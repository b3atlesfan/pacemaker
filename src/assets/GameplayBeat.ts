import {BeatContent} from "@/assets/BeatContent";

export class GameplayBeat {
    store: string
    type: string
    id: string
    label: string
    content: BeatContent
    position

    constructor(id: string, label: string, content: BeatContent, position) {
        //super();
        this.store = "elements"
        this.type = "gameplay-beat"

        this.id = id
        this.label = label
        this.content = content
        this.position = position
    }
}