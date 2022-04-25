import { ref } from 'vue'
import { point, entity } from './interfaces'
import { bake_entity, point_entity } from './entity_graphics'

export const entities = ref<entity[]>([
    {
        position: { x: 100, y: 50 },
        text: 'Hello world',
        image: bake_entity("Hello world")
    },
    {
        position: { x: 400, y: 50 },
        text: 'Hello world 1',
        image: bake_entity("Hello world 2")
    }
])