<script setup lang="ts">
import {Handle, Position} from "@vue-flow/core";
import {computed, ref} from "vue";
import BeatContentHolder from "@/components/BeatContentHolder.vue";
import { BeatManager } from "@/assets/BeatManager";
import {BeatContentManager} from "@/assets/BeatContentManager";

const emit = defineEmits(['onAddContentClicked', 'onEditClicked', 'onDeleteClicked'])

// data has to be named data because of how the node package works, but in our case data is content
// or better later: a pointer towards the content
const props = defineProps({
  id: {
    type: String,
    required: true,
  },
  label: {
    type: String,
    required: false,
  },
  data: {
    type: Number,
    required: true,
  },
})

const beatManager = BeatManager.getInstance()
const contentManager = BeatContentManager.getInstance()

const content = computed(() => contentManager.getContent(props.data))

function contentF() {
  return contentManager.getContent(props.data)
}

const isBeingEdited = ref(false)
const isLocked = ref(true)

function invertIsBeingEdited() {
  isBeingEdited.value = !isBeingEdited.value
}

function lockClicked() {
  isLocked.value = true
}

function unlockClicked() {
  isLocked.value = false
}

function changeLabel(newName: string) {
  beatManager.editNodeLabel(props.id, newName)
}

function onDeleteBeat() {
  beatManager.deleteNode(props.id)
}

function onSave(selectedId: number) {
  beatManager.editContentId(props.id, selectedId)
}

function onRemove() {
  beatManager.editContentId(props.id, -1)
}

</script>

<template>
  <v-card width="auto" color="tertiary">
    <v-container class="text-left">
      <v-row dense >
        <v-col>
          <v-text-field v-if="isBeingEdited" v-model="props.label" @keydown.enter="invertIsBeingEdited"></v-text-field>
          <p v-else>{{ props.label }}</p>
        </v-col>
        <v-col>
          <v-menu>
            <template v-slot:activator="{props}">
              <v-btn icon="mdi-dots-vertical" v-bind="props" density="comfortable" location="right"></v-btn>
            </template>

            <v-list>
              <v-list-item @click="invertIsBeingEdited()">
                <v-list-item-title>{{isBeingEdited ? 'Save' : 'Edit'}}</v-list-item-title>
              </v-list-item>
              <v-list-item @click="emit('onDeleteClicked', props.id)">
                <v-list-item-title>Delete</v-list-item-title>
              </v-list-item>
            </v-list>

          </v-menu>
        </v-col>
      </v-row>

      <v-divider></v-divider>

      <v-row dense>
        <v-col>Content:</v-col>
        <v-col>
          <v-btn @click="emit('onAddContentClicked', props.id)">Add</v-btn>
          <!--
          <BeatContentSelector v-if="content == undefined" @on-save-clicked="onSave"></BeatContentSelector>
          <p v-else>{{ props.data }} and {{ contentF() }} and {{ content }}</p>

          <BeatContentHolder v-else :content="content" :is-in-beat="true" @on-remove="onRemove"/>
          -->
        </v-col>
      </v-row>
    </v-container>
  </v-card>


  <Handle id="a_in" type="target" :position="Position.Left"/>
  <Handle id="a_out" type="source" :position="Position.Right"/>

</template>

<style scoped>

</style>
