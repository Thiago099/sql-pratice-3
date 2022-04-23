import { computed, ref } from 'vue';
import entity from './entity';


export const correlation_type = ref<entity[]>([])

export function add()
{
    const newCorrelation : entity = {
        id: 0,
        name: ''
    }
    correlation_type.value.push(newCorrelation)
}

export function del(correlation: entity)
{
    correlation.delete = true
}

export const display_correlation_type = computed(() => 
    correlation_type.value.filter(correlation => !correlation.delete)
)