<script setup lang="ts">
import {BeatContent} from "@/assets/BeatContent";

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

      <v-btn v-if="!props.isInBeat" @click="$emit('onDelete', props.content.id)">Delete</v-btn>
    </v-container>
  </v-card>
</template>

<style scoped>

</style>
