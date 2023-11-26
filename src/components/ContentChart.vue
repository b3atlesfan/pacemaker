<script setup lang="ts">
import {BeatManager} from "@/assets/BeatManager";
import {computed, ref} from "vue";
import {BeatContentManager} from "@/assets/BeatContentManager";
import {useTheme} from "vuetify";
import {BeatContent} from "@/assets/BeatContent";

const props = defineProps<{
  paths: {name: string, path: (BeatContent | null) []}[],
  path: number[] | undefined,
  //computeOptions: "Beat" | "Time",
}>()

const beatManager = BeatManager.getInstance()
const contentManager = BeatContentManager.getInstance()
const theme = useTheme()

const computeOptionsName = ref<"Beat" | "Time">("Time")

const formatterFunctions = {
  Beat: formatBeat,
  Time: formatTime,
}

function formatBeat(value: any) {
  //return value.toFixed(0)
}

function formatTime(value: any) {
  //const timeInMin = value / 60

  return value.toFixed(2)
}

const computeOptions = {
  Beat: computeBeat,
  Time: computeTime,
}

function computeBeat(): { name: string, data: { x: string, y: number[] }[] }[] | undefined {
  if (props.path == undefined) return

  const categories: { [category: string]: { x: string, y: number[] }[] } = {}

  for (let i = 0; i < props.path.length; i++) {
    const beat = beatManager.getNode(props.path[i].toString())

    if (beat.data.contentId == -1) continue

    const content = contentManager.getContent(beat.data.contentId)

    const category = content.category

    if (categories.hasOwnProperty(category)) {
      categories[category].push({x: 'Category', y: [i, i + 1]})
    } else {
      categories[category] = [{x: 'Category', y: [i, i + 1]}]
    }
  }

  const result: { name: string, data: { x: string, y: number[] }[] }[] = []

  for (let key in categories) {
    result.push({name: key, data: categories[key]})
  }

  return result
}

function computeTime(): { name: string, data: { x: string, y: number[] }[] }[] | undefined {
  const categories: { [category: string]: { x: string, y: number[] }[] } = {}

  props.paths.forEach(path => {

    let currentTime = 0
    path.path.forEach(content => {
      if (content == null) {
        currentTime += 0.5
        return
      }

      const min = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(0, 2)) : 0
      const sec = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(3, 5)) : 30

      let timeInMin = computeOptionsName.value == "Time" ? min + (sec / 60) : 1

      //timeInMin = Math.round(timeInMin / 0.5) * 0.5

      const category = content.category

      if (categories.hasOwnProperty(category)) {
        categories[category].push({x: path.name, y: [currentTime, currentTime + timeInMin]})
      } else {
        categories[category] = [{x: path.name, y: [currentTime, currentTime + timeInMin]}]
      }

      currentTime += timeInMin

    })

  })
  const result: { name: string, data: { x: string, y: number[] }[] }[] = []

  for (let key in categories) {
    result.push({name: key, data: categories[key]})
  }

  return result
}

const xAxisTitle = {
  Beat: "Beat",
  Time: "Time in minutes"
}

const options = computed(() => {
  return {
    chart: {
      id: 'vuechart-example',
      background: theme.current.value.colors['surface'],
      type: 'rangeBar',
      width: '100%',
      toolbar: {
        tools: {
          customIcons: [{
            icon: '<img src="/swap-horizontal.png" width="22" />',
            index: 0,
            title: 'Switch intensity settings: Computed->Gameplay->Narrative->All',
            class: 'custom-icon',
            click: changeMode
          } ]
        }
      },
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
        text: xAxisTitle[computeOptionsName.value],
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
        text: '',
        rotateAlways: false,
        formatter: formatterFunctions[computeOptionsName.value],
      },
      decimalsInFloat: 0
    },
    stroke: {
      width: [5, 5, 4], // array for subsequent data series
      curve: 'smooth', // 'straight' enables missing data points
      lineCap: 'round',
    },
    markers: {
      showNullDataPoints: false,
    },
    plotOptions: {
      bar: {
        horizontal: true,
        rangeBarGroupRows: true,
      }
    },
  }
})

const series = computed(computeOptions[computeOptionsName.value])

const chartOptions = {
  chart: {
    toolbar: {
      tools: {
        customIcons: [{
          icon: '<img src="/swap-horizontal.png" width="22" />',
          index: 0,
          title: 'Switch between beat and time view',
          class: 'custom-icon',
          click: changeMode
        } ]
      }
    },
  },
  plotOptions: {
    bar: {
      horizontal: true,
      barHeight: '50%',
      rangeBarGroupRows: true
    }
  },
  title: {
    text: 'Beat Categories',
    align: 'left',
    style: {
      fontFamily: "Roboto",
    }
  },
  colors: [
    "#3F51B5", "#D4526E", "#1B998B", "#E2C044",
    "#B415D4", "#F86624", "#1538D4", "#15D435",
    "#710678", "#0C7860", "#782306", "#546E7A",
    "#008FFB", "#00E396", "#FEB019", "#FF4560",
    "#775DD0", "#D7263D", "#E2C044", "#8D5B4C",
  ],
  fill: {
    type: 'solid'
  },
  xaxis: {
    type: 'numeric',
    title: {
      text: xAxisTitle[computeOptionsName.value],
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
  },
  yaxis: {
    show: true,
    horizontal: false,
  },
  legend: {
    position: 'bottom',
    style: {
      fontFamily: "Roboto",
    }
  },
}

function changeMode() {
  console.log("change")
  computeOptionsName.value = computeOptionsName.value == "Time" ? "Beat" : "Time"
  console.log(computeOptionsName.value)
}

</script>

<template>
  <apexchart type="rangeBar" width="100%" :options="chartOptions" :series="series"></apexchart>
</template>

<style scoped>

</style>
