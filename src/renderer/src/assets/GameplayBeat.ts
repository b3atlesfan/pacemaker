import {XYPosition} from "@vue-flow/core";

export class GameplayBeat {
  store: string
  type: string

  id: string
  label: string
  data: {contentId: number, isInBackground: boolean, isRecordingNode: boolean, runsList: number[]}
  position: XYPosition

  constructor(id: string, label: string, contentId: number, position: XYPosition, isRecordingNode: boolean = false, runsList: number[] = []) {
    //super();
    this.store = "elements"
    this.type = "gameplay-beat"

    this.id = id
    this.label = label
    this.data = {contentId: contentId, isInBackground: false, isRecordingNode: isRecordingNode, runsList: runsList}
    this.position = position
  }
}
