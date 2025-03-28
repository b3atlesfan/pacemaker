import { is, valueToNode } from '@babel/types';
import { defineStore } from 'pinia'

export class DesignVariable {
  id: number;
  name: string;
  remoteValue: number | null;
  localValue: number;
  path: string;
  detailedView: boolean;
  markedFavorite: boolean;
  isPublic: boolean;
  private intensityWeight: number;
  private narrativeWeight: number;
  isMultiplier: boolean;
  requestedFromPM: boolean;
  runtimeModified: boolean;

  constructor(
    id: number,
    name: string,
    remoteValue: number | null,
    localValue: number,
    path: string,
    detailedView: boolean,
    markedFavorite: boolean,
    isPublic: boolean,
    intensityWeight: number,
    narrativeWeight: number,
    isMultiplier: boolean,
    requestedFromPM: boolean,
    runtimeModified: boolean = false
  ) {
    this.id = id;
    this.name = name;
    this.remoteValue = remoteValue;
    this.localValue = localValue;
    this.path = path;
    this.detailedView = detailedView;
    this.markedFavorite = markedFavorite;
    this.isPublic = isPublic;
    this.intensityWeight = intensityWeight;
    this.narrativeWeight = narrativeWeight;
    this.isMultiplier = isMultiplier;
    this.requestedFromPM = requestedFromPM;
    this.runtimeModified = runtimeModified;
  }

  getWeight(type: string): number {
    if(type === 'narrative') {
      return this.narrativeWeight;
    }
    else if (type === 'gameplay') {
      return this.intensityWeight;
    }
    throw new Error('Invalid type');
  }

  getIntensityWeight(): number {
    return this.intensityWeight;
  }

  getNarrativeWeight(): number {
    return this.narrativeWeight;
  }
}

export const useDesignVariablesStore = defineStore('designVariablesStore',  {
  state: () => ({
    allVariables: [] as DesignVariable[],
  }),
  actions: {
    addVariable(variable){
      if(variable instanceof DesignVariable) {
        this.allVariables.push(variable);
        return;
      }

      const newVar = new DesignVariable(
        variable.id,
        variable.name,
        variable.remoteValue,
        variable.localValue,
        variable.path,
        variable.detailedView,
        variable.markedFavorite,
        variable.isPublic,
        variable.intensityWeight,
        variable.narrativeWeight,
        variable.isMultiplier,
        variable.requestedFromPM,
        variable.runtimeModified
      );
      this.allVariables.push(newVar);
    },

    deleteVariable(index: number) {
      this.allVariables.splice(index, 1);
      this.allVariables.forEach((element, index) => {
        element.id = index;
      });
    },
    applyVariable(index: number) {
      const current = this.allVariables[index];
      if (current.remoteValue === null) {
        this.deleteVariable(index);
        return;
      }
      this.allVariables[index].localValue = this.allVariables[index].remoteValue;
    },
    applyAllVariables() {
      for (let i = this.allVariables.length - 1; i >= 0; i--) {
        this.applyVariable(i);
      }
    },
    deleteAllVariables() {
      this.allVariables = [];
    },
    updateVariables(variables: DesignVariable[]) {
      this.allVariables = variables;
    },
    getWeight(index: number, type: string) {
      if(type === 'narrative') {
        return this.allVariables[index].getNarrativeWeight();
      }
      else if (type === 'gameplay') {
        return this.allVariables[index].getIntensityWeight();
      }
      throw new Error('Invalid type');
    },
    getNarrativeWeight(index: number) {
      return this.allVariables[index].getNarrativeWeight();
    },
    getVariable(name: string) : DesignVariable | undefined {
        const match = this.allVariables.find((element) => element.name === name);
       
        if (match && !(match instanceof DesignVariable)) {
          const newVar : DesignVariable = new DesignVariable(
            match.id,
            match.name,
            match.remoteValue,
            match.localValue,
            match.path,
            match.detailedView,
            match.markedFavorite,
            match.isPublic,
            match.intensityWeight,
            match.narrativeWeight,
            match.isMultiplier,
            match.requestedFromPM,
            match.runtimeModified
          );
          this.allVariables[this.allVariables.indexOf(match)] = newVar;
          return newVar;
        }
        return match;
    }
  },
  persist: {
    afterRestore: (ctx) => {
      ctx.store.allVariables = ctx.store.allVariables.map(variable => new DesignVariable(
        variable.id,
        variable.name,
        variable.remoteValue,
        variable.localValue,
        variable.path,
        variable.detailedView,
        variable.markedFavorite,
        variable.isPublic,
        variable.intensityWeight,
        variable.narrativeWeight,
        variable.isMultiplier,
        variable.requestedFromPM,
        variable.runtimeModified
      ));
    }
  }
})