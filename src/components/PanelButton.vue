<script setup>

const props = defineProps({
  title: {
    type: String,
    required: true
  },
  fill: {
    type: Object,
    required: true,
  },
  d: {
    type: String,
    required: true,
  }
})

const emit = defineEmits(["onClick"])

function onClickCallback() {
  emit("onClick")
}
</script>

<template>
  <button style="background-color: #6f3381; color: white" title="{{ title }}" @click="onClickCallback">
    <svg width="16" height="16" viewBox="0 0 32 32">
      <path fill="{{fill}}}" d="M18 28A12 12 0 1 0 6 16v6.2l-3.6-3.6L1 20l6 6l6-6l-1.4-1.4L8 22.2V16a10 10 0 1 1 10 10Z"/>
    </svg>
  </button>
</template>
