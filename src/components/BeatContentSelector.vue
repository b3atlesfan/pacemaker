<script setup lang="ts">
import {ref} from "vue";
import {useContentsStore} from "@/stores/contents";
import {storeToRefs} from "pinia";
import BeatContentCreatorButton from "@/components/BeatContentCreatorButton.vue";
import BeatContentHolder from "@/components/BeatContentHolder.vue";
import {BeatContentManager} from "@/assets/BeatContentManager";

const emit = defineEmits(['onSaveClicked'])

const manager = BeatContentManager.getInstance()

const { contents } = storeToRefs(useContentsStore())

const dialog = ref(false)

const id = ref(-1)

function onSaveClicked() {
  dialog.value = false
  emit('onSaveClicked', id.value)
}

function onSelect(selectedId: number) {
  console.log(id)
  id.value = id.value == selectedId ? -1 : selectedId
  console.log(id)
}

function onDelete(selectedId: number) {
  manager.deleteContent(selectedId)
}

</script>

<template>
  <v-btn @click="dialog = true">Add</v-btn>

  <v-dialog v-model="dialog" width="500px">
    <v-card>
      <v-item-group selected-class="bg-primary">
        <v-container>
          <v-row>
            <v-col
                v-for="content in contents"
                cols="12"
                md="6"
            >
              <v-item>
                <v-card
                    :color="id == content.id ? 'primary' : ''"
                    dark
                    height="auto"
                    @click="() => {onSelect(content.id);}"
                >
                  <BeatContentHolder :content="content" :is-in-beat="false" @on-delete="onDelete"/>
                </v-card>
              </v-item>
            </v-col>
          </v-row>
        </v-container>
      </v-item-group>

      <v-card-actions>
        <v-btn color="secondary" @click="dialog = false">Exit</v-btn>
        <BeatContentCreatorButton></BeatContentCreatorButton>
        <v-btn color="primary" @click="onSaveClicked()">Save</v-btn>
      </v-card-actions>
    </v-card>

  </v-dialog>
</template>

<style scoped>

</style>