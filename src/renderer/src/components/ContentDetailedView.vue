<script setup lang="ts">

import {BeatContent} from "@/assets/BeatContent";

const props = defineProps<{
  content: BeatContent
}>()

</script>

<template>
  <v-card :title="props.content.description">

    <v-container>
      <v-row>
        <v-col>Intensity:</v-col>
        <v-col>{{ props.content.computedIntensity }}</v-col>
        <v-col>Type:</v-col>
        <v-col>
          <v-chip>{{ props.content.category }}</v-chip>
        </v-col>
      </v-row>
      <v-row>
        <v-col>Narrative Intensity:</v-col>
        <v-col>{{ props.content.narrativeIntensity }}</v-col>
        <v-col>Gameplay Intensity:</v-col>
        <v-col>{{ props.content.intensity }}</v-col>
      </v-row>

      <v-row v-if="props.content.expectedPlaytime">
        <v-col>Expected Playtime:</v-col>
        <v-col>{{ props.content.expectedPlaytime }} min:s</v-col>
      </v-row>

      <v-row v-if="props.content.introducedSkills.length > 0">
        <v-col>Introduces:</v-col>
        <v-col>
          <v-chip v-for="(skill) in props.content?.introducedSkills"> {{ skill }} </v-chip>
        </v-col>
      </v-row>

      <v-row v-if="props.content.reinforcedSkills.length > 0">
        <v-col>Reinforces:</v-col>
        <v-col>
          <v-chip v-for="(skill) in props.content?.reinforcedSkills"> {{ skill }} </v-chip>
        </v-col>
      </v-row>

      <v-row v-if="props.content.requiredSkills.length > 0">
        <v-col>Requires:</v-col>
        <v-col>
          <v-chip v-for="(skill) in props.content?.requiredSkills"> {{ skill }} </v-chip>
        </v-col>
      </v-row>

    </v-container>

    <v-card-actions>
      <slot>

      </slot>
    </v-card-actions>
  </v-card>
</template>

<style scoped>

</style>
