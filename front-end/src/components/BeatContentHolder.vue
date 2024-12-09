<script setup lang="ts">
import {BeatContentManager} from "@/assets/BeatContentManager";
import {computed} from "vue";
import ContentPreview from "@/components/ContentPreview.vue";
import ContentDetailedView from "@/components/ContentDetailedView.vue";

const props = defineProps<{
  contentId: number,
  type: "preview" | "detailed",
  isHighlighted?: boolean,
  color?: string,
}>()

const contentManager = BeatContentManager.getInstance()

const content = computed(() => contentManager.getContent(props.contentId))

</script>

<template>

  <ContentPreview
      v-if="props.type == 'preview'"
      :title="content.description"
      :intensity="content.computedIntensity"
      :category="content.category"
      :is-highlighted="props.isHighlighted"
  ></ContentPreview>

  <ContentDetailedView v-else :content="content">
    <v-btn
      @click="$emit('onDelete', content.id)"
      icon="mdi-delete"
    ></v-btn>
  </ContentDetailedView>

</template>

<style scoped>

</style>
