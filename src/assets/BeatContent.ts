export const Categories = ["Puzzle", "Narrative", "Execution", "Action"] as const;
export type Category = typeof Categories[number];

export class BeatContent {
    // TODO: id?
    description: string
    category: Category
    intensity: number
    introducedSkills: string[]
    reinforcedSkills: string[]
    requiredSkills: string[]

    constructor(description: string, category: Category, intensity: number, introducedSkills: string[], reinforcedSkills: string[], requiredSkills: string[]) {
        this.description = description
        this.category = category
        this.intensity = intensity
        this.introducedSkills = introducedSkills
        this.reinforcedSkills = reinforcedSkills
        this.requiredSkills = requiredSkills
    }
}