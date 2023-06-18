<script setup>
import {GameplayBeat} from "@/assets/GameplayBeat";
import {Handle, Position} from "@vue-flow/core";
import {computed} from "vue";

const props = defineProps({
  id: {
    type: Object,
    required: true,
  },
  data: {
    type: Object,
    required: true,
  },
  label: {
    type: Object,
    required: false,
  },
  beat: {
    type: GameplayBeat,
    required: true,
  }
})

</script>

<template>
  <div class="gameplay-beat-node">
    <ul>
      <li>{{ props.label }}</li>
      <li>Difficulty is {{ props.data }} / 10</li>
    </ul>
  </div>
  <Handle id="a_in" type="target" :position="Position.Right" class="gameplay-beat-handle"/>
  <Handle id="a_out" type="source" :position="Position.Right" class="gameplay-beat-handle"/>
  <Handle id="b" type="source" :position="Position.Top" class="gameplay-beat-handle"/>
  <Handle id="c" type="source" :position="Position.Bottom" class="gameplay-beat-handle"/>
  <Handle id="d" type="source" :position="Position.Left" class="gameplay-beat-handle"/>
</template>

<style scoped>
.gameplay-beat-node {
  background: #9CA8B3;
  color: #fff;
  padding: 10px;
}

.gameplay-beat-handle {

}
</style>