<script setup lang="ts">
import {Handle, Position} from "@vue-flow/core";
import {computed, ref} from "vue";
import BeatContentHolder from "@/components/BeatContentHolder.vue";

const emit = defineEmits(['onAddContent', 'onRemoveContent', 'onEditLabel', 'onDelete'])

// data has to be named data because of how the node package works, but in our case data is content
// or better later: a pointer towards the content
const props = defineProps<{
  id: string,
  selected: boolean,
  label?: string | Object,
  data: number,
  isBeingEdited: boolean,
}>()


const hasContent = computed(() => props.data != -1)

const label = ref(props.label)

function onEditLabel() {
  emit('onEditLabel', props.id, label.value)
}

function onAddContent() {
  emit('onAddContent', props.id)
}

function onRemoveContent() {
  emit('onRemoveContent', props.id)
}

function onDelete() {
  emit('onDelete', props.id)
}


</script>

<template>
  <v-card min-width="200px" width="auto" :color="props.selected ? 'secondary' : 'tertiary'">
    <template v-slot:title>
      <v-text-field v-if="props.isBeingEdited" v-model="label" @keydown.enter="onEditLabel()"></v-text-field>
      <p v-else>{{ props.label }}</p>
    </template>


    <v-expansion-panels v-if="props.selected">
      <v-expansion-panel title="Content" :color="props.selected ? 'secondary' : 'tertiary'">
        <v-expansion-panel-text>
          <v-btn v-if="!hasContent" icon="mdi-plus" @click="onAddContent"></v-btn>
          <BeatContentHolder v-else :content-id="props.data" :is-in-beat="true"/>
        </v-expansion-panel-text>
      </v-expansion-panel>
    </v-expansion-panels>
    <!--
      <v-btn icon="mdi-plus"></v-btn>

      <v-row>
        <v-col>
          Content:
          <v-btn v-if="props.data != -1" @click="onRemoveContent">Remove</v-btn>
        </v-col>
        <v-col>
          <v-btn v-if="props.data == -1" @click="onAddContent">Add</v-btn>

          <BeatContentHolder v-else :content-id="props.data" :is-in-beat="true"/>
        </v-col>
      </v-row>
    </v-container>
    -->
  </v-card>


  <Handle id="a_in" type="target" :position="Position.Left"/>
  <Handle id="a_out" type="source" :position="Position.Right"/>

</template>

<style scoped>

</style>
