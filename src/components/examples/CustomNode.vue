<script setup>
const props = defineProps({
  data: {
    type: Object,
    required: true,
  },
  label: {
    type: Object,
    required: false,
  }
})

</script>

<template>
  <div>
    <ul>
      <li>{{ props.label }}</li>
      <li>Difficulty is {{ props.data }} / 10</li>
    </ul>
  </div>
</template>

<style scoped>
.vue-flow__node-custom {
  background: #9CA8B3;
  color: #fff;
  padding: 10px;
}
</style>