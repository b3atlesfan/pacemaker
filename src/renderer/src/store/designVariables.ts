import { defineStore } from 'pinia'

type DesignVariable = {
    id: number;
    name: string;
    remoteValue: number | null;
    localValue: number;
    path: string;
    detailedView: boolean;
    markedFavorite: boolean;
    isPublic: boolean;
    intensityWeight: number;
    requestedFromPM: boolean;
  };

export const useDesignVariablesStore = defineStore('designVariables', {
  state: () => ({
    allVariables: [] as DesignVariable[],
  }),
  actions: {
    addVariable(variable: VariableType) {
      this.allVariables.push(variable);
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
    updateVariables(variables: VariableType[]) {
      this.allVariables = variables;
    },
    getWeight(index: number) {
        return this.allVariables[index].intensityWeight;
    },
    getVariable(name: string) : VariableType {
        return this.allVariables.find((element) => element.name === name);
    }
  },
  persist: true,
})