<script setup lang="ts">
import { log } from "console";
import { color } from "d3";
import {computed, reactive, ref, shallowRef, watchEffect} from "vue";
import VariableCard from "@/components/VariableCard.vue";
import VariableCardClosed from "@/components/VariableCardClosed.vue";
import VariableCardMinimal from "@/components/VariableCardMinimal.vue";
import { useDesignVariablesStore, DesignVariable} from "@/store/designVariables";
import { settings, loadSettings, saveSettings, currentState } from '@/store/settings';


const designVariablesStore = useDesignVariablesStore();


window.server.onMessage('asynchronous-message', (message: any) => {
  if(!message.startsWith("Last ping")){
    console.log(message);
  }

  currentState.lastMessage = message.substring(0, 200);

  StartReactiveLastMessageTimer();
});

function StartReactiveLastMessageTimer(){
  currentState.messageAge = 0;
}

function OnDelete(index: number){
  designVariablesStore.deleteVariable(index);
}

function OnApply(index: number){
  designVariablesStore.applyVariable(index);
}



function isDetailedView(index: number): boolean  {
  if(designVariablesStore.allVariables[index] === undefined){
    return false;
  }
  return designVariablesStore.allVariables[index].detailedView;
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
const currentPage = ref(1);
const itemsPerPage = 8;

function getFilteredVars() {
    var a = designVariablesStore.getPathFilteredVariables();
    if(props.isInVisualizerView){
        a = a.filter(variable => variable.runtimeModified);
      }
      else {
        a = a.filter(variable => !variable.runtimeModified);
      }
      return a;
}

const totalPages = computed(() => {
  return Math.ceil(getFilteredVars().length / itemsPerPage);
});

const paginatedVariables = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage;
  const end = start + itemsPerPage;
  return getFilteredVars().slice(start, end);
});

function nextPage() {
  if (currentPage.value < totalPages.value) {
    currentPage.value++;
  }
}

function prevPage() {
  if (currentPage.value > 1) {
    currentPage.value--;
  }
}

function onUpdateVariable(){
    saveSettings();
    emit('onUpdateIntensityFormula')
}

const props = defineProps<{ isInVisualizerView: boolean }>();
const emit = defineEmits(['onUpdateIntensityFormula'])

</script>
<template>
  <div>

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
    <!-- 
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
    </span>-->
  </p>
  
  <v-row>
  <div style="margin-top: 10px; width: 33.33%;">
    <v-text-field v-model="currentState.pathFilterText" 
    label="Filter by Path" placeholder="Enter path to filter" clearable=""></v-text-field>
  </div>
    <v-col cols="1" class="d-flex align-center justify-center"><strong>Filters</strong></v-col>
    <v-col cols="2">
      <v-checkbox 
        class="d-flex align-center"
        v-model="currentState.favoritesOnly" 
        label="Favorite" 
      ></v-checkbox>
    </v-col>
    <v-col cols="2">
      <v-checkbox 
        v-model="currentState.onlyPublic" 
        label="Public" 
        class="d-flex align-center"
      ></v-checkbox>
    </v-col>
    <v-col cols="2">
      <v-checkbox 
        v-model="currentState.onlyWithWeight" 
        label="Has Weight"
        class="d-flex align-center"
      ></v-checkbox>
    </v-col>
  </v-row>

  <v-app>
    <v-container>
      
        <div style="margin-left: 20px">
      <v-row>
        <v-col v-if="!isInVisualizerView" cols="1"><strong>Favorite</strong></v-col>
        <v-col v-if="!isInVisualizerView" cols="1"></v-col>
        <v-col cols="2"><strong>Name</strong></v-col>
        <v-col v-if="!isInVisualizerView" cols="2"><strong>Path</strong></v-col>
        <v-col v-if="!isInVisualizerView" cols="1"><strong>Remote Value</strong></v-col>
        <v-col cols="2"><strong>Gameplay Intensity Weight</strong></v-col>
        <v-col cols="2"><strong>Narrative Intensity Weight</strong></v-col>
        <v-col cols="1"><strong>Is multiplier</strong></v-col>
      </v-row>
        </div>

      <v-row v-if="totalPages > 1" class="d-flex align-center justify-center">
      <v-btn @click="prevPage" :disabled="currentPage === 1">Previous</v-btn>
      <v-btn @click="nextPage" :disabled="currentPage === totalPages">Next</v-btn>
    </v-row>
      <v-row v-for="(row, index) in paginatedVariables" :key="row.id" class="d-flex align-center justify-center">
        <v-col v-if="!isInVisualizerView">
        <variable-card v-if="isDetailedView(row.id)" :currentState="currentState" :currentVariable="designVariablesStore.allVariables[row.id]" :onDelete="OnDelete" :onApply="OnApply"></variable-card>
        <variable-card-closed v-else :currentVariable="designVariablesStore.allVariables[row.id]"></variable-card-closed>
        </v-col>
        <v-col v-else>
        <variable-card-minimal :currentVariable="designVariablesStore.allVariables[row.id]" @onUpdateVariable="onUpdateVariable">

        </variable-card-minimal>
        </v-col>
    </v-row>
    <v-row v-if="totalPages > 1" class="d-flex align-center justify-center">
      <v-btn @click="prevPage" :disabled="currentPage === 1">Previous</v-btn>
      <v-btn @click="nextPage" :disabled="currentPage === totalPages">Next</v-btn>
    </v-row>
    </v-container>



  </v-app>
</div>
</template>



