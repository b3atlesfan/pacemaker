export const Categories = ["Puzzle", "Narrative", "Execution", "Action"] as const;
export type Category = typeof Categories[number];

export const Skills = ["Jump", "Dash", "Platform", "Enqueue"] as const;
export type Skill = typeof Skills[number];

export class BeatContent {
    id: number
    description: string
    category: Category
    intensity: number
    introducedSkills: string[]
    reinforcedSkills: string[]
    requiredSkills: string[]

    constructor(id: number, description: string, category: Category, intensity: number, introducedSkills: string[], reinforcedSkills: string[], requiredSkills: string[]) {
        this.id = id
        this.description = description
        this.category = category
        this.intensity = intensity
        this.introducedSkills = introducedSkills
        this.reinforcedSkills = reinforcedSkills
        this.requiredSkills = requiredSkills
    }
}