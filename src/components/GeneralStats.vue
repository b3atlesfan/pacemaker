<script setup>

const props = defineProps({
  data: {
    type: Object,
    required: true,
  },
})

</script>

<template>
  Type: Puzzle, Action, Narrative, ...
  Act: 1, 2, 3
</template>

<style scoped>

.general-stats {
  grid-column-start: 2;
  grid-column-end: 4;
  grid-row-start: 2;
  justify-self: center;
}

</style>