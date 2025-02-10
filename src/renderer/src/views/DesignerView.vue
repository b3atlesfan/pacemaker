<script setup lang="ts">
import { log } from "console";
import { color } from "d3";
import {computed, reactive, ref, shallowRef, watchEffect} from "vue";
import VariableCard from "@/components/VariableCard.vue";

function toggleFetchLoop() {
  currentState.fetchLoopEnabled = !currentState.fetchLoopEnabled;
  console.log("Fetch Loop Enabled: " + currentState.fetchLoopEnabled);
}


const  model_localValue = reactive(
  {id: 0, name: 'ERROR VIEW NOT LOADED', remoteValue: 0, 
  localValue: 0, path: "", detailedView: false, markedFavorite: false});

const path1 = "C:/git-projects/Unity/KartTemplate_MasterThesis/Packages/com.unity.pacemaker-for-unity/Editor/Temporary";
const path2 = "C:/git-projects/Unity/TheLostForest-master/Packages/com.unity.pacemaker-for-unity/Editor/Temporary";

const currentState = reactive({
  unityPath: path2,
  outFile: "designerVarsFromPacemaker.json",
  inFile: "designerVarsFromUnity.json",
  allVariables: [model_localValue,model_localValue,model_localValue],
  lastMessage : "lM",
  messageAge: 0.0,
  fetchLoopEnabled: false,
  sendLoopEnabled: false,
  favoritesOnly: false,
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

const pathFilterText = ref("");

function getPathFilteredVariables() {
  var a = currentState.allVariables.filter(variable => variable.path.includes(pathFilterText.value));
  if(currentState.favoritesOnly){
    a = a.filter(variable => variable.markedFavorite);
  }
  return a;
}


function addRow(){
  const next_id : number = currentState.allVariables.length;
  const  temp_model = reactive({id: next_id, name: '', remoteValue: 0, localValue: 0, path: "", detailedView: false, markedFavorite: false});
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
  const filteredVars = currentState.allVariables.map(({ name, localValue: value, path }) => ({ name, value, path }));
  const allVarsJsonFile = JSON.stringify(filteredVars, null, 2);
  const response = await window.versions.sendFile(allVarsJsonFile, currentState.unityPath + "/" + currentState.outFile);

  fetchAllVars();
}

const loadCurrentState = async () => {
  const response = await window.versions.fetchFile(currentState.unityPath + "/" + currentState.outFile)
  const allVars = JSON.parse(response);

  currentState.allVariables = [];
  Object.keys(allVars).forEach((key, index) => {
    //const temp_model = reactive({id: index, name: key, remoteValue: 0, localValue: allVars[key]});
    //currentState.allVariables.push(temp_model);
  });
}

function fetchAndSend() {
  if(currentState.fetchLoopEnabled){
    fetchAllVars();
  }
  if(currentState.sendLoopEnabled){
    sendAllVars();
  }
}

const fetchAllVars = async () => {
  const response = await window.versions.fetchFile(currentState.unityPath + "/" + currentState.inFile);
  const allVars: Array<{ name: string, value: number, path: string }> = JSON.parse(response);
  
  allVars.forEach(element => {
    let index = currentState.allVariables.findIndex((e) => e.name === element.name && e.path === element.path);
    if (index === -1) {
      const temp_model = reactive({
        id: currentState.allVariables.length,
        name: element.name,
        remoteValue: element.value,
        localValue: element.value,
        path: element.path || "",
        detailedView: false,
        markedFavorite: false
      });
      currentState.allVariables.push(temp_model);
      index = currentState.allVariables.length - 1;
    }
    currentState.allVariables[index].remoteValue = element.value;
  });

  currentState.allVariables.forEach((element, index) => {
    if (allVars.findIndex((e) => e.name === element.name && e.path === element.path) === -1) {
      currentState.allVariables[index].remoteValue = null;
    }
  });

  currentState.allVariables.sort((a, b) => pathWithName(a).localeCompare(pathWithName(b)));
};

function pathWithName (a: { path: string; name: string; }) : string  {
  return a.path + "_" + a.name;
}

const startListening = async () => {
  const response = await window.versions.startListening();
  //currentState.ping = response;
}

const startFetchLoop = async () => {
  setInterval(fetchAndSend, 1000);
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

  <v-row>
    <v-checkbox 
      v-model="currentState.fetchLoopEnabled" 
      label="Fetch automatically" 
    ></v-checkbox>
    <v-checkbox 
      v-model="currentState.sendLoopEnabled" 
      label="Send automatically" 
    ></v-checkbox>
  </v-row>


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

  
  <v-text-field v-model="pathFilterText" label="Filter by Path" placeholder="Enter path to filter"></v-text-field>
  <v-checkbox 
      v-model="currentState.favoritesOnly" 
      label="Show only favorites" 
    ></v-checkbox>

  <v-app>
    <v-container>
  <v-row v-for="(row, index) in getPathFilteredVariables()" :key="row.id">
    <v-col>
      <p v-if="row.detailedView">
        <variable-card :row="row" :currentState="currentState" :currentVariable="currentState.allVariables[row.id]" :sendAllVars="sendAllVars" :onDelete="OnDelete" :onApply="OnApply"></variable-card>
      </p>
      <p v-else>
        <v-row>
          <v-col cols="1">
            <v-btn @click="row.markedFavorite=!row.markedFavorite">
              <v-icon v-if="row.markedFavorite" icon="mdi-star"></v-icon>
              <v-icon v-else icon="mdi-star-outline"></v-icon>
            </v-btn>
          </v-col>
          <v-col cols="1">
            <v-btn @click="row.detailedView = true">Open</v-btn>
          </v-col>
          <v-col cols="2">{{ row.name }}</v-col>
          <v-col cols="4500">{{ row.path }}</v-col>
        </v-row>
      </p>
    </v-col>
  </v-row>
</v-container>



  </v-app>
</template>



