import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useDialogStore = defineStore('dialog', () => {
  const showVariableDialog = ref(false)
  return { showVariableDialog }
})
