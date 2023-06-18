<script setup>
import GameplayBeatCanvas from "@/components/GameplayBeatCanvas.vue";
</script>

<template>
  <main class="box content">
    <GameplayBeatCanvas />
  </main>
</template>

<style lang="scss" scoped>
main {
  display: flex;
  //flex-direction: column;
  //max-width: 500px;
  //width: 100%;
  //margin: 0 auto;
  //padding: 40px 16px;
  border-width: 3px;
  border-style: solid;
  border-color: #2c3e50;

  .border {
    border-width: 3px;
    border-style: solid;
    border-color: #2c3e50;
  }
}
</style>