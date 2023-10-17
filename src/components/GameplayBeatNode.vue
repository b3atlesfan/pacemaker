<script setup lang="ts">
import {Handle, Position} from "@vue-flow/core";
import {ref} from "vue";
import BeatContentHolder from "@/components/BeatContentHolder.vue";

const emit = defineEmits(['onAddContent', 'onRemoveContent', 'onEditLabel', 'onDelete'])

// data has to be named data because of how the node package works, but in our case data is content
// or better later: a pointer towards the content
const props = defineProps<{
  id: string,
  selected: boolean,
  label?: string | Object,
  data: number,
}>()

const label = ref(props.label)

const isBeingEdited = ref(false)

function invertIsBeingEdited() {
  isBeingEdited.value = !isBeingEdited.value
}

function onEditLabel() {
  invertIsBeingEdited()
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
    <v-container class="text-left">
      <v-row>
        <v-col>
          <v-text-field v-if="isBeingEdited" v-model="label" @keydown.enter="onEditLabel()"></v-text-field>
          <p v-else>{{ props.label }}</p>
        </v-col>
        <v-col cols="3">
          <v-menu>
            <template v-slot:activator="{props}">
              <v-btn icon="mdi-dots-vertical" v-bind="props" density="comfortable" location="right"></v-btn>
            </template>

            <v-list>
              <v-list-item v-if="isBeingEdited" @click="onEditLabel">
                <v-list-item-title>Save</v-list-item-title>
              </v-list-item>
              <v-list-item v-else @click="invertIsBeingEdited()">
                <v-list-item-title>Edit</v-list-item-title>
              </v-list-item>

              <v-list-item @click="onDelete">
                <v-list-item-title>Delete</v-list-item-title>
              </v-list-item>
            </v-list>

          </v-menu>
        </v-col>
      </v-row>


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
  </v-card>


  <Handle id="a_in" type="target" :position="Position.Left"/>
  <Handle id="a_out" type="source" :position="Position.Right"/>

</template>

<style scoped>

</style>
