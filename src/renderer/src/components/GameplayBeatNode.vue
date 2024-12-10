<script setup lang="ts">
import {Handle, Position} from "@vue-flow/core";
import {computed, ref} from "vue";
import BeatContentHolder from "@/components/BeatContentHolder.vue";

const emit = defineEmits(['onAddContent', 'onRemoveContent', 'onEditLabel', 'onDelete'])

const props = defineProps<{
  id: string,
  selected: boolean,
  label?: string | Object,
  data: {contentId: number, isInBackground: boolean},
  isBeingEdited: boolean,
}>()


const hasContent = computed(() => props.data.contentId != -1)

const label = ref(props.label)

const color = computed(() => {
  const base = props.selected ? 'secondary' : 'primary'
  const variant = props.data.isInBackground ? '-200' : ''
  return base + variant
})

function onEditLabel() {
  emit('onEditLabel', props.id, label.value)
}

function onAddContent() {
  emit('onAddContent', props.id)
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
      :content-id="props.data.contentId"
      type='preview'
      variant="tonal"
    />

    <v-card-actions v-else title="No Blueprint">
      <v-card-text>No Blueprint</v-card-text>
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
