

<script lang="ts" setup>
import { correlation_type, add, del, display_correlation_type } from './form'
</script>

<template>
  <div class="container">
    <h2 class="text-center">Correlations</h2>
    <div class="row">
      <div class="form-group" v-for="correlation in display_correlation_type" :key="correlation">
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
