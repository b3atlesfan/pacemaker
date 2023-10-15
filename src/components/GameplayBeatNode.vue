<script setup lang="ts">
import {Handle, Position, useVueFlow} from "@vue-flow/core";
import {computed, inject, ref} from "vue";
import {BeatContent} from "@/assets/BeatContent";
import BeatContentHolder from "@/components/BeatContentHolder.vue";
import {useModal} from "vue-final-modal";
import ModalConfirm from "@/components/DeleteBeatModal.vue";
import { BeatManager } from "@/assets/BeatManager";
import {BeatContentManager} from "@/assets/BeatContentManager";
import BeatContentSelector from "@/components/BeatContentSelector.vue";


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

function saveClicked() {
  isBeingEdited.value = false
}

function editClicked() {
  isBeingEdited.value = true
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

const { open, close } = useModal({
  component: ModalConfirm,
  attrs: {
    title: 'Warning!',
    onClose() {
      close()
    },
    onDelete() {
      onDeleteBeat()
      close()
    }
  },
  slots: {
    default: '<p>UseModal: The content of the modal</p>',
  },
})

function onSave(selectedId: number) {
  beatManager.editContentId(props.id, selectedId)
}

function onRemove() {
  beatManager.editContentId(props.id, -1)
}

</script>

<template>
  <v-container class="text-left">
    <v-row no-gutters>
      <v-col>Name:</v-col>
      <v-col>
        <v-text-field v-if="isBeingEdited" v-model="props.label"></v-text-field>
        <p v-else>{{ props.label }}</p>
      </v-col>
      <v-col>
        <div>

          <div v-if="isLocked">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" @click="unlockClicked">
              <path fill="currentColor"
                    d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zM9 6c0-1.66 1.34-3 3-3s3 1.34 3 3v2H9V6zm9 14H6V10h12v10zm-6-3c1.1 0 2-.9 2-2s-.9-2-2-2s-2 .9-2 2s.9 2 2 2z"/>
            </svg>
          </div>

          <div v-else class="flex">


            <svg v-if="isBeingEdited" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" @click="saveClicked()">
              <path fill="currentColor"
                    d="M5.75 3A2.75 2.75 0 0 0 3 5.75v12.5A2.75 2.75 0 0 0 5.75 21h4.249a2.112 2.112 0 0 1 .062-.593l.227-.907H7.5v-5.25a.75.75 0 0 1 .75-.75h6.603l1.435-1.435A2.258 2.258 0 0 0 15.75 12h-7.5A2.25 2.25 0 0 0 6 14.25v5.25h-.25c-.69 0-1.25-.56-1.25-1.25V5.75c0-.69.56-1.25 1.25-1.25H7v2.75A2.25 2.25 0 0 0 9.25 9.5h4.5A2.25 2.25 0 0 0 16 7.25V4.523c.358.06.692.23.952.49l2.035 2.035c.329.328.513.773.513 1.238v1.721a3.01 3.01 0 0 1 .213-.007h.002c.437 0 .875.087 1.285.261V8.287a3.25 3.25 0 0 0-.952-2.299l-2.035-2.035A3.25 3.25 0 0 0 15.714 3H5.75ZM8.5 7.25V4.5h6v2.75a.75.75 0 0 1-.75.75h-4.5a.75.75 0 0 1-.75-.75ZM19.715 11h-.002c-.585 0-1.17.223-1.615.67l-5.902 5.902a2.684 2.684 0 0 0-.707 1.247l-.458 1.831a1.087 1.087 0 0 0 1.319 1.318l1.83-.457a2.684 2.684 0 0 0 1.248-.707l5.902-5.902A2.285 2.285 0 0 0 19.715 11Z"/>
            </svg>
            <svg v-else xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" @click="editClicked()">
              <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
                <path d="M7 7H6a2 2 0 0 0-2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2-2v-1"/>
                <path d="M20.385 6.585a2.1 2.1 0 0 0-2.97-2.97L9 12v3h3l8.385-8.415zM16 5l3 3"/>
              </g>
            </svg>

            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" @click="open">
              <path fill="currentColor"
                    d="M16 9v10H8V9h8m-1.5-6h-5l-1 1H5v2h14V4h-3.5l-1-1zM18 7H6v12c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7z"/>
            </svg>

            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" @click="lockClicked">
              <path fill="currentColor"
                    d="M12 17c1.1 0 2-.9 2-2s-.9-2-2-2s-2 .9-2 2s.9 2 2 2zm6-9h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6h1.9c0-1.71 1.39-3.1 3.1-3.1c1.71 0 3.1 1.39 3.1 3.1v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm0 12H6V10h12v10z"/>
            </svg>
          </div>
        </div>
      </v-col>
    </v-row>

    <v-row>
      <v-col>Content:</v-col>
      <v-col>
        <BeatContentSelector v-if="content == undefined" @on-save-clicked="onSave"></BeatContentSelector>
        <p v-else>{{ props.data }} and {{ contentF() }} and {{ content }}</p>

        <BeatContentHolder v-else :content="content" :is-in-beat="true" @on-remove="onRemove"/>

      </v-col>
    </v-row>
  </v-container>


  <Handle id="a_in" type="target" :position="Position.Left"/>
  <Handle id="a_out" type="source" :position="Position.Right"/>

</template>

<style scoped>

</style>