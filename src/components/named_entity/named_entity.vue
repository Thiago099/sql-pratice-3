

<script setup  lang="ts">
import { toRefs, defineProps } from 'vue'
import { add, del, save, display_named_entity, named_entity_model, update_list } from './form'
import { model } from '@/global/model'
import entity from './entity';
const props = defineProps<{
  table_name:string
  title:string
}>()
const { table_name } = toRefs(props)

named_entity_model.value = new model<entity>(table_name.value);

update_list()


</script>

<template>
<div class="content">
  <div class="container">
    <h2 class="text-center">{{ title }}</h2>
    <div class="row">
      <div class="form-group" v-for="correlation in display_named_entity" :key="correlation">
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
  </div>
  <div class="footer"><button class="btn btn-primary" @click="save">Save</button></div>
</template>
<style>
.form-group{
  margin-top: 10px !important;
}
.footer{
  border-top: 1px solid rgb(222,206,230);
  bottom: 0;
  height: 50px;
  width: 100%;
  position: fixed;
}

.footer button{
  position: absolute;
  right: 10px;
  top: 5px;
}

.content{
  width: 100%;
  height: calc((100%) - (102px));
  position: absolute;
  overflow-y: auto;
  margin-top: 10px;
}

</style>
