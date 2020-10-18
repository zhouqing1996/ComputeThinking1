<template>
    <div class="nnn">
      <el-row class="tac">
        <el-col :span="4">
          <el-menu
            class="el-menu-vertical-demo"
            >
            <el-menu-item index="1">
              <i class="el-icon-menu"></i>
              <span slot="title" v-on:click="addCClick" >单选题</span>
            </el-menu-item>
            <el-menu-item index="2">
              <i class="el-icon-menu"></i>
              <span slot="title" v-on:click="addFClick">填空题</span>
            </el-menu-item>
            <el-menu-item index="3">
              <i class="el-icon-menu"></i>
              <span slot="title" v-on:click="addJClick">判断题</span>
            </el-menu-item>
            <el-menu-item index="4">
              <i class="el-icon-chat-dot-round"></i>
              <span slot="title" v-on:click="addCMClick">多选题</span>
            </el-menu-item>
            <el-menu-item index="5">
              <i class="el-icon-menu"></i>
              <span slot="title" v-on:click="addPClick">程序题</span>
            </el-menu-item>
          </el-menu>
        </el-col>
        <el-col :span="16">
          <div>
            <div>
              试卷名称：<input type="text" v-model="exname" placeholder="试卷名称"/>
              <hr/>
            </div>
            <div>
              <!--单选题-->
              <el-form>
                <el-form-item v-for="(item,index) in CList" :key="index">
                  <h3>选择题{{index+1}}</h3>
                  题干：<el-input v-model="item.cqitem" placeholder="题目题干" class="input"></el-input><br>
                  选项一：<el-input v-model="item.cqcho1" placeholder="题目选项一" class="input"></el-input><br>
                  选项二：<el-input v-model="item.cqcho2" placeholder="题目选项二" class="input"></el-input><br>
                  选项三：<el-input v-model="item.cqcho3" placeholder="题目选项三" class="input"></el-input><br>
                  选项四：<el-input v-model="item.cqcho4"rem placeholder="题目选项四" class="input"></el-input><br>
                  相关知识：<el-input v-model="item.cqrem" placeholder="题目相关知识" class="input"></el-input><br>
                  答案：<el-input v-model="item.cqans" placeholder="题目答案" class="input"></el-input><br>
                  详解：<el-input v-model="item.cqtail" placeholder="题目详解" class="input"></el-input><br>
                  <el-button @click.prevent="deleteCClick(index)" type="danger" class="input">删除</el-button><br>
                </el-form-item>
              </el-form>
              <!--填空题-->
              <el-form>
                <el-form-item v-for="(item,index) in FList" :key="index">
                  <h3>填空题{{index+1}}</h3>
                  题干：<el-input v-model="item.fitem" placeholder="题目题干" class="input"></el-input><br>
                  相关知识：<el-input v-model="item.frem" placeholder="题目相关知识" class="input"></el-input><br>
                  答案：<el-input v-model="item.fans" placeholder="题目答案" class="input"></el-input><br>
                  详解：<el-input v-model="item.ftail" placeholder="题目详解" class="input"></el-input><br>
                  <el-button @click.prevent="deleteFClick(index)" type="danger" class="input">删除</el-button><br>
                </el-form-item>
              </el-form>
              <!--判断题-->
              <el-form>
                <el-form-item v-for="(item,index) in JList" :key="index">
                  <h3>判断题{{index+1}}</h3>
                  题干：<el-input v-model="item.jitem" placeholder="题目题干" class="input"></el-input><br>
                  相关知识：<el-input v-model="item.jrem" placeholder="题目相关知识" class="input"></el-input><br>
                  答案：<el-input v-model="item.jans" placeholder="题目答案" class="input"></el-input><br>
                  详解：<el-input v-model="item.jtail" placeholder="题目详解" class="input"></el-input><br>
                  <el-button @click.prevent="deleteJClick(index)" type="danger" class="input">删除</el-button><br>
                </el-form-item>
              </el-form>
              <!--多选题-->
              <el-form>
                <el-form-item v-for="(item,index) in CMList" :key="index">
                  <h3>多选题{{index+1}}</h3>
                  题干：<el-input v-model="item.mitem" placeholder="题目题干" class="input"></el-input><br>
                  选项一：<el-input v-model="item.mcho1" placeholder="题目选项一" class="input"></el-input><br>
                  选项二：<el-input v-model="item.mcho2" placeholder="题目选项二" class="input"></el-input><br>
                  选项三：<el-input v-model="item.mcho3" placeholder="题目选项三" class="input"></el-input><br>
                  选项四：<el-input v-model="item.mcho4"rem placeholder="题目选项四" class="input"></el-input><br>
                  相关知识：<el-input v-model="item.mrem" placeholder="题目相关知识" class="input"></el-input><br>
                  答案：<el-input v-model="item.mans" placeholder="题目答案" class="input"></el-input><br>
                  详解：<el-input v-model="item.mtail" placeholder="题目详解" class="input"></el-input><br>
                  <el-button @click.prevent="deleteCMClick(index)" type="danger" class="input">删除</el-button><br>
                </el-form-item>
              </el-form>
              <!--程序题-->
              <el-form>
                <el-form-item v-for="(item,index) in PList" :key="index">
                  <h3>程序题{{index+1}}</h3>
                  题干：<el-input v-model="item.pitem" placeholder="题目题干" class="input"></el-input><br>
                  相关知识：<el-input v-model="item.prem" placeholder="题目相关知识" class="input"></el-input><br>
                  答案：<el-input v-model="item.pans" placeholder="题目答案" class="input"></el-input><br>
                  详解：<el-input v-model="item.ptail" placeholder="题目详解" class="input"></el-input><br>
                  <el-button @click.prevent="deletePClick(index)" type="danger" class="input">删除</el-button><br>
                </el-form-item>
              </el-form>
            </div>
            <button class="btn2 el-icon-circle-plus-outline" >完成创建</button>
          </div>
        </el-col>
        <el-col :span="1">
          <el-divider direction="vertical"></el-divider>
        </el-col>
        <el-col :span="3" >
          新的
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
    width: 350px;
  }
  .nnn{
    width: 100%;
    height: 650px;
  }
</style>
