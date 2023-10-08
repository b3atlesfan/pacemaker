<script setup lang="ts">
import {BeatContent, Categories} from "@/assets/BeatContent";

const props = defineProps({
  content: {
    type: BeatContent,
    required: true,
  }
})

</script>

<template>
  <div class="container">
    <div>Description:</div>
    <div class="centering">{{ props.content.description }}</div>

    <div>Intensity:</div>
    <div class="centering">{{ props.content.intensity }}</div>

    <div>Type:</div>
    <div class="centering">
      <!--<v-select :items="Categories" variant="solo-filled"></v-select>-->
      <v-chip>{{ props.content.category }}</v-chip>
    </div>

    <div>Introduces:</div>
    <div class="centering">
      <v-chip v-for="(skill) in props.content?.introducedSkills"> {{ skill }} </v-chip>
    </div>

    <div>Reinforces:</div>
    <div class="centering">
      <v-chip v-for="(skill) in props.content?.reinforcedSkills"> {{ skill }} </v-chip>
    </div>

    <div>Requires:</div>
    <div class="centering">
      <v-chip v-for="(skill) in props.content?.requiredSkills"> {{ skill }} </v-chip>
    </div>
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

.centering {
  justify-self: left;
}

</style>