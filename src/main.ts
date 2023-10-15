/**
 * main.ts
 *
 * Bootstraps Vuetify and other plugins then mounts the App`
 */
import './styles/main.css'
import './styles/vueflow.css'

// Components
import App from './App.vue'

// Composables
import { createApp } from 'vue'

// Plugins
import { registerPlugins } from '@/plugins'

const app = createApp(App)

registerPlugins(app)

app.mount('#app')
