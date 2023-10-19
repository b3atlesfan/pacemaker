<script setup lang="ts">
import {isNode, MarkerType, MaybeElement, useVueFlow, VueFlow} from '@vue-flow/core'
import {Background} from '@vue-flow/background'
import {Controls} from '@vue-flow/controls'
import {computed, markRaw, ref} from 'vue'
import GameplayBeatNode from "@/components/GameplayBeatNode.vue";
import ThePanel from "@/components/ThePanel.vue";
import {useElementsStore} from "@/store/elements";
import {storeToRefs} from "pinia";
import {BeatManager} from "@/assets/BeatManager";
import BeatContentSelector from "@/components/BeatContentSelector.vue";
import ContentCreatorForm from "@/components/ContentCreatorForm.vue";
import {Category, Skill} from "@/assets/BeatContent";
import {BeatContentManager} from "@/assets/BeatContentManager";

const contentSelectorDialog = ref(false)
const contentCreatorDialog = ref(false)

const dark = ref(true)

let beatId = ""

const beatManager = BeatManager.getInstance()
const contentManager = BeatContentManager.getInstance()
/**
 * useVueFlow provides all event handlers and store properties
 * You can pass the composable an object that has the same properties as the VueFlow component props
 */
const { onNodeDragStop, onConnect, addEdges, setTransform, toObject, nodeTypes, addNodes, getNodes, removeNodes, getSelectedElements } = useVueFlow()

/*
nodeTypes.value = {
  "gameplay-beat": markRaw(GameplayBeatNode)
}*/

/**
 * Our elements
 */
// const elements = ref(initialElements)
const { elements } = storeToRefs(useElementsStore())

let pos

function onContextMenu(mouseEvent: MouseEvent) {
  // prevent the browser's default menu
  mouseEvent.preventDefault();
  // for now, just create node
  pos = { x: mouseEvent.x, y: mouseEvent.y }
  beatManager.createNode(pos)
}

/**
 * This is a Vue Flow event-hook which can be listened to from anywhere you call the composable, instead of only on the main component
 *
 * onPaneReady is called when viewpane & nodes have visible dimensions
 */

onNodeDragStop((e) => console.log('drag stop', e))

/**
 * onConnect is called when a new connection is created.
 * You can add additional properties to your new edge (like a type or label) or block the creation altogether
 */
onConnect((params) => {

  console.log([params.sourceHandle, params.targetHandle])

  const edge = {
    id: 'e' + params.source + '-' + params.target,
    //label: 'edge with arrowhead',
    source: params.source,
    target: params.target,
    //sourceHandle: params.sourceHandle,
    //targetHandle: params.targetHandle,
    animated: true,
    markerEnd: MarkerType.ArrowClosed
  }

  addEdges(edge)
})

/**
 * toObject transforms your current graph data to an easily persist-able object
 */
function logToObject() {
  return console.log(toObject())
}

/**
 * Resets the current viewpane transformation (zoom & pan)
 */
function resetTransform() {
  return setTransform({ x: 0, y: 0, zoom: 1 })
}

function toggleClass() {
  return (dark.value = !dark.value)
}

function onAddContent(id: string) {
  beatId = id
  contentSelectorDialog.value = true
}

function onRemoveContent(id: string) {
  beatManager.editContentId(id, -1)
}

function onEditLabel(id: string, label: string) {
  editId.value = ""
  beatManager.editNodeLabel(id, label)
}

function onDelete(id: string) {
  beatManager.deleteNode(id)
}

function onSelectionPanelDelete() {
  console.log("onSelectionPanelDelete")
  beatManager.deleteNode(getSelectedElements.value[0].id)
}

function onSelectionPanelAdd() {
  console.log("onSelectionPanelDelete")
  onAddContent(getSelectedElements.value[0].id)
}

const editId = ref("")

function onSelectionPanelEdit() {
  console.log("onSelectionPanelDelete")
  editId.value = getSelectedElements.value[0].id
}

function onExit() {
  contentSelectorDialog.value = false
}

function onCreate() {
  contentCreatorDialog.value = true
}

function onSave(contentId: number) {
  console.log(beatId)
  console.log(contentId)
  beatManager.editContentId(beatId, contentId)
  contentSelectorDialog.value = false
}

function onCreateContent(description: string, categories: Category, intensity: number, introducedSkills: Skill[], reinforcedSkills: Skill[], requiredSkills: Skill[]) {
  contentManager.createContent(description, categories, intensity, introducedSkills, reinforcedSkills, requiredSkills)
  contentCreatorDialog.value = false
}



</script>

<template>
  <BeatContentSelector :dialog="contentSelectorDialog" @on-exit="onExit" @on-create="onCreate" @on-save="onSave"></BeatContentSelector>
  <ContentCreatorForm :dialog="contentCreatorDialog" @on-create-content="onCreateContent"></ContentCreatorForm>

  <VueFlow v-model="elements" :class="{ dark }" class="basicflow" :default-viewport="{ zoom: 1.5 }" :min-zoom="0.2" :max-zoom="4" @paneContextMenu="onContextMenu($event)">
    <Background :pattern-color="dark ? '#EDE7F6' : '#EDE7F6'" :gap="50" />

    <template #node-gameplay-beat="{ id, label, selected, data }">
      <GameplayBeatNode :id="id" :label="label" :selected="selected" :data="data" :is-being-edited="id == editId" @on-add-content="onAddContent" @on-remove-content="onRemoveContent" @on-edit-label="onEditLabel" @on-delete="onDelete" />
    </template>

    <!--
    <MiniMap />


    <Controls />
    -->

    <ThePanel :node-is-selected="getSelectedElements.length == 1" @on-delete="onSelectionPanelDelete" @on-add="onSelectionPanelAdd" @on-edit="onSelectionPanelEdit"/>

  </VueFlow>
  <!--
  <PacingChart />
  -->
</template>

<style>

</style>
