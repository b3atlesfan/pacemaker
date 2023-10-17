<script setup lang="ts">
import GameplayBeatCanvas from "@/components/GameplayBeatCanvas.vue";
import {computed, ref} from "vue";
import {BeatManager} from "@/assets/BeatManager";

const nodeLabel = ref("hi")

const beatManager = BeatManager.getInstance()

const selectedBeat = computed(() => beatManager.getSelectedBeat())

const selectedBeats = ref([] as number[])

function onSelectStartNode() {
  selectedBeats.value.push(selectedBeat.value.id)
}

</script>

<template>
  <div class="container">

    <GameplayBeatCanvas></GameplayBeatCanvas>

    <v-container class="col1">

      <v-row>
        <v-btn @click="onSelectStartNode">Select Start Node</v-btn>
      </v-row>
      <v-row>{{ nodeLabel }}</v-row>
      <v-row>{{ selectedBeat?.id }}</v-row>
      <v-row v-for="id in selectedBeats">{{ id }}</v-row>
    </v-container>

    <v-container class="col2">
      placeholder visualizer
    </v-container>

  </div>
<!--
  <v-container class="multiflows">
    <v-row class="height:100%">
      <v-col cols="6">
        <v-row class="child">
          <GameplayBeatCanvas></GameplayBeatCanvas>
        </v-row>
        <v-row class="child">
          <v-card title="placeholder path selector"></v-card>
        </v-row>
      </v-col>
      <v-col cols="6"></v-col>
    </v-row>

    <v-card title="not nice">
      <GameplayBeatCanvas></GameplayBeatCanvas>
    </v-card>

  </v-container>
  -->
  <!--
  <v-card title="nice" class="multiflows">
    <GameplayBeatCanvas></GameplayBeatCanvas>
  </v-card>
  -->

</template>

<style scoped>

.container {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-template-rows: repeat(2, 1fr);
  width: 100%;
  height: 100%;
}

.col1 {
  grid-column-start: 1;
}

.col2 {
  grid-column-start: 2;
  grid-row: 1 / span 2;
  background-color: aquamarine;
}

</style>
