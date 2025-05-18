<template>
  <v-dialog v-model="dialog" max-width="500">
    <v-card>
      <v-card-title>Enter Variable Name</v-card-title>
      <v-card-text>
        <v-form @submit.prevent="submit">
          <v-text-field
            v-model="variableName"
            label="Variable Name"
            required
          ></v-text-field>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="primary" type="submit">Submit</v-btn>
            <v-btn text @click="close">Cancel</v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script setup>
import { ref } from 'vue'

const dialog = ref(false)
const variableName = ref('')
const emit = defineEmits(['submitted'])


// Expose methods to parent
function open() {
  dialog.value = true
}

function close() {
  dialog.value = false
}


function submit() {
    emit('submitted', variableName.value)
    close()
}


defineExpose({ open })
</script>
