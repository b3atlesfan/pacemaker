<script setup lang="ts">
import {BeatContent, Categories} from "@/assets/BeatContent";
import {BeatContentManager} from "@/assets/BeatContentManager";

const props = defineProps({
  content: {
    type: BeatContent,
    required: true,
  },
  isInBeat: {
    type: Boolean,
    required: true,
  }
})

const beatContentManager = BeatContentManager.getInstance()

</script>

<template>
  <v-card>
    <v-container>
      <v-row no-gutters justify="start">
        <v-col justify="start">Description:</v-col>
        <v-col>{{ props.content.description }} + {{ props.content.id }}</v-col>
      </v-row>

      <v-row>
        <v-col>Intensity:</v-col>
        <v-col>{{ props.content.intensity }}</v-col>
      </v-row>

      <v-row>
        <v-col>Type:</v-col>
        <v-col>
          <v-chip>{{ props.content.category }}</v-chip>
        </v-col>
      </v-row>

      <v-row>
        <v-col>Introduces:</v-col>
        <v-col>
          <v-chip v-for="(skill) in props.content?.introducedSkills"> {{ skill }} </v-chip>
        </v-col>
      </v-row>

      <v-row>
        <v-col>Reinforces:</v-col>
        <v-col>
          <v-chip v-for="(skill) in props.content?.reinforcedSkills"> {{ skill }} </v-chip>
        </v-col>
      </v-row>

      <v-row>
        <v-col>Requires:</v-col>
        <v-col>
          <v-chip v-for="(skill) in props.content?.requiredSkills"> {{ skill }} </v-chip>
        </v-col>
      </v-row>

      <v-btn v-if="props.isInBeat" @click="$emit('onRemove')">Remove</v-btn>
      <v-btn v-else @click="$emit('onDelete', props.content.id)">Delete</v-btn>
    </v-container>
  </v-card>
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