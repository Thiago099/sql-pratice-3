import { ref } from 'vue'
export const ctx = ref<CanvasRenderingContext2D>(null)
import { bake_entity, point_entity } from './entity'

import { point, entity } from './interfaces'


const drag_offset : point = { x: 0, y: 0 }
let drag_point : point = null
const entities : entity[] = [
    {
        position: { x: 100, y: 50 },
        text: 'Hello World',
        image: bake_entity("Hello world")
    }
]

export function draw()
{
    const c = ctx.value
    c.clearRect(0, 0, c.canvas.width, c.canvas.height)

    for(const {image, position} of entities)
    {
        c.drawImage(image, position.x - image.width / 2, position.y - image.height / 2)
    }
}

export function mouse_down(e: MouseEvent)
{
    const mouse:point = {x:e.offsetX, y:e.offsetY}

    for(const entity of entities)
    {
        if(point_entity(mouse, entity))
        {
            drag_point = entity.position
            drag_offset.x = e.offsetX - entity.position.x
            drag_offset.y = e.offsetY - entity.position.y
        }
    }
}

export function mouse_move(e: MouseEvent)
{
    if(drag_point)
    {
        drag_point.x = e.offsetX - drag_offset.x
        drag_point.y = e.offsetY - drag_offset.y
        draw()
    }
}

export function mouse_up(e: MouseEvent)
{
    drag_point = null
}
