<script setup>
import {isNode, MarkerType, Panel, PanelPosition, useVueFlow, VueFlow} from '@vue-flow/core'
import {Background} from '@vue-flow/background'
import {Controls} from '@vue-flow/controls'
import {markRaw, ref} from 'vue'
import {initialElements} from '@/assets/vueflow_examples/initial-elements.js'
import ContextMenu from '@imengyu/vue3-context-menu'
import {GameplayBeat} from "@/assets/GameplayBeat"
import GameplayBeatNode from "@/components/GameplayBeatNode.vue";
import PanelButton from "@/components/PanelButton.vue";
import ThePanel from "@/components/ThePanel.vue";
import {ModalsContainer, useModal, VueFinalModal} from 'vue-final-modal'
import ModalConfirm from '@/components/CreateBeatModal.vue'
import {useElementsStore} from "@/stores/elements";
import {storeToRefs} from "pinia";
import PacingChart from "@/components/PacingChart.vue";


/**
 * useVueFlow provides all event handlers and store properties
 * You can pass the composable an object that has the same properties as the VueFlow component props
 */
const { onPaneReady, onNodeDragStop, onConnect, addEdges, setTransform, toObject, nodeTypes, addNodes, getNodes } = useVueFlow()


nodeTypes.value = {
  'gameplay-beat': markRaw(GameplayBeatNode)
}

/**
 * Our elements
 */
// const elements = ref(initialElements)
const { elements } = storeToRefs(useElementsStore())

let vueFlowInstance

onPaneReady((flowInstance) => {
  flowInstance.fitView()
  vueFlowInstance = flowInstance
})

let id = 0

elements.value.forEach(e => {
  if (e.type !== 'gameplay-beat') return;
  id++
})


let pos

function onContextMenu(mouseEvent) {
  //prevent the browser's default menu
  mouseEvent.preventDefault();
  //show your menu
  ContextMenu.showContextMenu({
    x: mouseEvent.x,
    y: mouseEvent.y,
    items: [
      {
        label: "Create beat",
        onClick: () => {
          pos = {x: mouseEvent.x, y: mouseEvent.y }
          open()
          /*
          console.log([mouseEvent.x, mouseEvent.y])
          const pos = { x: mouseEvent.x, y: mouseEvent.y }
          const beat = new GameplayBeat('' + id, 'Beat ' + id, 1, vueFlowInstance.project(pos))
          addNodes(beat)
          id++
           */
        }
      },
      {
        label: "A submenu",
        children: [
          { label: "Item1" },
          { label: "Item2" },
          { label: "Item3" },
        ]
      },
    ]
  });
}

/**
 * This is a Vue Flow event-hook which can be listened to from anywhere you call the composable, instead of only on the main component
 *
 * onPaneReady is called when viewpane & nodes have visible dimensions
 */

onNodeDragStop((e) => console.log('drag stop', e))

/**
 * onConnect is called when a new connection is created.
 * You can add additional properties to your new edge (like a type or label) or block the creation altogether
 */
onConnect((params) => {

  console.log([params.sourceHandle, params.targetHandle])

  const edge = {
    id: 'e' + params.source + '-' + params.target,
    //label: 'edge with arrowhead',
    source: params.source,
    target: params.target,
    //sourceHandle: params.sourceHandle,
    //targetHandle: params.targetHandle,
    animated: true,
    markerEnd: MarkerType.ArrowClosed
  }

  addEdges(edge)
})

const dark = ref(true)

/**
 * To update node properties you can simply use your elements v-model and mutate the elements directly
 * Changes should always be reflected on the graph reactively, without the need to overwrite the elements
 */
function updatePos() {
  return elements.value.forEach((el) => {
    if (isNode(el)) {
      el.position = {
        x: Math.random() * 400,
        y: Math.random() * 400,
      }
    }
  })
}

/**
 * toObject transforms your current graph data to an easily persist-able object
 */
function logToObject() {
  return console.log(toObject())
}

/**
 * Resets the current viewpane transformation (zoom & pan)
 */
function resetTransform() {
  return setTransform({ x: 0, y: 0, zoom: 1 })
}

function toggleClass() {
  return (dark.value = !dark.value)
}

const { open, close } = useModal({
  component: ModalConfirm,
  attrs: {
    title: 'Hello World!',
    onClose() {
      close()
    },
    onCreateNode(name, difficulty) {
      createNode(name, difficulty)
      close()
    }
  },
  slots: {
    default: '<p>UseModal: The content of the modal</p>',
  },
})

function createNode(name, difficulty) {
  const beat = new GameplayBeat('' + id, name, difficulty, vueFlowInstance.project(pos))
  addNodes(beat)
  console.log(getNodes.value)
  id++
}

</script>

<template>
  <VueFlow v-model="elements" :class="{ dark }" class="basicflow" :default-viewport="{ zoom: 1.5 }" :min-zoom="0.2" :max-zoom="4" @paneContextMenu="onContextMenu($event)">
    <Background :pattern-color="dark ? '#FFFFFB' : '#aaa'" gap="50" />

    <!--
    <MiniMap />
    -->

    <Controls />

    <ThePanel :dark=dark @onResetTransform="open" @onShuffleNodes="updatePos" @onToggleDarkMode="toggleClass" @onLogToObject="logToObject"/>

  </VueFlow>
  <PacingChart />
</template>