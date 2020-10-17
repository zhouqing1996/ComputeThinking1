<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadcrumb-css">
      <el-breadcrumb-item :to="{ path: '/user/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>测评</el-breadcrumb-item>
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
              <button class="btn2 el-icon-search" v-on:click="SeachEva()">搜索试卷</button>
            </div>
            <br>
            <br>
            <el-divider></el-divider>
            <table >
              <tr>
                <th>序号</th>
                <th>试卷编号 </th>
                <th>试卷名</th>
                <th>操作</th>
              </tr>
              <tr v-for=" (exam,key) in currentPageData" :key="key">
                <td>{{ key+1 }}</td>
                <td>{{exam.exid}}</td>
                <td>{{exam.exname}}</td>
                <td>
                  <span v-if="exam.exstatus==1" class="span2" @click="Goexam(exam.exid)">进入测试</span>
                </td>
              </tr>
            </table>
          </div>
        </el-tab-pane>
      </el-tabs>
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
    </div>
  </div>
</template>

<script>
    export default {
        name: "Evaluate",
      data(){
          return{
            inputname:'',
            EvaList:[],
            // 翻页相关
            currentPage: 1,
            totalPage: 1,
            pageSize: 10,
            currentPageData:[]

          }
      },
      methods:{
        //分页
        setCurrentPageDate: function () {
          let begin = (this.currentPage - 1) * this.pageSize;
          let end = this.currentPage * this.pageSize;
          this.currentPageData = this.EvaList.slice(begin, end)
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
          getEvaList:function () {
            this.$http.post('/yii/exam/index/queryexam',{
              flag:1,
            }).then(function (res) {
              console.log(res.data)
              this.EvaList =res.data.data
              this.totalPage =Math.ceil(this.EvaList.length/this.pageSize)
              this.totalPage=this.totalPage==0?1:this.totalPage
              this.setCurrentPageDate()
            })
          },
        SeachEva:function () {
          this.$http.post('/yii/exam/index/queryexam',{
            flag:4,
            name:this.inputname
          }).then(function (res) {
            console.log(res.data)
            this.EvaList =res.data.data
            this.totalPage =Math.ceil(this.EvaList.length/this.pageSize)
            this.totalPage=this.totalPage==0?1:this.totalPage
            this.setCurrentPageDate()
          })
        },
        Goexam:function(id){
          console.log(id)
          this.$router.push({
            path:'/user/evaluate/goeva',
            query:{
              id:id
            }
          })
        },
      },
      created(){
          this.getEvaList()
      }
    }
</script>

<style scoped>
  .btn2 {
    width: 100px;
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
  .span2{
    width: 50px;
    padding: 5px;
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
