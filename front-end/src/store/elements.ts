import { defineStore } from "pinia";

type elementType = { id: string }

export const useElementsStore = defineStore("elements", {
    state: () => {
        return {
            elements: <elementType[]>[]
        }
    },
    persist: true,
})