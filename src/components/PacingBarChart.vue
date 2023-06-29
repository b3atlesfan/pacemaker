<script setup>
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale
} from 'chart.js'

import { Bar } from 'vue-chartjs'
import { useElementsStore } from "@/stores/elements";

ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend)

const options = {
  responsive: true,
  maintainAspectRatio: false
}

const elements = useElementsStore().elements

const labels = []
const dataSet = []

elements.forEach(e => {
  if (e.type !== 'gameplay-beat') return;

  labels.push(e.id)
  dataSet.push(e.data)
})

const data = {
  labels: labels,
  datasets: [
    {
      label: 'First',
      backgroundColor: '#f87979',
      data: dataSet
    }
  ]
}

</script>

<template>
  <div>
    <Bar :data="data" :options="options" />
  </div>
</template>

<style scoped lang="scss">
</style>