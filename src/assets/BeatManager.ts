import {isNode, MaybeElement, useVueFlow, VueFlowStore} from "@vue-flow/core";
import {GameplayBeat} from "@/assets/GameplayBeat";
import {BeatContent} from "@/assets/BeatContent";
import {storeToRefs} from "pinia";
import {useElementsStore} from "@/store/elements";
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
        const id = this.idManager.getId()
        const beat = new GameplayBeat('' + id, 'Beat ' + id, -1, pos)

        this.elements.elements.value.push(beat)

    }

    deleteNode(id: string) {
        this.vueFlowStore.removeNodes(id)
        this.idManager.returnId(parseInt(id))
        //this.elements.elements.value
    }

    getNode(id: string) {
      return this.elements.elements.value.find(elem => elem.id == id) as GameplayBeat
    }

    editNodeLabel(id: string, label: string) {
        this.elements.elements.value.forEach(elem => console.log("elem id is " + elem.id))

        let currentNode = this.elements.elements.value.find(elem => elem.id == id)

        if (currentNode == undefined) return

        (currentNode as GameplayBeat).label = label
    }

    editContentId(beatId: string, contentId: number) {
        let currentNode = this.elements.elements.value.find(elem => elem.id == beatId)

        if (currentNode == undefined) return

        (currentNode as GameplayBeat).data = contentId
    }

    onDeleteContent(contentId: number) {
        this.elements.elements.value.forEach(elem => {
            if (!isNode(elem as MaybeElement)) return

            let currentNode = (elem as GameplayBeat)

            if (currentNode.data != contentId) return

            currentNode.data = -1
        })
    }

    getSelectedBeat() : GameplayBeat {
      let beat = this.elements.elements.value.find(elem => elem.selected)

      return beat as GameplayBeat
    }
}
