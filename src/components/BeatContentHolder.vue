<script setup lang="ts">
import {BeatContentManager} from "@/assets/BeatContentManager";
import {computed} from "vue";

const props = defineProps<{
  contentId: number,
  isInBeat: boolean,
  color?: string,
}>()

const contentManager = BeatContentManager.getInstance()

const content = computed(() => contentManager.getContent(props.contentId))

</script>

<template>

  <v-card :color="props.color ? props.color : ''" :title="content.description">
    <v-container>
      <!--
      <v-row no-gutters justify="start">
        <v-col justify="start">Description:</v-col>
        <v-col>{{ content.description }}</v-col>
      </v-row>
      -->
      <v-row>
        <v-col>Intensity:</v-col>
        <v-col>{{ content.intensity }}</v-col>
      </v-row>

      <v-row>
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

      <v-btn v-if="!props.isInBeat" @click="$emit('onDelete', content.id)">Delete</v-btn>
    </v-container>
  </v-card>
</template>

<style scoped>

</style>
