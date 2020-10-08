<template>
  <el-container>
    <el-header>
      <el-menu  class="el-menu-demo" mode="horizontal" >
        <el-menu-item index="1">
          <router-link to="/admin/userinfo" >用户信息</router-link>
        </el-menu-item>
        <el-submenu index="2">
          <template slot="title">题库信息</template>
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
          <template slot="title">我的信息</template>
          <el-menu-item index="3-1">资料</el-menu-item>
          <el-menu-item index="3-2">修改密码</el-menu-item>
          <el-menu-item index="3-3">退出登录</el-menu-item>
        </el-submenu>
      </el-menu>
    </el-header>
    <el-main >
      <router-view />
    </el-main>
    <el-footer>
      <el-menu  class="el-menu-demo" mode="horizontal" >
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
        name: "Home"
    }
</script>

<style scoped>
  a {
    text-decoration: none;
  }

  .router-link-active {
    text-decoration: none;
  }
</style>
