import {BeatContent} from "@/assets/BeatContent";
import {XYPosition} from "@vue-flow/core";

export class GameplayBeat {
    store: string
    type: string
    id: string
    label: string
    data: BeatContent
    position: XYPosition

    constructor(id: string, label: string, data: BeatContent, position: XYPosition) {
        //super();
        this.store = "elements"
        this.type = "gameplay-beat"

        this.id = id
        this.label = label
        this.data = data
        this.position = position
    }
}