<script setup lang="ts">
import { useRoute, useRouter } from 'vue-router'
const route = useRoute()
const router = useRouter()
const routes = router.getRoutes()

</script>

<template>
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
        :to="{name}">{{ name }}
      </router-link>
    </li>
  </ul>
  <div class="content">
    <router-view/>
  </div>
</template>

<style>
.content{
  width: 100%;
  height: calc(100% - 48px);
  position: absolute;
}
</style>
