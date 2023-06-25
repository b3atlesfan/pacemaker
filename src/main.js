import './assets/main.css'
import './style.css'
import '@imengyu/vue3-context-menu/lib/vue3-context-menu.css'
import 'vue-final-modal/style.css'
import ContextMenu from '@imengyu/vue3-context-menu'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import {createVfm} from "vue-final-modal";

const app = createApp(App)

const vfm = createVfm()

app.use(ContextMenu)
app.use(router)
app.use(vfm)

app.mount('#app')
