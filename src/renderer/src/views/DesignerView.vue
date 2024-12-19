<script setup lang="ts">
import {reactive, ref, shallowRef, watchEffect} from "vue";


const  model_localValue = reactive({id: 0, name: 'VariableName1', remoteValue: 'None Fetched', localValue: 'Default Value'});
const  model2 = reactive({id: 1, name: 'VariableName2', remoteValue: 'None Fetched', localValue: 'Default Value'});

const currentState = reactive({
  outputPath: "C:/git-projects/Unity/KartTemplate_MasterThesis/Assets/Plugins/pacemaker-for-unity/Temporary/designerVarsFromPacemaker.json",
  allVariables: [model_localValue, model2, reactive({id: 2, name: 'VariableName', remoteValue: 'None Fetched', localValue: 'Default Value'})],
  random2: "hi"
});

function addRow(){
  const next_id : number = currentState.allVariables.length;
  const  temp_model = reactive({id: next_id, name: 'VariableName', remoteValue: 'None Fetched', localValue: 'Default Value'});
  currentState.allVariables.push(temp_model);
}

function send(index: number){
  console.log("Sending... " + index);
  sendString("Sending... " + index);
}

const sendString = async (message: string) => {
  const response = await window.versions.sendString(message)
  console.log(response) 
}

const sendAllVars = async () => {
  const result: Record<string, string> = {};

  currentState.allVariables.forEach(element => {
      if (typeof element === 'object' && element !== null) {
          // Check if element has 'name' and 'localValue' properties
          const { name, localValue } = element;
          if (name && localValue) {
              result[name] = localValue;
          }
      }
  });


  const allVarsJsonFile = JSON.stringify(result, null, 2);
  const response = await window.versions.sendFile(allVarsJsonFile, currentState.outputPath)
  console.log(response) 
}

</script>
<template>
  <h1>Designer View</h1>
  <v-spacer></v-spacer>
  <v-btn @click="sendAllVars"> Send All </v-btn>
  <v-btn> Fetch Changes </v-btn>
  <p>This is the designer view, here you can sync design variables with the game engine.</p>

  <v-btn @click="addRow">Create Variable</v-btn>

  <v-text-field
    v-model="currentState.outputPath"
    label="Output Path"
    placeholder="Enter the output path for all variables"
  ></v-text-field>

  <v-app>
    <v-container>
      <v-row>
      <div v-for="(row, index) in currentState.allVariables" :key="currentState.allVariables.id">
        <v-col>
          <v-confirm-edit cancel-text="Cancel" ok-text="Send" v-model="currentState.allVariables[index].localValue"
          @save="send(index)">
            <template v-slot:default="{ model: theModel, actions }">
              <v-card width="320" >
                <template v-slot:text>
                  <v-text-field
                    v-model="currentState.allVariables[index].name"
                    :messages="`${currentState.allVariables[index].name}`"
                  ></v-text-field>
                  <v-text-field
                    v-model="theModel.value"
                    :messages="`${currentState.allVariables[index].remoteValue}`"
                  ></v-text-field>
                </template>

                <template v-slot:actions>
                  <v-spacer></v-spacer>

                  <component :is="actions"></component>
                </template>
              </v-card>
            </template>
          </v-confirm-edit>

        </v-col>
      </div>
      </v-row>
    </v-container>
  </v-app>
</template>



