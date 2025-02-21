<script setup lang="ts">
import {ref} from "vue";
import {useContentsStore} from "@/store/contents";
import {storeToRefs} from "pinia";
import BeatContentHolder from "@/components/BeatContentHolder.vue";
import {BeatContentManager} from "@/assets/BeatContentManager";

const props = defineProps<{
  dialog: boolean
}>()

const emit = defineEmits(['onSave', 'onExit', 'onCreate', 'onEdit'])


const manager = BeatContentManager.getInstance()

const {contents} = storeToRefs(useContentsStore())

const id = ref(-1)

function onSave() {
  emit('onSave', id.value)
  onSelect(id.value)
}

function onExit() {
  emit('onExit')
}

function onCreate() {
  emit('onCreate')
}

function onEdit() {
  emit('onEdit', id.value)
}

function onSelect(selectedId: number) {
  id.value = id.value == selectedId ? -1 : selectedId
}

function onDelete(selectedId: number) {
  manager.deleteContent(selectedId)
}

function onDeleteAll() {
  manager.deleteAllContents()
}

defineExpose({onDeleteAll})

</script>

<template>
  <v-dialog v-model="props.dialog" width="500px" persistent scrollable>
    <v-card>
      <v-card-title>Select Content</v-card-title>

      <v-divider></v-divider>

      <v-card-text>
        <v-item-group>
          <v-container>
            <v-row
            cols = "12">
              <v-col
                v-for="content in contents"
                cols="12"
                md="6"
              >
                <v-item>
                  <v-card @click="() => {onSelect(content.id);}">
                    <BeatContentHolder :is-highlighted="id == content.id" :content-id="content.id" type="preview"
                                       @on-delete="onDelete"/>
                  </v-card>
                </v-item>
              </v-col>
            </v-row>
          </v-container>
        </v-item-group>
      </v-card-text>

      <v-divider></v-divider>

      <v-card-actions>
        <v-btn @click="onCreate">Create</v-btn>
        <v-btn @click="onEdit">Edit</v-btn>
        <v-btn @click="onDeleteAll">Delete All</v-btn>
        <v-spacer></v-spacer>
        <v-btn @click="onExit">Exit</v-btn>
        <v-btn @click="onSave">Save</v-btn>
      </v-card-actions>
    </v-card>

  </v-dialog>
</template>

<style scoped>

</style>
