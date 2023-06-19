<script setup>

const props = defineProps({
  backgroundColor: {
    type: String,
    required: false
  },
  title: {
    type: String,
    required: false
  },
  width: {
    type: Number,
    required: false,
  },
  height: {
    type: Number,
    required: false,
  },
  viewBox: {
    type: String,
    required: false,
  },
  fillColor: {
    type: String,
    required: false,
  },
  svgString: {
    type: String,
    required: false,
  }
})

const style = "background-color: " + (props.backgroundColor ?? "#ffffff")
const title = props.title ?? "Button"
const width = props.width ?? 16
const height = props.height ?? 16
const viewBox = props.viewBox ?? "0 0 24 24"
const fill = props.fillColor ?? "#000"
const d = props.svgString ?? "M12 17q-2.075 0-3.537-1.463Q7 14.075 7 12t1.463-3.538Q9.925 7 12 7t3.538 1.462Q17 9.925 17 12q0 2.075-1.462 3.537Q14.075 17 12 17ZM2 13q-.425 0-.712-.288Q1"


const emit = defineEmits(["onClick"])

function onClickCallback() {
  console.log(props.title, props.fill, props.d)
  emit("onClick")
}
</script>

<template>
  <button :style=style :title=title @click="onClickCallback">
    <svg :width=width :height=height :viewBox=viewBox>
      <path :fill=fill :d=d />
    </svg>
  </button>
</template>
