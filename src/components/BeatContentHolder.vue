<script setup lang="ts">
import {BeatContent, Categories} from "@/assets/BeatContent";
import {BeatContentManager} from "@/assets/BeatContentManager";

const props = defineProps({
  content: {
    type: BeatContent,
    required: true,
  }
})

const beatContentManager = BeatContentManager.getInstance()

</script>

<template>
  <div class="container">
    <div class="column1">Description:</div>
    <div class="column2">{{ props.content.description }}</div>

    <div class="column1">Intensity:</div>
    <div class="column2">{{ props.content.intensity }}</div>

    <div class="column1">Type:</div>
    <div class="column2">
      <!--<v-select :items="Categories" variant="solo-filled"></v-select>-->
      <v-chip>{{ props.content.category }}</v-chip>
    </div>

    <div class="column1">Introduces:</div>
    <div class="column2">
      <v-chip v-for="(skill) in props.content?.introducedSkills"> {{ skill }} </v-chip>
    </div>

    <div class="column1">Reinforces:</div>
    <div class="column2">
      <v-chip v-for="(skill) in props.content?.reinforcedSkills"> {{ skill }} </v-chip>
    </div>

    <div class="column1">Requires:</div>
    <div class="column2">
      <v-chip v-for="(skill) in props.content?.requiredSkills"> {{ skill }} </v-chip>
    </div>

    <v-btn @click="beatContentManager.deleteContent(props.content.id)">Delete</v-btn>
  </div>
</template>

<style scoped>
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