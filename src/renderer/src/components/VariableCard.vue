<script setup lang="ts">
import { computed, defineProps } from 'vue';

const props = defineProps({
  currentVariable: Object,
  onDelete: Function,
  onApply: Function,
  sendAllVars: Function,
  currentState: Object,
});

function notInSync(): boolean  {
  return props.currentVariable.remoteValue !== props.currentVariable.localValue;
}

function createdInPM(): boolean {
  return props.currentVariable.requestedFromPM;
}

function onClose() {
  props.currentVariable.detailedView = false;
}
</script>

<template>
    <v-card>
      <v-row >
        <v-col cols="1">
          <v-btn @click="props.currentVariable.markedFavorite=!props.currentVariable.markedFavorite" :color="props.currentVariable.requestedFromPM ? 'secondary' : 'primary'">
                    <v-icon v-if="props.currentVariable.requestedFromPM" icon="mdi-account"></v-icon>
                    <v-icon v-else-if="props.currentVariable.markedFavorite" icon="mdi-star"></v-icon>
                    <v-icon v-else icon="mdi-star-outline"></v-icon>
                </v-btn>
        </v-col>
        <v-col cols="1">
          <v-btn color="secondary" @click="onClose()">Close</v-btn>
        </v-col>
        <v-col cols = "2">
          <v-text-field label="Name" v-model="props.currentVariable.name" dense outlined></v-text-field>
        </v-col>
        <v-col cols="2">{{ props.currentVariable.path }}</v-col>
        <v-col cols="1">
          <v-btn color="error" @click="onDelete(props.currentVariable.id)">Delete</v-btn>
        </v-col>
        <v-col>
        <v-btn color="success" @click="onApply(props.currentVariable.id)">Apply</v-btn>
        </v-col>
      </v-row>
      <span style="color: gray;">Path: </span>
      <v-label :text="props.currentVariable.path"></v-label>
      <v-row>
        <v-col cols="3"><!--v-model.number=... @input="value => props.currentVariable.localValue = value" -->
          <v-text-field
            v-model="props.currentVariable.localValue"
            @update:modelValue="value => {props.currentVariable.localValue = Number(value); sendAllVars()}"
            type="number"
            dense
            outlined
          ></v-text-field>
        </v-col>
        <v-col>
          <v-slider
            v-model="props.currentVariable.localValue"
            @update:modelValue="value => {props.currentVariable.localValue = value; sendAllVars()}"
            :min="0"
            :max="100"
            :step="1"
            thumb-label
            :color="notInSync() ? 'red' : 'green'"
          ></v-slider>
        </v-col>
      </v-row>
      <div
        :style="{
          color: notInSync() ? 'red' : 'gray',
          fontSize: '12px',
          marginTop: '-8px',
        }"
      >
        {{ notInSync() ? `Variable out of Sync. Fetched: ${props.currentVariable.remoteValue}` : 'In Sync' }}
      </div>

      <v-icon v-if="createdInPM()" color="blue" icon="mdi-account"></v-icon>

      {{ props.currentVariable.requestedFromPM ? '\nVariable created in Pacemaker' : '' }}
    
  </v-card>
</template>

