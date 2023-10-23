<script setup lang="ts">

import {useContentsStore} from "@/store/contents";
import {storeToRefs} from "pinia";
import BeatContentHolder from "@/components/BeatContentHolder.vue";
import ContentCreatorForm from "@/components/ContentCreatorForm.vue";
import {BeatContentManager, ContentFormState} from "@/assets/BeatContentManager";
import {Category, Skill} from "@/assets/BeatContent";
import {ref} from "vue";
import ContentCreationForm from "@/components/ContentCreationForm.vue";

const { contents } = storeToRefs(useContentsStore())

const dialog = ref(false)

const contentManager = BeatContentManager.getInstance()

function onDeleteContent(id: number) {
  contentManager.deleteContent(id)
}

function onCreateContent(formInput: Object) {
  contentManager.createContent(formInput)
  dialog.value = false
}

</script>

<template>
  <ContentCreationForm :dialog="dialog" @on-submit="onCreateContent" @on-exit="dialog = false"></ContentCreationForm>

  <!--
  <ContentCreatorForm :dialog="dialog" @on-create-content="onCreateContent"></ContentCreatorForm>
  -->
  <v-container contained>

    <v-row>
      <v-col
        v-for="content in contents"
        cols="12"
        sm="6"
        md="4"
        lg="4"
      >
        <BeatContentHolder :content-id="content.id" type='detailed' @on-delete="onDeleteContent"></BeatContentHolder>
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
