<script setup lang="ts">
import GameplayBeatCanvas from "@/components/GameplayBeatCanvas.vue";
import {computed, ref, watch} from "vue";
import {BeatManager} from "@/assets/BeatManager";
import {GameplayBeat} from "@/assets/GameplayBeat";
import {useVueFlow} from "@vue-flow/core";
import BeatChart from "@/components/BeatChart.vue";
import BeatTimeline from "@/components/BeatTimeline.vue";
import {onBeforeRouteLeave} from "vue-router";

const vue = useVueFlow()

const beatManager = BeatManager.getInstance()

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

const path = computed(computePath)

watch(path, () => {
  if (path.value.length <= 1) {
    beatManager.resetPath()
  } else {
    beatManager.setPath(path.value)
  }
})

function onAddNodes() {
  selectedBeats.value.forEach(beat => selectedPathBeats.value.push(beat))
  //selectedPathBeats.value.push(selectedBeats.value)
  //addToData(parseInt(selectedBeat.value.id))
}

function onClear() {
  selectedPathBeats.value = []
  //clearData()
}

class DNode {
  id: number
  cost: number
  prev: DNode | null

  constructor(id: number, cost: number = 0, prev: DNode | null = null) {
    this.id = id
    this.cost = cost
    this.prev = prev
  }
}

function computePath() {
  const path: number[] = []

  if (selectedPathBeats.value.length == 0) {
    //console.log("length is 0")
    return path
  }

  if (selectedPathBeats.value.length == 1) {
    //console.log("length is 1")
    path.push(parseInt(selectedPathBeats.value[0].id))
    return path
  }

  const nodesToVisit: DNode[] = []

  const startNode = new DNode(parseInt(selectedPathBeats.value[0].id), 0)
  nodesToVisit.push(startNode)

  let result: DNode = startNode

  let index = 1
  let targetId = parseInt(selectedPathBeats.value[index].id)


  let rounds = 0
  while (nodesToVisit.length != 0 && rounds < 100) {

    nodesToVisit.sort((first, second) => first.cost < second.cost ? 1 : -1)

    const current = nodesToVisit.pop()

    if (current == undefined) break

    if (current.id == targetId) {
      index++
      if (index >= selectedPathBeats.value.length) {
        result = current
        break
      } else {
        nodesToVisit.splice(0, nodesToVisit.length)
        targetId = parseInt(selectedPathBeats.value[index].id)
      }
    }

    const currentOutGoers = vue.getOutgoers(current.id.toString())

    currentOutGoers.forEach(outGoer => {

      const index = nodesToVisit.findIndex(node => node.id == parseInt(outGoer.id))

      if (index == -1) {
        nodesToVisit.push(new DNode(parseInt(outGoer.id), current.cost + 1, current))
      } else if (nodesToVisit[index].cost > current.cost + 1) {
        nodesToVisit[index].cost = current.cost + 1
        nodesToVisit[index].prev = current
      }
    })

    rounds++
  }

  while (result.prev != null) {
    path.push(result.id)
    result = result.prev
  }

  path.push(result.id)

  path.reverse()

  return path
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

</script>

<template>
  <v-container>
    <v-row>
      <v-col cols="4">
        <v-card elevation="3">
          <BeatChart :path="path" compute-options="Beat"></BeatChart>
        </v-card>
      </v-col>
      <v-col cols="4">
        <v-card elevation="3">
          <BeatChart :path="path" compute-options="Time"></BeatChart>
        </v-card>
      </v-col>
      <v-col cols="4">
        <v-card elevation="3">
          <BeatTimeline :path="path" compute-options="Time"></BeatTimeline>
        </v-card>
      </v-col>
    </v-row>
  </v-container>

  <v-container class="container2">
    <v-row>
      <v-col cols="12">
        <v-card class="container2" elevation="3">
          <GameplayBeatCanvas>
            <template v-slot:panel-bottom-left>

              <v-list width="auto" elevation="6">
                <v-list-item>
                  <v-btn-group>
                    <v-btn @click="onClear">Clear</v-btn>
                    <v-btn @click="onAddNodes">Add Node</v-btn>
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
