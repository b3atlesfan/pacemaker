<script setup lang="ts">
import {computed, reactive, ref} from 'vue'
import { useVuelidate } from '@vuelidate/core'
import { required, integer } from '@vuelidate/validators'
import {Categories, Skills} from "../assets/BeatContent";
import {ContentFormState} from "../assets/BeatContentManager";

const emit = defineEmits(['onSubmit', 'onExit'])

const props = defineProps<{
  dialog: boolean,
}>()

const initialState = {
  name: '',
  intensity: null,
  narrativeIntensity: null,
  category: null,
  playtime: '',
  introducedSkills: [],
  reinforcedSkills: [],
  requiredSkills: [],
}

const state = reactive({
  ...initialState
})

const computedIntensity = computed(() => {
  return state.intensity != null && state.narrativeIntensity != null ? (+state.intensity + +state.narrativeIntensity) / 2 : null
})

const rules = {
  name: { required },
  intensity: { required, integer },
  category: { required },
}

const v$ = useVuelidate(rules, state)

const min = 0
const max = 100

const possibleCategories = ref(Categories)
const possibleSkills = ref(Skills)

async function onSubmit() {
  const isValidated = await v$.value.$validate()

  if (!isValidated) return

  emit('onSubmit', state)
  onClear()
}

function onClear() {
  v$.value.$reset()

  for (const [key, value] of Object.entries(initialState)) {
    state[key] = value
  }
}

function onExit() {
  emit('onExit')
}

function thumbLabel(value: number) {
  if (value == min) return 'apathy'
  if (value == max) return 'special event'
  if (value < max* 0.33) return 'low'
  if (value < max* 0.67) return 'medium'
  return 'high'
}
</script>

<template>

  <v-dialog v-model="props.dialog" width="1024px" persistent>
    <v-form>
      <v-card title="Create Blueprint">

        <v-card-text>
          <v-container>
            <v-row align="center" >
              <v-col cols="6">
                <v-text-field
                  :error-messages="v$.name.$errors.map(e => e.$message)"
                  v-model="state.name"
                  label="Name*"
                  autofocus
                ></v-text-field>
              </v-col>
              <v-col cols="3">
                <v-slider
                  v-model="computedIntensity"
                  class="align-center"
                  :min="min"
                  :max="max"
                  :step="1"
                  hide-details
                  thumb-label
                  disabled
                >
                  <template #thumb-label="{ modelValue }">
                    {{ thumbLabel(modelValue) }}
                  </template>
                </v-slider>
              </v-col>

              <v-col>
                <v-text-field
                  v-model="computedIntensity"
                  :error-messages="v$.intensity.$errors.map(e => e.$message)"
                  label="Computed Intensity"
                  disabled
                ></v-text-field>
              </v-col>
            </v-row>

            <v-row align="center">
              <v-col cols="6">
                <v-slider
                  v-model="state.narrativeIntensity"
                  class="align-center"
                  :min="min"
                  :max="max"
                  :step="1"
                  hide-details
                  thumb-label
                >
                  <template #thumb-label="{ modelValue }">
                    {{ thumbLabel(modelValue) }}
                  </template>
                </v-slider>
              </v-col>

              <v-col>
                <v-text-field
                  v-model="state.narrativeIntensity"
                  :error-messages="v$.intensity.$errors.map(e => e.$message)"
                  label="Narrative Intensity*"
                ></v-text-field>
              </v-col>
            </v-row>


            <v-row align="center" >
              <v-col cols="6">
                <v-slider
                  v-model="state.intensity"
                  class="align-center"
                  :min="min"
                  :max="max"
                  :step="1"
                  hide-details
                  thumb-label
                >
                  <template #thumb-label="{ modelValue }">
                    {{ thumbLabel(modelValue) }}
                  </template>
                </v-slider>
              </v-col>

              <v-col cols="3">
                <v-text-field
                  v-model="state.intensity"
                  :error-messages="v$.intensity.$errors.map(e => e.$message)"
                  label="Gameplay Intensity*"
                ></v-text-field>
              </v-col>
              <v-col>
                <v-select
                  v-model="state.category"
                  :error-messages="v$.category.$errors.map(e => e.$message)"
                  :items="possibleCategories"
                  label="Type*"
                  chips
                ></v-select>
              </v-col>
            </v-row>

            <v-row align="center">
              <v-col cols="6">
                <v-text-field
                  v-model="state.playtime"
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
                  v-model="state.introducedSkills"
                  :items="possibleSkills"
                  label="Introduced Mechanics"
                  multiple
                  chips
                ></v-select>
              </v-col>

              <v-col cols="4">
                <v-select
                  v-model="state.reinforcedSkills"
                  :items="possibleSkills"
                  label="Reinforced Mechanics"
                  multiple
                  chips
                ></v-select>
              </v-col>

              <v-col>
                <v-select
                  v-model="state.requiredSkills"
                  :items="possibleSkills"
                  label="Required Mechanics"
                  multiple
                  chips
                ></v-select>
              </v-col>
            </v-row>

          </v-container>
        </v-card-text>

        <v-card-actions>
          <v-btn @click="onExit">Exit</v-btn>
          <v-spacer></v-spacer>
          <v-btn @click="onClear">Clear</v-btn>
          <v-btn @click="onSubmit">Submit</v-btn>
        </v-card-actions>
      </v-card>
    </v-form>

  </v-dialog>
</template>

<style scoped>

</style>
