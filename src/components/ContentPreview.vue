<script setup lang="ts">

import {Category} from "@/assets/BeatContent";

const props = defineProps<{
  title: string,
  intensity: number,
  category?: Category,
  isHighlighted?: boolean,
  variant?: 'tonal' | 'elevated',
}>()

</script>

<template>
  <v-card
      :variant="variant"
      :color="props.isHighlighted ? 'secondary' : ''"
      :title="title"
  >
    <v-container>
      <v-row>
        <v-col cols="2">
          <v-icon>mdi-lightning-bolt</v-icon>
        </v-col>
        <v-col cols="3">{{ intensity }}</v-col>
        <v-col v-if="category">
          <v-chip>{{ category }}</v-chip>
        </v-col>
      </v-row>

    </v-container>
  </v-card>
</template>

<style scoped>

</style>
