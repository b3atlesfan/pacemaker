<script setup lang="ts">

import {BeatManager} from "@/assets/BeatManager";
import {computed, ref} from "vue";
import {BeatContentManager} from "@/assets/BeatContentManager";
import {useTheme} from "vuetify";

const props = defineProps<{
  path: number[] | undefined,
  computeOptions: "beat" | "time",
}>()

const beatManager = BeatManager.getInstance()
const contentManager = BeatContentManager.getInstance()

const theme = useTheme()

const options = computed(() => {
  return {
    chart: {
      id: 'vuechart-example'
    },
    theme: {
      mode: theme.global.current.value.dark ? 'dark' : 'light',
      palette: 'palette1',
      monochrome: {
        enabled: false,
        color: '#255aee',
        shadeTo: 'light',
        shadeIntensity: 0.65
      },
    },
    title: {
      text: props.computeOptions + ' chart',
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
        gradientToColors: ['#79000e'],
        shadeIntensity: 1,
        type: 'horizontal',
        opacityFrom: 1,
        opacityTo: 1,
        stops: [0, 100, 100, 100]
      },
    }
  }
})


const computeOptions = {
  beat: computeBeat,
  time: computeTime,
}

const series = computed(computeOptions[props.computeOptions])

function computeBeat(): [{name: string, data: number[][]}] | undefined {
  if (props.path == undefined) return

  const data: number[][] = []

  for (let i = 0; i < props.path.length; i++) {
    //console.log("index " + i + " value " + props.path[i])
    const beat = beatManager.getNode(props.path[i].toString())

    if (beat.data == -1) continue
    const content = contentManager.getContent(beat.data)

    data.push([i, content.intensity])
    //console.log("series.data " + data)
  }

  return [{name: 'series-1', data: data}]
}

function computeTime(): [{name: string, data: number[][]}] | undefined {
  if (props.path == undefined) return

  const data: number[][] = []

  let currentTime = 0

  for (let i = 0; i < props.path.length; i++) {
    //console.log("index " + i + " value " + props.path[i])
    const beat = beatManager.getNode(props.path[i].toString())

    if (beat.data == -1) continue

    const content = contentManager.getContent(beat.data)

    const min = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(0, 2)) : 0
    const sec = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(3, 5)) : 30

    const upperBound = min * 2 + Math.floor(sec/30)

    for (let j = 1; j <= upperBound; j++) {
      data.push([currentTime, content.intensity])
      currentTime += 30
    }

    /*
    do {
      data.push([currentTime, content.intensity])
      currentTime += increment
      j += increment
    } while (content.expectedPlaytime && j < content.expectedPlaytime)
    */
  }

  return [{name: 'series-1', data: data}]
}

</script>

<template>
  <apexchart width="100%" type="line" :options="options" :series="series"></apexchart>
</template>

<style scoped>

</style>
