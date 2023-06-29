<script setup>
import {Handle, Position} from "@vue-flow/core";

const props = defineProps({
  id: {
    type: String,
    required: true,
  },
  data: {
    type: Number,
    required: true,
  },
  label: {
    type: String,
    required: false,
  },
})

</script>

<template>
  <div class="offset">
    <ul>
      <li>{{ props.label }}</li>
      <li>Difficulty: {{ props.data }} / 10</li>
    </ul>
    <Handle id="a_in" type="target" :position="Position.Left"  />
    <Handle id="a_out" type="source" :position="Position.Right" />
  </div>
</template>

<style scoped>
</style>