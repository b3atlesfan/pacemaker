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

const color = computed(() => props.selected ? 'secondary' : 'primary')

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
  <v-card min-width="200px" width="auto" :color="color">
    <template v-slot:title>
      <v-text-field v-if="props.isBeingEdited" v-model="label" @keydown.enter="onEditLabel()" autofocus></v-text-field>
      <p v-else>{{ props.label }}</p>
    </template>

    <BeatContentHolder
      v-if="hasContent"
      :content-id="props.data"
      type='preview'
      variant="tonal"
    />

    <v-card-actions v-else title="No Content">
      <v-card-text>No Content</v-card-text>
      <v-spacer></v-spacer>
      <v-btn icon="mdi-tag-plus" :color="'on-' + color" @click="onAddContent"></v-btn>
    </v-card-actions>

  </v-card>

  <Handle id="a_in" type="target" :position="Position.Left"/>
  <Handle id="b_out" type="source" :position="Position.Top"/>
  <Handle id="c_out" type="source" :position="Position.Right"/>
  <Handle id="d_out" type="source" :position="Position.Bottom"/>

</template>

<style scoped>

</style>
