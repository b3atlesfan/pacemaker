// Composables
import { createRouter, createWebHistory } from 'vue-router'
import SettingsView from '@/views/SettingsView.vue'

const routes = [
  {
    path: '/',
    name: 'main',
    component: () => import('@/views/Main.vue'),
  },
  {
    path: '/blueprints',
    name: 'blueprints',
    component: () => import('@/views/ContentView.vue')
  },
  {
    path: '/visualizer',
    name: 'visualizer',
    component: () => import('@/views/VisualizerView.vue')
  },
  {
    path: '/designer',
    name: 'designer',
    component: () => import('@/views/DesignerView.vue')
  },
  { path: '/settings', 
      
      name: 'settings',
      component: () => import('@/views/SettingsView.vue')
   }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

export default router
