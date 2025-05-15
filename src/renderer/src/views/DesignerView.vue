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
    //currentState.messageAge += 1;
}, 100);
 
function toggleFetchLoop() {
  currentState.fetchLoopEnabled = !currentState.fetchLoopEnabled;
  console.log("Fetch Loop Enabled: " + currentState.fetchLoopEnabled);
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

let currentView = ref('design');
function switchToRV(){
  currentView.value = 'runtime';
}

function switchToDV(){
  currentView.value = 'design';
}


</script>

<template>
  <div style="margin-left: 20px;">
    <h1>Variables View</h1>
    <p>
      This is the variables view.
      <br>
      It is seperated into two parts:
      Design Variables View and the Runtime Variables View.
      <br>
      Design Variables are constant at runtime, while Runtime Variables (RVs) aren't.
    </p>

    <!-- Other content -->

    <div style="margin-top: 20px;">
      <v-btn 
        @click="switchToDV" 
        :color="currentView === 'design' ? 'secondary' : undefined"
        :variant="currentView === 'design' ? 'flat' : undefined"
      >
        Design Variables
      </v-btn>
      <v-btn 
        @click="switchToRV" 
        :color="currentView === 'runtime' ? 'secondary' : undefined"
        :variant="currentView === 'runtime' ? 'flat' : undefined"
      >
        Runtime Variables
      </v-btn>
      <div v-if="currentView === 'design'">
      <h2>Design Variables View</h2>
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



      <!--v-text-field
        v-model="settings.Name"
        label="Output Path"
        placeholder="Enter the output path for all variables"
      ></v-text-field-->

      <div style="height: 20px;"></div>

      <!--<p>Latest Event: {{ currentState.lastMessage }}</p>
      <p>Age [s]: {{ (currentState.messageAge / 10).toFixed(1) }}</p>-->
      </div>
      <div v-else>
      <h2>Runtime Variables View</h2>
      </div>
      <VariableView :isInVisualizerView="currentView === 'runtime'"></VariableView>
    </div>
  </div>
</template>