<script setup lang="ts">
import {ref} from "vue";
import {Categories, Category, Skills, Skill} from "@/assets/BeatContent";

const emit = defineEmits(['onCreateContent'])

const description = ref("")

const dialog = ref(false)

const slider = ref(0)
const min = ref(0)
const max = ref(100)

const possibleCategories = ref(Categories)
const categories = ref("" as Category)

const possibleSkills = ref(Skills)
const introducedSkills = ref([] as Skill[])
const reinforcedSkills = ref([] as Skill[])
const requiredSkills = ref([] as Skill[])


function onSaveClicked() {
  emit('onCreateContent', description.value, categories.value, slider.value, introducedSkills.value, reinforcedSkills.value, requiredSkills.value)
  resetValues()
}

function resetValues() {
  description.value = ""

  dialog.value = false

  slider.value = 0

  categories.value = "" as Category

  introducedSkills.value = [] as Skill[]
  reinforcedSkills.value = [] as Skill[]
  requiredSkills.value = [] as Skill[]
}

</script>

<template>
  <v-btn @click="dialog = true">Create</v-btn>

  <v-dialog v-model="dialog" width="500px">
    <v-card>
      <v-card-title>Create content</v-card-title>

      <v-container>
        <v-row align="center" no-gutters>
          <v-col>Description:</v-col>
          <v-col>
            <v-text-field v-model="description" label="Description"></v-text-field>
          </v-col>
        </v-row>

        <v-row align="center" no-gutters>
          <v-col>Intensity:</v-col>
          <v-col>
            <v-slider
                v-model="slider"
                class="align-center"
                :max="max"
                :min="min"
                hide-details
            >
              <template v-slot:append>
                <v-text-field
                    v-model="slider"
                    hide-details
                    single-line
                    density="compact"
                    type="number"
                    style="width: 90px"
                ></v-text-field>
              </template>
            </v-slider>
          </v-col>
        </v-row>

        <v-row align="center" no-gutters>
          <v-col>Type:</v-col>
          <v-col>
            <v-select
                v-model="categories"
                :items="possibleCategories"
                label="Types"
                chips
            ></v-select>
          </v-col>
        </v-row>

        <v-row align="center" no-gutters>
          <v-col>Introduces:</v-col>
          <v-col>
            <v-select
                v-model="introducedSkills"
                :items="possibleSkills"
                label="Skills"
                multiple
                chips
            ></v-select>
          </v-col>
        </v-row>

        <v-row align="center" no-gutters>
          <v-col>Reinforces:</v-col>
          <v-col>
            <v-select
                v-model="reinforcedSkills"
                :items="possibleSkills"
                label="Skills"
                multiple
                chips
            ></v-select>
          </v-col>
        </v-row>

        <v-row align="center" no-gutters>
          <v-col>Requires:</v-col>
          <v-col>
            <v-select
                v-model="requiredSkills"
                :items="possibleSkills"
                label="Skills"
                multiple
                chips
            ></v-select>
          </v-col>
        </v-row>
      </v-container>

      <v-card-actions>
        <v-btn color="secondary" @click="dialog = false">Exit</v-btn>
        <v-btn color="primary" @click="onSaveClicked()">Save</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<style scoped>

</style>
