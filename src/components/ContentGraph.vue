<script setup lang="ts">
import {computed} from "vue";
import {useTheme} from "vuetify";
import {BeatContent} from "@/assets/BeatContent";

const props = defineProps<{
  paths: {name: string, path: (BeatContent | null) []}[]
  computeOptions: "Beat" | "Time",
}>()

const theme = useTheme()

const formatterFunctions = {
  Beat: formatBeat,
  Time: formatTime,
}

function formatBeat(value: any) {
  return value ? value.toFixed(0) : value
}

function formatTime(value: any) {
  const timeInMin = value / 60

  return Math.round(timeInMin / 0.5) * 0.5
}

const computeOptions = {
  Beat: computeBeat,
  Time: computeTime,
}

function computeBeat(): {name: string, data: {x: string | number, y: number | null}[]}[] | undefined {
  return props.paths.map(path => {
    return { name: path.name, data: path.path.map((content, id) => {
      const intensity = content ? (content.intensity + content.narrativeIntensity) / 2 : null
      console.log("gameplay " + content?.intensity)
      console.log("narrative " + content?.narrativeIntensity)
      console.log("intensity " + intensity)
      return {x: id, y: intensity}
    })
    }
  })
}

function computeTime(): {name: string, data: {x: string | number, y: number | null}[]}[] | undefined {
  return props.paths.map(path => {
    let currentTime = 0
    const tick = 30

    return { name: path.name, data: path.path.flatMap((content, id) => {
      if (content == null) {
        return {x: tick * currentTime++, y: null}
      }

      const data = []

      const min = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(0, 2)) : 0
      const sec = content.expectedPlaytime ? parseInt(content.expectedPlaytime.substring(3, 5)) : 30

      const upperBound = min * 2 + Math.floor(sec/30)
      const intensity = (content.intensity + content.narrativeIntensity) * 0.5
      for (let j = 1; j <= upperBound; j++) {
        data.push({x: tick * currentTime++, y: intensity})
        //data2.push({x: currentTime, y: content.intensity})
        //data3.push({x: currentTime, y: content.narrativeIntensity})
      }

      return data
      })
    }
  })
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
    },
    theme: {
      mode: theme.global.current.value.dark ? 'dark' : 'light',
      palette: 'palette1',
      monochrome: {
        enabled: true,
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

const series = computed(computeOptions[props.computeOptions])

</script>

<template>
  <apexchart width="100%" type="line" :options="options" :series="series"></apexchart>
</template>

<style scoped>

</style>
