import {storeToRefs} from "pinia";
import {IdManager} from "@/assets/IdManager";
import {useContentsStore} from "@/store/contents";
import {BeatContent, Category, Skill} from "@/assets/BeatContent";
import {BeatManager} from "@/assets/BeatManager";

export type ContentFormState = {
  name: string,
  intensity: number,
  category: Category,
  playtime: string,
  introducedSkills: [],
  reinforcedSkills: [],
  requiredSkills: [],
}

export class BeatContentManager {
  static instance: BeatContentManager
  idManager: IdManager
  //const { onPaneReady, onNodeDragStop, onConnect, addEdges, setTransform, toObject, nodeTypes, addNodes, getNodes, removeNodes } = useVueFlow()
  contentsStore

  constructor() {
    this.contentsStore = storeToRefs(useContentsStore())
    this.idManager = new IdManager()

    this.contentsStore.contents.value.forEach(content => {
      this.idManager.takeId(content.id)
    })
  }

  public static getInstance(): BeatContentManager {
    if (!BeatContentManager.instance) {
      BeatContentManager.instance = new BeatContentManager()
    }

    return BeatContentManager.instance
  }

  createContent(contentFormInput: Object) {
    const input = contentFormInput as ContentFormState

    const id = this.idManager.getId()
    const content = new BeatContent(id, input.name, input.category, input.intensity, input.playtime, input.introducedSkills, input.reinforcedSkills, input.requiredSkills)

    this.contentsStore.contents.value.push(content)
    /*
    const content = new BeatContent("mr cool 2.0", "Puzzle", 20, ["Jump"], ["Dash"], ["Enqueue", "Dequeue"])
    const id = this.idManager.getId()
    const beat = new GameplayBeat('' + id, 'Beat ' + id, content, this.vueFlowStore.project(pos))

    this.elements.elements.value.push(beat)
    */
  }

  deleteContent(id: number) {
    const index = this.contentsStore.contents.value.findIndex(x => x.id == id)
    if (index > -1) {
      this.contentsStore.contents.value.splice(index, 1)
      this.idManager.returnId(id)
      BeatManager.getInstance().onDeleteContent(id)
    }
  }

  getContent(id: number): BeatContent {
    //console.log("it is now called")
    const result = this.contentsStore.contents.value.find(x => x.id == id) as BeatContent
    //console.log("result is " + result)
    return result
  }

  editNodeLabel(id: string, label: string) {
    /*
    this.elements.elements.value.forEach(elem => console.log("elem id is " + elem.id))

    let currentNode = this.elements.elements.value.find(elem => elem.id == id)

    if (currentNode == undefined) return

    (currentNode as GameplayBeat).label = label

     */

  }
}
