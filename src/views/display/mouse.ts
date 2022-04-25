import { entities } from './entities'
import { point, entity } from './interfaces'
import { bake_entity, point_entity } from './entity_graphics'
import { draw } from './draw'


const drag_offset : point = { x: 0, y: 0 }
let drag_point : point = null


export function mouse_down(e: MouseEvent)
{
    const mouse:point = {x:e.offsetX, y:e.offsetY}
    
    for(const entity of entities.value)
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