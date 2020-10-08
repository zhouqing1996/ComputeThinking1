<template>
    <!--用户信息-->
  <div class="display1">
    <!--<button class="btn1 active">企业信息列表</button>-->
    <el-tabs type="border-card">
      <el-tab-pane>
        <span slot="label"><i class="el-icon-date"></i> 用户列表</span>
        <div class="display2">
          <div class="searchmem">
            <div class="meeting" >
              <el-input v-model="inputname" placeholder="用户姓名" size="mini"></el-input>
            </div>
            <button class="btn3 el-icon-search" v-on:click="searchCom()">搜索</button>
            <router-link :to="{ name: 'adduser' }">
              <button class="btn3 el-icon-circle-plus-outline">添加</button>
            </router-link>
            <!--//另一种形式-->
            <button class="btn3 el-icon-circle-plus-outline" @click="dialogFormVisible = true">添加2</button>
            <el-dialog title="添加用户" :visible.sync="dialogFormVisible">
              <el-form :model="addUserList">
                <el-form-item label="用户名称" :label-width="formLabelWidth">
                  <el-input style="width: 350px;" v-model="addUserList.addname" auto-complete="off"></el-input>
                </el-form-item>
                <el-form-item label="用户密码" :label-width="formLabelWidth">
                  <el-input style="width: 350px;" v-model="addUserList.addpwd" auto-complete="off"></el-input>
                </el-form-item>
                <el-form-item label="用户角色" :label-width="formLabelWidth">
                  <select class="inputdiv" v-model="addUserList.addrole" style="font-size:15px;width:180px;" >
                    <option value="">选择</option>
                    <option value="1">超级管理员</option>
                    <option value="2">二级管理员</option>
                    <option value="3" selected="selected">普通用户</option>
                  </select>
                  <!--<el-input style="width: 350px;" v-model="addUserList.addrole" auto-complete="off"></el-input>-->
                </el-form-item>
                <el-form-item label="用户状态" :label-width="formLabelWidth">
                  <select class="inputdiv" v-model="addUserList.addstatus" style="font-size:15px;width:180px;" >
                    <option value="">选择</option>
                    <option value="1" selected="selected">有效</option>
                    <option value="0">无效</option>
                  </select>
                  <!--<el-input style="width: 350px;" v-model="addUserList.addstatus" auto-complete="off"></el-input>-->
                </el-form-item>
              </el-form>
              <div slot="footer" style="align-content: center" class="dialog-footer">
                <el-button type="primary" @click="addUser(addUserList)">提交</el-button>
                <el-button @click="addReset">重置</el-button>
              </div>
            </el-dialog>
          </div>
          <table >
            <tr>
              <th>用户编号 </th>
              <th>用户名</th>
              <th>用户角色</th>
              <th>状态</th>
              <th>操作</th>
            </tr>
            <tr v-for=" (userinfo,key) in userinfoList" :key="key">
              <td>{{userinfo.id}}</td>
              <td>{{userinfo.username}}</td>
              <td v-if="userinfo.role==1">超级管理员</td>
              <td v-if="userinfo.role==2">二级管理员</td>
              <td v-if="userinfo.role==3">普通用户</td>
              <!--<td>{{userinfo.role}}</td>-->
              <!--<td>{{userinfo.status}}</td>-->
              <td v-if="userinfo.status==1">有效</td>
              <td v-if="userinfo.status==0">无效</td>
              <td>
                <!--<router-link :to="{ name: 'altercom', query: { companyId: member.id }}"><i class="el-icon-edit"></i>修改用户名</router-link>-->
                <!--<router-link :to="{ name: 'altercom', query: { companyId: member.id }}"><i class="el-icon-edit"></i>修改状态</router-link>-->
                <!--<router-link :to="{ name: 'altercom', query: { companyId: member.id }}"><i class="el-icon-edit"></i>删除用户</router-link>-->
                <button v-on:click="changeUsername(userinfo.id)">修改用户名</button>
                <button v-on:click="changeRole(userinfo.id)">修改状态</button>
                <button v-on:click="deleteUser(userinfo.id)">删除用户</button>
                <button v-on:click="deleteUsers(userinfo.id)">永久删除</button>
              </td>
            </tr>
          </table>
          <div class="page">
            <!--<el-pagination-->
              <!--@size-change="handleSizeChange"-->
              <!--@current-change="handleCurrentChange"-->
              <!--:current-page.sync="currentpage"-->
              <!--layout="total, prev, pager, next"-->
              <!--:total="totalpage">-->
            <!--</el-pagination>-->
            <!--<ul class="pagination pagination-sm">&lt;!&ndash;分页&ndash;&gt;-->
              <!--<li class="page-item" v-if="currentpage!=1">-->
                <!--<span class="page-link" v-on:click="prepage(currentpage)">上一页</span>-->
              <!--</li>-->
              <!--<li class="page-item" v-for="(index,key2) in pagenums" :key="key2" v-bind:class="{ active: currentpage == index} ">-->
                <!--<span class="page-link" v-on:click="pageChange(index)">{{ index }}</span>-->
              <!--</li>-->
              <!--<li class="page-item" v-if="currentpage!=totalpage">-->
                <!--<span class="page-link" v-on:click="nextpage(currentpage)">下一页</span>-->
              <!--</li>-->
              <!--<li class="page-item">-->
                <!--<span class="page-link">共<i>{{totalpage}}</i>页</span>-->
              <!--</li>-->
            <!--</ul>-->
          </div>
        </div>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
    export default {
        name: "Userinfo",
      data(){
          return{
            //用户信息列表
            userinfoList:[],
            inputname:'',
            //对话框标志
            dialogFormVisible: false,
            addUserList:{
              addname:'',
              addpwd:'',
              addrole:'',
              addstatus:''
            },
            formLabelWidth: '120px',
            // 翻页相关
            currentpage: 1,
            totalpage: '',
            visiblepage: 10
          }
      },
      methods:{
          //获取全部的用户信息
        getQuery:function () {
          let that = this
          this.$http.post('/yii/home/user/query',
            {
              flag:2,
              page:this.currentpage
            }).then(function (res) {
            console.log(res.data)
            that.userinfoList = res.data.data
          })
        },
        //增加用户
        addUser:function (userList) {
          this.$http.post('/yii/home/user/adduser',
            {
              addname:this.addUserList.addname,
              addpwd:this.addUserList.addpwd,
              addrole:this.addUserList.addrole,
              addstatus:this.addUserList.addstatus
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
              this.dialogFormVisible=false;
              this.getQuery();
              // this.$router.push({path:'/admin/user/userinfo'})
            }
            else
            {
              alert(msg)
            }
          }).catch(()=>{})
        },
        //添加用户时重置
        addReset:function()
        {
          this.addUserList.addstatus="";
          this.addUserList.addrole="";
          this.addUserList.addpwd="";
          this.addUserList.addname=""
        },
        //修改状态
        changeStatus:function (userid) {
          this.$http.post('/yii/home/user/changeuser',
            {
              flag:4,
              userid:userid
            }).then(function (res) {
            console.log(res.data)
            that.userinfoList = res.data.data[0]
            that.totalpage = res.data.data[1]
          })
        },
        //修改角色
        changeRole:function () {

        },
        //修改用户名
        changeUsername:function(){

        },
        //删除用户（暂时删除）
        deleteUser:function(userid){
          this.$confirm("将该用户删除，是否继续？","提示",{
            confirmButtonText:"确定",
            cancelButtonText:"取消",
            type:"warning"
          }).then(()=>{
            this.$http.post('/yii/home/user/deleteuser',
              {
                flag:1,
                userid:userid
              }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该用户已删除")
              {
                this.getQuery()
                alert("删除该用户成功！")
              }
            })
          }).catch(()=>
          {});
        },
        //永久删除
        deleteUsers:function() {
          this.$confirm("该用户将永久删除，是否继续？","提示",{
            confirmButtonText:"确定",
            cancelButtonText:"取消",
            type:"warning"
          }).then(()=>{
            this.$http.post('/yii/home/user/deleteuser',
              {
                flag:2,
                userid:userid
              }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该用户已永久删除")
              {
                this.getQuery()
                alert("永久删除该用户成功！")
              }
            })
          }).catch(()=>
          {});
        },



        pageChange: function (page) {//分页
          if (this.currentpage != page) {
            this.currentpage = page;
          }
          this.getQuery();
        },
        prepage: function (page) {//上一页
          page--;
          if (this.currentpage != page) {
            this.currentpage = page;
          }
          this.getQuery();
        },
        nextpage: function (page) {//下一页
          page++;
          if (this.currentpage != page) {
            this.currentpage = page;
          }
          this.getQuery();
        },
      },
      created(){
        this.getQuery()
      },
      computed: {
        // 计算属性：返回页码数组，这里会自动进行脏检查，不用$watch();
        pagenums: function () { // 分页
          // 初始化前后页边界
          let lowPage = 1
          let highPage = this.totalpage
          let pageArr = []
          if (this.totalpage > this.visiblepage) { // 总页数超过可见页数时，进一步处理；
            let subVisiblePage = Math.ceil(this.visiblepage / 2)
            if (this.currentpage > subVisiblePage && this.currentpage < this.totalpage - subVisiblePage + 1) { // 处理正常的分页
              lowPage = this.currentpage - subVisiblePage
              highPage = this.currentpage + subVisiblePage - 1
            } else if (this.currentpage <= subVisiblePage) { // 处理前几页的逻辑
              lowPage = 1
              highPage = this.visiblepage
            } else { // 处理后几页的逻辑
              lowPage = this.totalpage - this.visiblepage + 1
              highPage = this.totalpage
            }
          }
          // 确定了上下page边界后，要准备压入数组中了
          while (lowPage <= highPage) {
            pageArr.push(lowPage)
            lowPage++
          }
          return pageArr
        }
      }
    }
</script>

<style scoped>
  .btn1 {
    font-size: 16px;
    padding: 10px 10px;
    border-top-left-radius: 3px;
    border-top-right-radius: 3px;
    border: 1px solid #E5E7E9;
    cursor: pointer;
    background: #fff;
    margin-bottom: -1px;
    color: #000;
    width: 120px;
    /*margin-right: 0px;*/
  }
  .active {
    color: #01A6FE;
  }
  .btn3 {
    width: 80px;
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

  .btn3:hover {
    background-color: #5FA7FE;
  }
  table {
    border-collapse: collapse;
    width: 100%;
    margin-top: 10px;

  }

  th {
    font-size: 14px;
    border: solid 1px #ccc;
    font-weight: bold;
    padding: 5px;
    background-color: #F1F1F1;
    text-align: center;
  }

  table, td {
    border: solid 1px #ccc;
    padding: 5px;
    text-align: center;
    font-size: 14px;
  }
  .display{
    padding-left: 5px;
    padding-top: 10px;
  }

  .display1{
    border: solid 1px #E5E7E9;
    height: 600px;
    /*text-align: center;*/
    width: 98%;
    padding-left: 5px;
    padding-right: 5px;
    background-color: #fff;
  }
  .page {
    text-align: center;
  }
  .meeting{
    float:left;
    margin:14px 0 10px 0;
    font-weight: bold;
    background-color: #00AAFF;
    border:solid 1px #00AAFF;
    border-radius: 5px;
    width: 20%;
    padding:2px;
  }
  li{list-style-type:none;}
</style>
