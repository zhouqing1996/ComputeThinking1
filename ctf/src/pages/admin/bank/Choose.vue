<template>
    <!--选择题-->
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadcrumb-css">
      <el-breadcrumb-item :to="{ path: '/admin/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>题库信息</el-breadcrumb-item>
      <el-breadcrumb-item>选择题</el-breadcrumb-item>
    </el-breadcrumb>
    <div><hr/></div>
    <div class="display1">
      <el-tabs type="border-card">
        <el-tab-pane>
          <span slot="label"><i class="el-icon-date"></i> 选择题列表</span>
          <div class="display2">
            <div class="searchmem">
              <div class="meeting" >
                <el-input v-model="inputname" placeholder="模糊查找" size="mini"></el-input>
              </div>
              <button class="btn3 el-icon-search" v-on:click="searchC()">搜索</button>
              <button class="btn3 el-icon-circle-plus-outline" @click="dialogFormVisibleadd = true">添加</button>
              <el-dialog title="添加选择题" :visible.sync="dialogFormVisibleadd">
                <el-form :model="addList">
                  <el-form-item label="题干" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addList.item" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="选项1" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addList.op1" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="选项2" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addList.op2" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="选项3" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addList.op3" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="选项4" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addList.op4" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="答案" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addList.ans" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="详解" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addList.tail" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="知识点" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addList.rem" auto-complete="off"></el-input>
                  </el-form-item>
                </el-form>
                <div slot="footer" style="align-content: center" class="dialog-footer">
                  <el-button type="primary" @click="addcQuestion(addList)">提交</el-button>
                  <el-button @click="Reset">重置</el-button>
                </div>
              </el-dialog>
              <button class="btn2 el-icon-circle-plus-outline" @click="getQuerycquestionY">有效题目</button>
              <button class="btn2 el-icon-circle-plus-outline" @click="getQuerycquestionN">无效题目</button>
              <button class="btn2 el-icon-circle-plus-outline" @click="getQuerycquestion">所有题目</button>
            </div>
            <table >
              <tr>
                <th>序号</th>
                <th>题编号 </th>
                <th>题干</th>
                <th>选项1</th>
                <th>选项2</th>
                <th>选项3</th>
                <th>选项4</th>
                <th>答案</th>
                <th>详解</th>
                <th>相关知识</th>
                <th>状态</th>
                <th>操作</th>
              </tr>
              <tr v-for=" (cQuestion,key) in currentPageData" :key="key">
                <td>{{ key+1 }}</td>
                <td>{{cQuestion.cqid}}</td>
                <td>
                  <el-tooltip placement="top" effect="light">
                    <div slot="content">{{cQuestion.cqitem}}</div>
                    <el-button class="btn1">{{cQuestion.cqid}}</el-button>
                  </el-tooltip>
                  <span v-if="cQuestion.cqstatus==1" @click="dialogFormVisiblechangeitem=true;changeList.id=cQuestion.cqid;item=cQuestion.cqitem" class="span2">修改题干</span>
                  <el-dialog title="修改题干" :visible.sync="dialogFormVisiblechangeitem">
                    <el-form :model="changeList">
                      <el-form-item label="题干内容1" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="item" auto-complete="off"></el-input>
                      </el-form-item>
                      <el-form-item label="题干内容" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="changeList.item" auto-complete="off"></el-input>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeChoose(1,changeList)">提交</el-button>
                      <el-button @click="dialogFormVisiblechangeitem=false">退出</el-button>
                    </div>
                  </el-dialog>
                </td>
                <td>
                  <el-tooltip placement="top" effect="light">
                    <div slot="content">{{cQuestion.cqcho.split('---')[0]}}</div>
                    <el-button class="btn1">{{cQuestion.cqid}}</el-button>
                  </el-tooltip>
                  <span v-if="cQuestion.cqstatus==1" @click="dialogFormVisiblechangeop1=true;changeList.id=cQuestion.cqid;item=cQuestion.cqcho.split('---')[0]" class="span2">修改选项</span>
                  <el-dialog title="修改选项1" :visible.sync="dialogFormVisiblechangeop1">
                    <el-form :model="changeList">
                      <el-form-item label="选项内容1" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="item" auto-complete="off"></el-input>
                      </el-form-item>
                      <el-form-item label="选项内容" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="changeList.op1" auto-complete="off"></el-input>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeChoose(2,changeList)">提交</el-button>
                      <el-button @click="dialogFormVisiblechangeop1=false">退出</el-button>
                    </div>
                  </el-dialog>
                </td>
                <td>
                  <el-tooltip placement="top" effect="light">
                    <div slot="content">{{cQuestion.cqcho.split('---')[1]}}</div>
                    <el-button class="btn1">{{cQuestion.cqid}}</el-button>
                  </el-tooltip>
                  <span v-if="cQuestion.cqstatus==1" @click="dialogFormVisiblechangeop2=true;changeList.id=cQuestion.cqid;item=cQuestion.cqcho.split('---')[1]" class="span2">修改选项</span>
                  <el-dialog title="修改选项2" :visible.sync="dialogFormVisiblechangeop2">
                    <el-form :model="changeList">
                      <el-form-item label="选项内容2" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="item" auto-complete="off"></el-input>
                      </el-form-item>
                      <el-form-item label="选项内容" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="changeList.op2" auto-complete="off"></el-input>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeChoose(3,changeList)">提交</el-button>
                      <el-button @click="dialogFormVisiblechangeop2=false">退出</el-button>
                    </div>
                  </el-dialog>
                </td>
                <td>
                  <el-tooltip placement="top" effect="light">
                    <div slot="content">{{cQuestion.cqcho.split('---')[2]}}</div>
                    <el-button class="btn1">{{cQuestion.cqid}}</el-button>
                  </el-tooltip>
                  <span v-if="cQuestion.cqstatus==1" @click="dialogFormVisiblechangeop3=true;changeList.id=cQuestion.cqid;item=cQuestion.cqcho.split('---')[2]" class="span2">修改选项</span>
                  <el-dialog title="修改选项3" :visible.sync="dialogFormVisiblechangeop3">
                    <el-form :model="changeList">
                      <el-form-item label="选项内容3" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="item" auto-complete="off"></el-input>
                      </el-form-item>
                      <el-form-item label="选项内容" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="changeList.op3" auto-complete="off"></el-input>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeChoose(4,changeList)">提交</el-button>
                      <el-button @click="dialogFormVisiblechangeop3=false">退出</el-button>
                    </div>
                  </el-dialog>
                </td>
                <td>
                  <el-tooltip placement="top" effect="light">
                    <div slot="content">{{cQuestion.cqcho.split('---')[3]}}</div>
                    <el-button class="btn1">{{cQuestion.cqid}}</el-button>
                  </el-tooltip>
                  <span v-if="cQuestion.cqstatus==1" @click="dialogFormVisiblechangeop4=true;changeList.id=cQuestion.cqid;item=cQuestion.cqcho.split('---')[3]" class="span2">修改选项</span>
                  <el-dialog title="修改选项4" :visible.sync="dialogFormVisiblechangeop4">
                    <el-form :model="changeList">
                      <el-form-item label="选项内容4" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="item" auto-complete="off"></el-input>
                      </el-form-item>
                      <el-form-item label="选项内容" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="changeList.op4" auto-complete="off"></el-input>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeChoose(5,changeList)">提交</el-button>
                      <el-button @click="dialogFormVisiblechangeop4=false">退出</el-button>
                    </div>
                  </el-dialog>
                </td>
                <td>
                  <el-tooltip placement="top" effect="light">
                    <div slot="content">{{cQuestion.cqans}}</div>
                    <el-button class="btn1">{{cQuestion.cqid}}</el-button>
                  </el-tooltip>
                  <!--<span v-if="cQuestion.cqstatus==1" @click="" class="span2">修改答案</span>-->
                  <span v-if="cQuestion.cqstatus==1" @click="dialogFormVisiblechangeans=true;changeList.id=cQuestion.cqid;item=cQuestion.cqans" class="span2">修改答案</span>
                  <el-dialog title="修改答案" :visible.sync="dialogFormVisiblechangeans">
                    <el-form :model="changeList">
                      <el-form-item label="选项内容4" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="item" auto-complete="off"></el-input>
                      </el-form-item>
                      <el-form-item label="选项内容" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="changeList.ans" auto-complete="off"></el-input>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeChoose(6,changeList)">提交</el-button>
                      <el-button @click="dialogFormVisiblechangeans=false">退出</el-button>
                    </div>
                  </el-dialog>
                </td>
                <td>
                  <el-tooltip placement="top" effect="light">
                    <div slot="content">{{cQuestion.cqtail}}</div>
                    <el-button class="btn1">{{cQuestion.cqid}}</el-button>
                  </el-tooltip>
                  <!--<span v-if="cQuestion.cqstatus==1" @click="" class="span2">修改详解</span>-->
                  <span v-if="cQuestion.cqstatus==1" @click="dialogFormVisiblechangetail=true;changeList.id=cQuestion.cqid;item=cQuestion.cqtail" class="span2">修改详解</span>
                  <el-dialog title="修改详解" :visible.sync="dialogFormVisiblechangetail">
                    <el-form :model="changeList">
                      <el-form-item label="选项内容4" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="item" auto-complete="off"></el-input>
                      </el-form-item>
                      <el-form-item label="选项内容" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="changeList.tail" auto-complete="off"></el-input>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeChoose(7,changeList)">提交</el-button>
                      <el-button @click="dialogFormVisiblechangetail=false">退出</el-button>
                    </div>
                  </el-dialog>
                </td>
                <td>
                  <el-tooltip placement="top" effect="light">
                    <div slot="content">{{cQuestion.cqrem}}</div>
                    <el-button class="btn1">{{cQuestion.cqid}}</el-button>
                  </el-tooltip>
                  <!--<span v-if="cQuestion.cqstatus==1" @click="" class="span2">修改知识点</span>-->
                  <span v-if="cQuestion.cqstatus==1" @click="dialogFormVisiblechangerem=true;changeList.id=cQuestion.cqid;item=cQuestion.cqtail" class="span2">修改知识点</span>
                  <el-dialog title="修改知识点" :visible.sync="dialogFormVisiblechangerem">
                    <el-form :model="changeList">
                      <el-form-item label="选项内容4" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="item" auto-complete="off"></el-input>
                      </el-form-item>
                      <el-form-item label="选项内容" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="changeList.rem" auto-complete="off"></el-input>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeChoose(8,changeList)">提交</el-button>
                      <el-button @click="dialogFormVisiblechangerem=false">退出</el-button>
                    </div>
                  </el-dialog>
                </td>
                <td v-if="cQuestion.cqstatus==1">有效</td>
                <td v-if="cQuestion.cqstatus==0">无效</td>
                <td>
                  <span v-if="cQuestion.cqstatus==0" @click="changeChoose(9,cQuestion.cqid)" class="span2">修改状态</span>
                  <span v-if="cQuestion.cqstatus==1"@click="deleteChoose(1,cQuestion.cqid)" class="span1"><i class="el-icon-delete">删除题目</i></span>
                  <span v-if="cQuestion.cqstatus==0" @click="deleteChoose(2,cQuestion.cqid)" class="span1"><i class="el-icon-delete">永久删除</i></span>
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
        name: "Choose",
      data(){
          return{
            formLabelWidth: '120px',
            //题库列表
            cQuestionList:[],
            //搜索
            inputname:'',
            //添加
            dialogFormVisibleadd:false,
            addList:{
              item:'',
              op1:'',
              op2:'',
              op3:'',
              op4:'',
              ans:'',
              tail:'',
              rem:''
            },
            //修改
            changeList:{
              id:'',
              item:'',
              op1:'',
              op2:'',
              op3:'',
              op4:'',
              ans:'',
              tail:'',
              rem:'',
              status:''
            },
            item:'',
            dialogFormVisiblechangeitem:false,
            dialogFormVisiblechangeop1:false,
            dialogFormVisiblechangeop2:false,
            dialogFormVisiblechangeop3:false,
            dialogFormVisiblechangeop4:false,
            dialogFormVisiblechangeans:false,
            dialogFormVisiblechangetail:false,
            dialogFormVisiblechangerem:false,
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
          this.currentPageData = this.cQuestionList.slice(begin, end)
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
          //获取选择题列表
        getQuerycquestion:function(){
          this.$http.post('/yii/bank/chooseq/querychoose',{
            flag:1
          }).then(function (res) {
            console.log(res.data)
            this.cQuestionList = res.data.data
            this.totalPage =Math.ceil(this.cQuestionList.length/this.pageSize)
            this.totalPage=this.totalPage==0?1:this.totalPage
            this.setCurrentPageDate()
          }).catch(function (error) {
            console.log(error)
          })
        },
        //获取有效选择题列表
        getQuerycquestionY:function(){
          this.$http.post('/yii/bank/chooseq/querychoose',{
            flag:2
          }).then(function (res) {
            console.log(res.data)
            this.cQuestionList = res.data.data
            this.totalPage =Math.ceil(this.cQuestionList.length/this.pageSize)
            this.totalPage=this.totalPage==0?1:this.totalPage
            this.setCurrentPageDate()
          }).catch(function (error) {
            console.log(error)
          })
        },
        //获取无效选择题列表
        getQuerycquestionN:function(){
          this.$http.post('/yii/bank/chooseq/querychoose',{
            flag:4
          }).then(function (res) {
            console.log(res.data)
            this.cQuestionList = res.data.data
            this.totalPage =Math.ceil(this.cQuestionList.length/this.pageSize)
            this.totalPage=this.totalPage==0?1:this.totalPage
            this.setCurrentPageDate()
          }).catch(function (error) {
            console.log(error)
          })
        },
          //搜索
        searchC:function () {
          console.log(this.name)
          this.$http.post('/yii/bank/chooseq/querychoose',{
            flag:3,
            name:this.inputname
          }).then(function (res) {
            console.log(res.data)
            this.cQuestionList = res.data.data
            this.totalPage =Math.ceil(this.cQuestionList.length/this.pageSize)
            this.totalPage=this.totalPage==0?1:this.totalPage
            this.setCurrentPageDate()
          }).catch(function (error) {
            console.log(error)
          })
        },
        //添加题库
        addcQuestion:function (List) {
          console.log(List)
          this.$http.post('/yii/bank/chooseq/addchoose',{
            qitem:List.item,
            op1:List.op1,
            op2:List.op2,
            op3:List.op3,
            op4:List.op4,
            ans:List.ans,
            tail:List.tail,
            rem:List.rem
          }).then(function (res) {
            console.log(res.data)
            if(res.data.message=="插入选择题成功")
            {
              this.getQuerycquestion()
              alert("插入选择题成功")
              this.dialogFormVisibleadd=false
              this.Reset()
            }
            else
            {
              alert(res.data.message)
              this.Reset()
            }
          })
        },
        //重置
        Reset:function () {
          this.addList.rem=""
          this.addList.tail=""
          this.addList.ans=""
          this.addList.op1=""
          this.addList.op2=""
          this.addList.op3=""
          this.addList.op4=""
          this.addList.item=""

        },
        //修改
        //1:题干
        //2：选项1
        //3：选项2
        //4：选项3
        //5：选项4
        //6：答案
        //7：详解
        //8：知识点
        //9:状态
        changeChoose:function (item,id) {
          console.log(item)
          if(item==1) {
            this.$http.post('/yii/bank/chooseq/change',{
              cid:this.changeList.id,
              flag:1,
              item:this.changeList.item,
            }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该选择题题干修改成功")
              {
                this.getQuerycquestion()
              }
              alert(res.data.message)
              this.dialogFormVisiblechangeitem=false
              this.changeList.id=""
              this.changeList.item=""
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==2) {
            this.$http.post('/yii/bank/chooseq/change',{
              cid:this.changeList.id,
              flag:2,
              top:1,
              op1:this.changeList.op1
            }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该选择题选项1修改成功")
              {
                this.getQuerycquestion()
              }
              alert(res.data.message)
              this.dialogFormVisiblechangeop1=false
              this.changeList.id=""
              this.changeList.op1=""
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==3){
            this.$http.post('/yii/bank/chooseq/change',{
              cid:this.changeList.id,
              flag:2,
              top:2,
              op2:this.changeList.op2
            }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该选择题选项2修改成功")
              {
                this.getQuerycquestion()
              }
              alert(res.data.message)
              this.dialogFormVisiblechangeop2=false
              this.changeList.id=""
              this.changeList.op2=""
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==4){
            this.$http.post('/yii/bank/chooseq/change',{
              cid:this.changeList.id,
              flag:2,
              top:3,
              op3:this.changeList.op3
            }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该选择题选项3修改成功")
              {
                this.getQuerycquestion()
              }
              alert(res.data.message)
              this.dialogFormVisiblechangeop3=false
              this.changeList.id=""
              this.changeList.op3=""
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==5){
            this.$http.post('/yii/bank/chooseq/change',{
              cid:this.changeList.id,
              flag:2,
              top:4,
              op4:this.changeList.op4
            }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该选择题选项4修改成功")
              {
                this.getQuerycquestion()
              }
              alert(res.data.message)
              this.dialogFormVisiblechangeop4=false
              this.changeList.id=""
              this.changeList.op4=""
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==6){
            this.$http.post('/yii/bank/chooseq/change',{
              cid:this.changeList.id,
              flag:3,
              ans:this.changeList.ans
            }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该选择题答案修改成功")
              {
                this.getQuerycquestion()
              }
              alert(res.data.message)
              this.dialogFormVisiblechangeans=false
              this.changeList.id=""
              this.changeList.ans=""
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==7){
            this.$http.post('/yii/bank/chooseq/change',{
              cid:this.changeList.id,
              flag:4,
              tail:this.changeList.tail
            }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该选择题详解修改成功")
              {
                this.getQuerycquestion()
              }
              alert(res.data.message)
              this.dialogFormVisiblechangetail=false
              this.changeList.id=""
              this.changeList.tail=""
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==8){
            this.$http.post('/yii/bank/chooseq/change',{
              cid:this.changeList.id,
              flag:5,
              rem:this.changeList.rem
            }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该选择题相关知识修改成功")
              {
                this.getQuerycquestion()
              }
              alert(res.data.message)
              this.dialogFormVisiblechangerem=false
              this.changeList.id=""
              this.changeList.tail=""
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==9){
            console.log(id)
            this.$http.post('/yii/bank/chooseq/change',{
              cid:id,
              flag:6
            }).then(function (res) {

              console.log(res.data)
              if(res.data.message=="该选择题状态修改成功")
              {
                this.getQuerycquestion()
              }
              alert(res.data.message)
            })
          }
          else{
            alert("输入错误")
          }
        },
        //删除
        //1:暂时删除
        //2：永久删除
        deleteChoose:function (item,id) {
          console.log(item)
          if(item==1)
          {
            this.$confirm("删除该用户选择题，是否继续？", "提示", {
              confirmButtonText: "确定",
              cancelButtonText: "取消",
              type: "warning"
            }).then(() => {
              this.$http.post('/yii/bank/chooseq/delete',{
                cid:id,
                flag:1
              }).then(function (res) {
                console.log(res.data)
                if(res.data.message=="该选择题删除成功")
                {
                  this.getQuerycquestion()
                }
                alert(res.data.message)
              })
            }).catch(function (error) {
              console.log(error)
            });
          }
          else if(item==2)
          {
            this.$confirm("永久删除该用户选择题，是否继续？", "提示", {
              confirmButtonText: "确定",
              cancelButtonText: "取消",
              type: "warning"
            }).then(() => {
              this.$http.post('/yii/bank/chooseq/delete',{
                cid:id,
                flag:2
              }).then(function (res) {
                console.log(res.data)
                if(res.data.message=="该选择题永久删除成功")
                {
                  this.getQuerycquestion()
                }
                alert(res.data.message)
              })
            }).catch(function (error) {
              console.log(error)
            });
          }
          else{
            alert("输入错误！")
          }
        }


      },
      created(){
          this.getQuerycquestion()
      }
    }
</script>

<style scoped>
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
