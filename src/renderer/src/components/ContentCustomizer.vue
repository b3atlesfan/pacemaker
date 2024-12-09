<script setup lang="ts">
import {addCategory, addSkill, Categories, deleteCategory, deleteSkill, Skills} from "../assets/BeatContent";
import ChipManager from "../components/ChipManager.vue";

function onSkillSubmit(skill: string) {
  addSkill(skill)
}

function onSkillDelete(skillId: number) {
  deleteSkill(skillId)
}

function onCategorySubmit(skill: string) {
  addCategory(skill)
}

function onCategoryDelete(skillId: number) {
  deleteCategory(skillId)
}

</script>

<template>
  <v-container>
    <v-card title="Blueprint Customization" subtitle="Predefined values cannot be deleted">
      <v-container>
        <v-row>
          <v-col cols="6">
            <ChipManager
              :values="Categories"
              header="Available Gameplay Categories"
              @on-submit="onCategorySubmit"
              @on-delete="onCategoryDelete"
            ></ChipManager>
          </v-col>
          <v-col>
            <ChipManager
              :values="Skills"
              header="Available Mechanics"
              @on-submit="onSkillSubmit"
              @on-delete="onSkillDelete"
            ></ChipManager>
          </v-col>
        </v-row>
      </v-container>

    </v-card>
  </v-container>

</template>

<style scoped>

</style>
