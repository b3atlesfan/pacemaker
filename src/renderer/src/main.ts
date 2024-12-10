/**
 * main.ts
 *
 * Bootstraps Vuetify and other plugins then mounts the App`
 */
import './styles/main.css'
import './styles/vueflow.css'
import './styles/apexcharts.css'

// Components
import App from './App.vue'

// Composables
import { createApp } from 'vue'

// Plugins
import { registerPlugins } from './plugins/index'

const app = createApp(App)

registerPlugins(app)

app.mount('#app')

const information = document.getElementById('info')
information.innerText = ``
