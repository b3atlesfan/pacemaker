import { defineStore } from "pinia";

export const useCategoryStore = defineStore("categories", {
  state: () => {
    return {
      categories: [] as string[]
    }
  },
  persist: true,
})
