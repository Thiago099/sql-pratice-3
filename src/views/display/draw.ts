import { ref } from 'vue'
export const ctx = ref<CanvasRenderingContext2D>(null)

import { entities } from './entities'


export function draw()
{
    const c = ctx.value
    c.clearRect(0, 0, c.canvas.width, c.canvas.height)

    for(const {image, position} of entities.value)
    {
        c.drawImage(image, position.x - image.width / 2, position.y - image.height / 2)
    }
}


