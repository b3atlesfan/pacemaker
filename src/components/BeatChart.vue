<script setup lang="ts">
import {BeatManager} from "@/assets/BeatManager";
import {computed, ref} from "vue";
import {BeatContentManager} from "@/assets/BeatContentManager";
import {useTheme} from "vuetify";

const props = defineProps<{
  path: number[] | undefined,
  computeOptions: "Beat" | "Time",
}>()

const beatManager = BeatManager.getInstance()
const contentManager = BeatContentManager.getInstance()
const theme = useTheme()

const formatterFunctions = {
  Beat: formatBeat,
  Time: formatTime,
}

function formatBeat(value: any) {
  return value.toFixed(0)
}

function formatTime(value: any) {
  const timeInMin = value / 60

  return Math.round(timeInMin / 0.5) * 0.5
}

const computeOptions = {
  Beat: computeBeat,
  Time: computeTime,
}

function computeBeat(): [{name: string, data: [{x: string | number, y: number | null}]}] | undefined {
  if (props.path == undefined) return

  const data: [{x: string | number, y: number | null}] = []

  for (let i = 0; i < props.path.length; i++) {
    //console.log("index " + i + " value " + props.path[i])
    const beat = beatManager.getNode(props.path[i].toString())

    if (beat.data == -1) continue
    const content = contentManager.getContent(beat.data)

    //data.push([i, content.intensity ? content.intensity : null])
    data.push({x: i, y: content.intensity ? content.intensity : null})
    //console.log("series.data " + data)
  }

  return [{name: 'series-1', data: data}]
}

function computeTime(): [{name: string, data: [{x: string | number, y: number | null}]}] | undefined {
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

const xAxisTitle = {
  Beat: "Beat",
  Time: "Time in minutes"
}

const options = computed(() => {
  return {
    chart: {
      id: 'vuechart-example'
    },
    theme: {
      mode: theme.global.current.value.dark ? 'dark' : 'light',
      palette: 'palette1',
      monochrome: {
        enabled: true,
        color: theme.current.value.colors['secondary'],
        shadeTo: 'light',
        shadeIntensity: 0.65
      },
    },
    title: {
      text: 'Intensity',
      align: 'left',
      style: {
        fontFamily: "Roboto",
      }
    },
    xaxis: {
      type: 'numeric',
      title: {
        text: xAxisTitle[props.computeOptions],
        offsetX: 0,
        offsetY: 0,
        style: {
          color: undefined,
          fontSize: '12px',
          fontFamily: 'Roboto',
          fontWeight: 600,
          cssClass: 'apexcharts-xaxis-title',
        },
      },
      labels: {
        rotate: 0,
        text: 'hello',
        rotateAlways: false,
        formatter: formatterFunctions[props.computeOptions],
      },
      decimalsInFloat: 0
    },
    stroke: {
      width: 5,
      curve: 'smooth'
    },
    fill: {
      type: 'gradient',
      gradient: {
        shade: 'dark',
        gradientToColors: [theme.current.value.colors['primary']],
        shadeIntensity: 1,
        type: 'horizontal',
        opacityFrom: 1,
        opacityTo: 1,
        stops: [0, 100, 100, 100]
      },
    }
  }
})

const series = computed(computeOptions[props.computeOptions])

</script>

<template>
  <apexchart width="100%" type="line" :options="options" :series="series"></apexchart>
</template>

<style scoped>

</style>
