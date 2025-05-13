<script setup lang="ts">
import {MarkerType, Panel, PanelPosition, useVueFlow, VueFlow, isNode, isEdge} from '@vue-flow/core'
import {Background} from '@vue-flow/background'
import {computed, ref, watch, onMounted, nextTick } from 'vue'
import VisualizerView from "@/views/VisualizerView.vue"
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
import { useDesignVariablesStore, DesignVariable } from "@/store/designVariables";
import Papa from "papaparse";
import { eventNames } from 'process';
import { settings, currentProjectPath, loadSettings, saveSettings } from '@/store/settings';

const designVariablesStore = useDesignVariablesStore();
const theme = useTheme()

const contentSelectorDialog = ref(false)
const contentCreatorDialog = ref(false)

const props = defineProps<{ isInVisualizerView: boolean }>();

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

var justReloaded = true

// call onNodeSelected, when a node gets selected
watch(getSelectedElements, (newValue) => {
  if (newValue.length == 1 && isNode(newValue[0])) {
    if(justReloaded){
      justReloaded = false
      return
    }
    console.log("Node selected")
    onNodeSelected()
  }
})

function onNodeSelected() {
  //emit('on-draw-from-node', getSelectedElements.value[0].id)
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


function onSelectionPanelDrawGraph() {
  console.log("Drawing graph")
  emit('on-draw-from-node', getSelectedElements.value[0].id)
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

const addEdgesDelayed = async (edge : any) => {
  await nextTick();
  addEdges(edge)
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

var recordingName : number = ""
const startNewRecording = async (recID : string = "-1") => {
  if(isNaN(totalRecordings)){
    totalRecordings = 0 
  }
  if(recID == -1 || !Number.isNaN(Number(recID))) {
    totalRecordings += 1
    recordingName = "R " + totalRecordings
  }
  
  if(Number.isNaN(Number(recID))) {
    currentRecordingID = recID
    recordingName = "R " + recID
  }
  await newGraph("Recording " + totalRecordings)
}

const newGraph = async (name:string, pos=totalRecordings) =>{
  emit('on-finish-recording')
  beatId = beatManager.createNode({x: 0, y: pos * 200}, true)
  beatManager.editNodeLabel(beatId, name)
  await(nextTick())
  emit('on-next-recording')
  await(nextTick())
}

const displayAverage = async () => {
  recordingName = "Avg" + totalRecordings
  await newGraph("Average up to Rec " + totalRecordings, -1)
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

var totalRecordings : number = 0
const beatContentSelector = ref(null);

onMounted(async() => {
  await nextTick();
  console.log("Component instance:", beatContentSelector.value); // Should not be null after mounting
  
  if(settings.Name == null || settings.Name == "") {
    await loadSettings()
  }
  if(settings.Name == null || settings.Name == "") {
    settings.Name = "default_event_log"
  }
  loadRecordings()
});

var do_average = true

function createArrayWithKeys(arrayLength: number, entryLength: number, keys: string[]) {
  return Array.from({ length: arrayLength }, () => {
    const row: { [key: string]: number } = {};
    for (let k = 0; k < entryLength; k++) {
      const key = keys[k];
      row[key] = 0;
    }
    return row;
  });
}

const calculateAverages = async () => {
  if(!do_average) return;

  const keys = Object.keys(logged_events[0])


  var n_recordings = 0;
  var lastRecordingID = -1;
  var max_n_beats = 0;
  var current_n_beats = 0;
  for (let i = 0; i < logged_events.length; i++) {
    const recID = logged_events[i].RecordingID
    if(recID != lastRecordingID) {
      n_recordings += 1
      lastRecordingID = recID
      if(current_n_beats > max_n_beats) {
        max_n_beats = current_n_beats
      }
      current_n_beats = 0
    }
    current_n_beats += 1
  }
  if(current_n_beats > max_n_beats) {
    max_n_beats = current_n_beats
  }

  const n_rows = logged_events.length;
  const n_cols = keys.length;

  let totalValues = createArrayWithKeys(max_n_beats, n_cols, keys) 
  let n_entries = createArrayWithKeys(max_n_beats, n_cols, keys)

  var beatIndex:number = 0;
  var lastRecID:string = "";
  var rec:number = 0;
  for (let currentRow = 0; currentRow < n_rows; currentRow++) {
    const currentRecID :string= logged_events[currentRow].RecordingID
    if(currentRecID != lastRecID) {
      beatIndex = 0
      lastRecID = currentRecID
      rec++;
    }
    for (let k = 0; k < n_cols; k++) {
      const key : string = keys[k];
      if (logged_events[currentRow] && logged_events[currentRow][key] !== undefined) {
        totalValues[beatIndex][key] += Number(logged_events[currentRow][key]) || 0; 
        n_entries[beatIndex][key] += 1; 
      }
    }
    beatIndex += 1;
  }
  
  

  for (let i = 0; i < max_n_beats; i++) {
    for (const key of keys) {
      const entryAsNumber = Number(totalValues[i][key]);
      if (!(entryAsNumber === 0) && !Number.isNaN(entryAsNumber)){
        totalValues[i][key] /= n_entries[i][key] || 1; // Avoid division by zero
      } 
    }
  }
  
  await displayAverage()
  // create nodes with averages
  for(let i = 0; i < max_n_beats; i++){
    const event = totalValues[i];
    const eventName = "checkpointReached"
    
    const eventAsExpected = {
      name: eventName,
      args: { ...event }
    }
    
    createNodeFromValidEvent(eventAsExpected)
  }

  emit('on-finish-recording')
  emit('on-startup')
};

var logged_events: any[]
var currentRecordingID : string = ""

const loadRecordings = async () => {
  const workbook = await window.versions.readFromExcelFile(settings.Name);
  if(!workbook || workbook == "null") return;
  deleteAllNodes()
  beatContentSelector.value.onDeleteAll()

  const workbookWithoutDots = workbook.replace(/(\d+),(\d+)/g, '$1.$2');
  logged_events = Papa.parse(workbookWithoutDots, { header: true }).data;
  
  // wait for 1 ms to ensure that all nodes are deleted
  await nextTick();

  //for(var i = 0; i < workbook.SheetNames.length; i++){
  //var sheetName :string = workbook.SheetNames[i]
  //if(!sheetName.includes("Recording")) continue;
  //const sheet = workbook.Sheets[workbook.SheetNames[i]];
  
  //const index = workbook.SheetNames[i].split(" ")[1]
  currentRecordingID = logged_events[0].RecordingID;
  await startNewRecording(currentRecordingID)

  
  logged_events.forEach((event: any) => {
    const recID = event.RecordingID
    if(recID != currentRecordingID) {
      currentRecordingID = recID
      startNewRecording(recID)
    }
    const eventName = event.EventName;
    if(eventName != "checkpointReached") return;
    const eventAsExpected = {
      name: eventName,
      args: { ...event }
    };
    delete eventAsExpected.args["Timestamp"];
    delete eventAsExpected.args["eventName"];
    delete eventAsExpected.args["RecordingID"];
    createNodeFromValidEvent(eventAsExpected)
  })

  var lastBeat = beatManager.getNode(beatManager.getLatestNodeID())
  //}
  calculateAverages()
}


function recordEvent(event: string) {
  var eventObj = JSON.parse(event)
  if(eventObj.name != "checkpointReached" && eventObj.name != "VariableChanged" ) return;

  console.log("Recording event: " + JSON.stringify(eventObj))
  // expected eventObj.args example: 
/*{
  "(Empty, NoPath)": 0,
  "(index, NoPath)": 0,
  "(userReportedIntensity, NoPath)": 0,
}*/

  const { "(index, NoPath)": index, "(userReportedIntensity, NoPath)": userReportedIntensity, ...restArgs} = eventObj.args;
  eventObj.variables = {
    index,
    userReportedIntensity,
    ...restArgs
  };
  eventObj.timestamp = new Date().toISOString();

  window.versions.writeToExcelFile(settings.Name, eventObj)

  createNodeFromValidEvent(eventObj)
}

function calculateIntensityFromArray(event: { [key: string]: number }, weightType: 'gameplay' | 'narrative') : number {
  //return event.EnemiesKilled + event.Deaths * 10
  var intensity = 0;
  var M1 = 1; var M2 = 0; var M3 = 1;
  for (var key in event) {
    if(isNaN(event[key])) {
      continue;
    } 
    var variable : DesignVariable
    if(key.includes("_Diff")) {
      const undiffedKey = key.replace("_Diff", "")
      variable = designVariablesStore.getVariable(undiffedKey);
    } else if (key.includes("userReportedIntensity")) {
      variable = designVariablesStore.getVariable(key);
    }
    else {
      continue;
    }
    if(variable == null) continue;  
    var weight = Number(variable.getWeight(weightType));
    if(isNaN(weight)) {
      continue;
    }
    var isMultiplier = variable.isMultiplier;
    if(weight == null || weight == 0) continue;
    if(isMultiplier){
      if(weight > 0){
        M1 *= weight * event[key]
      } else {
        M3 *= -1 * weight * event[key]
      }
    } else {
      M2 += weight * event[key]
    }
  }
  if(M3 == 0 || M3 == -0) M3 = 0.00001;
  var total = M1 + M2 / M3;
  total = Math.floor(total);
  return total;
}

function seperateKey(key : string) {
  const parts = key.replace("(", "").replace(")", "").split(", ").map(part => part.trim());
  return {
        name: parts[0],
        path: parts[1]
    };
}

function getAllWithName(v : { [key: string]: number }, wantedName: string) {
  const all = []
  for(const [key, value] of Object.entries(v)) {
    const { name, path } = seperateKey(key)
    if(name == wantedName) {
      all.push({name: path, value: value})
    }
  }
  if(all.length == 0) {
    all.push({name: null, value: null})
  }
  return all;
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
  var v : { [key: string]: number } = eventObj.args;

  var timeDiffInMs =getAllWithName(v, "currentTime_Diff")[0].value;
  var timeDiffInMinAndSec = getTimeDiffInMinAndSec(timeDiffInMs);
  var beatId : number = beatManager.createNode({x: lastBeatPos.x + 300, y: lastBeatPos.y})
  beatManager.editNodeLabel(beatId, recordingName + " " +eventObj.name + " " + v.index)

  var gameplayIntensity = calculateIntensityFromArray(v, 'gameplay')
  var narrativeIntensity = calculateIntensityFromArray(v, 'narrative');

  const contentId = contentManager.createContent({
    name: "B" + v.index + " " + recordingName,
    intensity: gameplayIntensity,
    narrativeIntensity: narrativeIntensity,
    rawVariables: v,
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

function getPaths() {
  return beatManager.getLatestNodeID();
}

function updateAllContents() {
  contentManager.updateAllContents()
}


defineExpose({getPaths, updateAllContents})
const emit = defineEmits(['on-startup','on-add-node', 'on-next-recording', 'on-finish-recording', 'on-draw-from-node'])

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

        
        <v-tooltip v-if="props.isInVisualizerView" text="Save Graph from selection" location="bottom">
          <template v-slot:activator="{ props }">
            <v-btn v-bind="props" icon="mdi-chart-line" @click="onSelectionPanelDrawGraph" color="secondary"></v-btn>
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

      <v-tooltip text="Recalculate Average" location="start">
        <template v-slot:activator="{ props }">
          <v-btn v-bind="props" icon="mdi-calculator" color="secondary" @click="do_average = false"></v-btn>
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
