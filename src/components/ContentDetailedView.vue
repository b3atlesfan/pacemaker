<script setup lang="ts">

import {BeatContent} from "@/assets/BeatContent";

const props = defineProps<{
  content: BeatContent
}>()

</script>

<template>
  <v-card :title="content.description">

    <v-container>
      <v-row>
        <v-col>Intensity:</v-col>
        <v-col>{{ content.intensity }}</v-col>
      </v-row>

      <v-row v-if="content.expectedPlaytime">
        <v-col>Playtime:</v-col>
        <v-col>{{ content.expectedPlaytime }}</v-col>
      </v-row>

      <v-row v-if="content.category">
        <v-col>Type:</v-col>
        <v-col>
          <v-chip>{{ content.category }}</v-chip>
        </v-col>
      </v-row>

      <v-row v-if="content.introducedSkills.length > 0">
        <v-col>Introduces:</v-col>
        <v-col>
          <v-chip v-for="(skill) in content?.introducedSkills"> {{ skill }} </v-chip>
        </v-col>
      </v-row>

      <v-row v-if="content.reinforcedSkills.length > 0">
        <v-col>Reinforces:</v-col>
        <v-col>
          <v-chip v-for="(skill) in content?.reinforcedSkills"> {{ skill }} </v-chip>
        </v-col>
      </v-row>

      <v-row v-if="content.requiredSkills.length > 0">
        <v-col>Requires:</v-col>
        <v-col>
          <v-chip v-for="(skill) in content?.requiredSkills"> {{ skill }} </v-chip>
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
