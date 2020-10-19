<template>
    <div class="nnn">
      <el-row class="tac">
        <el-col :span="3">
          <el-menu
            class="el-menu-vertical-demo"
            >
            <el-menu-item index="1" v-on:click="addCClick">
              <i class="el-icon-menu"></i>
              <span slot="title"  >单选题</span>
            </el-menu-item>
            <el-menu-item index="2" v-on:click="addFClick">
              <i class="el-icon-menu"></i>
              <span slot="title" >填空题</span>
            </el-menu-item>
            <el-menu-item index="3" v-on:click="addJClick">
              <i class="el-icon-menu"></i>
              <span slot="title" >判断题</span>
            </el-menu-item>
            <el-menu-item index="4" v-on:click="addCMClick">
              <i class="el-icon-chat-dot-round"></i>
              <span slot="title" >多选题</span>
            </el-menu-item>
            <el-menu-item index="5" v-on:click="addPClick">
              <i class="el-icon-menu"></i>
              <span slot="title" >程序题</span>
            </el-menu-item>
          </el-menu>
        </el-col>
        <el-col :span="12">
          <div>
            <div>
              试卷名称：<input type="text" v-model="exname" placeholder="试卷名称"/>
              <hr/>
            </div>
            <div class="create">
              <!--单选题-->
              <el-form>
                <h3>一、选择题</h3>
                <el-form-item v-for="(item,index) in CList" :key="index">
                  <span>({{index+1}})</span>
                  题   干：<el-input v-model="item.cqitem" placeholder="题目题干" class="input"></el-input>
                  <el-button @click.prevent="deleteCClick(index)" type="danger" >删除</el-button><br>
                  选项  一：<el-input v-model="item.cqcho1" placeholder="题目选项一" class="input"></el-input><br>
                  选项  二：<el-input v-model="item.cqcho2" placeholder="题目选项二" class="input"></el-input><br>
                  选项  三：<el-input v-model="item.cqcho3" placeholder="题目选项三" class="input"></el-input><br>
                  选项  四：<el-input v-model="item.cqcho4"rem placeholder="题目选项四" class="input"></el-input><br>
                  相关知识：<el-input v-model="item.cqrem" placeholder="题目相关知识" class="input"></el-input><br>
                  答    案：<el-input v-model="item.cqans" placeholder="题目答案" class="input"></el-input><br>
                  详    解：<el-input v-model="item.cqtail" placeholder="题目详解" class="input"></el-input><br>
                </el-form-item>
              </el-form>
              <!--填空题-->
              <el-form>
                <h3>二、填空题</h3>
                <el-form-item v-for="(item,index) in FList" :key="index">
                  <span>（{{index+1}}）</span>
                  题  干：<el-input v-model="item.fitem" placeholder="题目题干" class="input"></el-input>
                  <el-button @click.prevent="deleteFClick(index)" type="danger" >删除</el-button><br>
                  相关知识：<el-input v-model="item.frem" placeholder="题目相关知识" class="input"></el-input><br>
                  答    案：<el-input v-model="item.fans" placeholder="题目答案" class="input"></el-input><br>
                  详    解：<el-input v-model="item.ftail" placeholder="题目详解" class="input"></el-input><br>
                </el-form-item>
              </el-form>
              <!--判断题-->
              <el-form>
                <h3>三、判断题</h3>
                <el-form-item v-for="(item,index) in JList" :key="index">
                  <span>（{{index+1}}）</span>
                  题    干：<el-input v-model="item.jitem" placeholder="题目题干" class="input"></el-input>
                  <el-button @click.prevent="deleteJClick(index)" type="danger" >删除</el-button><br>
                  相关知识：<el-input v-model="item.jrem" placeholder="题目相关知识" class="input"></el-input><br>
                  答    案：<el-input v-model="item.jans" placeholder="题目答案" class="input"></el-input><br>
                  详    解：<el-input v-model="item.jtail" placeholder="题目详解" class="input"></el-input><br>
                </el-form-item>
              </el-form>
              <!--多选题-->
              <el-form>
                <h3>四、多选题</h3>
                <el-form-item v-for="(item,index) in CMList" :key="index">
                  <span>（{{index+1}}）</span>
                  题  干：<el-input v-model="item.mitem" placeholder="题目题干" class="input"></el-input>
                  <el-button @click.prevent="deleteCMClick(index)" type="danger" >删除</el-button><br>
                  选项  一：<el-input v-model="item.mcho1" placeholder="题目选项一" class="input"></el-input><br>
                  选项  二：<el-input v-model="item.mcho2" placeholder="题目选项二" class="input"></el-input><br>
                  选项  三：<el-input v-model="item.mcho3" placeholder="题目选项三" class="input"></el-input><br>
                  选项  四：<el-input v-model="item.mcho4"rem placeholder="题目选项四" class="input"></el-input><br>
                  相关知识：<el-input v-model="item.mrem" placeholder="题目相关知识" class="input"></el-input><br>
                  答    案：<el-input v-model="item.mans" placeholder="题目答案" class="input"></el-input><br>
                  详    解：<el-input v-model="item.mtail" placeholder="题目详解" class="input"></el-input><br>
                  <span>多选题答案选项用“---”连接，如答案为ABC 则显示在A---B---C</span>
                </el-form-item>
              </el-form>
              <!--程序题-->
              <el-form>
                <h3>五、程序题</h3>
                <el-form-item v-for="(item,index) in PList" :key="index">
                  <span>（{{index+1}}）</span>
                  题   干：<el-input v-model="item.pitem" placeholder="题目题干" class="input"></el-input>
                  <el-button @click.prevent="deletePClick(index)" type="danger" >删除</el-button><br>
                  相关知识：<el-input v-model="item.prem" placeholder="题目相关知识" class="input"></el-input><br>
                  答    案：<el-input v-model="item.pans" placeholder="题目答案" class="input"></el-input><br>
                  详    解：<el-input v-model="item.ptail" placeholder="题目详解" class="input"></el-input><br>
                </el-form-item>
              </el-form>
            </div>
            <button class="btn2 el-icon-circle-plus-outline" @click="createOK">完成创建</button>
          </div>
        </el-col>
        <el-col :span="1">
          <el-divider direction="vertical"></el-divider>
        </el-col>
        <el-col :span="8" >
          <div class="yulan">
            <h3>一、选择题</h3>
              <div v-if="CList.length >0">
                  <span v-for="(c,key1) in CList":key="key1" >
                  <span class="item">({{key1+1}}){{c.cqitem}}</span><br>
                    <el-radio-group >
                      <el-radio :label="3">{{c.cqcho1}}</el-radio><br>
                      <el-radio :label="6">{{c.cqcho2}}</el-radio><br>
                      <el-radio :label="9">{{c.cqcho3}}</el-radio><br>
                      <el-radio :label="10">{{c.cqcho4}}</el-radio><br>
                    </el-radio-group><br>
                  <span class="ans" >答案：{{c.cqans}}</span><br>
                  <span class="tail">详解：{{c.cqtail}}</span><br>
                  <span class="rem">相关知识：{{c.cqrem}}</span><br>
                </span>
              </div>
            <h3>二、填空题</h3>
              <div v-if="FList.length>0">
                  <span v-for="(c,key1) in FList":key="key1" >
                  <span class="item">({{key1+1}}){{c.fitem}}</span><br>
                  <span class="ans" >答案：{{c.fans}}</span><br>
                  <span class="tail">详解：{{c.ftail}}</span><br>
                  <span class="rem">相关知识：{{c.frem}}</span><br>
                </span>
              </div>
            <h3>三、判断题</h3>
              <div v-if="JList.length>0">
                  <span v-for="(c,key1) in JList":key="key1" >
                  <span class="item">({{key1+1}}){{c.jitem}}</span><br>
                  <span class="ans" >答案：{{c.jans}}</span><br>
                  <span class="tail">详解：{{c.jtail}}</span><br>
                  <span class="rem">相关知识：{{c.jrem}}</span><br>
                </span>
              </div>
            <h3>四、多选题</h3>
              <div v-if="CMList.length>0">
                  <span v-for="(c,key1) in CMList":key="key1" >
                  <span class="item">({{key1+1}}){{c.mitem}}</span><br>
                  <el-radio-group >
                      <el-radio :label="3">{{c.mcho1}}</el-radio><br>
                      <el-radio :label="6">{{c.mcho2}}</el-radio><br>
                      <el-radio :label="9">{{c.mcho3}}</el-radio><br>
                      <el-radio :label="10">{{c.mcho4}}</el-radio><br>
                    </el-radio-group><br>
                  <span class="ans" >答案：{{c.mans}}</span><br>
                  <span class="tail">详解：{{c.mtail}}</span><br>
                  <span class="rem">相关知识：{{c.mrem}}</span><br>
                </span>
              </div>
            <h3>五、程序题</h3>
              <div v-if="PList.length>0">
                  <span v-for="(c,key1) in PList":key="key1" >
                  <span class="item">({{key1+1}}){{c.pitem}}</span><br>
                  <span class="ans" >答案：{{c.pans}}</span><br>
                  <span class="tail">详解：{{c.ptail}}</span><br>
                  <span class="rem">相关知识：{{c.prem}}</span><br>
                </span>
              </div>
          </div>
        </el-col>
      </el-row>
    </div>
</template>

<script>

    export default {
        name: "Newcreate",
      data(){
          return{
            exname:'',
            CList:[],
            FList:[],
            JList:[],
            CMList:[],
            PList:[],
          }
      },
      methods:{
          //添加选择题
          addCClick:function(){
            this.CList.push({
              cqitem:'',
              cqcho1:'',
              cqcho2:'',
              cqcho3:'',
              cqcho4:'',
              cqans:'',
              cqrem:'',
              cqtail:''
            })
          },
          deleteCClick:function (id) {
            this.CList.splice(id,1)
          },
        addFClick:function () {
          this.FList.push({
            fitem:'',
            fans:'',
            frem:'',
            ftail:''
          })
        },
        deleteFClick:function (id) {
          this.FList.splice(id,1)
        },
        addJClick:function () {
          this.JList.push({
            jitem:'',
            jans:'',
            jrem:'',
            jtail:''
          })
        },
        deleteJClick:function (id) {
          this.JList.splice(id,1)
        },
        addCMClick:function () {
          this.CMList.push({
            mitem:'',
            mcho1:'',
            mcho2:'',
            mcho3:'',
            mcho4:'',
            mans:'',
            mrem:'',
            mtail:''
          })
        },
        deleteCMClick:function (id) {
          this.CMList.splice(id,1)
        },
        addPClick:function () {
          this.PList.push({
            pitem:'',
            pans:'',
            prem:'',
            ptail:''
          })
        },
        deletePClick:function (id) {
          this.PList.splice(id,1)
        },
        createOK:function () {
            if(this.exname.length==0)
            {
              this.$alert('试卷没有名称', '警告', {
                confirmButtonText: '确定',})
            }
            else{
              let lc = this.CList.length;
              let lj =this.JList.length;
              let lp=this.PList.length;
              let lcm = this.CMList.length;
              let lf = this.FList.length;
              if(lc==0 || lj==0|| lp ==0 || lcm==0 ||lf==0)
              {
                this.$alert('试卷不完整，没有将五类题目都创建', '警告', {
                  confirmButtonText: '确定',})
              }
              else{
                this.$http.post('/yii/exam/index/addexam',{
                  exname:this.exname,
                  flag:3,
                  CList:this.CList,
                  FList:this.FList,
                  JList:this.JList,
                  PList:this.PList,
                  CMList:this.CMList,
                  auth:this.$store.getters.getsId
                }).then(function (res) {
                  console.log(res.data)
                  if(res.data.message=="完成创建试卷")
                  {
                    alert(res.data.message)
                    this.$router.push({path:'/admin/exam/create'})
                    this.CList =[]
                    this.FList=[]
                    this.JList =[]
                    this.CMList =[]
                    this.PList =[]
                  }
                  else {
                    // alert(res.data.message)
                  }
                })
              }
            }

        }
      },
      created(){

      }
    }
</script>

<style scoped>
  .el-divider--vertical {
    display: inline-block;
    width: 1px;
    height: 600px;
    margin: 0 8px;
    vertical-align: middle;
    position: relative;
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
  .input{
    outline-style: none ;
    border: 0px;
    border-radius: 3px;
    padding: 1px 1px;
    width: 300px;
    font-size: 14px;
    /*font-weight: 700;*/
    /*font-family: "Microsoft soft";*/
  }
  .input:focus{
    border-color: #66afe9;
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
  }
  .nnn{
    width: 100%;
    height: 650px;
  }
  .item{
    margin-left: 20px;
    margin-top: 10px;
    font-size: 16px;
    width: auto;
  }
  .ans{
    font-size: 14px;
    width: auto;
  }
  .tail{
    font-size: 12px;
  }
  .rem{
    font-size: 10px;
  }
  /*预览试卷*/
  .yulan{
    text-align: left;
  }
  /*创建试卷*/
  .create{
    text-align: left;
    padding: 5px;
    margin-left: 5px;
  }
</style>
