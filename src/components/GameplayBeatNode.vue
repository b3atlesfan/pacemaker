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
    <Handle id="a_out" type="source" :position="Position.Right" :style="{top: '10px'}" />
    <Handle id="a_in" type="target" :position="Position.Right" :style="{bottom: '10px'}" />
    <Handle id="b_out" type="source" :position="Position.Top" />
    <Handle id="c_out" type="source" :position="Position.Bottom" />
    <Handle id="d_out" type="source" :position="Position.Left" />
  </div>
</template>

<style scoped>
</style>