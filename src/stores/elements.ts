import { defineStore } from "pinia";
import {GameplayBeat} from "@/assets/GameplayBeat";

type elementType = { id: string }

export const useElementsStore = defineStore("elements", {
    state: () => {
        return {
            elements: <elementType[]>[]
        }
    },
    persist: true,
})