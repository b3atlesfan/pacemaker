<script setup>
const props = defineProps({
  data: {
    type: Object,
    required: true,
  },
})
</script>

<template>
  Intensity: {{ props.data }}
</template>

<style scoped>

</style>