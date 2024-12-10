import { defineStore } from "pinia";
import { BeatContent } from "@/assets/BeatContent";

export const useContentsStore = defineStore("contents", {
    state: () => {
        return {
            contents: <BeatContent[]>[]
        }
    },
    persist: true,
})
