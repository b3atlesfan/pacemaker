<script setup lang="ts">
import GameplayBeatCanvas from "@/components/GameplayBeatCanvas.vue";
import {computed, ref, watch, onMounted, nextTick} from "vue";
import {BeatManager} from "@/assets/BeatManager";
import {GameplayBeat} from "@/assets/GameplayBeat";
import BeatChart from "@/components/BeatChart.vue";
import BeatTimeline from "@/components/BeatTimeline.vue";
import {onBeforeRouteLeave, onBeforeRouteUpdate} from "vue-router";
import {computePath} from "@/assets/PathFinder";
import {useVueFlow} from "@vue-flow/core";
import {BeatContent} from "@/assets/BeatContent";
import {BeatContentManager} from "@/assets/BeatContentManager";
import ContentGraph from "@/components/ContentGraph.vue";
import ContentChart from "@/components/ContentChart.vue";
import { identifierToKeywordKind } from "typescript";
import { on } from "events";
import { start } from "repl";
import DesignerView from "./DesignerView.vue";
import IntensityFormulasView from "./IntensityFormulasView.vue";
import { time } from "console";
import VariableView from '@/views/VariableView.vue';
import { DesignVariable } from "../store/designVariables";

const vue = useVueFlow()

const beatManager = BeatManager.getInstance()
const contentManager = BeatContentManager.getInstance()

const selectedBeats = computed(() => beatManager.getSelectedBeats())

const selectedPathBeats = ref([] as GameplayBeat[])

const items = computed(() => {
  const result = []

  for (let i = 0; i < selectedPathBeats.value.length; i++) {
    /*
    if (i > 0) {
      result.push({
        type: 'divider',
      })
    }*/

    const icon = i == selectedPathBeats.value.length - 1 ? 'mdi-flag-checkered' : 'mdi-circle-medium'

    result.push({
      title: selectedPathBeats.value[i].label,
      icon: icon,
    })
  }

  return result
})

const path = computed(() => 
  computePath(selectedPathBeats.value, vue)
)

function pathFromArray(arr: GameplayBeat[]) {
    const beatPath:number[] = computePath(arr, vue) || []
    const result: (BeatContent | null) [] = []
    beatPath.forEach(beatId => {
      const beat = beatManager.getNode(beatId.toString())
      result.push(beat.data.contentId == -1 ? null : contentManager.getContent(beat.data.contentId))
    })
    return result
}

const pathOnSelection = computed(() => { 
    if (selectedBeats.value.length == 0) {
      return []
    }
    return pathFromArray(selectedBeats.value)
  }
)

const currentContentPath = computed(() => {
  const result: (BeatContent | null) [] = []

  path.value.forEach(beatId => {
    const beat = beatManager.getNode(beatId.toString())

    result.push(beat.data.contentId == -1 ? null : contentManager.getContent(beat.data.contentId))
  })

  return result
})

let snapShots: {name: string, path: (BeatContent | null) []}[] = []
let id = 1

const allContentPaths = computed(() => {
  var result: {name: string, path: (BeatContent | null) []}[] = snapShots.concat({name: "Path " + id.toString(), path: currentContentPath.value})
  if(pathOnSelection.value.length > 0) {
    result.push({name: "Selection", path: pathOnSelection.value})
  }
  return result
})

watch(allContentPaths, () => {
  console.log(allContentPaths.value)
})

watch(path, () => {
  if (path.value.length <= 1) {
    beatManager.resetPath()
  } else {
    beatManager.setPath(path.value)
  }
})

function onSnapshot() {
  snapShots.push({name: currentPathName, path: currentContentPath.value})
  currentPathName = ""
  id++
  selectedPathBeats.value = []
}


var startID = "-1"
function onAddNode(id){
}

function onDrawFromNode(){
  return;
  snapShots.push({name: "Path " + id.toString(), path: pathOnSelection.value})
  id++
}

const onFinishRecording = async() => {
  return;
  if(startID == "-1") {
    return
  }
  var firstNode = beatManager.getNode(startID)
  selectedPathBeats.value.push(firstNode)
  var lastNode = beatManager.getNode(beatManager.getLatestNodeID())
  selectedPathBeats.value.push(lastNode)

  await nextTick()
  onSnapshot()
}

var currentPathName = ""

const onNextRecording = async() => {
  return;
  startID = beatManager.getLatestNodeID() + 1
  const namingBeat = beatManager.getNode(beatManager.getLatestNodeID())
  currentPathName = namingBeat.label
}

function onAddNodes() {
  selectedBeats.value.forEach(beat => selectedPathBeats.value.push(beat))
  //selectedPathBeats.value.push(selectedBeats.value)
  //addToData(parseInt(selectedBeat.value.id))
}

function onClear() {
  selectedPathBeats.value = []
  snapShots = []
  id = 1
  //clearData()
}

function switchSelectedBeats(id1: number, id2: number) {
  const temp = selectedPathBeats.value[id1]
  selectedPathBeats.value[id1] = selectedPathBeats.value[id2]
  selectedPathBeats.value[id2] = temp
}

function removeFromSelectedBeats(id: number) {
  selectedPathBeats.value.splice(id, 1)
}

onBeforeRouteLeave(() => {
  beatManager.resetPath()
})

function onUpdateIntensityFormula() {
  console.log("Intensity Formula Updated")
  // reload whole page

  window.location.reload();
}

const onStartup = async () => {
  await nextTick()
  var ids : number[] = beatManager.getAllRecordingNodeIDs()
  if (ids.length > 1) {
    const lastItem = ids.pop();
    if (lastItem !== undefined) {
      ids.unshift(lastItem);
    }
  }
  ids.forEach((recID: number) => {
    const node = beatManager.getNode(recID)
    if(node){
      var path = pathFromArray([node])
      if(path.length > 1) {
        path = path.filter((item) => item != null)
        snapShots.push({name: "" + node.label, path: path})
        id++
      }
    }
  })
  allContentPaths.value
}

const gameplayBeatCanvas = ref(null)

onMounted(async() => {
  await nextTick();
  console.log("Component instance:", gameplayBeatCanvas.value); // Should not be null after mounting
});



</script>

<template>
  <v-container>
    <v-row>
      <v-col cols="4">
        <v-card elevation="3">
          <ContentGraph :paths="allContentPaths" compute-options="Beat" ></ContentGraph>
        </v-card>
      </v-col>
      <v-col cols="4">
        <v-card elevation="3">
          <ContentGraph :paths="allContentPaths" compute-options="Time" ></ContentGraph>
        </v-card>
      </v-col>
      <v-col cols="4">
        <v-card elevation="3">
          <ContentChart :paths="allContentPaths" :path="path" ></ContentChart>
        </v-card>
      </v-col>
    </v-row>
  </v-container>

  <v-container class="container2">
    <v-row>
      <v-col cols="6">
        <v-card class="container2" elevation="3">
          <GameplayBeatCanvas ref="gameplayBeatCanvas" @onAddNode="onAddNode"
          @on-next-recording="onNextRecording"
          @on-finish-recording="onFinishRecording"
          @on-draw-from-node="onDrawFromNode"
          @on-startup="onStartup"
          :isInVisualizerView="true">
            <template v-slot:panel-bottom-left>

              <v-list width="auto" elevation="6">
                <v-list-item>
                  <v-btn-group>
                    <v-btn @click="onClear">Clear</v-btn>
                    <v-btn @click="onAddNodes">Add Node</v-btn>
                    <v-btn @click="onSnapshot">Snapshot</v-btn>
                    <!--
                    <v-btn @click="onShow">Show</v-btn>
                    -->
                  </v-btn-group>
                </v-list-item>

                <v-divider></v-divider>

                <v-list-item v-for="(item, i) in items" :title="item.title" :prepend-icon="item.icon">

                  <template v-slot:append>
                    <v-btn-group>
                      <v-btn icon="mdi-delete" @click="removeFromSelectedBeats(i)"></v-btn>
                      <v-btn icon="mdi-arrow-down" @click="switchSelectedBeats(i, i+1)" :disabled="i == items.length - 1"></v-btn>
                      <v-btn icon="mdi-arrow-up" @click="switchSelectedBeats(i, i-1)" :disabled="i == 0"></v-btn>
                    </v-btn-group>
                  </template>

                </v-list-item>
              </v-list>

            </template>
          </GameplayBeatCanvas>
        </v-card>
      </v-col>
      <v-col cols="6">
        <v-card class="container2" elevation="3">
          <VariableView :isInVisualizerView="true" @onUpdateIntensityFormula="onUpdateIntensityFormula"></VariableView>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<style scoped>

.container2 {
  display: flex;
  width: 100%;
  height: 75%;
}

.container {
  display: grid;
  grid-template-columns: 75% 25%;
  grid-template-rows: 60% 40%;
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  bottom: 0;
}

.col1 {
  grid-column: 1 / span 2;
  overflow-y: scroll;
}

.col2 {
  grid-column-start: 2;
  grid-row: 1;
  overflow-y: scroll;
}

</style>
