import { defineConfig } from "electron-vite";
import react from '@vitejs/plugin-react';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
  publicDir: false,
  main: {},
  preload: {},
  renderer: {
    plugins: [vue()]
  },
});
