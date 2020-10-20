<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadcrumb-css">
      <el-breadcrumb-item :to="{ path: '/user/exercise' }">练习</el-breadcrumb-item>
      <el-breadcrumb-item>程序题</el-breadcrumb-item>
    </el-breadcrumb>
    <!--程序题-->
    程序题
  </div>
</template>

<script>
    export default {
        name: "ViewProgram",
      data(){
        return{
          qid:'',
          uid:'',
        }
      },
      methods:{

      },
      created(){
        this.qid = this.$route.query.id
      }
    }
</script>

<style scoped>

</style>
