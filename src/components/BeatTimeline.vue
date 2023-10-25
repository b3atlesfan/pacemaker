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
  //return value.toFixed(0)
}

function formatTime(value: any) {
  const timeInMin = value / 60

  return Math.round(timeInMin / 0.5) * 0.5
}

const computeOptions = {
  Beat: computeBeat,
  Time: computeTime,
}

function computeBeat(): {name: string, data: {x: string, y: number[]}[]}[] | undefined {
  if (props.path == undefined) return

  const categories: { [category: string]: {x: string, y: number[]}[]} = {}

  for (let i = 0; i < props.path.length; i++) {
    const beat = beatManager.getNode(props.path[i].toString())

    if (beat.data == -1) continue

    const content = contentManager.getContent(beat.data)

    const category = content.category

    if (categories.hasOwnProperty(category)) {
      categories[category].push({x: 'Category', y: [i, i + 1]})
    } else {
      categories[category] = [{x: 'Category', y: [i, i + 1]}]
    }
  }

  const result: {name: string, data: {x: string, y: number[]}[]}[] = []

  for (let key in categories) {
    result.push({name: key, data: categories[key]})
  }

  return result
}

function computeTime(): {name: string, data: {x: string, y: number[]}[]}[] | undefined {
  if (props.path == undefined) return

  const categories: { [category: string]: {x: string, y: number[]}[]} = {}

  let currentTime = 0

  for (let i = 0; i < props.path.length; i++) {
    const beat = beatManager.getNode(props.path[i].toString())

    if (beat.data == -1) continue

    const content = contentManager.getContent(beat.data)

    const min = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(0, 2)) : 0
    const sec = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(3, 5)) : 30

    let timeInMin = min + (sec/60)

    timeInMin = Math.round(timeInMin / 0.5) * 0.5

    const category = content.category

    if (categories.hasOwnProperty(category)) {
      categories[category].push({x: 'Category', y: [currentTime, currentTime + timeInMin]})
    } else {
      categories[category] = [{x: 'Category', y: [currentTime, currentTime + timeInMin]}]
    }

    currentTime += timeInMin
  }
  const result: {name: string, data: {x: string, y: number[]}[]}[] = []

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
        text: '',
        rotateAlways: false,
        formatter: formatterFunctions[props.computeOptions],
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

const series = computed(computeOptions[props.computeOptions])

const chartOptions = {
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
    "#008FFB", "#00E396", "#FEB019", "#FF4560", "#775DD0",
    "#710678", "#3A780C", "#782306",  "#0C7860",
    "#3F51B5", "#546E7A", "#D4526E", "#8D5B4C", "#F86624",
    "#D7263D", "#1B998B", "#2E294E", "#F46036", "#E2C044"
  ],
  fill: {
    type: 'solid'
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


const seriesAlt = [
  {
    name: 'First',
    data: [
      {
        x: 'Deployment',
        y: [
          0,
          10.5
        ]
      },
      {
        x: 'Deployment',
        y: [
          20,
          30
        ]
      }
    ]
  },
  {
    name: 'Second',
    data: [
      {
        x: 'Deployment',
        y: [
          10,
          20
        ]
      },
      {
        x: 'Deployment',
        y: [
          30,
          40
        ]
      },
    ]
  },
]

</script>

<template>
  <apexchart type="rangeBar" width="100%" :options="chartOptions" :series="series"></apexchart>
</template>

<style scoped>

</style>
