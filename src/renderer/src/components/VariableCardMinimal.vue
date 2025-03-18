<script setup lang="ts">
import { defineProps, watch } from 'vue';
import { useTheme } from 'vuetify';
const theme = useTheme();

const props = defineProps({
    currentVariable: Object,
});

// on changes of props emit the event to update the variable

watch(props.currentVariable, (newValue, oldValue) => {
    emit('onUpdateVariable', newValue);
});

const emit = defineEmits(['onUpdateVariable']);

</script>

<template>
    <v-card>
        <v-row class="d-flex align-center justify-left" style="margin-left: 10px;">
            <v-col cols="2">{{ props.currentVariable.name }}</v-col>
            <v-col cols="2">
                <v-text-field v-model="props.currentVariable.intensityWeight" type="number" density="compact" hide-details="auto"></v-text-field>
            </v-col>
            <v-col cols="2">
                <v-text-field v-model="props.currentVariable.narrativeWeight" type="number" density="compact" hide-details="auto"></v-text-field>
            </v-col>
            <v-col cols="2">
                <v-checkbox v-model="props.currentVariable.isMultiplier" label="Multiplier"></v-checkbox>
            </v-col>
        </v-row>
    </v-card>
</template>