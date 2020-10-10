<template>
    <!--图书管理-->
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadcrumb-css">
      <el-breadcrumb-item :to="{ path: '/admin/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>书籍信息</el-breadcrumb-item>
    </el-breadcrumb>
    <div><hr/></div>
    <div class="display1">
      <el-tabs type="border-card">
        <el-tab-pane>
          <span slot="label"><i class="el-icon-date"></i> 图书列表</span>
          <div class="display2">
            <div class="searchmem">
              <div class="meeting" >
                <el-input v-model="inputname" placeholder="模糊查找" size="mini"></el-input>
              </div>
              <button class="btn3 el-icon-search" v-on:click="searchB()">搜索</button>
              <button class="btn3 el-icon-circle-plus-outline" @click="dialogFormVisibleadd = true">添加</button>
              <el-dialog title="添加图书" :visible.sync="dialogFormVisibleadd">
                <el-form :model="addList">
                  <el-form-item label="书名" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addList.name" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="出版社" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addList.publish" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="作者" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addList.author" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="关于" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addList.about" auto-complete="off"></el-input>
                  </el-form-item>
                </el-form>
                <div slot="footer" style="align-content: center" class="dialog-footer">
                  <el-button type="primary" @click="addBook(addList)">提交</el-button>
                  <el-button @click="Reset">重置</el-button>
                </div>
              </el-dialog>
              <button class="btn2 el-icon-circle-plus-outline" @click="getBookList(1)">有效图书</button>
              <button class="btn2 el-icon-circle-plus-outline" @click="getBookList(2)">无效图书</button>
              <button class="btn2 el-icon-circle-plus-outline" @click="getBookList(3)">所有图书</button>
            </div>
            <table >
              <tr>
                <th>序号</th>
                <th>书编号 </th>
                <th>书名</th>
                <th>出版社</th>
                <th>作者</th>
                <th>关于</th>
                <th>状态</th>
                <th>操作</th>
              </tr>
              <tr v-for=" (Book,key) in currentPageData" :key="key">
                <td>{{ key+1 }}</td>
                <td>{{Book.bookid}}</td>
                <td>{{Book.bookname}}
                  <span v-if="Book.status==1" @click="dialogFormVisiblechangName=true;changeList.id=Book.bookid;item=Book.bookname" class="span2">修改书名</span>
                  <el-dialog title="修改书名" :visible.sync="dialogFormVisiblechangName">
                    <el-form :model="changeList">
                      <el-form-item label="书名内容1" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="item" auto-complete="off"></el-input>
                      </el-form-item>
                      <el-form-item label="书名内容" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="changeList.name" auto-complete="off"></el-input>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeBook(1,changeList)">提交</el-button>
                      <el-button @click="dialogFormVisiblechangName=false">退出</el-button>
                    </div>
                  </el-dialog>
                </td>
                <td>
                  {{Book.publish}}
                  <span v-if="Book.status==1" @click="dialogFormVisiblechangePublish=true;changeList.id=Book.bookid;item=Book.publish" class="span2">修改出版社</span>
                  <el-dialog title="修改出版社" :visible.sync="dialogFormVisiblechangePublish">
                    <el-form :model="changeList">
                      <el-form-item label="原始出版社" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="item" auto-complete="off"></el-input>
                      </el-form-item>
                      <el-form-item label="修改出版社" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="changeList.publish" auto-complete="off"></el-input>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeBook(2,changeList)">提交</el-button>
                      <el-button @click="dialogFormVisiblechangePublish=false">退出</el-button>
                    </div>
                  </el-dialog>
                </td>
                <td>
                  {{Book.author}}
                  <span v-if="Book.status==1" @click="dialogFormVisiblechangeAuthor=true;changeList.id=Book.bookid;item=Book.author" class="span2">修改作者</span>
                  <el-dialog title="修改作者" :visible.sync="dialogFormVisiblechangeAuthor">
                    <el-form :model="changeList">
                      <el-form-item label="原始作者" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="item" auto-complete="off"></el-input>
                      </el-form-item>
                      <el-form-item label="修改作者" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="changeList.author" auto-complete="off"></el-input>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeBook(3,changeList)">提交</el-button>
                      <el-button @click="dialogFormVisiblechangeAuthor=false">退出</el-button>
                    </div>
                  </el-dialog>
                </td>
                <td>
                  <el-tooltip placement="top" effect="light">
                  <div slot="content">{{Book.about}}</div>
                  <el-button class="btn1">关于</el-button>
                  </el-tooltip>
                  <span v-if="Book.status==1" @click="dialogFormVisiblechangeAbout=true;changeList.id=Book.bookid;item=Book.about" class="span2">修改关于</span>
                  <el-dialog title="修改关于" :visible.sync="dialogFormVisiblechangeAbout">
                    <el-form :model="changeList">
                      <el-form-item label="原始关于" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="item" auto-complete="off"></el-input>
                      </el-form-item>
                      <el-form-item label="修改关于" :label-width="formLabelWidth">
                        <el-input style="width: 350px;" v-model="changeList.about" auto-complete="off"></el-input>
                      </el-form-item>
                    </el-form>
                    <div slot="footer" style="align-content: center" class="dialog-footer">
                      <el-button type="primary" @click="changeBook(4,changeList)">提交</el-button>
                      <el-button @click="dialogFormVisiblechangeAbout=false">退出</el-button>
                    </div>
                  </el-dialog>
                </td>
                <td v-if="Book.status==1">有效</td>
                <td v-if="Book.status==0">无效</td>
                <td>
                  <span v-if="Book.status==0" @click="changeBook(5,Book.bookid)" class="span2">修改状态</span>
                  <span v-if="Book.status==1"@click="deleteBook(1,Book.bookid)" class="span1"><i class="el-icon-delete">删除图书</i></span>
                  <span v-if="Book.status==0" @click="deleteBook(2,Book.bookid)" class="span1"><i class="el-icon-delete">永久删除</i></span>
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
        name: "Book",
      data(){
          return{
            formLabelWidth: '120px',
            inputname:'',
            bookList:[],
            addList:{
              name:'',
              publish:'',
              author:'',
              about:''
            },
            dialogFormVisibleadd:false,
            dialogFormVisiblechangName:false,
            dialogFormVisiblechangePublish:false,
            dialogFormVisiblechangeAuthor:false,
            dialogFormVisiblechangeAbout:false,
            changeList:{
              id:'',
              name:'',
              publish:'',
              author:'',
              about:''
            },
            item:'',
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
          this.currentPageData = this.bookList.slice(begin, end)
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
        searchB:function()
        {
          console.log(this.inputname)
          if(this.inputname=="")
          {
            alert("请输入需要查询的内容")
            return
          }
          this.$http.post('/yii/book/book/querybook',{
            flag:4,
            name:this.inputname
          }).then(function (res) {
            console.log(res.data)
            this.bookList = res.data.data
            this.totalPage =Math.ceil(this.bookList.length/this.pageSize)
            this.totalPage=this.totalPage==0?1:this.totalPage
            this.setCurrentPageDate()
          })
        },
          getBookList:function(item)
          {
            console.log(item)
            if(item==1)
            {
              //有效图书
              this.$http.post('/yii/book/book/querybook',{
                flag:1
              }).then(function (res) {
                console.log(res.data)
                this.bookList = res.data.data
                this.totalPage =Math.ceil(this.bookList.length/this.pageSize)
                this.totalPage=this.totalPage==0?1:this.totalPage
                this.setCurrentPageDate()
              })
            }
            else if(item==2)
            {
              //无效图书
              this.$http.post('/yii/book/book/querybook',{
                flag:2
              }).then(function (res) {
                console.log(res.data)
                this.bookList = res.data.data
                this.totalPage =Math.ceil(this.bookList.length/this.pageSize)
                this.totalPage=this.totalPage==0?1:this.totalPage
                this.setCurrentPageDate()
              })
            }
            else if(item==3)
            {
              //所有图书
              this.$http.post('/yii/book/book/querybook',{
                flag:3
              }).then(function (res) {
                console.log(res.data)
                this.bookList = res.data.data
                this.totalPage =Math.ceil(this.bookList.length/this.pageSize)
                this.totalPage=this.totalPage==0?1:this.totalPage
                this.setCurrentPageDate()
              })
            }
            else
            {
              alert("错误")
            }
          },
        addBook:function () {
          console.log(this.addList)
          this.$http.post('/yii/book/book/addbook',
            {
              bookname:this.addList.name,
              publish:this.addList.publish,
              author:this.addList.author,
              about:this.addList.about
            }).then(function (res) {
              console.log(res.data)
            if(res.data.message=="图书添加成功")
            {
              this.getBookList(3)
              this.dialogFormVisibleadd=false
              this.Reset()
            }
            alert(res.data.message)
          })
        },
        Reset:function () {
          this.addList.name=""
          this.addList.publish=""
          this.addList.author=""
          this.addList.about=""
        },
        //修改
        //1：书名
        //2：出版社
        //3：作者
        //4:关于
        //5：状态
        changeBook:function (item,id) {
          console.log(item)
          console.log(this.changeList)
          if(item==1)
          {
            this.$http.post('/yii/book/book/changebook',{
              bookid:this.changeList.id,
              flag:1,
              bookname:this.changeList.name
            }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该图书名修改成功")
              {
                this.getBookList(3)
              }
              this.dialogFormVisiblechangName=false
              alert(res.data.message)
              console.log(res.data.message)
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==2)
          {
            this.$http.post('/yii/book/book/changebook',{
              bookid:this.changeList.id,
              flag:2,
              publish:this.changeList.publish
            }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该图书出版社修改成功")
              {
                this.getBookList(3)
              }
              this.dialogFormVisiblechangePublish=false
              alert(res.data.message)
              console.log(res.data.message)
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==3)
          {
            this.$http.post('/yii/book/book/changebook',{
              bookid:this.changeList.id,
              flag:3,
              author:this.changeList.author
            }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该图书作者修改成功")
              {
                this.getBookList(3)
              }
              this.dialogFormVisiblechangeAuthor=false
              alert(res.data.message)
              console.log(res.data.message)
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==4)
          {
            this.$http.post('/yii/book/book/changebook',{
              bookid:this.changeList.id,
              flag:4,
              about:this.changeList.about
            }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该图书关于修改成功")
              {
                this.getBookList(3)
              }
              this.dialogFormVisiblechangeAbout=false
              alert(res.data.message)
              console.log(res.data.message)
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==5)
          {
            this.$http.post('/yii/book/book/changebook',{
              bookid:id,
              flag:5,
            }).then(function (res) {
              console.log(res.data)
              if(res.data.message=="该图书状态修改成功")
              {
                this.getBookList(3)
              }
              alert(res.data.message)
              console.log(res.data.message)
            }).catch(function (error) {
              console.log(error)
            })
          }
          else
          {
            alert("错误")
          }
        },
        deleteBook(item,id)
        {
          console.log(item)
          if(item==1)
          {
            this.$confirm("删除该书籍，是否继续？", "提示", {
              confirmButtonText: "确定",
              cancelButtonText: "取消",
              type: "warning"
            }).then(() => {
              this.$http.post('/yii/book/book/deletebook',{
                flag:1,
                bookid:id
              }).then(function (res) {
                console.log(res.data)
                if(res.data.message=="该图书已删除")
                {
                  this.getBookList(3)
                }
                alert(res.data.message)
              })
            }).catch(function (error) {
              console.log(error)
            })
          }
          else if(item==2)
          {
            this.$confirm("永久删除该书籍，是否继续？", "提示", {
              confirmButtonText: "确定",
              cancelButtonText: "取消",
              type: "warning"
            }).then(() => {
              this.$http.post('/yii/book/book/deletebook',{
                flag:2,
                bookid:id
              }).then(function (res) {
                console.log(res.data)
                if(res.data.message=="该图书已永久删除")
                {
                  this.getBookList(3)
                }
                alert(res.data.message)
              })
            }).catch(function (error) {
              console.log(error)
            })

          }
          else
          {
            alert("错误")
          }
        }
      },
      created(){
        this.getBookList(3)
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
