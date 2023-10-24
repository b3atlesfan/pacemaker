<script setup lang="ts">
import {ref} from "vue";

const emit = defineEmits(['onSubmit', 'onDelete'])

const props = defineProps<{
  values: string[],
  header: string,
}>()

const selection = ref(null)

const newValue = ref("")

function onSubmit() {
  if (newValue.value == "") return

  emit('onSubmit', newValue.value)
  newValue.value = ""
}

function onDelete() {
  emit('onDelete', selection.value)
}

</script>

<template>
  <v-card :subtitle="props.header">
    <v-card-text>
      <v-chip-group v-model="selection">
        <v-chip v-for="option in props.values" >{{option}}</v-chip>
      </v-chip-group>

      <v-text-field
        v-model="newValue"
        label="Add new Option"
        @keydown.enter="onSubmit"
      >

      </v-text-field>
    </v-card-text>

    <v-card-actions>
      <v-btn @click="onSubmit" color="secondary">Submit</v-btn>
      <v-spacer></v-spacer>
      <v-btn @click="onDelete" icon="mdi-delete"></v-btn>
    </v-card-actions>

  </v-card>
</template>

<style scoped>

</style>
