import {XYPosition} from "@vue-flow/core";

export class GameplayBeat {
    store: string
    type: string

    id: string
    label: string
    data: number
    position: XYPosition

    constructor(id: string, label: string, contentId: number, position: XYPosition) {
        //super();
        this.store = "elements"
        this.type = "gameplay-beat"

        this.id = id
        this.label = label
        this.data = contentId
        this.position = position
    }
}
