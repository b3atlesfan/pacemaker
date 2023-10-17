<script setup lang="ts">

import GameplayBeatCanvas from "@/components/GameplayBeatCanvas.vue";
import Flow from "@/components/Flow.vue";
</script>

<template>
  <div class="container">

    <GameplayBeatCanvas></GameplayBeatCanvas>


    <div class="col1">
      placeholder path selector2
    </div>

    <div class="col2">
      placeholder visualizer
    </div>

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
  background-color: antiquewhite;
}

.col2 {
  grid-column-start: 2;
  grid-row: 1 / span 2;
  background-color: aquamarine;
}

</style>
