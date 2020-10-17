<template>
    <!--查看试卷-->
  <div id="waimian">
    <div>
      <h1>{{examList.id}}:<strong>{{examList.exname}}</strong></h1>
      <p><i class="el-icon-s-custom"></i>试卷创建人：{{examList.exUser}}  ||<i class="el-icon-date"></i>创建时间：{{examList.exCreateTime}}</p>
      <hr/>
      <h2>一、选择题</h2>
      <div>
      <span v-for="(c,key1) in chooseqList":key="key1">
      <li class="item">({{key1+1}}){{c.cqitem}}<br>
        <input type="radio"  value="">（A）{{c.cqcho.split('---')[0]}}<br>
        <input type="radio"  value="">（B）{{c.cqcho.split('---')[1]}}<br>
        <input type="radio"  value="">（C）{{c.cqcho.split('---')[2]}}<br>
        <input type="radio"  value="">（D）{{c.cqcho.split('---')[3]}}<br>
      </li>
      <p class="ans">答案：{{c.cqans}}</p>
      <p class="tail">详解：{{c.cqtail}}</p>
      <p class="rem">相关知识点：{{c.cqrem}}</p>
    </span>
      </div>
      <hr/>
      <h2>二、填空题</h2>
      <div>
      <span v-for="(f,key2) in fillqList":key="key2">
      <li class="item">({{key2+1}}){{f.fqitem}}<br>
        <input type="text" value=""><br>
      </li>

      <p class="ans">答案：{{f.fqans}}</p>
      <p class="tail">详解：{{f.fqtail}}</p>
      <p class="rem">相关知识点：{{f.fqrem}}</p>
    </span>
      </div>
      <hr/>
      <h2>三、判断题</h2>
      <div>
      <span v-for="(j,keyj) in judgeList":key="keyj">
      <li class="item">({{keyj+1}}){{j.jqitem}}<br>
        <input type="text" value=""><br>
      </li>
      <p class="ans">答案：{{j.jqans}}</p>
      <p class="tail">详解：{{j.jqtail}}</p>
      <p class="rem">相关知识点：{{j.jqrem}}</p>
    </span>
      </div>
      <hr/>
      <h2>四、多选题</h2>
      <div>
      <span v-for="(m,keym) in choosemList":key="keym">
      <li class="item">({{keym+1}}){{m.mqitem}}<br>
        <input type="text" value=""><br>
      </li>

      <p class="ans">答案：{{m.mqans}}</p>
      <p class="tail">详解：{{m.mqtail}}</p>
      <p class="rem">相关知识点：{{m.mqrem}}</p>
    </span>
      </div>
      <hr/>
      <h2>五、程序题</h2>
      <div>
      <span v-for="(p,key3) in programqList":key="key3">
        <hr/>
        ({{key3+1}})<strong>题目：{{p.pqitem}}</strong>
        <p class="ans">答案：{{p.pqans}}</p>
        <p class="tail">详解：{{p.pqtail}}</p>
        <p class="rem">相关知识点：{{p.pqrem}}</p>
      </span>
      </div>
    </div>
    <div>
      <button class="btn2" @click="back">返回</button>
    </div>
  </div>
</template>

<script>
    export default {
        name: "Viewexam",
      data(){
          return{
            examList:{
              id:'',
              exname:'',
              exUser:'',
              exCreateTime:'',
            },
            chooseqList:[],
            fillqList:[],
            judgeList:[],
            choosemList:[],
            programqList:[],
          }
      },
      methods:{
        back:function(){
          this.$router.push({
            path:'/admin/exam/create',
          })
        },
        getView(id){
          let that =this
          this.$http.post('/yii/exam/exam/view',{
            id:id
          }).then(function (res) {
            console.log(res.data)
            that.examList.exname=res.data.data[0]
            that.examList.exUser=res.data.data[1].data.username
            that.examList.exCreateTime=res.data.data[2]
            that.chooseqList=res.data.data[3]
            that.fillqList=res.data.data[4]
            that.programqList=res.data.data[5]
            that.judgeList =res.data.data[6]
            that.choosemList=res.data.data[7]
          })
        }
      },
      created(){
          this.examList.id =this.$route.query.id
        console.log(this.examList.id)
        this.getView(this.examList.id)
      },
    }
</script>

<style scoped>
  #waimian {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    color: #2c3e50;
    margin-top: 5px;
    text-align: left;
    padding: 30px;
  }
  .item{
    /*background-color: sandybrown;*/
    margin-left: 20px;
    margin-top: 10px;
    font-family: "Times New Roman";
    font-size: 16px;
  }
  .ans{
    /*background-color: gray;*/
    font-size: 14px;
    font-family: "Times New Roman";
  }
  .tail{
    font-family: "Times New Roman";
    font-size: 12px;
  }
  .rem{
    font-family: "Times New Roman";
    font-size: 10px;
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
  li{list-style-type:none;}
</style>
