<script setup lang="ts">
import {Handle, Position} from "@vue-flow/core";
import {computed, ref} from "vue";
import BeatContentHolder from "@/components/BeatContentHolder.vue";
import { BeatManager } from "@/assets/BeatManager";
import {BeatContentManager} from "@/assets/BeatContentManager";

const emit = defineEmits(['onAddContent', 'onEditLabel', 'onDelete'])

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

const contentManager = BeatContentManager.getInstance()

const content = computed(() => contentManager.getContent(props.data))

const label = ref(props.label)

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

function onEditLabel() {
  invertIsBeingEdited()
  emit('onEditLabel', props.id, label.value)
}

</script>

<template>
  <v-card min-width="200px" width="auto" color="tertiary">
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

              <v-list-item @click="emit('onDeleteClicked', props.id)">
                <v-list-item-title>Delete</v-list-item-title>
              </v-list-item>
            </v-list>

          </v-menu>
        </v-col>
      </v-row>


      <v-row>
        <v-col>Content:</v-col>
        <v-col>
          <v-card>
            <v-btn @click="emit('onAddContentClicked', props.id)">Add</v-btn>
            <!--
            <BeatContentSelector v-if="content == undefined" @on-save-clicked="onSave"></BeatContentSelector>
            <p v-else>{{ props.data }} and {{ contentF() }} and {{ content }}</p>

            <BeatContentHolder v-else :content="content" :is-in-beat="true" @on-remove="onRemove"/>
            -->
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-card>


  <Handle id="a_in" type="target" :position="Position.Left"/>
  <Handle id="a_out" type="source" :position="Position.Right"/>

</template>

<style scoped>

</style>
