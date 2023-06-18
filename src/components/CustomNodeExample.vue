<script setup>
import { Handle, Position } from '@vue-flow/core'
import { computed } from 'vue'
import { colors } from '@/assets/presets.js'

const props = defineProps({
  data: {
    type: Object,
    required: true,
  },
})

const emit = defineEmits(['change', 'gradient'])

function onSelect(color) {
  emit('change', color)
}

function onGradient() {
  emit('gradient')
}

const sourceHandleStyleA = computed(() => ({ backgroundColor: props.data.color, filter: 'invert(100%)', top: '10px' }))

const sourceHandleStyleB = computed(() => ({
  backgroundColor: props.data.color,
  filter: 'invert(100%)',
  bottom: '10px',
  top: 'auto',
}))
</script>

<template>
  <div>Select a color</div>

  <div
      style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content: center; max-width: 90%; margin: auto; gap: 3px"
  >
    <template v-for="color of colors" :key="color.name">
      <button :title="color.name" :style="{ backgroundColor: color.value }" type="button" @click="onSelect(color)" />
    </template>

    <button class="animated-bg-gradient" title="gradient" type="button" @click="onGradient" />
  </div>

  <Handle id="a" type="source" :position="Position.Right" :style="sourceHandleStyleA" />

  <Handle id="b" type="source" :position="Position.Right" :style="sourceHandleStyleB" />
</template>

<style scoped>
@import 'https://cdn.jsdelivr.net/npm/@vue-flow/core@1.20.2/dist/style.css';
@import 'https://cdn.jsdelivr.net/npm/@vue-flow/core@1.20.2/dist/theme-default.css';
@import 'https://cdn.jsdelivr.net/npm/@vue-flow/controls@latest/dist/style.css';
@import 'https://cdn.jsdelivr.net/npm/@vue-flow/minimap@latest/dist/style.css';
@import 'https://cdn.jsdelivr.net/npm/@vue-flow/node-resizer@latest/dist/style.css';

.customnodeflow .vue-flow__node-custom{border:1px solid #777;padding:10px;border-radius:10px;background:whitesmoke;display:flex;flex-direction:column;justify-content:space-between;align-items:center;gap:10px;max-width:250px}.customnodeflow button{padding:5px;width:25px;height:25px;border-radius:25px;-webkit-box-shadow:0px 5px 10px 0px rgba(0,0,0,.3);box-shadow:0 5px 10px #0000004d;cursor:pointer}.customnodeflow button:hover{opacity:.9;transform:scale(105%);transition:.25s all ease}.animated-bg-gradient{background:linear-gradient(122deg,#6f3381,#81c7d4,#fedfe1,#fffffb);background-size:800% 800%;-webkit-animation:gradient 4s ease infinite;-moz-animation:gradient 4s ease infinite;animation:gradient 4s ease infinite}@-webkit-keyframes gradient{0%{background-position:0% 22%}50%{background-position:100% 79%}to{background-position:0% 22%}}@-moz-keyframes gradient{0%{background-position:0% 22%}50%{background-position:100% 79%}to{background-position:0% 22%}}@keyframes gradient{0%{background-position:0% 22%}50%{background-position:100% 79%}to{background-position:0% 22%}}

</style>
