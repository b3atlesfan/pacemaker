<script setup>
import {Handle, Position} from "@vue-flow/core";

const props = defineProps({
  id: {
    type: String,
    required: true,
  },
  data: {
    type: Number,
    required: true,
  },
  label: {
    type: String,
    required: false,
  },
})

</script>

<template>
  <div class="container">

    <div class="edit-btn">
      <v-btn icon="$vuetify"></v-btn>
    </div>

    <div class="basic-stats-label">
      Name:
    </div>
    <div class="basic-stats">
      {{ props.label }}
    </div>

    <div class="general-stats-label">
      General:
    </div>
    <div class="general-stats">
      Type: Puzzle, Action, Narrative, ...
    </div>

    <div class="desired-stats-label">
      Desired:
    </div>
    <div class="desired-stats">
      Intensity: {{ props.data }}
    </div>

    <div class="current-stats">
      Current:
    </div>

    <Handle id="a_in" type="target" :position="Position.Left"  />
    <Handle id="a_out" type="source" :position="Position.Right" />
  </div>
</template>

<style scoped>

.container {
  display: grid;
  grid-template-columns: auto auto auto;
  column-gap: 10px;
  row-gap: 10px;
  grid-template-rows: auto auto auto auto;
}

.edit-btn {
  grid-column-start: 3;
  grid-row-start: 1;
  justify-self: end;
}

.basic-stats-label {
  grid-column-start: 1;
  grid-row-start: 1;
  justify-self: center;
  align-self: center;
}
.basic-stats {
  grid-column-start: 2;
  grid-row-start: 1;
  justify-self: center;
  align-self: center;
}

.general-stats-label {
  grid-column-start: 1;
  grid-row-start: 2;
  justify-self: center;
}
.general-stats {
  grid-column-start: 2;
  grid-column-end: 4;
  grid-row-start: 2;
  justify-self: center;
}

.desired-stats-label {
  grid-column-start: 1;
  grid-row-start: 3;
  justify-self: center;
}
.desired-stats {
  grid-column-start: 2;
  grid-row-start: 3;
  justify-self: center;
}

.current-stats {
  grid-column-start: 1;
  grid-row-start: 4;
  justify-self: center;
}

</style>