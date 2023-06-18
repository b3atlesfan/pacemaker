<script setup>
import {RouterLink} from "vue-router";
</script>

<template>
  <header class="row header">
    <nav class="container">
      <div class="branding">
        <img src="@/assets/images/pacemaker_icon_cropped.png" alt="">
        <h1>PaceMaker</h1>
      </div>
      <ul class="nav-routes">
        <RouterLink to="/">Main</RouterLink>
        <RouterLink to="/flowexample">VueFlowExample</RouterLink>
        <RouterLink to="/theming">Theming</RouterLink>
        <RouterLink to="/composables">Composables</RouterLink>
        <RouterLink to="/customnodes">Custom Nodes</RouterLink>
        <RouterLink to="/customnodesexample">Custom Nodes Example</RouterLink>
      </ul>
    </nav>
  </header>
</template>

<style lang="scss" scoped>
header {
  background-color: #f1f1f1;
  nav {
    display: flex;
    align-items: center;
    padding: 0 16px;

    .branding {
      display: flex;
      align-items: center;
      gap: 8px;
      img {
        max-width: 50px;
      }

      h1 {
        font-size: 24px;
      }
    }
  }

  .nav-routes {
    display: flex;
    flex: 1;
    justify-content: flex-end;
    gap: 12px;
    list-style: none;

    a {
      text-decoration: none;
      color: inherit;
    }
  }
}
</style>