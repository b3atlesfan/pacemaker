export class GameplayBeat {
    id
    type
    label
    data
    position

    constructor(id, label, data, position) {
        //super();
        this.id = id
        this.type = 'gameplay-beat'
        this.label = label
        this.data = data
        this.position = position
    }
}