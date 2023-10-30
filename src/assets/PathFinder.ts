import {VueFlowStore} from "@vue-flow/core";

class DijkstraNode {
  id: number
  cost: number
  prev: DijkstraNode | null

  constructor(id: number, cost: number = 0, prev: DijkstraNode | null = null) {
    this.id = id
    this.cost = cost
    this.prev = prev
  }
}

export function computePath(selectedPathBeats: { id: string, }[], vue: VueFlowStore): number[] {
  const path: number[] = []

  if (selectedPathBeats.length == 0) {
    //console.log("length is 0")
    return path
  }

  if (selectedPathBeats.length == 1) {
    //console.log("length is 1")
    path.push(parseInt(selectedPathBeats[0].id))
    return path
  }

  const nodesToVisit: DijkstraNode[] = []

  const startNode = new DijkstraNode(parseInt(selectedPathBeats[0].id), 0)
  nodesToVisit.push(startNode)

  let result: DijkstraNode = startNode

  let index = 1
  let targetId = parseInt(selectedPathBeats[index].id)

  let rounds = 0
  while (nodesToVisit.length != 0 && rounds < 100) {

    nodesToVisit.sort((first, second) => first.cost < second.cost ? 1 : -1)

    const current = nodesToVisit.pop()

    if (current == undefined) break

    if (current.id == targetId) {
      index++
      if (index >= selectedPathBeats.length) {
        result = current
        break
      } else {
        nodesToVisit.splice(0, nodesToVisit.length)
        targetId = parseInt(selectedPathBeats[index].id)
      }
    }

    const currentOutGoers = vue.getOutgoers(current.id.toString())

    currentOutGoers.forEach(outGoer => {

      const index = nodesToVisit.findIndex(node => node.id == parseInt(outGoer.id))

      if (index == -1) {
        nodesToVisit.push(new DijkstraNode(parseInt(outGoer.id), current.cost + 1, current))
      } else if (nodesToVisit[index].cost > current.cost + 1) {
        nodesToVisit[index].cost = current.cost + 1
        nodesToVisit[index].prev = current
      }
    })

    rounds++
  }

  while (result.prev != null) {
    path.push(result.id)
    result = result.prev
  }

  path.push(result.id)

  path.reverse()

  return path
}
