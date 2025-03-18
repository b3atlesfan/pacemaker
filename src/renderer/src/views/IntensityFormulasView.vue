<script setup lang="ts">
import { computed, reactive, ref, watchEffect } from "vue";
import VariableCardMinimal from "@/components/VariableCardMinimal.vue";
import { useDesignVariablesStore, DesignVariable } from "@/store/designVariables";

const designVariablesStore = useDesignVariablesStore();

const savedState = localStorage.getItem('currentState');
const initialState = savedState ? JSON.parse(savedState) : {
  onlyWithWeight: true,
};

const currentState = reactive(initialState);

watchEffect(() => {
  localStorage.setItem('currentState', JSON.stringify(currentState));
});

function getPathFilteredVariables() {
  let variables = designVariablesStore.allVariables;
  variables = variables.filter(variable => (variable.intensityWeight || 0) != 0 || (variable.narrativeWeight || 0) != 0);
  return variables;
}


function getIntensityWeightString(variable: { intensityWeight: number; name: string; isMultiplier: boolean; }, invert = false): string {
  let intensity = variable.intensityWeight;
  if (invert) {
    intensity = parseFloat(intensity.toString().substring(1));
  }
  if (intensity === 1) {
    return variable.name;
  }
  return intensity + " * " + variable.name;
}

function getNarrativeIntensityWeightString(variable: { narrativeIntensity: number; name: string; isMultiplier: boolean; }, invert = false): string {
  const input = { intensityWeight: variable.narrativeWeight, name: variable.name, isMultiplier: variable.isMultiplier };
  return getIntensityWeightString(input, invert);
}

const emit = defineEmits(['onUpdateIntensityFormula'])

const isMultiplier = (variable: DesignVariable) => {
  var res : boolean = (variable.narrativeWeight || 0) > 0 && (variable.isMultiplier || false);
  return res;
}

const isSummand = (variable: DesignVariable) => {
  var res : boolean = (variable.narrativeWeight || 0) != 0 && !(variable.isMultiplier || false);
  return res;
}

const isDivider = (variable: DesignVariable) => {
  var res : boolean = (variable.narrativeWeight || 0) < 0 && (variable.isMultiplier || false);
  return res;
}

</script>

<template>
  <div style="margin-left: 20px;">
    <h1>Intensity Formulas</h1>
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
        (1 + {{ designVariablesStore.allVariables.filter(isMultiplier).map(variable => getNarrativeIntensityWeightString(variable)).join(" + ") }})
        <br>
        <span style="margin-left: 120px;"></span>
        * ({{ designVariablesStore.allVariables.filter(isSummand).map(variable => getNarrativeIntensityWeightString(variable)).join(" + ") }})
        <br>
        <span style="margin-left: 120px;"></span>
        / (1 + {{ designVariablesStore.allVariables.filter(isDivider).map(variable => getNarrativeIntensityWeightString(variable, true)).join(" + ") }})
      </span>
    </p>

    <v-app>
      <v-container>
        <v-row>
          <v-col cols="2"><strong>Name</strong></v-col>
          <v-col cols="2"><strong>Gameplay Intensity Weight</strong></v-col>
          <v-col cols="2"><strong>Narrative Intensity Weight</strong></v-col>
          <v-col cols="2"><strong>Is multiplier</strong></v-col>
        </v-row>

        <v-row v-for="(row, index) in getPathFilteredVariables()" :key="row.id" class="d-flex align-center justify-center">
          <v-col>
            <variable-card-minimal 
            :currentState="currentState" 
            :currentVariable="designVariablesStore.allVariables[row.id]" 
            @onUpdateVariable="emit('onUpdateIntensityFormula')">
            </variable-card-minimal>
          </v-col>
        </v-row>
      </v-container>
    </v-app>
  </div>
</template>

<style scoped>
</style>