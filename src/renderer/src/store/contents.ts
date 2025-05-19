import { defineStore } from "pinia";
import { BeatContent } from "@/assets/BeatContent";

export const useContentsStore = defineStore("contents", {
    state: () => {
        return {
            contents: <BeatContent[]>[]
        }
    },
    persist: {
        afterRestore: (ctx) => {
          if(!ctx.store.contents.map){
            ctx.store.contents = []
          }
          ctx.store.contents = ctx.store.contents.map(content => {
                var ret = new BeatContent(
                    content.id,
                    content.name || "",
                    content.narrativeIntensity,
                    content.category,
                    content.intensity,
                    content.rawVariables,
                    content.playtime || "",
                    content.introducedSkills || [],
                    content.reinforcedSkills || [],
                    content.requiredSkills || [],
                    content.runsList,
                    content.beatColumn
                );
                return ret;
            }
          );
        }
    }
})
