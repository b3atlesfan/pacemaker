<script setup lang="ts">
import {BeatContent} from "@/assets/BeatContent";
import BeatContentHolder from "@/components/BeatContentHolder.vue";

const content = new BeatContent("mr cool", "Puzzle", 20, ["dash"], ["jump"], ["enqueue", "queue order"])
</script>

<template>
  <div class="centering">
    <BeatContentHolder  :content="content"/>
  </div>
</template>

<style scoped>
.centering {
  //align-self: center;
  justify-self: center;
}
</style>