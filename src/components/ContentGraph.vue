<script setup lang="ts">
import {computed, ref} from "vue";
import {useTheme} from "vuetify";
import {BeatContent} from "@/assets/BeatContent";

const props = defineProps<{
  paths: { name: string, path: (BeatContent | null) [] }[]
  computeOptions: "Beat" | "Time",
}>()

const theme = useTheme()

let currentTick = 0
const tick = ref(1)
const possibleTicks = [1, 2, 5, 10, 30, 60, 120, 300]

const points = ref([])
const pointsIsTurnedOn = ref(false)

let currentOption = 0
const possibleIntensityOptions = ["Computed", "Gameplay", "Narrative", "All"]
const intensityOptions = ref<typeof possibleIntensityOptions[number]>("Computed")

const formatterFunctions = {
  Beat: formatBeat,
  Time: formatTime,
}

function formatBeat(value: any) {
  return value ? value.toFixed(0) : value
}

function formatTime(value: any) {
  const timeInMin = value / 60

  return timeInMin.toFixed(2)
}

const computeOptions = {
  Beat: computeBeat,
  Time: computeTime,
}

function computeBeat(): { name: string, data: { x: string | number, y: number | null }[] }[] | undefined {
  return props.paths.flatMap(path => {
    if (intensityOptions.value == "Computed") return {
      name: path.name, data: path.path.map((content, id) => {
        const intensity = content ? content.computedIntensity : null
        return {x: id, y: intensity}
      })
    }
    else if (intensityOptions.value == "Gameplay") return {
      name: path.name + " Gameplay", data: path.path.map((content, id) => {
        const intensity = content ? content.intensity : null
        return {x: id, y: intensity}
      })
    }
    else if (intensityOptions.value == "Narrative") return {
      name: path.name + " Narrative", data: path.path.map((content, id) => {
        const intensity = content ? content.narrativeIntensity : null
        return {x: id, y: intensity}
      })
    }
    else if (intensityOptions.value == "All") return [{
      name: path.name, data: path.path.map((content, id) => {
        const intensity = content ? content.computedIntensity : null
        return {x: id, y: intensity}
      })
    }, {
      name: path.name + " Gameplay", data: path.path.map((content, id) => {
        const intensity = content ? content.intensity : null
        return {x: id, y: intensity}
      })
    }, {
      name: path.name + " Narrative", data: path.path.map((content, id) => {
        const intensity = content ? content.narrativeIntensity : null
        return {x: id, y: intensity}
      })
    },]
    else {
      // "Computed" and else
      return {
        name: path.name, data: path.path.map((content, id) => {
          const intensity = content ? content.computedIntensity : null
          return {x: id, y: intensity}
        })
      }
    }
  })
}

function computeTime(): { name: string, data: { x: string | number, y: number | null }[] }[] | undefined {
  return props.paths.flatMap(path => {
    let currentTime = 0
    const result = []

    if (intensityOptions.value == "Computed" || intensityOptions.value == "All") {
      result.push({
        name: path.name, data: path.path.flatMap((content, id) => {
          if (content == null) {
            return {x: tick.value * currentTime++, y: null}
          }

          const data = []

          const min = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(0, 2)) : 0
          const sec = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(3, 5)) : 30

          const upperBound = Math.floor((min * 60 + sec) / tick.value) //min * (60 / tick) + Math.floor(sec / tick) //min * 2 + Math.floor(sec / 30)
          const intensity = content.computedIntensity
          for (let j = 1; j <= upperBound; j++) {
            data.push({x: tick.value * currentTime++, y: intensity})
            //data2.push({x: currentTime, y: content.intensity})
            //data3.push({x: currentTime, y: content.narrativeIntensity})
          }

          if (data.length == 0) {
            data.push({x: tick.value * currentTime++, y: intensity})
          }

          return data
        })
      })
    }

    currentTime = 0
    if (intensityOptions.value == "Gameplay" || intensityOptions.value == "All") {
      result.push({
        name: path.name + " Gameplay", data: path.path.flatMap((content, id) => {
          if (content == null) {
            return {x: tick.value * currentTime++, y: null}
          }

          const data = []

          const min = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(0, 2)) : 0
          const sec = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(3, 5)) : 30

          const upperBound = Math.floor((min * 60 + sec) / tick.value) //min * (60 / tick) + Math.floor(sec / tick) //min * 2 + Math.floor(sec / 30)
          const intensity = content.intensity
          for (let j = 1; j <= upperBound; j++) {
            data.push({x: tick.value * currentTime++, y: intensity})
            //data2.push({x: currentTime, y: content.intensity})
            //data3.push({x: currentTime, y: content.narrativeIntensity})
          }

          if (data.length == 0) {
            data.push({x: tick.value * currentTime++, y: intensity})
          }

          return data
        })
      })
    }

    currentTime = 0
    if (intensityOptions.value == "Narrative" || intensityOptions.value == "All") {
      result.push({
        name: path.name + " Narrative", data: path.path.flatMap((content, id) => {
          if (content == null) {
            return {x: tick.value * currentTime++, y: null}
          }

          const data = []

          const min = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(0, 2)) : 0
          const sec = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(3, 5)) : 30

          const upperBound = Math.floor((min * 60 + sec) / tick.value) //min * (60 / tick) + Math.floor(sec / tick) //min * 2 + Math.floor(sec / 30)
          const intensity = content.narrativeIntensity
          for (let j = 1; j <= upperBound; j++) {
            data.push({x: tick.value * currentTime++, y: intensity})
            //data2.push({x: currentTime, y: content.intensity})
            //data3.push({x: currentTime, y: content.narrativeIntensity})
          }

          if (data.length == 0) {
            data.push({x: tick.value * currentTime++, y: intensity})
          }

          return data
        })
      })
    }

    return result
  })
}

const xAxisTitle = {
  Beat: "Beat",
  Time: "Time in minutes"
}

function createPoint(x: number, y: number, text: string) {
  return {
    x: x,
    y: y,
    marker: {
      size: 4,
      fillColor: '#fff',
      strokeColor: 'red',
      radius: 2,
      //cssClass: 'apexcharts-custom-class'
    },
    label: {
      borderColor: '#FF4560',
      offsetY: 0,
      style: {
        color: '#fff',
        background: '#FF4560',
      },

      text: text,
    }
  }
}

const options = computed(() => {
  return {
    chart: {
      id: 'vuechart-example',
      background: theme.current.value.colors['surface'],
      toolbar: {
        tools: {
          customIcons: [{
            icon: '<img src="/swap-horizontal.png" width="22" />',
            index: 0,
            title: 'Switch intensity settings: Computed->Gameplay->Narrative->All',
            class: 'custom-icon',
            click: onIntensityOptions
          }, {
            icon: '<img src="/timer-cog-outline.png" width="22" />',
            index: 0,
            title: 'Switch time scale settings: 1s->2s->5s->10s->30s->60s->120s->300s',
            class: 'custom-icon',
            click: props.computeOptions == "Time" ? onTickRate : onShowPoints
          },]
        }
      },
    },
    theme: {
      mode: theme.global.current.value.dark ? 'dark' : 'light',
      palette: 'palette1',
      monochrome: {
        enabled: false,
        color: "#001678",
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
    colors: [
      "#3F51B5", "#D4526E", "#1B998B", "#E2C044",
      "#B415D4", "#F86624", "#1538D4", "#15D435",
      "#710678", "#0C7860", "#782306", "#546E7A",
      "#008FFB", "#00E396", "#FEB019", "#FF4560",
      "#775DD0", "#D7263D", "#E2C044", "#8D5B4C",
      //"#BDD415",
      //"#001678", "#6A7800", "#630078", "#007814",
      //"#0027D4", "#BBD400", "#B000D4", "#00D423",
    ],
    annotations: {
      points: points.value
    }
    /*
    annotations: {
      points: [{
        x: 2,
        y: 64,
        marker: {
          strokeColor: theme.current.value.colors['primary'],
        },
      }]
    },
    tooltip: {
      x: {
        show: true,
      },
      y: {
        formatter: function(value, { series, seriesIndex, dataPointIndex, w }) {
          return value
        }
      },
      custom: function({series, seriesIndex, dataPointIndex, w}) {
        return '<v-card class="arrow_box" title="help">' +
          '<v-card-text>' + series[seriesIndex][dataPointIndex] + '</v-card-text>' +
          '</v-card>'
      }
      */
  }
})

function onIntensityOptions() {
  currentOption = (currentOption + 1) % possibleIntensityOptions.length
  intensityOptions.value = possibleIntensityOptions[currentOption]
}

function onTickRate() {
  currentTick = (currentTick + 1) % possibleTicks.length
  tick.value = possibleTicks[currentTick]
}

function onShowPoints() {
  pointsIsTurnedOn.value = !pointsIsTurnedOn.value
  if (!pointsIsTurnedOn.value) {
    points.value.splice(0, points.value.length)
    console.log(points.value.length)
  } else if (intensityOptions.value == "Computed") {
    props.paths.forEach(path => {
      path.path.forEach((content, id) => {
        if (content != null && pointsIsTurnedOn.value) {
          if (content.introducedSkills.length > 0) {
            points.value.push(createPoint(id, content.computedIntensity, "Introduces: " + content.introducedSkills.join()))
            console.log(points.value[0])
          }

          if (content.reinforcedSkills.length > 0) {
            points.value.push(createPoint(id, content.computedIntensity, "Reinforces: " + content.reinforcedSkills.join()))
            console.log(points.value[0])
          }

          if (content.requiredSkills.length > 0) {
            points.value.push(createPoint(id, content.computedIntensity, "Requires: " + content.requiredSkills.join()))
            console.log(points.value[0])
          }
        }
      })
    })
  }
}


const series = computed(computeOptions[props.computeOptions])

</script>

<template>
  <apexchart width="100%" type="line" :options="options" :series="series"></apexchart>
</template>

<style scoped>

</style>
