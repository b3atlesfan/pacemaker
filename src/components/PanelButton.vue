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
  console.log(props.title, props.fill, props.d)
  emit("onClick")
}
</script>

<template>
  <button style="background-color: #6f3381; color: white" :title=props.title @click="onClickCallback">
    <svg width="16" height="16" viewBox="0 0 32 32">
      <path :fill=fill :d="d"/>
    </svg>
  </button>
</template>
