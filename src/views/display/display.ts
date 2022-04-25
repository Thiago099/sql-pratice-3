import { ref } from 'vue'
import { point, entity } from './interfaces'
import { bake_entity, point_entity } from './entity'

export const entities = ref<entity[]>([
    {
        position: { x: 100, y: 50 },
        text: 'Hello World',
        image: bake_entity("Hello world")
    }
])