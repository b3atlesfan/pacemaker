// Composables
import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/',
    name: 'main',
    component: () => import('@/views/Main.vue'),
  },
  {
    path: '/content',
    name: 'content',
    component: () => import('@/views/ContentView.vue')
  },
  {
    path: '/visualizer',
    name: 'visualizer',
    component: () => import('@/views/VisualizerView.vue')
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

export default router
