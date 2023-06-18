<script setup>
import {GameplayBeat} from "@/assets/GameplayBeat";
import {Handle, Position} from "@vue-flow/core";
import {computed} from "vue";

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
  <div class="rounded border-pink-300 border-2 mx-1 my-1 bg-green-100 text-black">
    <ul>
      <li>{{ props.label }}</li>
      <li>Difficulty is {{ props.data }} / 10</li>
    </ul>
    <Handle id="a_in" type="target" :position="Position.Right" />
    <Handle id="a_out" type="source" :position="Position.Right" />
    <Handle id="b" type="source" :position="Position.Top" />
    <Handle id="c" type="source" :position="Position.Bottom" />
    <Handle id="d" type="source" :position="Position.Left" />
  </div>
</template>

<style scoped>
</style>