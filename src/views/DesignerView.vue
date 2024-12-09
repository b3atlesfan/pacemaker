<script setup lang="ts">
import {reactive, ref, shallowRef, watchEffect} from "vue";


const  model_localValue = reactive({id: 0, name: 'VariableName1', remoteValue: 'None Fetched', localValue: 'Default Value'});
const  model2 = reactive({id: 1, name: 'VariableName2', remoteValue: 'None Fetched', localValue: 'Default Value'});

const currentState = reactive({
  random: "hi1",
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
}

</script>
<template>
  <h1>Designer View</h1>
  <v-btn> Save All </v-btn>
  <v-btn> Fetch Changes </v-btn>
  <p>This is the designer view...</p>

  <p class="tip">
    Tip...
  </p>

  <v-btn @click="addRow">Create Variable</v-btn>

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



