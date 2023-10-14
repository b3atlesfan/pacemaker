<script setup lang="ts">
import BeatContentHolder from "@/components/BeatContentHolder.vue";
import BeatContentCreatorButton from "@/components/BeatContentCreatorButton.vue";

import {storeToRefs} from "pinia";
import {useContentsStore} from "@/stores/contents";
import {BeatContentManager} from "@/assets/BeatContentManager";

const { contents } = storeToRefs(useContentsStore())

const beatContentManager = BeatContentManager.getInstance()

</script>

<template>
  <div class="container2">
    <BeatContentCreatorButton/>

    <div class="centering">
      <v-card v-for="content in contents">
        <BeatContentHolder  :content="content"/>
      </v-card>
    </div>
  </div>
</template>

<style scoped>
.centering {
  align-self: center;
  justify-self: center;
}

.container2 {
  max-width: 500px;
}

.container {
  display: grid;
  justify-items: start;
  grid-template-rows: auto;
  grid-template-columns: auto auto;
  padding: 5px;
}

.column1 {
  grid-column-start: 1;
}

.column2 {
  grid-column-start: 2;
}

</style>