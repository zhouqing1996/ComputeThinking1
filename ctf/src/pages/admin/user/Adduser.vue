<template>
    <!--添加用户-->
  <div class="display1">
    <button class="btn-header active">
      <span>添加用户</span>
    </button>
    <button>
      <span style="font-size: 13px" @click="back">返回列表</span>
    </button>
    <div class="display2">
      <div class="add-content">
        <div>
          <label> 姓名</label>
          <input class="inputdiv" type="text" placeholder="请输入姓名" v-model="addname">
        </div>
        <div>
          <label> 密码</label>
          <input class="inputdiv" type="text" placeholder="请输入密码" v-model="addpwd">
        </div>
        <div>
          <label>角色</label>
          <select class="inputdiv" v-model="addrole" style="font-size:15px;width:180px;" >
            <option value="">选择</option>
            <option value="1">超级管理员</option>
            <option value="2">二级管理员</option>
            <option value="3" selected="selected">普通用户</option>
          </select>
        </div>
        <div>
          <label>状态</label>
          <select class="inputdiv" v-model="addstatus" style="font-size:15px;width:180px;" >
            <option value="">选择</option>
            <option value="1" selected="selected">有效</option>
            <option value="0">无效</option>
          </select>
        </div>
      </div>
      <div class="add-btn">
        <button  class="btn2 icon-huanyihuan" v-on:click="reset">重置</button>
        <button type="submit" class="btn1 icon-duigou" v-on:click="sumbit">确认</button>
      </div>
    </div>
  </div>
</template>

<script>
    export default {
        name: "Adduser",
      data() {
        return {
          addname:'',
          addpwd:'',
          addrole:'',
          addstatus:''
        }
      },
      methods:{
          back:function () {
            //退回倒上一级
            this.$router.push({path:'/admin/user/userinfo'})
          },
        reset:function () {
          //重置
          this.addrole="";
          this.addpwd="";
          this.addname="";
          this.addstatus=""
        },
        sumbit:function () {
          //提交
          this.$http.post('/yii/home/user/adduser',
            {
              addname:this.addname,
              addpwd:this.addpwd,
              addrole:this.addrole,
              addstatus:this.addstatus
            }).then(function (res) {
              console.log(res.data)
            let msg = res.data.message
            if(msg=="该用户名已存在")
            {
              alert("该用户名已存在,不能添加！")
            }
            else if(msg=="用户添加成功")
            {
              alert(msg)
              this.$router.push({path:'/admin/user/userinfo'})
            }
            else
            {
              alert(msg)
            }
          }).catch(()=>{})
        }
      }
    }
</script>

<style scoped>
  label input select {
    float: left;
  }
  .add-content {
    padding: 30px;
    display: flex;
    flex-wrap: wrap;
    align-content: flex-start
  }
  .add-content > div {
    width: 30%;
  }
  .inputdiv {
    margin-bottom: 25px;
  }
  .display1 {
    padding-left: 5px;
    padding-top: 10px;
  }
  .display2 {
    border: solid 2px #e0e0e0;
    height: auto;
    width: 90%;
    padding: 100px 50px;
    background-color: #fff;
  }
  .btn-header {
    font-size: 18px;
    padding: 10px 10px;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
    border: 1px solid #ccc;
    cursor: pointer;
    background: #f0f0f0;
    color: #000;
    width: auto;
    /*margin-right: 0px;*/
  }
  .btn-header:hover {
    background: #e0e0e0;
  }
  .btn {
    margin-right: 750px;
    float:right;
  }
  .btn1{
    width:80px;
    padding:7px;
    font-size: 16px;
    border-radius: 3px;
    border:none;
    color:white;
    background-color:#338FFC ;
    margin-left: 20px;
    margin-top: 0px;
    /*margin-bottom: 5px;*/
  }
  .btn1:hover{
    background-color:#5FA7FE;
  }

  .active {
    background: #e0e0e0;
  }
  .btn2{
    width:80px;
    padding:6px;
    font-size: 16px;
    border-radius: 3px;
    border:none;
    color:white;
    background-color:#898989;
    float: left;
    margin-left: 10px;
  }
  .btn2:hover{
    background-color:#A5A5A5;
  }
</style>
