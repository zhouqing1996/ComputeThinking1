<template>
    <!--用户身份首页-->
    <el-carousel :interval="4000" type="card" height="500px">
      <el-carousel-item v-for="item in 4" :key="item">
        <h5 class="medium">{{ item }}</h5>
        <img src="../../assets/images/ct6s.jpeg" alt="计算思维六要素"/>
      </el-carousel-item>
    </el-carousel>
</template>

<script>
    export default {
        name: "Index"
    }
</script>

<style scoped>
  .el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 200px;
    margin: 0;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
</style>
