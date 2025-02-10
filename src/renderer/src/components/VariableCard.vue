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
</script>

<template>
    <v-card>
        <v-btn color="blue" @click="props.currentVariable.detailedView = false">Close</v-btn>
    <v-btn color="red" @click="OnDelete(row.id)">Delete</v-btn>
    <v-btn color="green" @click="OnApply(row.id)">Apply</v-btn>
    <v-text-field label="Name" v-model="props.currentVariable.name" dense outlined>
    </v-text-field>
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

    
  </v-card>
</template>

