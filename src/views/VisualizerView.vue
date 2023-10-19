<script setup lang="ts">
import GameplayBeatCanvas from "@/components/GameplayBeatCanvas.vue";
import {computed, ref} from "vue";
import {BeatManager} from "@/assets/BeatManager";
import {GameplayBeat} from "@/assets/GameplayBeat";
import {useVueFlow} from "@vue-flow/core";

const vue = useVueFlow()

const beatManager = BeatManager.getInstance()

const selectedBeat = computed(() => beatManager.getSelectedBeat())

const selectedBeats = ref([] as GameplayBeat[])

const options = ref({
  chart: {
    id: 'vuechart-example'
  },
  xaxis: {
    type: 'numeric'
  },
  stroke: {
    width: 5,
    curve: 'smooth'
  },
  fill: {
    type: 'gradient',
    gradient: {
      shade: 'dark',
      gradientToColors: [ '#FDD835'],
      shadeIntensity: 1,
      type: 'horizontal',
      opacityFrom: 1,
      opacityTo: 1,
      stops: [0, 100, 100, 100]
    },
  }
})

const series = ref([{
  name: 'series-1',
  data: [[] as number[]]
}])

function onSelectStartNode() {
  selectedBeats.value.push(selectedBeat.value)
  //addToData(parseInt(selectedBeat.value.id))
}

function onClear() {
  selectedBeats.value = []
  clearData()
}

function addToData(value: number, position: number) {
/*
  const result = beatManager.elements.elements.value.find(element => element.id == value.toString())
  let value = ""
  if (result) {
    const beat = result as GameplayBeat
    value = beat.label
    //console.log("what? " + value)
  }
*/
  //options.value.xaxis.categories.push(value)

  //options.value.xaxis.categories.forEach(category => console.log(category))

  series.value[0].data.push([position, value])
}

function clearData() {
  series.value[0].data.splice(0, series.value[0].data.length)
  //options.value.xaxis.categories.splice(0, options.value.xaxis.categories.length)
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

function onShow() {
  console.log(vue.getOutgoers(selectedBeat.value.id))

  const dict : { [key: string]: { cost: number, prev: number}} = {}

  dict["hello"] = {cost: 3, prev: 3}

  //

  if (selectedBeats.value.length == 0) return

  const nodesToVisit: DNode[] = []

  const startNode = new DNode(parseInt(selectedBeats.value[0].id), 0)
  nodesToVisit.push(startNode)

  let result: DNode = startNode

  let index = 1
  let targetId = parseInt(selectedBeats.value[index].id)

  while (nodesToVisit.length != 0) {

    nodesToVisit.sort((first, second) => first.id < second.id ? 1 : -1)

    const current = nodesToVisit.pop()

    if (current == undefined) break

    if (current.id == targetId) {
      index++
      if (index >= selectedBeats.value.length) {
        result = current
        break
      } else {
        nodesToVisit.splice(0, nodesToVisit.length)
        targetId = parseInt(selectedBeats.value[index].id)
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

  }

  const path: number[] = []

  while (result.prev != null) {
    path.push(result.id)
    result = result.prev
  }

  path.push(result.id)

  clearData()

  for (let i = path.length - 1; i >= 0; i--) {
    addToData(path[i], (path.length - 1 - i)*5)
  }
}

</script>

<template>
  <div class="container">

    <GameplayBeatCanvas></GameplayBeatCanvas>

    <v-container class="col1">

      <v-row>
        <v-col>
          <v-btn @click="onClear">Clear</v-btn>
        </v-col>
        <v-col>
          <v-btn @click="onSelectStartNode">Add Node</v-btn>
        </v-col>
        <v-col>
          <v-btn @click="onShow">Show</v-btn>
        </v-col>
        <v-col cols="6">
          <v-card color="secondary">
            <v-container>
              Currently selected: {{ selectedBeat ? selectedBeat.label : '--'}}
            </v-container>
          </v-card>
        </v-col>
      </v-row>

      <v-row>
        <v-col v-for="(beat, i) in selectedBeats" cols="3">
          <v-card :title="i == 0 ? 'Start Beat' : (i == selectedBeats.length - 1 ? 'Goal Beat' : 'Intermediate Beat')">
            <v-container>{{ beat.label }}</v-container>
          </v-card>
        </v-col>
      </v-row>
    </v-container>

    <v-container class="col2">
      <apexchart width="500" type="line" :options="options" :series="series"></apexchart>
    </v-container>

  </div>

</template>

<style scoped>

.container {
  display: grid;
  grid-template-columns: 67% 33%;
  grid-template-rows: 67% 33%;
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  bottom: 0;
}

.col1 {
  grid-column-start: 1;
  overflow-y: scroll;
}

.col2 {
  grid-column-start: 2;
  grid-row: 1 / span 2;
  background-color: aquamarine;
}

</style>
