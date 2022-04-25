import { computed, ref } from 'vue';
import entity from './entity';
import { model } from '@/global/model'
export const named_entity_model = ref<model<entity>>();
export const named_entity = ref<entity[]>([])
export const search = ref<string>('')
export function add()
{
    const newItem : entity = {
        id: 0,
        name: ''
    }
    named_entity.value.push(newItem)
}

export function del(item: entity)
{
    item.delete = true
}

export async function save()
{
    await named_entity_model.value.save(named_entity.value)
    update_list()
}

export const display_named_entity = computed(() => 
    named_entity.value.filter(item => !item.delete && item.name.toLowerCase().includes(search.value.toLowerCase()))
)

export function update_list()
{
    named_entity_model.value.get().then((result:entity[]) => {
        named_entity.value = result;
    });
}