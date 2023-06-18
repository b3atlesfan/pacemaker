<script setup>
import { VueFlow  } from '@vue-flow/core'
import {ref} from "vue";

const elements = ref([
  // Nodes
  // An input node, specified by using `type: 'input'`
  { id: '1', type: 'input', label: 'Node 1', position: { x: 250, y: 5 }, class: 'custom-node' },

  // Default nodes, you can omit `type: 'default'`
  { id: '2', label: 'Node 2', position: { x: 100, y: 100 }, },
  { id: '3', label: 'Node 3', position: { x: 400, y: 100 } },

  // An output node, specified by using `type: 'output'`
  { id: '4', type: 'output', label: 'Node 4', position: { x: 400, y: 200 } },
  {
    id: '5',
    label: 'Node 5',
    position: { x: 250, y: 5 },

    // Add a class name to the node
    class: 'my-custom-node-class',

    // You can pass an object containing CSSProperties or CSS variables
    style: { backgroundColor: 'green', width: '200px', height: '100px' },
  },

  {
    id: '6',
    label: 'Node 6',
    position: { x: 100, y: 100 },

    /*
     * You can also use a function which will receive your current element as it's input.
     * Useful if you want to add styles if the element is selected
     */
    style: (el) => {
      if (el.selected) return { background: 'purple' }
      return { background: 'green' }
    }
  },
  // Overwrite the `--vf-node-color` variable to change the border, box-shadow and handle color of a node
  { id: '7', label: 'Node 7', position: { x: 100, y: 100 }, style: { '--vf-node-color': 'blue' } },

  // Edges
  // Most basic edge, only consists of an id, source-id and target-id
  { id: 'e1-3', source: '1', target: '3' },

  // An animated edge
  { id: 'e1-2', source: '1', target: '2', animated: true },
])
</script>

<template>
  <div class="box content">
    <VueFlow v-model="elements" />
  </div>
</template>

<style scoped>
/* these are necessary styles for vue flow */
/*@import 'style.css';*/

/* this contains the default theme, these are optional styles */
/*@import 'theme-default.css';*/

.vue-flow {
  background: #6f3381;
}

.custom-node {
  background: #57534e;
}
</style>
