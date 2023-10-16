<script setup lang="ts">

import {useContentsStore} from "@/store/contents";
import {storeToRefs} from "pinia";
import BeatContentHolder from "@/components/BeatContentHolder.vue";
import ContentCreatorForm from "@/components/ContentCreatorForm.vue";
import {BeatContentManager} from "@/assets/BeatContentManager";
import {Category, Skill} from "@/assets/BeatContent";
import {ref} from "vue";

const { contents } = storeToRefs(useContentsStore())

const dialog = ref(false)

const contentManager = BeatContentManager.getInstance()

function onDeleteContent(id: number) {
  contentManager.deleteContent(id)
}

function onCreateContent(description: string, categories: Category, intensity: number, introducedSkills: Skill[], reinforcedSkills: Skill[], requiredSkills: Skill[]) {
  contentManager.createContent(description, categories, intensity, introducedSkills, reinforcedSkills, requiredSkills)
  dialog.value = false
}

</script>

<template>
  <ContentCreatorForm :dialog="dialog" @on-create-content="onCreateContent" />

  <v-container contained>

    <v-row>
      <v-col
        v-for="content in contents"
        :key="content"
        cols="12"
        sm="6"
        md="4"
        lg="2"
      >
        <BeatContentHolder :content="content" :is-in-beat="false" @on-delete="onDeleteContent"></BeatContentHolder>
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        <v-btn @click="dialog = true">Create</v-btn>
      </v-col>
    </v-row>

  </v-container>
</template>

<style scoped>

</style>
