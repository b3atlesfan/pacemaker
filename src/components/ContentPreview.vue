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
    <!--
        <template v-slot:append>
          <v-btn-group :color="props.color ? props.color : ''">
            <v-btn
              v-if="!props.isInBeat"
              @click="$emit('onDelete', content.id)"
              icon="mdi-delete"
            ></v-btn>
          </v-btn-group>
        </template>
    -->
    <v-container>
      <v-row>
        <v-col cols="2">
          <v-icon>mdi-lightning-bolt</v-icon>
        </v-col>
        <v-col cols="3">{{ intensity }}</v-col>
        <v-col v-if="category">
          <v-chip>{{ category }}</v-chip>
        </v-col>
        <!--
        <v-col v-if="content.category"><v-icon>mdi-lightning-bolt</v-icon></v-col>
        <v-col>{{ content.intensity }}</v-col>
        -->
      </v-row>

    </v-container>
    <!--
        <v-card-actions>
          <v-icon>mdi-lightning-bolt</v-icon>
          <v-spacer></v-spacer>
          <v-btn
              v-if="!props.isInBeat"
              @click="$emit('onDelete', content.id)"
              icon="mdi-delete"
          ></v-btn>
        </v-card-actions>
        -->
  </v-card>
</template>

<style scoped>

</style>
