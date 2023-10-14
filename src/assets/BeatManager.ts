import {isNode, MaybeElement, useVueFlow, VueFlowStore} from "@vue-flow/core";
import {GameplayBeat} from "@/assets/GameplayBeat";
import {BeatContent} from "@/assets/BeatContent";
import {storeToRefs} from "pinia";
import {useElementsStore} from "@/stores/elements";
import {IdManager} from "@/assets/IdManager";

export class BeatManager {
    idManager: IdManager
    vueFlowStore: VueFlowStore
    elements
    //const { onPaneReady, onNodeDragStop, onConnect, addEdges, setTransform, toObject, nodeTypes, addNodes, getNodes, removeNodes } = useVueFlow()

    static instance: BeatManager

    public static getInstance(): BeatManager {
        if (!BeatManager.instance) {
            BeatManager.instance = new BeatManager()
        }

        return BeatManager.instance
    }

    constructor() {
        this.vueFlowStore = useVueFlow()
        this.elements = storeToRefs(useElementsStore())
        this.idManager = new IdManager()

        this.elements.elements.value.forEach(elem => {
            if (isNode(elem as MaybeElement)) this.idManager.takeId(parseInt(elem.id))
        })
    }

    createNode(pos: {x: number, y: number}) {
        const content = new BeatContent("mr cool 2.0", "Puzzle", 20, ["Jump"], ["Dash"], ["Enqueue", "Dequeue"])
        const id = this.idManager.getId()
        const beat = new GameplayBeat('' + id, 'Beat ' + id, content, this.vueFlowStore.project(pos))

        this.elements.elements.value.push(beat)

    }

    deleteNode(id: string) {
        this.vueFlowStore.removeNodes(id)
        this.idManager.returnId(parseInt(id))
        //this.elements.elements.value
    }

    editNodeLabel(id: string, label: string) {
        this.elements.elements.value.forEach(elem => console.log("elem id is " + elem.id))

        let currentNode = this.elements.elements.value.find(elem => elem.id == id)

        if (currentNode == undefined) return

        (currentNode as GameplayBeat).label = label
    }
}