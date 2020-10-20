<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadcrumb-css">
      <el-breadcrumb-item :to="{ path: '/user/exercise' }">练习</el-breadcrumb-item>
      <el-breadcrumb-item>填空题</el-breadcrumb-item>
    </el-breadcrumb>
    <!--填空题-->
    填空题
  </div>
</template>

<script>
    export default {
        name: "ViewFill",
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
