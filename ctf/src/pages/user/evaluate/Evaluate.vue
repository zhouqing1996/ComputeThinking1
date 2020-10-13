<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadcrumb-css">
      <el-breadcrumb-item :to="{ path: '/user/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>测评</el-breadcrumb-item>
    </el-breadcrumb>
  </div>
</template>

<script>
    export default {
        name: "Evaluate",
      data(){
          return{
            EvaList:[],

          }
      },
      methods:{

      },
      created(){

      }
    }
</script>

<style scoped>

</style>
