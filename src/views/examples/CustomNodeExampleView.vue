<script setup>
import { MiniMap } from '@vue-flow/minimap'
import { Position, VueFlow, useVueFlow } from '@vue-flow/core'
import { h, onMounted, ref } from 'vue'
import ColorSelectorNode from '@/components/examples/CustomNodeExample.vue'
import { presets } from '@/assets/vueflow_examples/presets.js'

const { findNode } = useVueFlow()

const elements = ref([])

const gradient = ref(false)

const bgColor = ref(presets.ayame)

const bgName = ref('AYAME')

const connectionLineStyle = { stroke: '#fff' }

// minimap stroke color functions
function nodeStroke(n) {
  if (n.type === 'input') {
    return '#0041d0'
  }
  if (n.type === 'custom') {
    return presets.sumi
  }
  if (n.type === 'output') {
    return '#ff0072'
  }
  return '#eee'
}

function nodeColor(n) {
  if (n.type === 'custom') {
    return bgColor.value
  }
  return '#fff'
}

// output labels
function outputColorLabel() {
  return h('div', {}, bgColor.value)
}
function outputNameLabel() {
  return h('div', {}, bgName.value)
}

function onChange(color) {
  gradient.value = false
  bgColor.value = color.value
  bgName.value = color.name

  findNode('3').hidden = false
}

function onGradient() {
  gradient.value = true
  bgColor.value = null
  bgName.value = 'gradient'

  findNode('3').hidden = true
}

onMounted(() => {
  elements.value = [
    {
      id: '1',
      type: 'custom',
      data: { color: bgColor },
      position: { x: 0, y: 50 },
    },
    {
      id: '2',
      type: 'output',
      label: outputNameLabel,
      position: { x: 350, y: 25 },
      targetPosition: Position.Left,
    },
    {
      id: '3',
      type: 'output',
      label: outputColorLabel,
      position: { x: 350, y: 200 },
      targetPosition: Position.Left,
    },
    {
      id: 'e1a-2',
      source: '1',
      sourceHandle: 'a',
      target: '2',
      animated: true,
      style: () => ({
        stroke: bgColor.value,
        filter: 'invert(100%)',
      }),
    },
    {
      id: 'e1b-3',
      source: '1',
      sourceHandle: 'b',
      target: '3',
      animated: true,
      style: () => ({
        stroke: bgColor.value,
        filter: 'invert(100%)',
      }),
    },
  ]
})
</script>

<template>
  <VueFlow
      v-model="elements"
      class="customnodeflow"
      :class="[gradient ? 'animated-bg-gradient' : '']"
      :style="{ backgroundColor: bgColor }"
      :connection-line-style="connectionLineStyle"
      :default-viewport="{ zoom: 1.5 }"
      fit-view-on-init
  >
    <template #node-custom="{ data }">
      <ColorSelectorNode :data="data" @change="onChange" @gradient="onGradient" />
    </template>

    <MiniMap :node-stroke-color="nodeStroke" :node-color="nodeColor" />
  </VueFlow>
</template>

<style scoped>
@import 'https://cdn.jsdelivr.net/npm/@vue-flow/core@1.20.2/dist/style.css';
@import 'https://cdn.jsdelivr.net/npm/@vue-flow/core@1.20.2/dist/theme-default.css';
@import 'https://cdn.jsdelivr.net/npm/@vue-flow/controls@latest/dist/style.css';
@import 'https://cdn.jsdelivr.net/npm/@vue-flow/minimap@latest/dist/style.css';
@import 'https://cdn.jsdelivr.net/npm/@vue-flow/node-resizer@latest/dist/style.css';

.customnodeflow .vue-flow__node-custom{border:1px solid #777;padding:10px;border-radius:10px;background:whitesmoke;display:flex;flex-direction:column;justify-content:space-between;align-items:center;gap:10px;max-width:250px}.customnodeflow button{padding:5px;width:25px;height:25px;border-radius:25px;-webkit-box-shadow:0px 5px 10px 0px rgba(0,0,0,.3);box-shadow:0 5px 10px #0000004d;cursor:pointer}.customnodeflow button:hover{opacity:.9;transform:scale(105%);transition:.25s all ease}.animated-bg-gradient{background:linear-gradient(122deg,#6f3381,#81c7d4,#fedfe1,#fffffb);background-size:800% 800%;-webkit-animation:gradient 4s ease infinite;-moz-animation:gradient 4s ease infinite;animation:gradient 4s ease infinite}@-webkit-keyframes gradient{0%{background-position:0% 22%}50%{background-position:100% 79%}to{background-position:0% 22%}}@-moz-keyframes gradient{0%{background-position:0% 22%}50%{background-position:100% 79%}to{background-position:0% 22%}}@keyframes gradient{0%{background-position:0% 22%}50%{background-position:100% 79%}to{background-position:0% 22%}}

</style>