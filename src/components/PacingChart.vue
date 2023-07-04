<script setup>
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend
} from 'chart.js'

import { Line } from 'vue-chartjs'
import { useElementsStore } from "@/stores/elements";
import {computed, ref, watch, watchEffect} from "vue";
import {storeToRefs} from "pinia";

ChartJS.register(
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    Title,
    Tooltip,
    Legend
)

const options = {
  responsive: true,
  maintainAspectRatio: false
}

const { elements } = storeToRefs(useElementsStore())

const labels = []
const dataSet = []

const data = ref({
  labels: labels,
  datasets: [
    {
      label: 'Difficulty',
      backgroundColor: '#f87979',
      data: dataSet
    }
  ]
})
/*
watchEffect(() => {
  elements.value.forEach(e => {
    if (e.type !== 'gameplay-beat') return;

    labels.push(e.id)
    dataSet.push(e.data)
  })

  data.value.labels = labels
  data.value.datasets[0].data = dataSet
})*/

watch(elements, () => {
  console.log("Logging elements: " + elements.value)

  const labels2 = []
  const dataSet2 = []
  data.value.labels = []
  data.value.datasets[0].data = []

  elements.value.forEach(e => {
    console.log("Logging for each")
    if (e.type !== 'gameplay-beat') return;
    labels2.push(e.id)
    console.log("e.data: " + e.data)

    dataSet2.push(e.data)
  })

  //data.value.labels = labels2
  //data.value.datasets[0].data = dataSet2
  //console.log("labels2: " + labels2)
  //console.log("labels: " + data.value.labels)
  data.value = {
    labels: labels2,
        datasets: [
    {
      label: 'Difficulty',
      backgroundColor: '#f87979',
      data: dataSet2
    }
  ]
  }
})

/*
const labelsComputed = computed(() => {
  const resultLabels = []
  const resultData = []

  elements.value.forEach(e => {
    if (e.type !== 'gameplay-beat') return;

    resultLabels.push(e.id)
    resultData.push(e.data)
  })

  return [resultLabels, resultData]
})

 */

elements.value.forEach(e => {
  if (e.type !== 'gameplay-beat') return;

  labels.push(e.id)
  dataSet.push(e.data)
})

</script>

<template>
  <div>
    <Line :data="data" :options="options" />
  </div>
</template>

<style scoped lang="scss">
</style>