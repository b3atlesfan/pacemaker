export const Categories = ["Puzzle", "Narrative", "Execution", "Action"] as const;
export type Category = typeof Categories[number];

export class BeatContent {
    // TODO: id?
    name: string
    category: Category
    intensity: number
    introducedSkills: string[]
    reinforcedSkills: string[]
    requiredSkills: string[]

    constructor(name: string, category: Category, intensity: number, introducedSkills: string[], reinforcedSkills: string[], requiredSkills: string[]) {
        this.name = name
        this.category = category
        this.intensity = intensity
        this.introducedSkills = introducedSkills
        this.reinforcedSkills = reinforcedSkills
        this.requiredSkills = requiredSkills
    }
}