<script setup>
import {VueFinalModal} from "vue-final-modal";
import {ref} from "vue";

const emit = defineEmits(['close', 'delete'])

const getInitialValues = () => ({
  modelValue: false,
  teleportTo: 'body',
  displayDirective: 'if',
  hideOverlay: false,
  overlayTransition: 'vfm-fade',
  contentTransition: 'vfm-fade',
  clickToClose: true,
  escToClose: true,
  background: 'non-interactive',
  lockScroll: true,
  swipeToClose: 'none',
})

const options = ref(getInitialValues())

const difficulty = ref(0)

const name = ref("")
</script>

<template>
  <VueFinalModal
      v-model="options.modelValue"
      :teleport-to="options.teleportTo"
      :display-directive="options.displayDirective"
      :hide-overlay="options.hideOverlay"
      :overlay-transition="options.overlayTransition"
      :content-transition="options.contentTransition"
      :click-to-close="options.clickToClose"
      :esc-to-close="options.escToClose"
      :background="options.background"
      :lock-scroll="options.lockScroll"
      :swipe-to-close="options.swipeToClose"
      class="flex justify-center items-center"
      content-class="max-w-xl mx-4 p-4 bg-white dark:bg-gray-900 border dark:border-gray-700 rounded-lg space-y-2"
  >
    <h1 class="text-xl">
      Warning!
    </h1>
    <div>
      Do you want to delete this node?
    </div>
    <div>
      <button @click="$emit('close')">
        Close
      </button>
      <button class="float-right" @click="$emit('delete')">
        Delete
      </button>
    </div>
  </VueFinalModal>
</template>

<style scoped>

</style>