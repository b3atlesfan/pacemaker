import {computed} from "vue";
import {useSkillStore} from "@/store/skills";
import {useCategoryStore} from "@/store/categories";

const categoryStore = useCategoryStore()
const predefinedCategories = ["Puzzle", "Narrative", "Execution", "Action"] as const;
export const Categories = computed(() => categoryStore.categories.concat(predefinedCategories))
export type Category = typeof Categories[number];
export function deleteCategory(index: number) {
  if (index >= categoryStore.categories.length) return

  categoryStore.categories.splice(index, 1)
}

export function addCategory(category: string) {
  categoryStore.categories.push(category)
}


const skillStore = useSkillStore()
const predefinedSkills = ["Jump", "Dash", "Platform", "Enqueue"] as const;
export const Skills = computed(() => skillStore.skills.concat(predefinedSkills))
export type Skill = typeof Skills[number];
export function deleteSkill(index: number) {
  if (index >= skillStore.skills.length) return

  skillStore.skills.splice(index, 1)
}

export function addSkill(skill: string) {
  skillStore.skills.push(skill)
}

export class BeatContent {
  id: number
  description: string
  category: Category
  intensity: number
  expectedPlaytime: number
  introducedSkills: string[]
  reinforcedSkills: string[]
  requiredSkills: string[]

  constructor(id: number, description: string, category: Category, intensity: number, expectedPlaytime: number, introducedSkills: string[], reinforcedSkills: string[], requiredSkills: string[]) {
    this.id = id
    this.description = description
    this.category = category
    this.intensity = intensity
    this.expectedPlaytime = expectedPlaytime
    this.introducedSkills = introducedSkills
    this.reinforcedSkills = reinforcedSkills
    this.requiredSkills = requiredSkills
  }
}
