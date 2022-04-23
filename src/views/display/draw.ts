import { ref } from 'vue'
export const ctx = ref<CanvasRenderingContext2D>(null)

export function draw()
{
    ctx.value.strokeStyle = "red"
    ctx.value.lineWidth = 5
    ctx.value.strokeRect(30,30,100,100)
}