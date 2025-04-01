<script setup lang="ts">
import VariableView from '@/views/VariableView.vue';
import { computed, reactive, ref } from 'vue';
import { useDesignVariablesStore, DesignVariable } from '@/store/designVariables';
import { loadSettings, settings, currentState } from '@/store/settings';

const designVariablesStore = useDesignVariablesStore();

function ApplyAll(){
  designVariablesStore.applyAllVariables();
}

function deleteAll(){
  designVariablesStore.deleteAllVariables();
}

function send(index: number){
  sendString("Sending... " + index);
}


const ageInterval = setInterval(() => {
    currentState.messageAge += 1;
}, 100);
 
function toggleFetchLoop() {
  currentState.fetchLoopEnabled = !currentState.fetchLoopEnabled;
  console.log("Fetch Loop Enabled: " + currentState.fetchLoopEnabled);
}

function addRow(){
  const next_id : number = designVariablesStore.allVariables.length;
  const  temp_model = reactive({id: next_id, name: '', remoteValue: 0, localValue: 0, path: "FromPM", 
      detailedView: true, markedFavorite: false, isPublic: true, intensityWeight: 0, narrativeIntensity: 0, requestedFromPM: true,
    isMultiplier:false});
      designVariablesStore.addVariable(temp_model);
}


const sendString = async (message: string) => {
  const response = await window.versions.sendString(message)
}


function fetchAndSend() {
  if(currentState.fetchLoopEnabled){
    fetchAllVars();
  }
  if(currentState.sendLoopEnabled){
    sendAllVars();
  }
}


const sendAllVars = async () => {
  const filteredVars = designVariablesStore.allVariables
      .filter(a => a.localValue !== null)
      .map(
        ({ name, localValue: value, path, intensityWeight, narrativeIntensity, runtimeModified }) => 
        ({ name, value, path, hasIntensity: intensityWeight != 0 || narrativeIntensity != 0, runtimeModified }));
  const allVarsJsonFile = JSON.stringify(filteredVars, null, 2);
  const response = await window.versions.sendFile(allVarsJsonFile, currentState.unityPath + "/" + currentState.outFile);

  if(currentState.fetchLoopEnabled){
    fetchAllVars();
  }
}


const fetchAllVars = async () => {
  const response = await window.versions.fetchFile(currentState.unityPath + "/" + currentState.inFile);
  if(response === null || response === ''||response === "{}"){
    return;
  }

  const allVarsAsDict = JSON.parse(response);
  const allVars = Object.values(allVarsAsDict);
  
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
        false,
        false,
        element.runtimeModified || false,
      );
      designVariablesStore.addVariable(temp_model);
      index = designVariablesStore.allVariables.length - 1;
    }
    designVariablesStore.allVariables[index].remoteValue = element.value;
    designVariablesStore.allVariables[index].runtimeModified = element.runtimeModified;

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


const startFetchLoop = async () => {
  setInterval(fetchAndSend, 1000);
  setInterval(startListening, 1000);
}



const startListening = async () => {
  const response = await window.versions.startListening();
}

function onReloadPage(){
  //loadCurrentState();
  //fetchAllVars();
  if(!settings.Name) {
    loadSettings();
  }
  startFetchLoop();
}
onReloadPage();

function pathWithName (a: { path: string; name: string; }) : string  {
  return a.path + "_" + a.name;
}

</script>

<template>
  <div style="margin-left: 20px;">
    <h1>Designer View</h1>
    <p>This is the designer view, where you can sync design variables with the game engine.</p>

    <!-- Other content -->

    <div style="margin-top: 20px;">
      <h2>Variable View</h2>
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
        v-model="settings.Name"
        label="Output Path"
        placeholder="Enter the output path for all variables"
      ></v-text-field>

      <div style="height: 20px;"></div>

      <p>Latest Event: {{ currentState.lastMessage }}</p>
      <p>Age [s]: {{ (currentState.messageAge / 10).toFixed(1) }}</p>
      <VariableView :isInVisualizerView="false"></VariableView>
    </div>
  </div>
</template>