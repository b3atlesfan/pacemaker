<script setup lang="ts">
import { defineProps } from 'vue';

const props = defineProps({
    currentVariable: Object,
});

function toggleFavorite() {
    props.currentVariable.markedFavorite = !props.currentVariable.markedFavorite;
}

function openDetailedView() {
    props.currentVariable.detailedView = true;
}
</script>

<template>
    <v-card>
        <v-row>
            <v-col cols="1">
                <v-btn @click="toggleFavorite">
                    <v-icon v-if="props.currentVariable.markedFavorite" icon="mdi-star"></v-icon>
                    <v-icon v-else icon="mdi-star-outline"></v-icon>
                </v-btn>
            </v-col>
            <v-col cols="1">
                <v-btn @click="openDetailedView">Open</v-btn>
            </v-col>
            <v-col cols="2">{{ props.currentVariable.name }}</v-col>
            <v-col cols="2">{{ props.currentVariable.path }}</v-col>
            <v-col cols="1">
                <v-text-field v-model="props.currentVariable.intensityWeight" type="number" density="compact" hide-details="auto"></v-text-field>
            </v-col>
        </v-row>
    </v-card>
</template>