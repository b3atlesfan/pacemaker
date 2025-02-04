<script setup lang="ts">
import {MarkerType, Panel, PanelPosition, useVueFlow, VueFlow, isNode, isEdge} from '@vue-flow/core'
import {Background} from '@vue-flow/background'
import {computed, ref} from 'vue'
import GameplayBeatNode from "@/components/GameplayBeatNode.vue";
import {useElementsStore} from "@/store/elements";
import {storeToRefs} from "pinia";
import {BeatManager} from "@/assets/BeatManager";
import BeatContentSelector from "@/components/BeatContentSelector.vue";
import ContentCreatorForm from "@/components/ContentCreatorForm.vue";
import {Category, Skill} from "@/assets/BeatContent";
import {BeatContentManager} from "@/assets/BeatContentManager";
import {useTheme} from "vuetify";
import ContentCreationForm from "@/components/ContentCreationForm.vue";
import { BeatContent } from '@/assets/BeatContent';

const theme = useTheme()

const contentSelectorDialog = ref(false)
const contentCreatorDialog = ref(false)

const dark = ref(true)

let beatId = ""

const beatManager = BeatManager.getInstance()
const contentManager = BeatContentManager.getInstance()

const editId = ref("")

const hasContent = computed(() => {
  if (getSelectedElements.value.length == 0) return false

  return getSelectedElements.value[0].data != -1
})

const {
  onNodeDragStop, onConnect, addEdges, removeEdges, setTransform, toObject,
  nodeTypes, addNodes, getNodes, removeNodes, getSelectedElements, getViewport, fitView, setViewport, project,
} = useVueFlow()

const oneNodeIsSelected = computed(() => {
  return getSelectedElements.value.length == 1 && isNode(getSelectedElements.value[0])
})

const oneEdgeIsSelected = computed(() => {
  return getSelectedElements.value.length == 1 && isEdge(getSelectedElements.value[0])
})

const multipleElementsSelected = computed(() => {
  return getSelectedElements.value.length > 1
})

// const elements = ref(initialElements)
const {elements} = storeToRefs(useElementsStore())

let pos

function onContextMenu(mouseEvent: MouseEvent) {
  // prevent the browser's default menu
  mouseEvent.preventDefault();
  // for now, just create node
  pos = {x: mouseEvent.x, y: mouseEvent.y}
  beatManager.createNode(project(pos))
}

/**
 * onConnect is called when a new connection is created.
 * You can add additional properties to your new edge (like a type or label) or block the creation altogether
 */
onConnect((params) => {

  //console.log([params.sourceHandle, params.targetHandle])

  const edge = {
    id: 'e' + params.source + '-' + params.target,
    //label: 'edge with arrowhead',
    source: params.source,
    target: params.target,
    sourceHandle: params.sourceHandle,
    targetHandle: params.targetHandle,
    animated: false,
    markerEnd: {
      type: MarkerType.ArrowClosed,
      width: 20,
      height: 20,
      color: '#000000',
    },
    style: {
      strokeWidth: 2,
      stroke: '#000000',
    },
  }

  addEdges(edge)
})

function onAddContent(id: string) {
  beatId = id
  contentSelectorDialog.value = true
}

function onEditContent() {
  const selectedElement = getSelectedElements.value[0];
  if (selectedElement && isNode(selectedElement)) {
    console.log("Editing content id: " + selectedElement.id);
    beatId = selectedElement.id
    contentSelectorDialog.value = true;
  }
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
  getSelectedElements.value.forEach(elem => {
    if (isNode(elem)) {
      beatManager.deleteNode(elem.id)
    } else if (isEdge(elem)) {
      removeEdges(elem.id)
    }
  })
}

function onSelectionPanelAdd() {
  onAddContent(getSelectedElements.value[0].id)
}

function onSelectionPanelRemove() {
  beatManager.editContentId(getSelectedElements.value[0].id, -1)
}

function onSelectionPanelEdit() {
  editId.value = getSelectedElements.value[0].id
}

function onExit() {
  contentSelectorDialog.value = false
}

function onCreate() {
  overrideInitialState.value = null
  contentCreatorDialog.value = true
}

function onSave(contentId: number) {
  //console.log(beatId)
  //console.log(contentId)
  beatManager.editContentId(beatId, contentId)
  contentSelectorDialog.value = false
}

function onEdit(selectedId: number) {
  console.log("Editing " + selectedId)
  contentCreatorDialog.value = true
  contentSelectorDialog.value = false


  overrideInitialState.value = contentManager.getContent(selectedId)
}

function onCreateContent(formInput: Object) {
  contentManager.createContent(formInput)
  contentCreatorDialog.value = false
}

function createNode() {
  const viewport = getViewport()
  beatManager.createNode({x: -viewport.x / viewport.zoom, y: -viewport.y / viewport.zoom})
}

function deleteAllNodes() {
  beatManager.deleteAllNodes()
}


/** export type ContentFormState = {
  name: string,
  intensity: number,
  narrativeIntensity: number,
  category: Category,
  playtime: string,
  introducedSkills: [],
  reinforcedSkills: [],
  requiredSkills: [],
} */

function addEdgesDelayed(edge : any) {
  setTimeout(() => {
    addEdges(edge)
  }, 1)
}

window.server.onMessage('asynchronous-message', (message: any) => {
  if(!message.startsWith("Last ping")){
    console.log(message);
  }
  recordEvent(message);
});

function recordEvent(event:string) {
  const eventObj = JSON.parse(event)

  console.log("Recording event: " + event)

  const viewport = getViewport()

  // get position of last beat
  var lastBeatId = beatManager.getLatestNodeID()
  var lastBeat = beatManager.getNode(lastBeatId)
  
  var lastBeatPos = {x: viewport.x / viewport.zoom, y: viewport.y / viewport.zoom}
  if (lastBeat != null) {
    lastBeatPos = {x: lastBeat.position.x, y: lastBeat.position.y}
  }

  var beatId : number = beatManager.createNode({x: lastBeatPos.x + 300, y: lastBeatPos.y})
  const contentId = contentManager.createContent({
    name: eventObj.name + " " + beatId + " " + eventObj.args.strength,
    intensity: 0,
    narrativeIntensity: 0,
    category: "Platforming",
    playtime: "0"
  })

  beatManager.editContentId(beatId, contentId)

  const edge = {
    id: 'e' + lastBeatId + '-' + beatId,
    //label: 'edge with arrowhead',
    source: String(lastBeatId),
    target: String(beatId),
    sourceHandle: 'c_out',
    targetHandle: 'a_in',
    animated: false,
    markerEnd: {
      type: MarkerType.ArrowClosed,
      width: 20,
      height: 20,
      color: '#000000',
    },
    style: {
      strokeWidth: 2,
      stroke: '#000000',
    },
  }
  if (beatId != 0) {
    addEdgesDelayed(edge)
  }
  lastBeatId = beatId
  
  // beatmanager.createNode
  // contentManager.CreateContent
  // connect beats
  // connect content to beat*/
}
const overrideInitialState = ref<BeatContent | null>(null);
</script>

<template>
  <BeatContentSelector :dialog="contentSelectorDialog" @on-exit="onExit" @on-create="onCreate"
                       @on-save="onSave" @on-edit="onEdit"></BeatContentSelector>

  <ContentCreationForm :dialog="contentCreatorDialog" :overrideInitialState="overrideInitialState" @on-submit="onCreateContent" @on-exit="contentCreatorDialog = false"></ContentCreationForm>

  <!--
  <ContentCreatorForm :dialog="contentCreatorDialog" @on-create-content="onCreateContent"></ContentCreatorForm>
  -->

  <VueFlow v-model="elements" :class="{ dark }" class="basicflow" :default-viewport="{ zoom: 1.5 }" :min-zoom="0.2"
           :max-zoom="4" @paneContextMenu="onContextMenu($event)">

    <!-- Selection Panel -->
    <Panel :position="PanelPosition.TopRight">
      <v-btn-group v-if="oneNodeIsSelected" color="secondary">

        <v-tooltip text="Edit Beat" location="bottom">
          <template v-slot:activator="{ props }">
            <v-btn v-bind="props" icon="mdi-pencil" @click="onSelectionPanelEdit"></v-btn>
          </template>
        </v-tooltip>

        <v-tooltip v-if="!hasContent" text="Add Content" location="bottom">
          <template v-slot:activator="{ props }">
            <v-btn v-bind="props" icon="mdi-tag-plus" @click="onSelectionPanelAdd" color="secondary"></v-btn>
          </template>
        </v-tooltip>

        <!--
        <v-tooltip text="Show Content" location="bottom">
          <template v-slot:activator="{ props }">
            <v-btn v-bind="props" icon="mdi-tag-search" color="secondary"></v-btn>
          </template>
        </v-tooltip>
        -->

        <v-tooltip v-else text="Remove Content" location="bottom">
          <template v-slot:activator="{ props }">
            <v-btn v-bind="props" icon="mdi-tag-minus" @click="onSelectionPanelRemove" color="secondary"></v-btn>
          </template>
        </v-tooltip>


        <!--
        <v-tooltip text="Switch Content" location="bottom">
          <template v-slot:activator="{ props }">
            <v-btn v-bind="props" icon="mdi-tag-edit" @click="onRemove" color="secondary"></v-btn>
          </template>
        </v-tooltip>
        -->

        <v-tooltip text="Delete Beat" location="bottom">
          <template v-slot:activator="{ props }">
            <v-btn v-bind="props" icon="mdi-delete" @click="onSelectionPanelDelete"></v-btn>
          </template>
        </v-tooltip>

      </v-btn-group>

      <v-btn-group v-if="oneEdgeIsSelected" color="secondary">
        <v-tooltip text="Delete Edge" location="bottom">
          <template v-slot:activator="{ props }">
            <v-btn v-bind="props" icon="mdi-delete" @click="onSelectionPanelDelete"></v-btn>
          </template>
        </v-tooltip>
      </v-btn-group>

      <v-btn-group v-if="multipleElementsSelected" color="secondary">
        <v-tooltip text="Delete All" location="bottom">
          <template v-slot:activator="{ props }">
            <v-btn v-bind="props" icon="mdi-delete" @click="onSelectionPanelDelete"></v-btn>
          </template>
        </v-tooltip>
      </v-btn-group>

    </Panel>

    <!-- General Panel -->
    <Panel :position="PanelPosition.BottomRight">
      <v-tooltip text="Edit Contents" location="start">
        <template v-slot:activator="{ props }">
          <v-btn v-bind="props" icon="mdi-tag" color="secondary" @click="onEditContent"></v-btn>
        </template>
      </v-tooltip>
      <v-tooltip text="Record" location="start">
        <template v-slot:activator="{ props }">
          <v-btn v-bind="props" icon="mdi-record" color="secondary" @click="recordEvent"></v-btn>
        </template>
      </v-tooltip>
      <v-tooltip text="Delete All" location="start">
        <template v-slot:activator="{ props }">
          <v-btn v-bind="props" icon="mdi-delete" color="secondary" @click="deleteAllNodes"></v-btn>
        </template>
      </v-tooltip>
      <v-tooltip text="Create Gameplay Beat" location="start">
        <template v-slot:activator="{ props }">
          <v-btn v-bind="props" icon="mdi-plus" color="secondary" @click="createNode"></v-btn>
        </template>
      </v-tooltip>
      
      <!--
      <v-btn icon="mdi-fit-to-screen-outline" color="surface" @click="fitView">
        <v-icon></v-icon>
        <v-tooltip activator="parent" location="top">
          Reset Transform
        </v-tooltip>
      </v-btn>
      -->
    </Panel>

    <!-- Slot Panel -->
    <Panel v-if="true" :position="PanelPosition.BottomLeft">
      <slot name="panel-bottom-left"></slot>
    </Panel>

    <Background :pattern-color="theme.current.value.colors['on-surface']" :gap="50"/>

    <template #node-gameplay-beat="{ id, label, selected, data }">
      <GameplayBeatNode :id="id" :label="label" :selected="selected" :data="data" :is-being-edited="id == editId"
                        @on-add-content="onAddContent" @on-remove-content="onRemoveContent" @on-edit-label="onEditLabel"
                        @on-delete="onDelete"
      />
    </template>

  </VueFlow>
</template>

<style>

</style>
