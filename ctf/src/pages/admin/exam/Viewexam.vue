<template>
    <!--查看试卷-->
  <div id="waimian">
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
    <h2>三、程序题</h2>
    <div>
      <span v-for="(p,key3) in programqList":key="key3">
      <li class="item">({{key3+1}}){{p.pqitem}}<br>
        <textarea name="key5.1" value="" rows="5" cols="30"></textarea>
      </li>
      <p class="ans">答案：{{p.pqans}}</p>
      <p class="tail">详解：{{p.pqtail}}</p>
      <p class="rem">相关知识点：{{p.pqrem}}</p>
    </span>
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
            programqList:[],
          }
      },
      methods:{
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
</style>
