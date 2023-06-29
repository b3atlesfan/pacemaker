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

const app = createApp(App)

app.use(ContextMenu)
app.use(router)
app.use(createVfm())
app.use(createPinia())

app.mount('#app')
