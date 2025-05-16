import { defineConfig } from "electron-vite";
import react from '@vitejs/plugin-react';
// Plugins
import vue from '@vitejs/plugin-vue'
import vuetify, { transformAssetUrls } from 'vite-plugin-vuetify'
import ViteFonts from 'unplugin-fonts/vite'

// Utilities
import { fileURLToPath, URL } from 'node:url'

export default defineConfig({
  publicDir: false,
  main: {  
    entry: 'src/main/main.js',
    build: {
      sourcemap: true,
      outDir: 'dist/main',
    },
  },
  preload: {
    
    input: {
      preload: 'src/preload/preload.js',
    },
    build: {
      sourcemap: true,
      outDir: 'dist/preload',
    },
  },
  renderer: {
    input: {
      index: 'src/renderer/index.html',
    },
    build: {
      sourcemap: true,
      outDir: 'dist/renderer',
    },
    plugins: [
    vue({
      template: { transformAssetUrls }
    }),
    // https://github.com/vuetifyjs/vuetify-loader/tree/next/packages/vite-plugin
    vuetify({
      autoImport: true,
      styles: {
        configFile: 'src/styles/settings.scss',
      },
    }),
    ViteFonts({
      google: {
        families: [{
          name: 'Roboto',
          styles: 'wght@100;300;400;500;700;900',
        }],
      },
    }),
  ],
  define: { 'process.env': {} },
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src/renderer/src', import.meta.url))
    },
    extensions: [
      '.js',
      '.json',
      '.jsx',
      '.mjs',
      '.ts',
      '.tsx',
      '.vue',
    ],
  },
  server: {
    port: 5173,
  },
  },
});
