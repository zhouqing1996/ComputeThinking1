<template>
    <!--创建试卷-->
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadcrumb-css">
      <el-breadcrumb-item :to="{ path: '/admin/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>测评试卷</el-breadcrumb-item>
    </el-breadcrumb>
    <div><hr/></div>
    <div class="display1">
      <el-tabs type="border-card">
        <el-tab-pane>
          <span slot="label"><i class="el-icon-date"></i> 试卷列表</span>
          <div class="display2">
            <div class="searchmem">
              <div class="meeting" >
                <el-input v-model="inputname" placeholder="模糊查找" size="mini"></el-input>
              </div>
              <button class="btn2 el-icon-search" v-on:click="getExamList(4)">搜索试卷</button>
              <button class="btn2 el-icon-circle-plus-outline" @click="dialogFormVisibleAdd=true">自动组卷</button>
              <el-dialog title="自动组卷" :visible.sync="dialogFormVisibleAdd">
                <el-form :model="addexam">
                  <el-form-item label="试卷名称" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addexam.name" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="选择题数" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addexam.nc" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="填空题数" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addexam.nf" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="程序题数" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addexam.np" auto-complete="off"></el-input>
                  </el-form-item>
                </el-form>
                <div slot="footer" style="align-content: center" class="dialog-footer">
                  <el-button type="primary" @click="AddExam">提交</el-button>
                  <el-button @click="dialogFormVisibleAdd=false">退出</el-button>
                </div>
              </el-dialog>
              <button class="btn2 el-icon-folder" @click="getExamList(1)">有效试卷</button>
              <button class="btn2 el-icon-folder-remove" @click="getExamList(2)">无效试卷</button>
              <button class="btn2 el-icon-folder-checked" @click="getExamList(3)">所有试卷</button>
            </div>
            <table >
              <tr>
                <th>序号</th>
                <th>试卷编号 </th>
                <th>试卷名</th>
                <th>创建时间</th>
                <th>作者编号</th>
                <th>状态</th>
                <th>操作</th>
              </tr>
              <tr v-for=" (exam,key) in currentPageData" :key="key">
                <td>{{ key+1 }}</td>
                <td>{{exam.exid}}</td>
                <td>{{exam.exname}}</td>
                <td>{{exam.createtime}}</td>
                <td>{{exam.auth}}</td>
                <td v-if="exam.exstatus==1">有效</td>
                <td v-if="exam.exstatus==0">无效
                  <span @click="changeExamstatus(exam.exid)" class="span2">修改</span>
                </td>
                <td>
                  <span v-if="exam.exstatus==1" class="span2" @click="lookexam(exam.exid)">查看试卷
                  </span>
                  <span v-if="exam.exstatus==1"@click="deleteExam(1,exam.exid)" class="span1"><i class="el-icon-delete">删除试卷</i></span>
                  <span v-if="exam.exstatus==0" @click="deleteExam(2,exam.exid)" class="span1"><i class="el-icon-delete">永久删除</i></span>
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
        name: "create",
      data(){
          return{
            formLabelWidth: '120px',
            examList:[],
            inputname:'',
            authname:"",
            //组卷
            dialogFormVisibleAdd:false,
            addexam:{
              id:"",
              name:"",
              nc:0,
              nf:0,
              np:0
            },
            // 翻页相关
            currentPage: 1,
            totalPage: 1,
            pageSize: 10,
            currentPageData:[]
          }
      },
      methods:{
        //  查看试卷
        lookexam:function(id){
          console.log(id)
          // this.$router.push({ name:'viewexam', params: { id: id }})
          this.$router.push({
            path:'/admin/exam/viewexam',
            query:{
              id:id
            }
          })
        },
        //  查询人
        getUser(id)
        {
          this.$http.post('/yii/home/user/queryid',{
            id:id
          }).then(function (res) {
            console.log(res.data)
            this.authname = res.data.data.username
          }).catch(function (error) {
            console.log(error)
          })
        },
        //分页
        setCurrentPageDate: function () {
          let begin = (this.currentPage - 1) * this.pageSize;
          let end = this.currentPage * this.pageSize;
          this.currentPageData = this.examList.slice(begin, end)
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
        Reset:function(){
          this.addexam.name="";
          this.addexam.nc=0;
          this.addexam.np=0;
          this.addexam.nf=0;
        },
      //  组卷
      //  1：自动组卷
      //  2：手动组卷
        AddExam:function () {
          this.$http.post('/yii/exam/index/addexam',{
            flag:1,
            exname:this.addexam.name,
            numc:this.addexam.nc,
            numf:this.addexam.nf,
            nump:this.addexam.np,
            auth:this.$store.getters.getsId
          }).then(function (res) {
            console.log(res.data)
            if(res.data.message=="自动组卷成功")
            {
              this.getExamList(3)
            }
            this.dialogFormVisibleAdd=false
            this.Reset();
            alert(res.data.message)
          }).catch(function (error) {
            console.log(error)
          })
        },
        //返回试卷信息
        //1：有效试卷
        //2：无效试卷
        //3：所有试卷
        //4:模糊查找
        getExamList:function (item) {
          console.log(item)
          if(item==1)
          {
            this.$http.post('/yii/exam/index/queryexam',{
              flag:1
            }).then(function (res) {
              console.log(res.data)
              this.examList = res.data.data
              this.totalPage =Math.ceil(this.examList.length/this.pageSize)
              this.totalPage=this.totalPage==0?1:this.totalPage
              this.setCurrentPageDate()
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==2)
          {
            this.$http.post('/yii/exam/index/queryexam',{
              flag:2
            }).then(function (res) {
              console.log(res.data)
              this.examList = res.data.data
              this.totalPage =Math.ceil(this.examList.length/this.pageSize)
              this.totalPage=this.totalPage==0?1:this.totalPage
              this.setCurrentPageDate()
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==3)
          {
            this.$http.post('/yii/exam/index/queryexam',{
              flag:3
            }).then(function (res) {
              console.log(res.data)
              this.examList = res.data.data
              this.totalPage =Math.ceil(this.examList.length/this.pageSize)
              this.totalPage=this.totalPage==0?1:this.totalPage
              this.setCurrentPageDate()
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==4)
          {
            this.$http.post('/yii/exam/index/queryexam',{
              flag:4,
              name:this.inputname
            }).then(function (res) {
              console.log(res.data)
              this.examList = res.data.data
              this.totalPage =Math.ceil(this.examList.length/this.pageSize)
              this.totalPage=this.totalPage==0?1:this.totalPage
              this.setCurrentPageDate()
            }).catch(function (error) {
              console.log(error)
            })
          }
          else{
            console.log("输入错误")
          }
        },
        //修改状态
        changeExamstatus:function (id) {
          this.$http.post('/yii/exam/index/changestatus',{
            exid:id
          }).then(function (res) {
            console.log(res.data)
            this.getExamList(3)
            alert(res.data.message)
          }).catch(function (error) {
            console.log(error)
          })
        },
      //  删除
        deleteExam:function (item,id) {
          if(item==1)
          {
            this.$confirm("删除该试卷，是否继续？", "提示", {
              confirmButtonText: "确定",
              cancelButtonText: "取消",
              type: "warning"
            }).then(() => {
              this.$http.post('/yii/exam/index/deleteexam',{
                flag:1,
                exid:id
              }).then(function (res) {
                console.log(res.data)
                if(res.data.message=="删除成功")
                {
                  this.getExamList(3)
                }
                alert(res.data.message)
              })
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==2)
          {
            this.$confirm("完全删除该试卷，是否继续？", "提示", {
              confirmButtonText: "确定",
              cancelButtonText: "取消",
              type: "warning"
            }).then(() => {
              this.$http.post('/yii/exam/index/deleteexam',{
                flag:2,
                exid:id
              }).then(function (res) {
                console.log(res.data)
                if(res.data.message=="完全删除成功")
                {
                  this.getExamList(3)
                }
                alert(res.data.message)
              })
            }).catch(function (error) {
              console.log(error)
            })
          }
          else{
            console.log("输入错误")
          }
        }
      },
      created(){
          this.getExamList(3)
      },
      mounted(){

      }
    }
</script>

<style scoped>
  a {
    text-decoration: none;
  }
  .router-link-active {
    text-decoration: none;
  }
  .btn1 {
    font-size: 10px;/*px*/
    padding: 7px 7px;
    border: 1px solid #E5E7E9;/*no*/
    cursor: pointer;
    background: #fff;
    margin-bottom: -1px;
    color: black;
    width: 40px;
  }
  .active {
    color: #01A6FE;
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
  .btn3 {
    width: 80px;/*px*/
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
    width: 100px;/*px*/
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
    width: 50px;/*px*/
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
    border: solid 1px #ccc;/*no*/
    padding: 5px;/*no*/
    text-align: center;
    font-size: 18px;/*px*/
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
