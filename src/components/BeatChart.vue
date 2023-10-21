<script setup lang="ts">

import {BeatManager} from "@/assets/BeatManager";
import {computed, ref} from "vue";

const props = defineProps<{
  path: number[] | undefined,
}>()

const beatManager = BeatManager.getInstance()

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

const series = computed((): [{name: string, data: number[][]}] | undefined => {
  if (props.path == undefined) return

  const data: number[][] = []

  for (let i = 0; i < props.path.length; i++) {
    //console.log("index " + i + " value " + props.path[i])
    data.push([i, props.path[i]])
    //console.log("series.data " + data)
  }

  return [{name: 'series-1', data: data}]
})

</script>

<template>
  <apexchart width="100%" type="line" :options="options" :series="series"></apexchart>
</template>

<style scoped>

</style>
