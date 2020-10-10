<template>
    <!--用户信息-->
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadcrumb-css">
      <!--<el-breadcrumb-item :to="{ path: '/admin/index' }">首页</el-breadcrumb-item>-->
      <el-breadcrumb-item>用户信息</el-breadcrumb-item>
    </el-breadcrumb>
    <div><hr/></div>
    <div class="display1">
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
              <!--添加-->
              <el-dialog title="添加用户" :visible.sync="dialogFormVisible">
                <el-form :model="addUserList">
                  <el-form-item label="用户名称" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addUserList.addname" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="用户密码" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addUserList.addpwd" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="用户角色" :label-width="formLabelWidth">
                    <select style="font-size:15px;width:180px;" v-model="addUserList.addrole"  >
                      <option value="1">超级管理员</option>
                      <option value="2">二级管理员</option>
                      <option value="3" selected="selected">普通用户</option>
                    </select>
                    <!--<el-input style="width: 350px;" v-model="addUserList.addrole" auto-complete="off"></el-input>-->
                  </el-form-item>
                  <el-form-item label="用户状态" :label-width="formLabelWidth">
                    <select style="font-size:15px;width:180px;" v-model="addUserList.addstatus"  >
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
              <button class="btn3 el-icon-circle-plus-outline" @click="getQueryY">有效用户</button>
              <button class="btn3 el-icon-circle-plus-outline" @click="getQueryN">无效用户</button>
              <button class="btn3 el-icon-circle-plus-outline" @click="getQuery">所有用户</button>
            </div>
            <table >
              <tr>
                <th>用户编号 </th>
                <th>用户名</th>
                <th>用户角色</th>
                <th>状态</th>
                <th>操作</th>
              </tr>
              <tr v-for=" (userinfo,key) in currentPageData" :key="key">
                <td>{{userinfo.id}}</td>
                <td>{{userinfo.username}}
                  <span v-if="userinfo.status==1" @click="dialogFormVisibleName=true;changeList.id=userinfo.id" class="span2"><i class="el-icon-edit">修改用户名</i></span>
                </td>
                <td v-if="userinfo.role==1">超级管理员
                  <span v-if="userinfo.status==1" @click="dialogFormVisibleRole=true;changeList.id=userinfo.id" class="span2"><i class="el-icon-edit">修改角色</i></span>
                </td>
                <td v-if="userinfo.role==2">二级管理员
                  <span v-if="userinfo.status==1" @click="dialogFormVisibleRole=true;changeList.id=userinfo.id" class="span2"><i class="el-icon-edit">修改角色</i></span>
                </td>
                <td v-if="userinfo.role==3">普通用户
                  <span v-if="userinfo.status==1" @click="dialogFormVisibleRole=true;changeList.id=userinfo.id" class="span2"><i class="el-icon-edit">修改角色</i></span>
                </td>
                <!--<td>{{userinfo.role}}</td>-->
                <!--<td>{{userinfo.status}}</td>-->
                <td v-if="userinfo.status==1">有效</td>
                <td v-if="userinfo.status==0">无效
                  <span v-if="userinfo.status==0" @click="changeStatus(userinfo.id)" class="span2"><i class="el-icon-edit">修改状态</i></span>
                </td>
                <td>
                  <!--<span v-if="userinfo.status==1" @click="dialogFormVisibleName=true;changeList.id=userinfo.id" class="span2"><i class="el-icon-edit">修改用户名</i></span>-->
                  <!--更改用户名的对话框-->
                  <el-dialog title="修改用户名" :visible.sync="dialogFormVisibleName">
                    <el-form :model="changeList">
                      <el-form-item label="用户名称" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="changeList.name" auto-complete="off"></el-input>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeUsername(changeList)">提交</el-button>
                      <el-button @click="dialogFormVisibleName=false">退出</el-button>
                    </div>
                  </el-dialog>
                  <!--<span v-if="userinfo.status==1" @click="dialogFormVisibleRole=true;changeList.id=userinfo.id" class="span2"><i class="el-icon-edit">修改角色</i></span>-->
                  <!--更改用户角色的对话框-->
                  <el-dialog title="修改角色" :visible.sync="dialogFormVisibleRole" >
                    <el-form :model="changeList">
                      <el-form-item label="用户角色" :label-width="formLabelWidth">
                        <select style="font-size:20px;width:150px;" v-model="changeList.role"  >
                          <option value="1">超级管理员</option>
                          <option value="2">二级管理员</option>
                          <option value="3" selected="selected">普通用户</option>
                        </select>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeRole(changeList)">提交</el-button>
                      <el-button @click="dialogFormVisibleRole=false">退出</el-button>
                    </div>
                  </el-dialog>
                  <!--<span v-if="userinfo.status==0" @click="changeStatus(userinfo.id)" class="span2"><i class="el-icon-edit">修改状态</i></span>-->
                  <span v-if="userinfo.status==1"@click="deleteUser(userinfo.id)" class="span1"><i class="el-icon-delete">删除用户</i></span>
                  <span v-if="userinfo.status==0" @click="deleteUsers(userinfo.id)" class="span1"><i class="el-icon-delete">永久删除</i></span>
                </td>
              </tr>
            </table>
          </div>
          <div class="page">
            <ul class="pagination pagination-sm"><!--分页-->
              <li class="page-item" v-if="currentPage!=1">
                <span class="page-link" v-on:click="prePage">上一页</span>
              </li>
              <li class="page-item" >
                <span class="page-link" >第{{ currentPage }}页/共{{totalPage}}页</span>
              </li>
              <li class="page-item" v-if="currentPage!=totalPage">
                <span class="page-link" v-on:click="nextPage">下一页</span>
              </li>
            </ul>
          </div>
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>

</template>

<script>
    export default {
      name: "Userinfo",
      data() {
        return {
          //用户信息列表
          userinfoList: [],
          inputname: '',
          //对话框标志
          dialogFormVisible: false,
          dialogFormVisibleName: false,
          changeList: {
            id: '',
            name: '',
            role: '',
          },
          dialogFormVisibleRole: false,
          addUserList: {
            addname: '',
            addpwd: '',
            addrole: '',
            addstatus: ''
          },
          formLabelWidth: '120px',
          // 翻页相关
          currentPage: 1,
          totalPage: 1,
          pageSize: 10,
          currentPageData: []
        }
      },
      methods: {
        //分页
        setCurrentPageDate: function () {
          let begin = (this.currentPage - 1) * this.pageSize;
          let end = this.currentPage * this.pageSize;
          this.currentPageData = this.userinfoList.slice(begin, end)
        },
        prePage() {
          console.log(this.currentPage)
          if (this.currentPage == 1)
            return
          this.currentPage--;
          this.setCurrentPageDate()
        },
        nextPage() {
          if (this.currentPage == this.totalPage) return
          this.currentPage++;
          this.setCurrentPageDate()
        },
        //搜索
        searchCom:function(){
          console.log(this.inputname)
          this.$http.post('/yii/home/user/queryname',
            {
              name:this.inputname
            }).then(function (res) {
            console.log(res.data)
            this.userinfoList=res.data.data
            this.totalPage =Math.ceil(this.userinfoList.length/this.pageSize)
            this.totalPage=this.totalPage==0?1:this.totalPage
            this.setCurrentPageDate()
          })
        },
        //获取全部的用户信息
        getQuery: function () {
          // let that = this
          this.$http.post('/yii/home/user/query',
            {
              flag: 2,
              page: this.currentpage
            }).then(function (res) {
            console.log(res.data)
            // that.userinfoList = res.data.data
            this.userinfoList=res.data.data
            this.totalPage =Math.ceil(this.userinfoList.length/this.pageSize)
            this.totalPage=this.totalPage==0?1:this.totalPage
            this.setCurrentPageDate()
          })
        },
        //获取有效的用户信息
        getQueryY: function () {
          // let that = this
          this.$http.post('/yii/home/user/query',
            {
              flag: 1,
              page: this.currentpage
            }).then(function (res) {
            console.log(res.data)
            // that.userinfoList = res.data.data
            this.userinfoList=res.data.data
            this.totalPage =Math.ceil(this.userinfoList.length/this.pageSize)
            this.totalPage=this.totalPage==0?1:this.totalPage
            this.setCurrentPageDate()
          })
        },
        //获取无效的用户信息
        getQueryN: function () {
          // let that = this
          this.$http.post('/yii/home/user/query',
            {
              flag: 3,
              page: this.currentpage
            }).then(function (res) {
            console.log(res.data)
            // that.userinfoList = res.data.data
            this.userinfoList=res.data.data
            this.totalPage =Math.ceil(this.userinfoList.length/this.pageSize)
            this.totalPage=this.totalPage==0?1:this.totalPage
            this.setCurrentPageDate()
          })
        },
        //增加用户
        addUser: function (userList) {
          this.$http.post('/yii/home/user/adduser',
            {
              addname: this.addUserList.addname,
              addpwd: this.addUserList.addpwd,
              addrole: this.addUserList.addrole,
              addstatus: this.addUserList.addstatus
            }).then(function (res) {
            console.log(res.data)
            let msg = res.data.message
            if (msg == "该用户名已存在") {
              this.dialogFormVisible = false;
              alert("该用户名已存在,不能添加！")
            }
            else if (msg == "用户添加成功") {
              alert(msg)
              this.dialogFormVisible = false;
              this.getQuery();
            }
            else {
              this.dialogFormVisible = false;
              alert(msg)
            }
          }).catch(function (error) {
            console.log(error)
          })
        },
        //添加用户时重置
        addReset: function () {
          this.addUserList.addstatus = "";
          this.addUserList.addrole = "";
          this.addUserList.addpwd = "";
          this.addUserList.addname = ""
        },
        //修改状态
        changeStatus: function (userid) {
          console.log(userid)
          this.$confirm("修改该用户状态，是否继续？", "提示", {
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            type: "warning"
          }).then(() => {
            this.$http.post('/yii/home/user/changeuser',
              {
                flag: 4,
                userid: userid
              }).then(function (res) {
              console.log(res.data)
              if (res.data.message == "该用户状态修改成功") {
                this.getQuery()
                alert("该用户状态修改成功！")
              }
              else {
                alert(res.data.message)
              }
            })
          }).catch(function (error) {
            console.log(error)
          });
        },
        //修改角色
        changeRole: function (List) {
          console.log(List)
          this.$http.post('/yii/home/user/changeuser',
            {
              flag: 2,
              userid: List.id,
              role: List.role
            }).then(function (res) {
            console.log(res.data)
            this.changeList.role = ""
            if (res.data.message == "该用户角色修改成功") {
              this.getQuery()
              this.dialogFormVisibleRole = false
              alert("该用户角色修改成功！")
            }
            else {
              this.dialogFormVisibleName = false
              alert(res.data.message)
            }
          }).catch(function (error) {
            console.log(error)
          })
        },
        //修改用户名
        changeUsername: function (List) {
          console.log(List)
          this.$http.post('/yii/home/user/changeuser',
            {
              flag: 1,
              userid: List.id,
              username: List.name
            }).then(function (res) {
            console.log(res.data)
            this.changeList.name = ""
            if (res.data.message == "已有该用户名用户存在") {
              alert("已有该用户名用户存在,修改用户名失败")
              this.dialogFormVisibleName = false
            }
            else if (res.data.message == "该用户名修改成功") {
              this.getQuery()
              this.dialogFormVisibleName = false
              alert("该用户名修改成功！")
            }
            else {
              this.dialogFormVisibleName = false
              alert(res.data.message)

            }
          }).catch(function (error) {
            console.log(error)
          })

        },
        //删除用户（暂时删除）
        deleteUser: function (userid) {
          console.log(userid)
          this.$confirm("将该用户删除，是否继续？", "提示", {
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            type: "warning"
          }).then(() => {
            this.$http.post('/yii/home/user/deleteuser',
              {
                flag: 1,
                userid: userid
              }).then(function (res) {
              console.log(res.data)
              if (res.data.message == "该用户已删除") {
                this.getQuery()
                alert("删除该用户成功！")
              }
            })
          }).catch(function (error) {
            console.log(error)
          });
        },
        //永久删除
        deleteUsers: function (userid) {
          this.$confirm("该用户将永久删除，是否继续？", "提示", {
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            type: "warning"
          }).then(() => {
            console.log("2222")
            this.$http.post('/yii/home/user/deleteuser',
              {
                flag: 2,
                userid: userid
              }).then(function (res) {
              console.log(res.data)
              if (res.data.message == "该用户已永久删除") {
                this.getQuery()
                alert("永久删除该用户成功！")
              }
            })
          }).catch(function (error) {
            console.log(error)
          })
        },
      },
      created(){
        this.getQuery()

      },
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
  /*删除*/
  .span1{
    width: 100px;
    padding: 7px;
    font-size: 14px;
    border-radius: 3px;
    border: none;
    color: white;
    background-color: gray;
    margin-left: 5px;
    margin-top: 17px;
    margin-bottom: 5px;
  }
  .span1:hover{
    background-color: #5FA7FE;
  }
  /*修改*/
  .span2{
    width: 100px;
    padding: 7px;
    font-size: 14px;
    border-radius: 3px;
    border: none;
    color: white;
    background-color: sandybrown;
    margin-left: 5px;
    margin-top: 17px;
    margin-bottom: 5px;
  }
  .span2:hover{
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
    font-size: 18px;
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
  .dialog1{
    width: 350px;
    height:400px;
  }
  ul {
    display: flex;
    /*flex-direction: row;*/
    /*flex-wrap: nowrap;*/
    flex-flow: row nowrap;
    justify-content: center;
  }
  ul li {
    list-style: none;
    text-align: center;
    line-height: 30px;
    padding: 10px;
    height: 30px;
    width: 100px;
    margin: 0 10px;
  }
</style>
