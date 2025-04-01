
<script setup lang="ts">
import { computed, onMounted, nextTick } from 'vue';
import { settings, currentProjectPath, loadSettings, saveSettings, saveCurrentProjectPath, recentlyLoadedPaths, currentState } from '@/store/settings';

async function saveSettingsHandler() {
  var ret = await saveSettings();
  if(ret) {
    alert(ret);
    return;
  }
}

function hasValue() {
  return settings.Name;
}

onMounted(() => {
  if(!settings.Name) {
    loadSettings();
  }
});
</script>

<template>
  <v-container>
    <h1>Settings</h1>
    <h2>Game: </h2>
    <v-expansion-panels>
      <v-expansion-panel>
        <v-expansion-panel-title>Recently Loaded Projects</v-expansion-panel-title>
        <v-expansion-panel-text>
          <v-list>
            <v-list-item
              v-for="(path, index) in recentlyLoadedPaths"
              :key="index"
              @click="currentProjectPath = path; loadSettings()"
            >
              <v-list-item-title>{{ path }}</v-list-item-title>
            </v-list-item>
          </v-list>
        </v-expansion-panel-text>
      </v-expansion-panel>
    </v-expansion-panels>
    <v-text-field
      label="Pacemaker Project"
      v-model="currentProjectPath"
    ></v-text-field>
    <v-btn color="primary" @click="saveSettingsHandler">Override</v-btn>
    <v-btn color="secondary" @click="loadSettings">Load</v-btn>
    <v-text-field
      v-if="settings.value || hasValue()"
      label="Name"
      v-model="settings.Name"
      placeholder="Enter project name"
    ></v-text-field>
    <h3>Unity</h3>
    <v-text-field
      label="Unity Project Path"
      v-model="currentState.unityPath"
    ></v-text-field>
    <v-text-field
      label="Output File"
      v-model="currentState.outFile"
    ></v-text-field>
    <v-text-field
      label="Input File"
      v-model="currentState.inFile"
    ></v-text-field>
    
  </v-container>
</template>