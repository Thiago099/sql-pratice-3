<script setup lang="ts">
import { useRoute, useRouter } from 'vue-router'
const route = useRoute()
const router = useRouter()
const routes = router.getRoutes()

</script>

<template>
  <div>
    <ul class="nav nav-tabs">
    <li 
    class="nav-item"
    v-for="({name}) in routes"
    :key = "name"
      >
      <router-link 
      
        class="nav-link" 
        :class="{active:route.name == name}"
        aria-current="page" 
        :to="{name}">{{ name }}</router-link>
    </li>
  </ul>
    <router-view/>
  </div>
</template>

<style>

</style>
