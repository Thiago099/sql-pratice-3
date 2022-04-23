import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import Home from '@/views/entity/entityControl.vue'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'Entity',
    component: Home
  },
  {
    path: '/Correlation_type',
    name: 'Correlation type',
    component: () => import(/* webpackChunkName: "about" */ '@/views/correlation_type/correlation_type.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
