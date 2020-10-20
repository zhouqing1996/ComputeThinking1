<template>
  <el-container>
    <el-header>
      <el-menu
        class="el-menu-demo"
        mode="horizontal"
        background-color="	#1E90FF"
        text-color="#fff"
        active-text-color="#ffd04b">
        <el-menu-item index="1">
          <router-link to="/teacher/index">首页</router-link>
        </el-menu-item>
        <el-menu-item index="2">
          <router-link to="/teacher/stuManage" >学生管理</router-link>
        </el-menu-item>
        <el-submenu index="3">
          <template slot="title">教师事务管理</template>
          <el-menu-item index="3-1">
            <router-link to="/teacher/create" >评测管理</router-link>
          </el-menu-item>
          <el-menu-item index="3-2">
            <router-link to="" >资源管理</router-link>
          </el-menu-item>
        </el-submenu>
        <el-menu-item index="4">
          <router-link to="" >学生评测数据</router-link>
        </el-menu-item>
        <!--<el-submenu index="6">-->
          <!--<template slot="title">结果</template>-->
          <!--<el-menu-item index="6-1">结果查看</el-menu-item>-->
          <!--<el-menu-item index="6-2">结果分析</el-menu-item>-->
        <!--</el-submenu>-->
        <el-submenu index="7">
          <template slot="title">我的信息</template>
          <el-menu-item index="7-1">
            <router-link to="/teacher/my" >我的资料</router-link>
          </el-menu-item>
          <el-menu-item index="7-2">
            <router-link to="/teacher/my/changepwd" >修改密码</router-link>
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
        background-color="#1E90FF"
        text-color="#fff"
        active-text-color="#ffd04b">
        <el-menu-item index="1">用户页面</el-menu-item>
        <el-submenu index="2">
          <template slot="title">友情链接</template>
          <el-menu-item index="2-1">
            <a href="https://www.luogu.com.cn">洛谷</a>
          </el-menu-item>
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

      }
    },
    methods:{
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

<style scoped>
  .header-css{
    position: fixed;
    top: 0px;
    margin: auto;
    opacity: 0.8;
    float: right;
  }
  .header-menu{

  }
  .main-css{
    width: 100%;
    height: 600px;
    /*position: absolute;*/
  }
  a {
    text-decoration: none;
  }
  .router-link-active {
    text-decoration: none;
  }

</style>
