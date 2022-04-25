<script setup lang="ts">
import { ref, onMounted } from 'vue'
const canvas = ref(null)
import { ctx, draw } from './draw'
import { mouse_down, mouse_move, mouse_up } from './mouse'

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
    <canvas 
        ref="canvas"
        @mousedown="mouse_down"
        @mousemove="mouse_move"
        @mouseup="mouse_up"
    ></canvas>
</template>