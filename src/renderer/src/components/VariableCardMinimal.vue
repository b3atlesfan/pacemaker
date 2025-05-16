<script setup lang="ts">
import { defineProps, watch } from 'vue';
import { useTheme } from 'vuetify';
import { BeatContentManager } from '../assets/BeatContentManager';
const theme = useTheme();

const beatContentManager = BeatContentManager.getInstance();

const props = defineProps({
    currentVariable: Object,
});

watch(
  () => props.currentVariable,
  (newValue, oldValue) => {
    if (newValue) {
      emit('onUpdateVariable', newValue);
      beatContentManager.updateAllContents();
    }
  },
  { deep: true }
);


function getName() {
    return props.currentVariable.name;
}

const emit = defineEmits(['onUpdateVariable']);

function toggleFavorite() {
    props.currentVariable.markedFavorite = !props.currentVariable.markedFavorite;
}
</script>

<template>
    <v-card>
        <v-row class="d-flex align-center justify-left" style="margin-left: 10px;">
            <v-col cols="1">
                <v-btn @click="toggleFavorite" :color="(props.currentVariable.requestedFromPM || props.currentVariable.markedFavorite) ? 'secondary' : 'primary'">
                    <v-icon v-if="props.currentVariable.requestedFromPM" icon="mdi-account"></v-icon>
                    <v-icon v-else-if="props.currentVariable.markedFavorite" icon="mdi-star"></v-icon>
                    <v-icon v-else icon="mdi-star-outline"></v-icon>
                </v-btn>
            </v-col>
            <v-col cols="3">
                <span :title="props.currentVariable.path">{{ props.currentVariable.path }}</span>
            </v-col>
            <v-col cols="2">
                <span :title="props.currentVariable.path">{{ getName() }}</span>
            </v-col>
            <v-col cols="2">
                <v-text-field v-model="props.currentVariable.intensityWeight" type="number" density="compact" hide-details="auto"></v-text-field>
            </v-col>
            <!--v-col cols="2">
                <v-text-field v-model="props.currentVariable.narrativeWeight" type="number" density="compact" hide-details="auto"></v-text-field>
            </v-col-->
            <v-col cols="1">
                <v-checkbox v-model="props.currentVariable.isMultiplier" label="Multiplier"></v-checkbox>
            </v-col>
            
            <v-col cols="1">
                <v-checkbox v-model="props.currentVariable.useDiff" label="Use Diff"></v-checkbox>
            </v-col>
            <v-col cols="1">
                <v-checkbox v-model="props.currentVariable.isBV" label="Is BV"></v-checkbox>
            </v-col>
        </v-row>
    </v-card>
</template>