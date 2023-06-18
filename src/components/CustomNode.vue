<script setup>
const props = defineProps({
  data: {
    type: Object,
    required: true,
  },
})

</script>

<template>
  <div class="vue-flow__node-custom">
    {{ data.label }}
  </div>
</template>

<style scoped>
.vue-flow__node-custom {
  background: #9CA8B3;
  color: #fff;
  padding: 10px;
}
</style>