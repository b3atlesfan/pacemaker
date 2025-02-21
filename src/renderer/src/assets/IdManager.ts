export class IdManager {
    id: number
    idIsTaken: boolean[]

    constructor() {
        this.id = 0
        this.idIsTaken = new Array(512).fill(false)
    }

    _findNextId() {
        for (let i = this.id; i < 512; i++) {
            if (this.idIsTaken[i]) continue

            this.id = i
            break
        }
    }

    getId() {
        const currentFreeId = this.id
        this.idIsTaken[this.id] = true

        this._findNextId()

        return currentFreeId
    }

    getLatestId() {
        return this.id - 1
    }

    returnId(id: number) {
        this.idIsTaken[id] = false

        if (id < this.id) {
            console.log("is smaller")
            this.id = id
        }
    }

    takeId(id: number) {
        this.idIsTaken[id] = true
        this._findNextId()
    }
}