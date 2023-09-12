import './assets/main.css'
import './style.css'
import '@imengyu/vue3-context-menu/lib/vue3-context-menu.css'
import 'vue-final-modal/style.css'
import ContextMenu from '@imengyu/vue3-context-menu'

import { createApp } from 'vue'
import { createVfm } from "vue-final-modal";
import { createPinia } from "pinia";
import App from './App.vue'
import router from './router'

// Vuetify
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'

const app = createApp(App)

const vuetify = createVuetify({
    components,
    directives,
})

app.use(ContextMenu)
app.use(router)
app.use(createVfm())
app.use(createPinia())
app.use(vuetify)

app.mount('#app')
