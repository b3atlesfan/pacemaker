<script setup lang="ts">
import {MarkerType, Panel, PanelPosition, useVueFlow, VueFlow, isNode, isEdge} from '@vue-flow/core'
import {Background} from '@vue-flow/background'
import {computed, ref, watch, onMounted, nextTick } from 'vue'
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
import { time } from 'console';
import Filemanager from "@/assets/Filemanager";
import * as XLSX from "xlsx";

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
    var contentId = beatManager.getNode(selectedElement.id).data.contentId
    onEdit(contentId)
  }
  else {
    beatId = ""
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
  if(beatId != "") {
    beatManager.editContentId(beatId, contentId)
  }
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
  if(isRecording.value){
    recordEvent(message)
  }
});

var isRecording = ref(false)
var recordingIcon = ref('mdi-record')

function toggleRecording(){
  isRecording.value = !isRecording.value
  recordingIcon.value = isRecording.value ? 'mdi-stop' : 'mdi-record'
}

var recordingName :string = ""
function startNewRecording(index : number = -1){
  if(index == -1) {
    totalRecordings += 1
  } else {
    totalRecordings = index
  }
  // Create empty beat with name "Recording x"
  beatId = beatManager.createNode({x: 0, y: totalRecordings * 200})
  recordingName = "Recording " + totalRecordings
  beatManager.editNodeLabel(beatId, recordingName)
}

function displayAverage(){
  beatId = beatManager.createNode({x: 0, y: -200})
  recordingName = "Average up to Rec " + totalRecordings
  beatManager.editNodeLabel(beatId, recordingName)
}

const startListening = async () => {
      const response = await window.versions.startListening();
      startNewRecording()
    }
watch(isRecording, (newValue) => {
  recordingIcon.value = newValue ? 'mdi-stop' : 'mdi-record';
  if(isRecording.value){
    startListening()
  } else {
    console.log("Recording stopped")
  }
});

function getTimeDiffInMinAndSec(timeDiffInS: number) {
  var timeDiffInMin  = Math.floor(timeDiffInS / 60);
  var timeDiffInSec = Math.floor((timeDiffInS % 60));
  var timeDiffTotal = ""
  if(timeDiffInMin < 10){
    timeDiffTotal += "0"
  }
  timeDiffTotal += timeDiffInMin + ":"
  if(timeDiffInSec < 10){
    timeDiffTotal += "0"
  }
  timeDiffTotal += timeDiffInSec
  return timeDiffTotal
}


//let exampleEvent = '{\r\n  "name": "checkpointReached",\r\n  "args": {\r\n    "index": 1,\r\n    "TimeDiff": 0.0,\r\n    "EnemiesKilled": 0,\r\n    "Deaths": 0,\r\n    "Jumps": 0,\r\n    "ScoreDiff": 0\r\n  }\r\n}'
//window.versions.writeToExcelFile("TestWrite", exampleEvent)

var totalRecordings = 0
const beatContentSelector = ref(null);

onMounted(async() => {
  await nextTick();
  console.log("Component instance:", beatContentSelector.value); // Should not be null after mounting
  loadRecordings()
});

const calculateAverages = async () => {
  const workbook = await window.versions.readFromExcelFile("event_log");
  if (!workbook || workbook === "null") return;

  var n_rows = 0;
  for (let i = 0; i < workbook.SheetNames.length; i++) {
    const sheet = workbook.Sheets[workbook.SheetNames[i]];
    const range = XLSX.utils.decode_range(sheet["!ref"]); // Get the range of the first sheet
    const local_n_rows = range.e.r + 1; // Number of rows
    if (local_n_rows > n_rows) {
      n_rows = local_n_rows;
    }
  }

  const sheet = workbook.Sheets[workbook.SheetNames[0]];
  const range = XLSX.utils.decode_range(sheet["!ref"]); // Get the range of the first sheet

  const n_cols = range.e.c + 1; // Number of columns
  const n_of_sheets = workbook.SheetNames.length; 
  const skipCols = 2
  const skipRows = 1

  let totalValues = Array.from({ length: n_rows - skipRows }, () => Array(n_cols-skipCols).fill(0));

  for (let i = 0; i < workbook.SheetNames.length; i++) {
    const sheet = workbook.Sheets[workbook.SheetNames[i]];
    const localValues = XLSX.utils.sheet_to_json(sheet, { header: 1 }); // Convert sheet to a 2D array

    for (let j = skipRows; j < n_rows; j++) {
      for (let k = skipCols; k < n_cols; k++) {
        if (localValues[j] && localValues[j][k] !== undefined) {
          totalValues[j - skipRows][k-skipCols] += Number(localValues[j][k]) / n_of_sheets || 0; // Convert to number and sum
        }
      }
    }
  }

  // get args array
  const firstSheet = workbook.Sheets[workbook.SheetNames[0]];
  const firstRow : string[] = XLSX.utils.sheet_to_json(firstSheet, { header: 1 })[0].slice(2);
  
  displayAverage()
  // create nodes with averages
  for(let i = 0; i < n_rows - skipRows; i++){
    const event = totalValues[i];
    const eventName = "checkpointReached"
    const eventArgs = firstRow.reduce((argsObj, name, index) => {
      argsObj[name] = event[index]; // Assign each value to its respective key
      return argsObj;
    }, {});
    const eventAsExpected = {
      name: eventName,
      args: eventArgs
    }
    createNodeFromValidEvent(eventAsExpected)
  }
};


const loadRecordings = async () => {
  const workbook = await window.versions.readFromExcelFile("event_log");
  if(!workbook || workbook == "null") return;
  deleteAllNodes()
  beatContentSelector.value.onDeleteAll()
  
  // wait for 1 ms to ensure that all nodes are deleted
  await nextTick();

  for(var i = 0; i < workbook.SheetNames.length; i++){
    const sheet = workbook.Sheets[workbook.SheetNames[i]];
    
    const index = workbook.SheetNames[i].split(" ")[1]
    startNewRecording(parseInt(index))

    // "Record" for each line in sheet
    const events = XLSX.utils.sheet_to_json(sheet);
    
    events.forEach((event: any) => {
      const eventName = event.eventName;
      if(eventName != "checkpointReached") return;
      delete event["Timestamp"];
      delete event["eventName"];
      const eventAsExpected = {
        name: eventName,
        args: event
      }
      createNodeFromValidEvent(eventAsExpected)
    })
  }
  calculateAverages()
}


function recordEvent(event: any) {
  var eventObj = JSON.parse(event)
  if(eventObj.name != "checkpointReached") return;

  console.log("Recording event: " + JSON.stringify(eventObj))

  window.versions.writeToExcelFile("Recording " + totalRecordings, event)

  createNodeFromValidEvent(eventObj)
}

function createNodeFromValidEvent(eventObj) {
  const viewport = getViewport()

  // get position of last beat
  var lastBeatId = beatManager.getLatestNodeID()
  var lastBeat = beatManager.getNode(lastBeatId)
  
  var lastBeatPos = {x: viewport.x / viewport.zoom, y: viewport.y / viewport.zoom}
  if (lastBeat != null) {
    lastBeatPos = {x: lastBeat.position.x, y: lastBeat.position.y}
  }
  var v = eventObj.args;
  var timeDiffInMs = v.TimeDiff;
  var timeDiffInMinAndSec = getTimeDiffInMinAndSec(timeDiffInMs);
  var beatId : number = beatManager.createNode({x: lastBeatPos.x + 300, y: lastBeatPos.y})
  beatManager.editNodeLabel(beatId, eventObj.name + " " + v.index)

  const contentId = contentManager.createContent({
    name: "B" + v.index + " " + recordingName,
    intensity: v.EnemiesKilled + v.Deaths * 10,
    narrativeIntensity: v.Jumps + v.ScoreDiff,
    category: "Platforming",
    playtime: timeDiffInMinAndSec
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
  if (beatId != 0 && beatId != '') {
    addEdgesDelayed(edge)
  }
  lastBeatId = beatId
}
const overrideInitialState = ref<BeatContent | null>(null);
</script>

<template>
  <BeatContentSelector ref="beatContentSelector" :dialog="contentSelectorDialog" @on-exit="onExit" @on-create="onCreate"
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
            <v-btn v-bind="props" :icon="recordingIcon" color="secondary" @click="toggleRecording"></v-btn>
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
