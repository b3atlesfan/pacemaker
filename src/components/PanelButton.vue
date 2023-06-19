<script setup>

const props = defineProps({
  dark: {
    type: Boolean,
    required: true
  },
  backgroundColor: {
    type: String,
    required: false
  },
  backgroundColorLight: {
    type: String,
    required: false
  },
  backgroundColorDark: {
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
  fillColorLight: {
    type: String,
    required: false,
  },
  fillColorDark: {
    type: String,
    required: false,
  },
  svgString: {
    type: String,
    required: false,
  },
  svgStringDark: {
    type: String,
    required: false,
  }
})

const emit = defineEmits(["onClick"])

const baseSvgString = "M12 17q-2.075 0-3.537-1.463Q7 14.075 7 12t1.463-3.538Q9.925 7 12 7t3.538 1.462Q17 9.925 17 12q0 2.075-1.462 3.537Q14.075 17 12 17ZM2 13q-.425 0-.712-.288Q1"

const color_light = props.backgroundColor ?? (props.backgroundColorLight ?? "#fffffb")
const color_dark = props.backgroundColor ?? (props.backgroundColorDark ?? "#292524")
const title = props.title ?? "Button"
const width = props.width ?? 16
const height = props.height ?? 16
const viewBox = props.viewBox ?? "0 0 24 24"
const fill = props.fillColor ?? (props.fillColorLight ?? "#292524")
const fill_dark = props.fillColor ?? (props.fillColorDark ?? "#fffffb")
const d = props.svgString ?? baseSvgString
const d_dark = props.svgStringDark ?? (props.svgString ?? baseSvgString)
</script>

<template>
  <!--
  <button :style="{{ dark ? color_dark : color_light }}" :title=title @click="$emit('onClick')">
  -->
  <button :style="{ backgroundColor: dark ? color_dark : color_light }" :title=title @click="$emit('onClick')">
    <template v-if="dark">
      <svg :width=width :height=height :viewBox=viewBox>
        <path :fill=fill_dark :d=d_dark />
      </svg>
    </template>

    <template v-else >
      <svg :width=width :height=height :viewBox=viewBox>
        <path :fill=fill :d=d />
      </svg>
    </template>
  </button>
</template>
