<script setup lang="ts">
import { color } from "d3";
import {reactive, ref, shallowRef, watchEffect} from "vue";


const  model_localValue = reactive({id: 0, name: 'ERROR VIEW NOT LOADED', remoteValue: 'undefined', localValue: 'Default Value'});

const currentState = reactive({
  unityPath: "C:/git-projects/Unity/KartTemplate_MasterThesis/Packages/com.unity.pacemaker-for-unity/Editor/Temporary",
  outFile: "designerVarsFromPacemaker.json",
  inFile: "designerVarsFromUnity.json",
  allVariables: [model_localValue,model_localValue,model_localValue],
  random2: "hi"
});


function addRow(){
  const next_id : number = currentState.allVariables.length;
  const  temp_model = reactive({id: next_id, name: '', remoteValue: 'undefined', localValue: 'Default Value'});
  currentState.allVariables.push(temp_model);
}

function OnDelete(index: number){
  currentState.allVariables.splice(index, 1);
}

function send(index: number){
  sendString("Sending... " + index);
}

const sendString = async (message: string) => {
  const response = await window.versions.sendString(message)
}

const sendAllVars = async () => {
  const result: Record<string, string> = {};

  currentState.allVariables.forEach(element => {
      if (typeof element === 'object' && element !== null) {
          // Check if element has 'name' and 'localValue' properties
          const { name, localValue } = element;
          if (name && localValue) {
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
    const temp_model = reactive({id: index, name: key, remoteValue: 'undefined', localValue: allVars[key]});
    currentState.allVariables.push(temp_model);
  });
}

const fetchAllVars = async () => {
  const response = await window.versions.fetchFile(currentState.unityPath + "/" + currentState.inFile)
  const allVars = JSON.parse(response);
  currentState.allVariables.forEach(element => {
    if (typeof element === 'object' && element !== null) {
        // Check if element has 'name' and 'localValue' properties
        const { name } = element;
        if (name) {
            element.remoteValue = allVars[name];
        }
    }
  });
}

const startFetchLoop = async () => {
  setInterval(fetchAllVars, 5000);
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
  <v-spacer></v-spacer>
  <v-btn @click="sendAllVars"> Send All </v-btn>
  <v-btn @click="fetchAllVars"> Fetch Changes </v-btn>
  <p>This is the designer view, here you can sync design variables with the game engine.</p>

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

  <v-app>
    <v-container>
      <v-row>
      <div v-for="(row, index) in currentState.allVariables" :key="currentState.allVariables.id">
        <v-col>
          <v-confirm-edit cancel-text="Cancel" ok-text="Send" v-model="currentState.allVariables[index].localValue"
          @save="send(index)">
            <template v-slot:default="{ model: theModel, actions }">
              <v-card width="320" >
                <template v-slot:text>
                  <v-text-field
                    label="Name"
                    v-model="currentState.allVariables[index].name"
                  ></v-text-field>
                  <v-text-field
                    label="Value"
                    v-model="theModel.value"
                    :error="notInSync(index)"
                    :outlined="currentState.allVariables[index].remoteValue === currentState.allVariables[index].localValue"
                    :bg-color="notInSync(index) ? 'red-lighten-4' : ''"
                    color="notInSync(index) ? 'red' : ''"
                    ></v-text-field>
                    <div
                    :style="{ color: notInSync(index) ? 'red' : 'gray', marginLeft: '16px', fontSize: '12px', marginTop: '-16px' }"
                  >
                    {{ notInSync(index) ? `Variable out of Sync. Fetched: ` : 'In Sync' }}
                    <br>
                    <p style="color: gray">  {{ notInSync(index) ? `${currentState.allVariables[index].remoteValue}` : '' }}</p>
                  </div>
                </template>

                <template v-slot:actions>
                  <v-spacer></v-spacer>
                  <v-btn color="red" @click="OnDelete(index)">Delete</v-btn>

                  <component :is="actions"></component>
                </template>
              </v-card>
            </template>
          </v-confirm-edit>

        </v-col>
      </div>
      </v-row>
    </v-container>
  </v-app>
</template>



