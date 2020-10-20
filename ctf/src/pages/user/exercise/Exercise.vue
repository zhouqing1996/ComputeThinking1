<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadcrumb-css">
      <el-breadcrumb-item>练习</el-breadcrumb-item>
    </el-breadcrumb>
    <div><hr/></div>
    <div class="display1">
      <el-tabs type="border-card">
        <!--选择题-->
        <el-tab-pane>
          <span slot="label"><i class="el-icon-date"></i> 选择题列表</span>
          <div class="display2">
            <div class="searchmem">
              <div class="meeting" >
                <el-input v-model="inputname" placeholder="选择题" size="mini"></el-input>
              </div>
              <button class="btn3 el-icon-search" >搜索</button>
            </div>
            <br>
            <br>
            <el-divider></el-divider>
            <table >
              <tr>
                <th>序号</th>
                <th>题目编号 </th>
                <th>题干</th>
                <th>操作</th>
              </tr>
              <tr v-for=" (c,key) in currentPageData1" :key="key">
                <td>{{key+1}}</td>
                <td>{{c.cqid}}</td>
                <td>{{c.cqitem}}</td>
                <td>
                  <span class="span2" @click="Click1(c.cqid)">进入练习</span>
                </td>
              </tr>
            </table>
            <hr/>
            <div class="page">
              <ul class="pagination pagination-sm"><!--分页-->
                <li class="page-item" v-if="currentPage1!=1">
                  <span class="page-link" v-on:click="prePage1">上一页</span>
                </li>
                <li class="page-item" >
                  <span class="page-link" >第{{ currentPage1 }}页/共{{totalPage1}}页</span>
                </li>
                <li class="page-item" v-if="currentPage1!=totalPage1">
                  <span class="page-link" v-on:click="nextPage1">下一页</span>
                </li>
              </ul>
            </div>
          </div>
        </el-tab-pane>
        <!--填空题-->
        <el-tab-pane>
          <span slot="label"><i class="el-icon-date"></i> 填空题列表</span>
          <div class="display2">
            <div class="searchmem">
              <div class="meeting" >
                <el-input v-model="inputname" placeholder="填空题" size="mini"></el-input>
              </div>
              <button class="btn3 el-icon-search" >搜索</button>
            </div>
            <br>
            <br>
            <el-divider></el-divider>
            <table >
              <tr>
                <th>序号</th>
                <th>题目编号 </th>
                <th>题干</th>
                <th>操作</th>
              </tr>
              <tr v-for=" (f,key) in currentPageData2" :key="key">
                <td>{{key+1}}</td>
                <td>{{f.fqid}}</td>
                <td>{{f.fqitem}}</td>
                <td>
                  <span class="span2" @click="Click2(f.fqid)">进入练习</span>
                </td>
              </tr>
            </table>
          </div>
          <hr/>
          <hr/>
          <div class="page">
            <ul class="pagination pagination-sm"><!--分页-->
              <li class="page-item" v-if="currentPage2!=1">
                <span class="page-link" v-on:click="prePage2">上一页</span>
              </li>
              <li class="page-item" >
                <span class="page-link" >第{{ currentPage2 }}页/共{{totalPage2}}页</span>
              </li>
              <li class="page-item" v-if="currentPage2!=totalPage2">
                <span class="page-link" v-on:click="nextPage2">下一页</span>
              </li>
            </ul>
          </div>
        </el-tab-pane>
        <!--判断题-->
        <el-tab-pane>
          <span slot="label"><i class="el-icon-date"></i> 判断题列表</span>
          <div class="display2">
            <div class="searchmem">
              <div class="meeting" >
                <el-input v-model="inputname" placeholder="判断题" size="mini"></el-input>
              </div>
              <button class="btn3 el-icon-search" >搜索</button>
            </div>
            <br>
            <br>
            <el-divider></el-divider>
            <table >
              <tr>
                <th>序号</th>
                <th>题目编号 </th>
                <th>题干</th>
                <th>操作</th>
              </tr>
              <tr v-for=" (j,key) in currentPageData3" :key="key">
                <td>{{key+1}}</td>
                <td>{{j.jqid}}</td>
                <td>{{j.jqitem}}</td>
                <td>
                  <span class="span2" @click="Click3(j.jqid)">进入练习</span>
                </td>
              </tr>
            </table>
          </div>
          <hr/>
          <div class="page">
            <ul class="pagination pagination-sm"><!--分页-->
              <li class="page-item" v-if="currentPage3!=1">
                <span class="page-link" v-on:click="prePage3">上一页</span>
              </li>
              <li class="page-item" >
                <span class="page-link" >第{{ currentPage3 }}页/共{{totalPage3}}页</span>
              </li>
              <li class="page-item" v-if="currentPage3!=totalPage3">
                <span class="page-link" v-on:click="nextPage3">下一页</span>
              </li>
            </ul>
          </div>
        </el-tab-pane>
        <!--多选题-->
        <el-tab-pane>
          <span slot="label"><i class="el-icon-date"></i> 多选题列表</span>
          <div class="display2">
            <div class="searchmem">
              <div class="meeting" >
                <el-input v-model="inputname" placeholder="多选题" size="mini"></el-input>
              </div>
              <button class="btn3 el-icon-search" >搜索</button>
            </div>
            <br>
            <br>
            <el-divider></el-divider>
            <table >
              <tr>
                <th>序号</th>
                <th>题目编号 </th>
                <th>题干</th>
                <th>操作</th>
              </tr>
              <tr v-for=" (m,key) in currentPageData4" :key="key">
                <td>{{key+1}}</td>
                <td>{{m.mqid}}</td>
                <td>{{m.mqitem}}</td>
                <td>
                  <span class="span2" @click="Click4(m.mqid)">进入练习</span>
                </td>
              </tr>
            </table>
          </div>
          <hr/>
          <hr/>
          <div class="page">
            <ul class="pagination pagination-sm"><!--分页-->
              <li class="page-item" v-if="currentPage4!=1">
                <span class="page-link" v-on:click="prePage4">上一页</span>
              </li>
              <li class="page-item" >
                <span class="page-link" >第{{ currentPage4 }}页/共{{totalPage4}}页</span>
              </li>
              <li class="page-item" v-if="currentPage4!=totalPage4">
                <span class="page-link" v-on:click="nextPage4">下一页</span>
              </li>
            </ul>
          </div>
        </el-tab-pane>
        <!--程序题-->
        <el-tab-pane>
          <span slot="label"><i class="el-icon-date"></i> 程序题列表</span>
          <div class="display2">
            <div class="searchmem">
              <div class="meeting" >
                <el-input v-model="inputname" placeholder="程序题" size="mini"></el-input>
              </div>
              <button class="btn3 el-icon-search" >搜索</button>
            </div>
            <br>
            <br>
            <el-divider></el-divider>
            <table >
              <tr>
                <th>序号</th>
                <th>题目编号 </th>
                <th>题干</th>
                <th>操作</th>
              </tr>
              <tr v-for=" (p,key) in currentPageData5" :key="key">
                <td>{{key+1}}</td>
                <td>{{p.pqid}}</td>
                <td>{{p.pqitem}}</td>
                <td>
                  <span class="span2" @click="Click5(p.pqid)">进入练习</span>
                </td>
              </tr>
            </table>
          </div>
          <hr/>
          <hr/>
          <div class="page">
            <ul class="pagination pagination-sm"><!--分页-->
              <li class="page-item" v-if="currentPage5!=1">
                <span class="page-link" v-on:click="prePage5">上一页</span>
              </li>
              <li class="page-item" >
                <span class="page-link" >第{{ currentPage5 }}页/共{{totalPage5}}页</span>
              </li>
              <li class="page-item" v-if="currentPage5!=totalPage5">
                <span class="page-link" v-on:click="nextPage5">下一页</span>
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
        name: "Exercise",
      data(){
          return{
            inputname: '',
            //1：选择题
            //2：填空题
            //3：判断题
            //4：多选题
            //5：程序题
            //列表显示
            Lists1:[],
            Lists2:[],
            Lists3:[],
            Lists4:[],
            Lists5:[],

            // 翻页相关
            currentPage1: 1,
            totalPage1: 1,
            pageSize1: 10,
            currentPageData1: [],
            currentPage2: 1,
            totalPage2: 1,
            pageSize2: 10,
            currentPageData2: [],
            currentPage3: 1,
            totalPage3: 1,
            pageSize3: 10,
            currentPageData3: [],
            currentPage4: 1,
            totalPage4: 1,
            pageSize4: 10,
            currentPageData4: [],
            currentPage5: 1,
            totalPage5: 1,
            pageSize5: 10,
            currentPageData5: [],

          }
      },
      methods:{
        //分页
        setCurrentPageDate1: function () {
          let begin1 = (this.currentPage1 - 1) * this.pageSize1;
          let end1 = this.currentPage1 * this.pageSize1;
          this.currentPageData1 = this.Lists1.slice(begin1, end1)
        },
        setCurrentPageDate2: function () {
          let begin2 = (this.currentPage2 - 1) * this.pageSize2;
          let end2 = this.currentPage2 * this.pageSize2;
          this.currentPageData2 = this.Lists2.slice(begin2, end2)
        },
        setCurrentPageDate3: function () {
          let begin3 = (this.currentPage3 - 1) * this.pageSize3;
          let end3 = this.currentPage3 * this.pageSize3;
          this.currentPageData3 = this.Lists3.slice(begin3, end3)
        },
        setCurrentPageDate4: function () {
          let begin4 = (this.currentPage4 - 1) * this.pageSize4;
          let end4 = this.currentPage4 * this.pageSize4;
          this.currentPageData4 = this.Lists4.slice(begin4, end4)
        },
        setCurrentPageDate5: function () {
          let begin5 = (this.currentPage5 - 1) * this.pageSize5;
          let end5 = this.currentPage5 * this.pageSize5;
          this.currentPageData5 = this.Lists5.slice(begin5, end5)
        },
        prePage1:function() {
          console.log(this.currentPage1)
          if (this.currentPage1 == 1)
            return
          this.currentPage1--;
          this.setCurrentPageDate1()
        },
        prePage2:function() {
          console.log(this.currentPage2)
          if (this.currentPage2 == 1)
            return
          this.currentPage2--;
          this.setCurrentPageDate2()
        },
        prePage3:function() {
          console.log(this.currentPage3)
          if (this.currentPage3 == 1)
            return
          this.currentPage3--;
          this.setCurrentPageDate3()
        },
        prePage4:function() {
          console.log(this.currentPage4)
          if (this.currentPage4 == 1)
            return
          this.currentPage4--;
          this.setCurrentPageDate4()
        },
        prePage5:function() {
          console.log(this.currentPage5)
          if (this.currentPage5 == 1)
            return
          this.currentPage5--;
          this.setCurrentPageDate5()
        },
        nextPage1:function() {
          if (this.currentPage1 == this.totalPage1) return
          this.currentPage1++;
          this.setCurrentPageDate1()
        },
        nextPage2:function() {
          if (this.currentPage2 == this.totalPage2) return
          this.currentPage2++;
          this.setCurrentPageDate2()
        },
        nextPage3:function() {
          if (this.currentPage3 == this.totalPage3) return
          this.currentPage3++;
          this.setCurrentPageDate3()
        },
        nextPage4:function() {
          if (this.currentPage4 == this.totalPage4) return
          this.currentPage4++;
          this.setCurrentPageDate4()
        },
        nextPage5:function() {
          if (this.currentPage5 == this.totalPage5) return
          this.currentPage5++;
          this.setCurrentPageDate5()
        },
        //获取所有列表内容;只有有效题目
        getQuery1:function () {
          //选择题
          this.$http.post('/yii/bank/chooseq/querychoose',{
            flag:2
          }).then(function (res) {
            console.log(res.data)
            this.Lists1 = res.data.data
            this.totalPage1 =Math.ceil(this.Lists1.length/this.pageSize1)
            this.totalPage1=this.totalPage1==0?1:this.totalPage1
            this.setCurrentPageDate1()
          }).catch(function (error) {
            console.log(error)
          })
        },
        getQuery2:function () {
          //填空题
          this.$http.post('/yii/bank/fillq/queryfill',{
            flag:2
          }).then(function (res) {
            console.log(res.data)
            this.Lists2 = res.data.data
            this.totalPage2 =Math.ceil(this.Lists2.length/this.pageSize2)
            this.totalPage2=this.totalPage2==0?1:this.totalPage2
            this.setCurrentPageDate2()
          }).catch(function (error) {
            console.log(error)
          })
        },
        getQuery3:function () {
          //判断题
          this.$http.post('/yii/bank/judge/queryjudge',{
            flag:2
          }).then(function (res) {
            console.log(res.data)
            this.Lists3 = res.data.data
            this.totalPage3 =Math.ceil(this.Lists3.length/this.pageSize3)
            this.totalPage3=this.totalPage3==0?1:this.totalPage3
            this.setCurrentPageDate3()
          }).catch(function (error) {
            console.log(error)
          })
        },
        getQuery4:function () {
          //多选题
          this.$http.post('/yii/bank/choosem/querychoose',{
            flag:2
          }).then(function (res) {
            console.log(res.data)
            this.Lists4 = res.data.data
            this.totalPage4 =Math.ceil(this.Lists4.length/this.pageSize4)
            this.totalPage4=this.totalPage4==0?1:this.totalPage4
            this.setCurrentPageDate4()
          }).catch(function (error) {
            console.log(error)
          })
        },
        getQuery5:function () {
          //程序题
          this.$http.post('/yii/bank/program/queryprogram',{
            flag:2
          }).then(function (res) {
            console.log(res.data)
            this.Lists5 = res.data.data
            this.totalPage5 =Math.ceil(this.Lists5.length/this.pageSize5)
            this.totalPage5=this.totalPage5==0?1:this.totalPage5
            this.setCurrentPageDate5()
          }).catch(function (error) {
            console.log(error)
          })
        },
        Click1:function (id) {
          this.$router.push({
            path:'/user/exercisre/pchoose',
            query:{
              id:id
            }
          })
        },
        Click2:function (id) {
          this.$router.push({
            path:'/user/exercise/pfill',
            query:{
              id:id
            }
          })
        },
        Click3:function (id) {
          this.$router.push({
            path:'/user/exercise/pjudge',
            query:{
              id:id
            }
          })
        },
        Click4:function (id) {
          this.$router.push({
            path:'/user/exercise/pchoosem',
            query:{
              id:id
            }
          })
        },
        Click5:function (id) {
          this.$router.push({
            path:'/user/exercise/pprogram',
            query:{
              id:id
            }
          })
        },

      },
      created(){
        this.getQuery1()
        this.getQuery2()
        this.getQuery3()
        this.getQuery4()
        this.getQuery5()
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
    font-size: 10px;
    padding: 7px 7px;
    border: 1px solid #E5E7E9;
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
    width: 50px;
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
