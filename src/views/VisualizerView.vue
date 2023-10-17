<script setup lang="ts">
import GameplayBeatCanvas from "@/components/GameplayBeatCanvas.vue";
import {computed, ref} from "vue";
import {BeatManager} from "@/assets/BeatManager";
import {GameplayBeat} from "@/assets/GameplayBeat";

const nodeLabel = ref("hi")

const beatManager = BeatManager.getInstance()

const selectedBeat = computed(() => beatManager.getSelectedBeat())

const selectedBeats = ref([] as GameplayBeat[])

function onSelectStartNode() {
  selectedBeats.value.push(selectedBeat.value)
}

function onClear() {
  selectedBeats.value = []
}

</script>

<template>
  <div class="container">

    <GameplayBeatCanvas></GameplayBeatCanvas>

    <v-container class="col1">

      <v-row>
        <v-col>
          <v-btn @click="onSelectStartNode">Select Start Node</v-btn>
        </v-col>
        <v-col>
          <v-btn @click="onClear">Clear</v-btn>
        </v-col>
      </v-row>

      <v-row>
        <v-col>
          Currently selected:
        </v-col>
        <v-col>
          {{ selectedBeat?.label }}
        </v-col>
        <v-col>
          {{ selectedBeat?.id }}
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
      placeholder visualizer
    </v-container>

  </div>

</template>

<style scoped>

.container {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-template-rows: repeat(2, 1fr);
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
