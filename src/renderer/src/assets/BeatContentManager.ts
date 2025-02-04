import {storeToRefs} from "pinia";
import {IdManager} from "@/assets/IdManager";
import {useContentsStore} from "@/store/contents";
import {BeatContent, Category, Skill} from "@/assets/BeatContent";
import {BeatManager} from "@/assets/BeatManager";

export type ContentFormState = {
  overridingContentWithId: number,
  name: string,
  intensity: number,
  narrativeIntensity: number,
  category: Category,
  playtime: string,
  introducedSkills: string[],
  reinforcedSkills: string[],
  requiredSkills: string[],
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

  getContent(id: number): BeatContent {
    //console.log("it is now called")
    const result = this.contentsStore.contents.value.find(x => x.id == id) as BeatContent
    //console.log("result is " + result)
    return result
  }
  createContent(contentFormInput: Object) : number{
    const input = contentFormInput as ContentFormState

    var id : number = input.overridingBeatContent
    if(id == undefined || id == -1){
      id = this.idManager.getId()
      const content = new BeatContent(id, input.name, input.narrativeIntensity, input.category, input.intensity, input.playtime, input.introducedSkills, input.reinforcedSkills, input.requiredSkills)

      this.contentsStore.contents.value.push(content)
      return id;
    }
    const content : BeatContent = this.getContent(id)
    content.description = input.name
    content.intensity = input.intensity
    content.narrativeIntensity = input.narrativeIntensity
    content.category = input.category
    content.playtime = input.playtime
    content.introducedSkills = input.introducedSkills
    content.reinforcedSkills = input.reinforcedSkills
    content.requiredSkills = input.requiredSkills

    return id;
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

  deleteAllContents() {
    for(let i = this.contentsStore.contents.value.length - 1; i >= 0; i--) {
      this.deleteContent(this.contentsStore.contents.value[i].id)
    }
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
