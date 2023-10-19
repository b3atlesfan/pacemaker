<script lang="ts" setup>

</script>

<template>
  <v-app class="overflow-hidden">
    <v-navigation-drawer color="primary" expand-on-hover rail floating>
      <v-list>
        <v-list-item
            prepend-avatar="@/assets/images/pacemaker_icon_cropped.png"
            title="PaceMaker"
        ></v-list-item>
      </v-list>

      <v-divider></v-divider>

      <v-list density="compact" nav>
        <v-list-item prepend-icon="mdi-graph" title="Graph" to="/"></v-list-item>
        <v-list-item prepend-icon="mdi-file-multiple" title="Content" to="/content"></v-list-item>
        <v-list-item prepend-icon="mdi-chart-line" title="Visualizer" to="/visualizer"></v-list-item>
        <!--
        <v-list-item prepend-icon="mdi-account-multiple" title="Shared with me" value="shared"></v-list-item>
        <v-list-item prepend-icon="mdi-star" title="Starred" value="starred"></v-list-item>
        -->
      </v-list>
    </v-navigation-drawer>

    <v-main class="overflow-hidden">
      <router-view></router-view>
    </v-main>

  </v-app>
</template>

<style>

</style>
