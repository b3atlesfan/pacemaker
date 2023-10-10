import {useVueFlow, VueFlowStore} from "@vue-flow/core";
import {GameplayBeat} from "@/assets/GameplayBeat";
import {BeatContent} from "@/assets/BeatContent";
import {storeToRefs} from "pinia";
import {useElementsStore} from "@/stores/elements";

export class BeatManager {
    id: number
    vueFlowStore: VueFlowStore
    elements
    //const { onPaneReady, onNodeDragStop, onConnect, addEdges, setTransform, toObject, nodeTypes, addNodes, getNodes, removeNodes } = useVueFlow()

    constructor() {
        this.vueFlowStore = useVueFlow()
        this.id = 0
        this.elements = storeToRefs(useElementsStore())
    }

    createNode(label: string, pos: {x: number, y: number}) {
        const content = new BeatContent("mr cool 2.0", "Puzzle", 20, ["Jump"], ["Dash"], ["Enqueue", "Dequeue"])
        const beat = new GameplayBeat('' + this.id, label, content, this.vueFlowStore.project(pos))
        //this.vueFlowStore.addNodes(beat)
        this.elements.elements.value.push(beat)
        this.vueFlowStore.updateNodeInternals()
        console.log(this.vueFlowStore.getNodes.value)
        this.id++
    }

    deleteNode(id: string) {
        this.vueFlowStore.removeNodes(id)
    }

    editNodeLabel(id: string, label: string) {
        let currentNode = this.elements.elements.value.find(elem => elem.id == id)
        currentNode.label = label
    }
}