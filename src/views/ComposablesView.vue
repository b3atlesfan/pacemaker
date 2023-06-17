<script setup>
import { useVueFlow, VueFlow } from '@vue-flow/core'
import {onMounted} from "vue";

const { nodes, edges } = useVueFlow({
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
  console.log(edges.value) // will log an empty array
})

</script>

<template>
  <VueFlow />
</template>

<style scoped>

</style>