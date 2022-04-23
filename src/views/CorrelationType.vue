

<script lang="ts" setup>
import { computed, ref } from 'vue';
import { connection } from '@/global/mysql';
interface correlation{
  id: number;
  name: string;
  delete?: boolean;
}
const correlations = ref<correlation[]>([])
connection.query('SELECT * FROM correlation_type', function (error, results) {
  if (error) throw error;
  correlations.value = results
  console.log(results)
});

function add()
{
  const newCorrelation : correlation = {
    id: 0,
    name: ''
  }
  correlations.value.push(newCorrelation)
}

function del(correlation: correlation)
{
  correlation.delete = true
}

const display_correlations = computed(() => {
  return correlations.value.filter(correlation => !correlation.delete)
})
</script>

<template>
  <div class="container">
    <h2 class="text-center">Correlations</h2>
    <div class="row">
      <div class="form-group" v-for="correlation in display_correlations" :key="correlation">
        <label for="name">Name:</label>
        <div class="input-group">
          <input class="form-control" id="name" v-model="correlation.name">
          <button class="btn btn-danger" @click="del(correlation)"> <i class="fa fa-trash"></i></button>
        </div>
      </div>
      <div class="form-group">
        <button class="btn btn-success" @click="add"><i class="fa fa-plus"></i></button>
      </div>
    </div>
  </div>
</template>
<style>
.form-group{
  margin-top: 10px !important;
}
</style>
