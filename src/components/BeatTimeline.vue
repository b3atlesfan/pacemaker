<script setup lang="ts">

const chartOptions = {
  chart: {
    type: 'boxPlot',
    height: 350
  },
  title: {
    text: 'Time Chart',
    align: 'left'
  },
  plotOptions: {
    boxPlot: {
      colors: {
        upper: '#5C4742',
        lower: '#5C4742'
      }
    }
  }
}

const series2 = [
  {
    type: 'boxPlot',
    data: [
      {
        x: 'Jan 2015',
        y: [40, 40, 40, 60, 60]
      },
      {
        x: 'Jan 2016',
        y: [43, 65, 69, 76, 81]
      },
      {
        x: 'Jan 2017',
        y: [31, 39, 45, 51, 59]
      },
      {
        x: 'Jan 2018',
        y: [39, 46, 55, 65, 71]
      },
      {
        x: 'Jan 2019',
        y: [29, 31, 35, 39, 44]
      },
      {
        x: 'Jan 2020',
        y: [41, 49, 58, 61, 67]
      },
      {
        x: 'Jan 2021',
        y: [54, 59, 66, 71, 88]
      }
    ]
  }
]
</script>

<template>
  <apexchart width="100%" type="boxPlot" :options="chartOptions" :series="series2"></apexchart>
</template>

<style scoped>

</style>
