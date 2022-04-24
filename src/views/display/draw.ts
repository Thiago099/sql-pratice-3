import { ref } from 'vue'
export const ctx = ref<CanvasRenderingContext2D>(null)

export function draw()
{
    ctx.value.clearRect(0, 0, ctx.value.canvas.width, ctx.value.canvas.height)
    ctx.value.strokeStyle = "red"
    ctx.value.lineWidth = 5
    ctx.value.strokeRect(pos.x, pos.y, 100, 100)
}
let drag = false
const drag_pos = { x: 0, y: 0 }
const pos = { x: 10, y: 10 }
export function mouse_down(e: MouseEvent)
{
    drag = true
    drag_pos.x = e.offsetX - pos.x
    drag_pos.y = e.offsetY - pos.y
}

export function mouse_move(e: MouseEvent)
{
    if(drag)
    {
        pos.x = e.offsetX - drag_pos.x
        pos.y = e.offsetY - drag_pos.y
        draw()
    }
}

export function mouse_up(e: MouseEvent)
{
    drag = false
}
