import { point, entity } from './interfaces'

function measureText(text: string, font: string) {
    const ctx = document.createElement('canvas').getContext('2d')
    ctx.font = font
    return ctx.measureText(text).width
}

export function bake_entity(text: string)
{
    const entity = document.createElement('canvas')
    entity.width = measureText(text,"30px Calibri") + 20
    entity.height = 50
    const c = entity.getContext('2d')

    c.font = "30px Calibri";
    c.textBaseline = 'middle';
    c.textAlign = "center";

    c.strokeStyle = "black"
    c.lineWidth = 2
    c.roundRect(1, 1, entity.width-2, entity.height-2, 5)
    c.fillStyle = "rgb(200, 200, 200)"
    c.fill()
    c.stroke()
    c.fillStyle = "black"
    c.fillText(text, entity.width/2, entity.height/2)
    return entity
}

export function point_entity(point: point, entity: entity)
{
    return point.x > entity.position.x && point.x < entity.position.x + entity.image.width && point.y > entity.position.y && point.y < entity.position.y + entity.image.height
}