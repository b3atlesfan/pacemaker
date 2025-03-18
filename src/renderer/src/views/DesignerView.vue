<script setup lang="ts">
import { log } from "console";
import { color } from "d3";
import {computed, reactive, ref, shallowRef, watchEffect} from "vue";
import VariableCard from "@/components/VariableCard.vue";
import VariableCardClosed from "@/components/VariableCardClosed.vue";
import { useDesignVariablesStore, DesignVariable} from "@/store/designVariables";


const designVariablesStore = useDesignVariablesStore();

function toggleFetchLoop() {
  currentState.fetchLoopEnabled = !currentState.fetchLoopEnabled;
  console.log("Fetch Loop Enabled: " + currentState.fetchLoopEnabled);
}

const path1 = "C:/git-projects/Unity/KartTemplate_MasterThesis/Packages/com.unity.pacemaker-for-unity/Runtime/Temporary";
const path2 = "C:/git-projects/Unity/TheLostForest-master/Packages/com.unity.pacemaker-for-unity/Runtime/Temporary";

const savedState = localStorage.getItem('currentState');
const initialState = savedState ? JSON.parse(savedState) : {
  unityPath: path2,
  outFile: "designerVarsFromPacemaker.json",
  inFile: "designerVarsFromUnity.json",
  lastMessage: "lM",
  messageAge: 0.0,
  fetchLoopEnabled: false,
  sendLoopEnabled: false,
  favoritesOnly: false,
  onlyPublic: true,
  onlyWithWeight: false,
  pathFilterText: "",
};

const currentState = reactive(initialState);

watchEffect(() => {
  currentState.allVariables = null
  localStorage.setItem('currentState', JSON.stringify(currentState));
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


function getPathFilteredVariables() {
  var a
  if(!currentState.pathFilterText) {
    a = designVariablesStore.allVariables;
  }
  else {
    a = designVariablesStore.allVariables.filter(variable => (variable.path + "/" + variable.name).match(new RegExp(currentState.pathFilterText, "i")));
  }
  if(currentState.favoritesOnly){
    a = a.filter(variable => variable.markedFavorite || variable.requestedFromPM);
  }
  if(currentState.onlyPublic){
    a = a.filter(variable => variable.isPublic);
  }
  if(currentState.onlyWithWeight){
    a = a.filter(variable => (variable.intensityWeight || 0) != 0 || (variable.narrativeWeight || 0) != 0);
  }
  return a;
}


function addRow(){
  const next_id : number = designVariablesStore.allVariables.length;
  const  temp_model = reactive({id: next_id, name: '', remoteValue: 0, localValue: 0, path: "FromPM", 
      detailedView: true, markedFavorite: false, isPublic: true, intensityWeight: 0, narrativeIntensity: 0, requestedFromPM: true,
    isMultiplier:false});
      designVariablesStore.addVariable(temp_model);
}

function OnDelete(index: number){
  designVariablesStore.deleteVariable(index);
}

function OnApply(index: number){
  designVariablesStore.applyVariable(index);
}

function ApplyAll(){
  designVariablesStore.applyAllVariables();
}

function deleteAll(){
  designVariablesStore.deleteAllVariables();
}

function send(index: number){
  sendString("Sending... " + index);
}

const sendString = async (message: string) => {
  const response = await window.versions.sendString(message)
}

const sendAllVars = async () => {
  const filteredVars = designVariablesStore.allVariables.map(
      ({ name, localValue: value, path, intensityWeight, narrativeIntensity }) => ({ name, value, path, hasIntensity: intensityWeight != 0 || narrativeIntensity != 0}));
  const allVarsJsonFile = JSON.stringify(filteredVars, null, 2);
  const response = await window.versions.sendFile(allVarsJsonFile, currentState.unityPath + "/" + currentState.outFile);

  if(currentState.fetchLoopEnabled){
    fetchAllVars();
  }
}

const loadCurrentState = async () => {
  /*const response = await window.versions.fetchFile(currentState.unityPath + "/" + currentState.outFile)
  const allVars = JSON.parse(response);

  currentState.allVariables = [];
  Object.keys(allVars).forEach((key, index) => {
    //const temp_model = reactive({id: index, name: key, remoteValue: 0, localValue: allVars[key]});
    //currentState.allVariables.push(temp_model);
  });*/
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
  if(response === null || response === ''){
    return;
  }
  //const allVars: Array<{ name: string, value: number, path: string, isPublic: bool }> = JSON.parse(response);
  // Example for response: {"(speed, 1_Moving Platform_FlyPlats_Platform)":{"name":"speed","value":5.0,"path":"1_Moving Platform_FlyPlats_Platform","isPublic":false,"fieldType":"System.Single"},"(killcounter, 1_Enemies_Bees_Bee0_Enemy)":{"name":"killcounter","value":0.0,"path":"1_Enemies_Bees_Bee0_Enemy","isPublic":true,"fieldType":"System.Int32"}
  // Read as dictionary with name and path for key
  const allVarsAsDict : { [key: string]: { name: string, value: number, path: string, isPublic: boolean } } = JSON.parse(response);
  const allVars : Array<{ name: string, value: number, path: string, isPublic: boolean }> = Object.values(allVarsAsDict);
  
  allVars.forEach(element => {
    let index = designVariablesStore.allVariables.findIndex((e : DesignVariable) => e.name === element.name && e.path === element.path);
    if (index === -1) {
      const temp_model = new DesignVariable(
        designVariablesStore.allVariables.length,
        element.name,
        element.value,
        null,
        element.path || "",
        false,
        false,
        element.isPublic || false,
        0,
        0,
        false
      );
      designVariablesStore.addVariable(temp_model);
      index = designVariablesStore.allVariables.length - 1;
    }
    designVariablesStore.allVariables[index].remoteValue = element.value;

    // Remove all other matches from store
    designVariablesStore.allVariables.forEach((element, i) => {
      if (element.name === designVariablesStore.allVariables[index].name && element.path === designVariablesStore.allVariables[index].path && i !== index) {
        designVariablesStore.deleteVariable(i);
      }
    });
    
  });

  designVariablesStore.allVariables.forEach((element, index) => {
    if (allVars.findIndex((e) => e.name === element.name && e.path === element.path) === -1) {
      designVariablesStore.allVariables[index].remoteValue = null;
    }
  });

  designVariablesStore.allVariables.sort((a, b) => pathWithName(a).localeCompare(pathWithName(b)));
  designVariablesStore.allVariables.forEach((element, index) => {
    element.id = index;
  });
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
  return designVariablesStore.allVariables[index].remoteValue !== designVariablesStore.allVariables[index].localValue;
}

function isDetailedView(index: number): boolean  {
  if(designVariablesStore.allVariables[index] === undefined){
    return false;
  }
  return designVariablesStore.allVariables[index].detailedView;
}

onReloadPage();

function onReloadPage(){
  //loadCurrentState();
  //fetchAllVars();
  startFetchLoop();
}

// variable => variable.intensityWeight + " * " + variable.name
function getIntensityWeightString(variable: { intensityWeight: number; name: string; isMultiplier: boolean; }, invert =false) : string {
  var intensity = variable.intensityWeight;
  if(invert){
    // remove first symbol, which is probably a minus signss
    intensity = intensity.toString().substring(1);
  }
  if(intensity === '1'){
    return variable.name;
  }
  return intensity + " * " + variable.name;
}

function getNarrativeIntensityWeightString(variable: { narrativeIntensity: number; name: string; isMultiplier: boolean; }, invert =false) : string {
  var input: { intensityWeight: number; name: string; isMultiplier: boolean; }
  input = {intensityWeight: variable.narrativeWeight, name: variable.name, isMultiplier: variable.isMultiplier};
  return getIntensityWeightString(input, invert);
}

</script>
<template>
  <div style="margin-left: 20px;">
  <h1>Designer View</h1>
  <p>This is the designer view, here you can sync design variables with the game engine.</p>

  <div style="height: 20px;"></div>
  <!-- <v-btn @click="fetchAllVars"> Fetch Changes </v-btn>-->
  <v-btn @click="ApplyAll"> Apply All </v-btn>
  <v-btn @click="sendAllVars"> Send All </v-btn>
  <v-btn @click="deleteAll">Delete All</v-btn>

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

  <p>
    <strong>Gameplay Intensity := </strong> 
    <span v-if="designVariablesStore.allVariables.length > 0" style="margin-left: 120px;">
      <br>
      <span style="margin-left: 120px;"></span>
      (1 + {{ designVariablesStore.allVariables.filter(variable => variable.intensityWeight > 0 && variable.isMultiplier).map(variable => getIntensityWeightString(variable)).join(" + ") }})
      <br>
      <span style="margin-left: 120px;"></span>
      * ({{ designVariablesStore.allVariables.filter(variable => variable.intensityWeight != 0 && !variable.isMultiplier).map(variable => getIntensityWeightString(variable)).join(" + ") }})
      <br>
      <span style="margin-left: 120px;"></span>
      / (1 + {{ designVariablesStore.allVariables.filter(variable => variable.intensityWeight < 0 && variable.isMultiplier).map(variable => getIntensityWeightString(variable, true)).join(" + ") }})
    </span>
    <br>
    <strong>Narrative Intensity := </strong>
    <span v-if="designVariablesStore.allVariables.length > 0" style="margin-left: 120px;">
      <br>
      <span style="margin-left: 120px;"></span>
      (1 + {{ designVariablesStore.allVariables.filter(variable => variable.narrativeWeight > 0 && variable.isMultiplier).map(variable => getNarrativeIntensityWeightString(variable)).join(" + ") }})
      <br>
      <span style="margin-left: 120px;"></span>
      * ({{ designVariablesStore.allVariables.filter(variable =>variable.narrativeWeight&& variable.narrativeWeight != 0 && !variable.isMultiplier).map(variable => getNarrativeIntensityWeightString(variable)).join(" + ") }})
      <br>
      <span style="margin-left: 120px;"></span>
      / (1 + {{ designVariablesStore.allVariables.filter(variable => variable.narrativeWeight < 0 && variable.isMultiplier).map(variable => getNarrativeIntensityWeightString(variable, true)).join(" + ") }})
    </span>
  </p>
  
  <v-row>
  <div style="margin-top: 10px; width: 33.33%;">
    <v-text-field v-model="currentState.pathFilterText" 
    label="Filter by Path" placeholder="Enter path to filter" clearable=""></v-text-field>
  </div>
    <v-col cols="1" class="d-flex align-center justify-center"><strong>Filters</strong></v-col>
    <v-col cols="1">
      <v-checkbox 
        class="d-flex align-center"
        v-model="currentState.favoritesOnly" 
        label="Favorite" 
      ></v-checkbox>
    </v-col>
    <v-col cols="1">
      <v-checkbox 
        v-model="currentState.onlyPublic" 
        label="Public" 
        class="d-flex align-center"
      ></v-checkbox>
    </v-col>
    <v-col cols="1">
      <v-checkbox 
        v-model="currentState.onlyWithWeight" 
        label="Has Weight"
        class="d-flex align-center"
      ></v-checkbox>
    </v-col>
  </v-row>

  <v-app>
    <v-container>
      <v-row>
        <v-col cols="1"><strong>Favorite</strong></v-col>
        <v-col cols="1"></v-col>
        <v-col cols="2"><strong>Name</strong></v-col>
        <v-col cols="2"><strong>Path</strong></v-col>
        <v-col cols="1"><strong>Gameplay Intensity Weight</strong></v-col>
        <v-col cols="1"><strong>Narrative Intensity Weight</strong></v-col>
        <v-col cols="1"><strong>Is multiplier</strong></v-col>
      </v-row>

      <v-row v-for="(row, index) in getPathFilteredVariables()" :key="row.id" class="d-flex align-center justify-center">
        <v-col>
          <variable-card v-if="isDetailedView(row.id)" :currentState="currentState" :currentVariable="designVariablesStore.allVariables[row.id]" :sendAllVars="sendAllVars" :onDelete="OnDelete" :onApply="OnApply"></variable-card>
          
          <variable-card-closed v-else :currentVariable="designVariablesStore.allVariables[row.id]"></variable-card-closed>
        </v-col>
      </v-row>
    </v-container>



  </v-app></div>
</template>



