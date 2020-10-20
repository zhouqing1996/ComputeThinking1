<template>
  <el-container>
    <el-header >
        <el-menu
          mode="horizontal">
          <el-menu-item index="1">
            <router-link to="/admin/index">首页</router-link>
          </el-menu-item>
          <el-menu-item index="2">
            <router-link to="/admin/user/userinfo" >用户信息</router-link>
          </el-menu-item>
          <el-submenu index="3">
            <template slot="title">题库信息</template>
            <el-menu-item index="3-1">
              <router-link to="/admin/bank/choose" >选择题</router-link>
            </el-menu-item>
            <el-menu-item index="3-2">
              <router-link to="/admin/bank/fill" >填空题</router-link>
            </el-menu-item>
            <el-menu-item index="3-3">
              <router-link to="/admin/bank/program" >程序题</router-link>
            </el-menu-item>
            <el-menu-item index="3-4">
              <router-link to="/admin/bank/programn" >程序题新</router-link>
            </el-menu-item>
            <el-menu-item index="3-5">
              <router-link to="/admin/bank/judge" >判断题</router-link>
            </el-menu-item>
            <el-menu-item index="3-6">
              <router-link to="/admin/bank/choosem" >多选题</router-link>
            </el-menu-item>
          </el-submenu>
          <el-menu-item index="4">
            <router-link to="/admin/book" >图书管理</router-link>
          </el-menu-item>
            <el-menu-item index="5">
              <router-link to="/admin/exam/create" >测评题库</router-link>
            </el-menu-item>
          <el-submenu index="6">
            <template slot="title">测评结果</template>
            <el-menu-item index="6-1">查看测评</el-menu-item>
            <el-menu-item index="6-2">测评分析</el-menu-item>
          </el-submenu>
          <el-submenu index="7">
            <template slot="title">我的信息</template>
            <el-menu-item index="7-1">
              <router-link to="/admin/my/my" >我的资料</router-link>
            </el-menu-item>
            <el-menu-item index="7-2">
              <router-link to="/admin/my/changepwd" >修改密码</router-link>
            </el-menu-item>
            <el-menu-item index="7-3" v-on:click="logout">
                退出登录
              </el-menu-item>
          </el-submenu>
        </el-menu>
    </el-header>
    <el-main  class="main-css">
      <router-view />
    </el-main>
    <el-footer>
      <el-menu
        class="el-menu-demo"
        mode="horizontal"
        background-color="	#1E90FF"
        text-color="#fff"
        active-text-color="#ffd04b">>
        <el-menu-item index="1">footer1</el-menu-item>
        <el-submenu index="2">
          <template slot="title">footer2</template>
          <el-menu-item index="2-1">选择题</el-menu-item>
          <el-menu-item index="2-2">填空题</el-menu-item>
          <el-menu-item index="2-3">程序题</el-menu-item>
          <el-submenu index="2-4">
            <template slot="title">选项4</template>
            <el-menu-item index="2-4-1">选项1</el-menu-item>
            <el-menu-item index="2-4-2">选项2</el-menu-item>
            <el-menu-item index="2-4-3">选项3</el-menu-item>
          </el-submenu>
        </el-submenu>
        <el-submenu index="3">
          <template slot="title">有关信息</template>
          <el-menu-item index="3-1">资料</el-menu-item>
          <el-menu-item index="3-2">修改密码</el-menu-item>
          <el-menu-item index="3-3">退出登录</el-menu-item>
        </el-submenu>
      </el-menu>
    </el-footer>
  </el-container>
</template>

<script>
    export default {
        name: "Home",
      data() {
        return{
          // userForm:[]
          isN:true

        }
      },
      methods:{
          reload1:function(index){
            if(index === this.$rotuer.path)
            {
              this.isN=false
              this.$nextTick(function () {
                this.isN=true
              })
            }
          },
          //退出登录
          logout:function () {
            let suserid=this.$store.getters.getsId
            console.log(suserid)
            this.$confirm("是否退出？","提示",{
              confirmButtonText:"确定",
              cancelButtonText:"取消",
              type:"warning"
            }).then(()=>{
              this.$http.post('/yii/home/index/logout',
                {
                  userid:suserid
                }).then(function (res) {
                console.log(res.data)
                if(res.data.message=="退出成功")
                {
                  this.$store.dispatch('logout')
                  this.$store.dispatch('slogout')
                  alert("退出成功！")
                  this.$router.push({path:'/login'})
                }
                else
                {
                  alert(res.data.message)
                }
              })
            }).catch(()=>
            {});
          }
      },
      created()
      {

      }
    }
</script>

<style >
  .main-css{
    width: 100%;
    height: 550px;
  }
  a {
    text-decoration: none;
  }
</style>
