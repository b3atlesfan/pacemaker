<script setup lang="ts">
import {ref} from "vue";
import {Categories, Category, Skills, Skill} from "@/assets/BeatContent";
import ContentCreationForm from "@/components/ContentCreationForm.vue";

const props = defineProps({
  dialog: {
    type: Boolean,
    required: true,
  }
})

const emit = defineEmits(['onCreateContent'])

const description = ref("")

const slider = ref(0)
const playtime = ref('')
const min = ref(0)
const max = ref(100)

const possibleCategories = ref(Categories)
const categories = ref("" as Category)

const possibleSkills = ref(Skills)
const introducedSkills = ref([] as Skill[])
const reinforcedSkills = ref([] as Skill[])
const requiredSkills = ref([] as Skill[])


function onSaveClicked() {
  emit('onCreateContent', description.value, categories.value, slider.value, playtime.value, introducedSkills.value, reinforcedSkills.value, requiredSkills.value)
  resetValues()
}

function resetValues() {
  description.value = ""

  slider.value = 0

  categories.value = "" as Category

  introducedSkills.value = [] as Skill[]
  reinforcedSkills.value = [] as Skill[]
  requiredSkills.value = [] as Skill[]
}

</script>

<template>
    <v-dialog v-model="props.dialog" width="1024px" persistent>
    <ContentCreationForm></ContentCreationForm>
    <!--
    <v-card title="Create Content">

      <v-card-text>
        <v-container>
          <v-row align="center" no-gutters>
            <v-col cols="6">
              <v-text-field v-model="description" label="Name*" autofocus></v-text-field>
            </v-col>
          </v-row>

          <v-row align="center" no-gutters>
            <v-col cols="6">
              <v-slider
                v-model="slider"
                class="align-center"
                :max="max"
                :min="min"
                :step="1"
                hide-details
              >
                <template v-slot:append>
                  <v-text-field
                    v-model="slider"
                    label="Intensity*"
                    style="width: 90px"
                    readonly
                  ></v-text-field>
                </template>
              </v-slider>
            </v-col>

            <v-col>
              <v-select
                v-model="categories"
                :items="possibleCategories"
                label="Type*"
                chips
              ></v-select>
            </v-col>
          </v-row>

          <v-row align="center">
            <v-col cols="6">
              <v-text-field
                v-model="playtime"
                min="00:30"
                max="10:00"
                label="Expected Playtime"
                type="time"
                suffix="min:s"
              ></v-text-field>
            </v-col>
          </v-row>

          <v-row align="center">
            <v-col cols="4">
              <v-select
                v-model="introducedSkills"
                :items="possibleSkills"
                label="Introduced Skills"
                multiple
                chips
              ></v-select>
            </v-col>

            <v-col cols="4">
              <v-select
                v-model="reinforcedSkills"
                :items="possibleSkills"
                label="Reinforced Skills"
                multiple
                chips
              ></v-select>
            </v-col>

            <v-col>
              <v-select
                v-model="requiredSkills"
                :items="possibleSkills"
                label="Required Skills"
                multiple
                chips
              ></v-select>
            </v-col>
          </v-row>

        </v-container>
      </v-card-text>

      <v-card-actions>
        <v-btn color="secondary" @click="dialog = false">Exit</v-btn>
        <v-btn color="primary" @click="onSaveClicked()">Save</v-btn>
      </v-card-actions>
    </v-card>
    -->
  </v-dialog>
</template>

<style scoped>

</style>
