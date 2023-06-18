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
  <div>
    <ul>
      <li>{{ props.label }}</li>
      <li>Difficulty is {{ props.data }} / 10</li>
    </ul>
    <Handle id="a_in" type="target" :position="Position.Right" />
    <Handle id="a_out" type="source" :position="Position.Right" />
    <Handle id="b_in" type="target" :position="Position.Top" />
    <Handle id="b_out" type="source" :position="Position.Top" />
    <Handle id="c_in" type="target" :position="Position.Bottom" />
    <Handle id="c_out" type="source" :position="Position.Bottom" />
    <Handle id="d_in" type="target" :position="Position.Left" />
    <Handle id="d_out" type="source" :position="Position.Left" />
  </div>
</template>

<style scoped>
</style>