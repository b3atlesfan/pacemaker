<script setup lang="ts">
import { log } from "console";
import { color } from "d3";
import {reactive, ref, shallowRef, watchEffect} from "vue";


const  model_localValue = reactive({id: 0, name: 'ERROR VIEW NOT LOADED', remoteValue: 0, localValue: 0});

const path1 = "C:/git-projects/Unity/KartTemplate_MasterThesis/Packages/com.unity.pacemaker-for-unity/Editor/Temporary";
const path2 = "C:/git-projects/Unity/TheLostForest-master/Packages/com.unity.pacemaker-for-unity/Editor/Temporary";

const currentState = reactive({
  unityPath: path2,
  outFile: "designerVarsFromPacemaker.json",
  inFile: "designerVarsFromUnity.json",
  allVariables: [model_localValue,model_localValue,model_localValue],
  lastMessage : "lM",
  messageAge: 0.0,
});

window.server.onMessage('asynchronous-message', (message: any) => {
  if(!message.startsWith("Last ping")){
    console.log(message);
  }

  currentState.lastMessage = message;

  StartReactiveLastMessageTimer();
});


const ageInterval = setInterval(() => {
    currentState.messageAge += 1;
}, 100);
 
function StartReactiveLastMessageTimer(){
  currentState.messageAge = 0;
}



function addRow(){
  const next_id : number = currentState.allVariables.length;
  const  temp_model = reactive({id: next_id, name: '', remoteValue: 0, localValue: 0});
  currentState.allVariables.push(temp_model);
}

function OnDelete(index: number){
  currentState.allVariables.splice(index, 1);
}

function OnApply(index: number){
  const current = currentState.allVariables[index];
  if(current.remoteValue === null){
    OnDelete(index);
    return;
  }
  currentState.allVariables[index].localValue = currentState.allVariables[index].remoteValue;
}

function ApplyAll(){
  for(let i = currentState.allVariables.length - 1; i >= 0; i--){
    OnApply(i);
  }
}

function send(index: number){
  sendString("Sending... " + index);
}

const sendString = async (message: string) => {
  const response = await window.versions.sendString(message)
}

const sendAllVars = async () => {
  return;
  const result: Record<string, number> = {};

  currentState.allVariables.forEach(element => {
      if (typeof element === 'object' && element !== null) {
          // Check if element has 'name' and 'localValue' properties
          const { name, localValue } = element;
          if (name) {
              result[name] = localValue;
          }
      }
  });

  const allVarsJsonFile = JSON.stringify(result, null, 2);
  const response = await window.versions.sendFile(allVarsJsonFile, currentState.unityPath + "/" + currentState.outFile)

  fetchAllVars();
}

const loadCurrentState = async () => {
  const response = await window.versions.fetchFile(currentState.unityPath + "/" + currentState.outFile)
  const allVars = JSON.parse(response);

  currentState.allVariables = [];
  Object.keys(allVars).forEach((key, index) => {
    const temp_model = reactive({id: index, name: key, remoteValue: 0, localValue: allVars[key]});
    currentState.allVariables.push(temp_model);
  });
}

const fetchAllVars = async () => {
  const response = await window.versions.fetchFile(currentState.unityPath + "/" + currentState.inFile)
  const allVars: Array<{ name: string, value: number, path: string }> = JSON.parse(response);
  allVars.forEach(element => {
    if (typeof element === 'object' && element !== null) {
        // Check if element has 'name' and 'localValue' properties
        const { name } = element;
        if (name) {
            var index = currentState.allVariables.findIndex((e) => e.name === name);
            var localVar = currentState.allVariables[index];
            if (localVar === undefined){ 
                const temp_model = reactive({id: currentState.allVariables.length, name: name, remoteValue: element.value, localValue: element.value});
                currentState.allVariables.push(temp_model);
                index = currentState.allVariables.length - 1;
            }
            currentState.allVariables[index].remoteValue = element.value;
        }
    }
  });
  currentState.allVariables = currentState.allVariables.filter((e) => allVars.find((a) => a.name === e.name) !== undefined);

  currentState.allVariables.sort((a, b) => a.name.localeCompare(b.name));
}

const startListening = async () => {
  const response = await window.versions.startListening();
  //currentState.ping = response;
}

const startFetchLoop = async () => {
  setInterval(fetchAllVars, 1000);
  setInterval(startListening, 1000);
}

function notInSync(index: number): boolean  {
  return currentState.allVariables[index].remoteValue !== currentState.allVariables[index].localValue;
}

onReloadPage();

function onReloadPage(){
  loadCurrentState();
  fetchAllVars();
  startFetchLoop();
}

</script>
<template>
  <h1>Designer View</h1>
  <p>This is the designer view, here you can sync design variables with the game engine.</p>

  <div style="height: 20px;"></div>
  <!-- <v-btn @click="fetchAllVars"> Fetch Changes </v-btn>-->
  <v-btn @click="ApplyAll"> Apply All </v-btn>
  <v-btn @click="sendAllVars"> Send All </v-btn>

  <v-btn @click="addRow">Create Variable</v-btn>

  <v-text-field
    v-model="currentState.unityPath"
    label="Output Path"
    placeholder="Enter the output path for all variables"
  ></v-text-field>

  <v-row>
  <v-text-field
    v-model="currentState.outFile"
    label="Output File"
    placeholder="Enter the output file name"
  ></v-text-field>

  <v-text-field
    v-model="currentState.inFile"
    label="Input File"
    placeholder="Enter the input file name"
  ></v-text-field></v-row>

  <div style="height: 20px;"></div>

  <p>Latest Event: {{ currentState.lastMessage }}</p>
  <p>Age [s]: {{ (currentState.messageAge / 10).toFixed(1) }}</p>

  <div style="height: 20px;"></div>

  <v-app>
    <v-container>
  <v-row v-for="(row, index) in currentState.allVariables" :key="row.id">
    <v-col>
      <v-card>
        <v-text-field
          label="Name"
          v-model="currentState.allVariables[index].name"
          dense
          outlined
        ></v-text-field>
        <v-row>
          <v-col cols="3"><!--v-model.number=... @input="value => currentState.allVariables[index].localValue = value" -->
            <v-text-field
              v-model="currentState.allVariables[index].localValue"
              type="number"
              dense
              outlined
            ></v-text-field>
          </v-col>
          <v-col>
            <v-slider
              v-model="currentState.allVariables[index].localValue"
              @update:modelValue="value => currentState.allVariables[index].localValue = value"
              :min="0"
              :max="100"
              :step="1"
              thumb-label
              :color="notInSync(index) ? 'red' : 'green'"
            ></v-slider>
          </v-col>
        </v-row>
        <div
          :style="{
            color: notInSync(index) ? 'red' : 'gray',
            fontSize: '12px',
            marginTop: '-8px',
          }"
        >
          {{ notInSync(index) ? `Variable out of Sync. Fetched: ${currentState.allVariables[index].remoteValue}` : 'In Sync' }}
        </div>
        <v-btn color="red" @click="OnDelete(index)">Delete</v-btn>
        <v-btn color="green" @click="OnApply(index)">Apply</v-btn>
      </v-card>
    </v-col>
  </v-row>
</v-container>



  </v-app>
</template>



