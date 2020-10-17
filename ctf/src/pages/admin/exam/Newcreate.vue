<template>
    <div>
      <el-row class="tac">
        <el-col :span="4">
          <el-menu
            class="el-menu-vertical-demo"
            >
            <el-menu-item index="1">
              <i class="el-icon-menu"></i>
              <span slot="title">单选题</span>
            </el-menu-item>
            <el-menu-item index="2">
              <i class="el-icon-menu"></i>
              <span slot="title">填空题</span>
            </el-menu-item>
            <el-menu-item index="3">
              <i class="el-icon-menu"></i>
              <span slot="title">判断题</span>
            </el-menu-item>
            <el-menu-item index="4">
              <i class="el-icon-chat-dot-round"></i>
              <span slot="title">多选题</span>
            </el-menu-item>
            <el-menu-item index="5">
              <i class="el-icon-menu"></i>
              <span slot="title">程序题</span>
            </el-menu-item>
          </el-menu>
        </el-col>
        <el-col :span="16">
          <div>
            试卷名称：<input type="text" v-model="exname" placeholder="试卷名称"/>
            <hr/>
          </div>
          <div>

          </div>
          <button class="btn2 el-icon-circle-plus-outline" >完成创建</button>
        </el-col>
        <el-col :span="1">
          <el-divider direction="vertical"></el-divider>
        </el-col>
        <el-col :span="3" >
          新的
        </el-col>
      </el-row>
    </div>
</template>

<script>
    export default {
        name: "Newcreate",
      data(){
          return{
            exname:'',
            CList:[],
            FList:[],
            JList:[],
            CMList:[],
            PList:[],
          }
      },
      methods:{
          CClick(){

          }
      },
      created(){

      }
    }
</script>

<style scoped>
  .el-divider--vertical {
    display: inline-block;
    width: 1px;
    height: 600px;
    margin: 0 8px;
    vertical-align: middle;
    position: relative;
  }
  .btn2 {
    width: 100px;/*px*/
    padding: 7px;
    font-size: 14px;
    border-radius: 3px;
    border: none;
    color: white;
    background-color: #7F96FE;
    float: left;
    margin-left: 5px;
    margin-top: 17px;
    margin-bottom: 5px;
  }

  .btn2:hover {
    background-color: #5FA7FE;
  }
</style>
