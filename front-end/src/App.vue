<script lang="ts" setup>
import {useTheme} from "vuetify";

const theme = useTheme()

function toggleTheme() {
  theme.global.name.value = theme.global.current.value.dark ? 'red' : 'redDark'
}


</script>

<template>
  <v-app class="overflow-hidden">
    <v-navigation-drawer color="primary" expand-on-hover rail floating>
      <v-list>
        <v-list-item
            prepend-icon="mdi-heart-pulse"
            title="PaceMaker"
        ></v-list-item>
      </v-list>

      <v-divider></v-divider>

      <v-list density="compact" nav>
        <v-list-item prepend-icon="mdi-file-multiple" title="Blueprints" to="/blueprints"></v-list-item>
        <v-list-item prepend-icon="mdi-graph" title="Graph" to="/"></v-list-item>
        <v-list-item prepend-icon="mdi-chart-line" title="Visualizer" to="/visualizer"></v-list-item>
        <v-list-item prepend-icon="mdi-chart-line" title="Designer" to="/designer"></v-list-item>
        <!--
        <v-list-item prepend-icon="mdi-account-multiple" title="Shared with me" value="shared"></v-list-item>
        <v-list-item prepend-icon="mdi-star" title="Starred" value="starred"></v-list-item>
        -->
      </v-list>
      <v-divider></v-divider>

      <v-list density="compact" nav>
        <v-list-item prepend-icon="mdi-weather-night" :title="theme.global.current.value.dark ? 'Light Mode' : 'Dark Mode'" @click="toggleTheme"></v-list-item>
      </v-list>

    </v-navigation-drawer>

    <v-main class="overflow-hidden">
      <router-view></router-view>
    </v-main>

  </v-app>
</template>

<style>

</style>
