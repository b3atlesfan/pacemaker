<script setup>
import {useVueFlow, VueFlow} from '@vue-flow/core'
import CustomNode from '@/components/examples/CustomNode.vue'
import {markRaw, ref} from "vue";

const { nodeTypes } = useVueFlow()

const node = {
  id: '1',
  label: 'Node 23',
  type: 'custom',
  data: 1,
  position: { x: 50, y: 50 },
}

const elements = ref([
    node,
  {
    id: '2',
    label: 'Node 13',
    position: { x: 50, y: 150 },
  },
  {
    id: '23',
    label: 'Node 143',
    type: 'custom',
    position: { x: 50, y: 150 },
  }
])

const nodeTypes2 = {
  custom: markRaw(CustomNode),
}
</script>

<template>
  <VueFlow v-model="elements" :node-types="nodeTypes2">
    <!--
    <template #node-custom="data">
      <CustomNode :data="node"></CustomNode>
    </template>
    -->
  </VueFlow>
</template>

<style scoped>

</style>