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

    returnId(id: number) {
        console.log("return id " + id)
        this.idIsTaken[id] = false

        console.log("current id" + this.id)

        if (id < this.id) {
            console.log("is smaller")
            this.id = id
        }
    }

    takeId(id: number) {
        this.idIsTaken[id] = false
        this._findNextId()
    }
}