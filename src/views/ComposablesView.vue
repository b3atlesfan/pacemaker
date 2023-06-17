<script setup>
import {Panel, PanelPosition, useVueFlow, VueFlow} from '@vue-flow/core'
import {onMounted, ref} from "vue";

const { nodes, edges, addEdges, addNodes } = useVueFlow({
  nodes: [
    {
      id: '1',
      label: 'Node 1',
      position: { x: 0, y: 0 },
    }
  ]
})

const useFlow = useVueFlow({
  nodes: [
    {
      id: '1',
      label: 'Node 1',
      position: { x: 0, y: 0 },
    }
  ]
})



onMounted(() => {
  console.log(nodes.value) // will log a single node
  console.log(useFlow.nodes.value) // will log a single node
  console.log(edges.value) // will log an empty array
})
const dark = ref(true)

function addNode() {
  addNodes({
    id: '2',
    position: { x: 150, y: 50 },
    label: 'Node 2',
  })
}
</script>

<template>
  <VueFlow :class="{ dark }" class="basicflow">
    <Panel :position="PanelPosition.TopRight" class="controls">
      <button style="background-color: #113285; color: white" title="Reset Transform" @click="addNode">
        <svg width="16" height="16" viewBox="0 0 32 32">
          <path fill="#FFFFFB" d="M18 28A12 12 0 1 0 6 16v6.2l-3.6-3.6L1 20l6 6l6-6l-1.4-1.4L8 22.2V16a10 10 0 1 1 10 10Z" />
        </svg>
      </button>
    </Panel>
  </VueFlow>
</template>

<style scoped>

</style>