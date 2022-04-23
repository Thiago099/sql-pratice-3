<script setup lang="ts">
import { ref, onMounted } from 'vue'
const canvas = ref(null)
import { ctx, draw } from './draw'

function resize_canvas()
{
    canvas.value.width = canvas.value.parentElement.clientWidth;
    canvas.value.height = canvas.value.parentElement.clientHeight;
    draw()
}

window.addEventListener('resize', function() {
    resize_canvas()
}, true);

onMounted(()=>{
    ctx.value = canvas.value.getContext('2d')
    resize_canvas()
})

</script>

<template>
    <canvas ref="canvas"></canvas>
</template>