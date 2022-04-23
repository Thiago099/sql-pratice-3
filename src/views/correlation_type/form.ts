import { computed, ref } from 'vue';
import correlation_type_entity from '@/views/correlation_type/correlation_type_entity';
import { model } from '@/global/model'
const correlation_model = new model<correlation_type_entity>('correlation_type');
export const correlation_type = ref<correlation_type_entity[]>([])
correlation_model.get().then((result:correlation_type_entity[]) => {
    correlation_type.value = result;
});

export function add()
{
    const newCorrelation : correlation_type_entity = {
        id: 0,
        name: ''
    }
    correlation_type.value.push(newCorrelation)
}

export function del(correlation: correlation_type_entity)
{
    correlation.delete = true
}

export const display_correlation_type = computed(() => 
    correlation_type.value.filter(correlation => !correlation.delete)
)