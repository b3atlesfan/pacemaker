<script setup lang="ts">

import {computed, ref} from "vue";

const options = ref({
  chart: {
    id: 'vuechart-example'
  },
  theme: {
    mode: 'light',
    palette: 'palette1',
    monochrome: {
      enabled: false,
      color: '#255aee',
      shadeTo: 'light',
      shadeIntensity: 0.65
    },
  },
  title: {
    text: 'Beat Chart',
    align: 'left'
  },
  xaxis: {
    type: 'numeric'
  },
  stroke: {
    width: 5,
    curve: 'smooth'
  },
  fill: {
    type: 'gradient',
    gradient: {
      shade: 'dark',
      gradientToColors: [ '#79000e'],
      shadeIntensity: 1,
      type: 'horizontal',
      opacityFrom: 1,
      opacityTo: 1,
      stops: [0, 100, 100, 100]
    },
  }
})
/*
const series = ref([{
  name: 'series-1',
  data: [[] as number[]],
}])*/

const series = computed(computeData)

</script>

<template>

</template>

<style scoped>

</style>
