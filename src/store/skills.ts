import { defineStore } from "pinia";

export const useSkillStore = defineStore("skills", {
  state: () => {
    return {
      skills: [] as string[]
    }
  },
  persist: true,
})
