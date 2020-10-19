<template>
    <!--进入测评-->
  <div id="waimian">
    <div>
      <h1 style="text-align: center"><strong>{{examList.exname}}</strong></h1>
      <p style="text-align: center"><i class="el-icon-s-custom"></i>试卷创建人：{{examList.exUser}}  ||<i class="el-icon-date"></i>创建时间：{{examList.exCreateTime}}</p>
      <hr/>
      <h2>一、选择题</h2>
      <div>
        <div v-for="(c,index) in chooseqList">
          <h3>({{index+1}}):{{c.cqitem}}</h3>
          <ul>
            <li v-for="(x,i) in c.cqcho" >
              <input type="radio" :name="c.cqid"
                     @change="cr(c.cqid,c.cqcho[i])"/>{{x}}
            </li>
          </ul>
        </div>
      </div>
      <hr/>
      <h2>二、填空题</h2>
      <div>
      <span v-for="(f,key2) in fillqList":key="key2">
      <li class="item">({{key2+1}}){{f.fqitem}}<br>
        <input type="text"  :name="f.fqid" @input="fr(f.fqid,$event)"><br>
      </li>
    </span>
      </div>
      <hr/>
      <h2>三、判断题</h2>
      <div>
      <span v-for="(j,keyj) in judgeList":key="keyj">
      <li class="item">({{keyj+1}}){{j.jqitem}}<br>
        <input type="text" value=""><br>
      </li>
    </span>
      </div>
      <hr/>
      <h2>四、多选题</h2>
      <div>
      <span v-for="(m,keym) in choosemList":key="keym">
      <li class="item">({{keym+1}}){{m.mqitem}}<br>
        <input type="radio"  value="0">（A）{{m.mqcho.split('---')[0]}}<br>
        <input type="radio"  value="1">（B）{{m.mqcho.split('---')[1]}}<br>
        <input type="radio"  value="2">（C）{{m.mqcho.split('---')[2]}}<br>
        <input type="radio"  value="3">（D）{{m.mqcho.split('---')[3]}}<br>
      </li>
    </span>
      </div>
      <hr/>
      <h2>五、程序题</h2>
      <div>
      <span v-for="(p,key3) in programqList":key="key3">
        ({{key3+1}})<strong>{{p.pqitem}}</strong>
        <input type="text" value=""><br>
      </span>
      </div>
    </div>
    <hr/>
    <div style="text-align: center">
      <button class="btn2" @click="back">返回</button>
      <el-divider direction="vertical"></el-divider>
      <button class="btn2" @click="EvaOK">提交试卷</button>
    </div>
  </div>
</template>

<script>
    export default {
        name: "Goeva",
      data(){
          return{
            eid:"",
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
            //用户答案
            cList:[],
            cmList:[],
            fList:[],
            jList:[],
            pList:[],
          }
      },
      methods:{
        back:function(){
          this.$router.push({
            path:'/user/evaluate',
          })
        },
        getExamList:function () {
          let that =this
          this.$http.post('/yii/exam/exam/view',{
            id:this.eid
          }).then(function (res) {
            console.log(res.data)
            that.examList.exname=res.data.data[0]
            that.examList.exUser=res.data.data[1].data.username
            that.examList.exCreateTime=res.data.data[2]
            let cqList = res.data.data[3]
            for(let i=0;i<cqList.length;i++)
            {
              that.chooseqList.push({
                cqid:cqList[i].cqid,
                cqitem:cqList[i].cqitem,
                cqcho:[cqList[i].cqcho.split('---')[0],cqList[i].cqcho.split('---')[1],cqList[i].cqcho.split('---')[2],cqList[i].cqcho.split('---')[3]],
                cqrem:cqList[i].cqrem,
                cqans:cqList[i].cqans
              })
            }
            that.fillqList=res.data.data[4]
            that.programqList=res.data.data[5]
            that.judgeList =res.data.data[6]
            that.choosemList=res.data.data[7]
          })
        },
        //提交选择题
        cr:function(id,str){
          let flag = false
          for(let i=0;i< this.cList.length;i++)
          {
            if(this.cList[i]['id']==id)
            {
              flag=true
              break
            }
          }
          if(flag){
            this.cList.splice(id,1)
            console.log(this.cList)
          }
          else{
            this.cList.push({
              id:id,
              ans:str
            })
            console.log(this.cList)
          }
        },
        //提交填空题
        fr:function(id,event){
          let flag = false
          for(let i=0;i< this.fList.length;i++)
          {
            if(this.fList[i]['id']==id)
            {
              flag=true
              break
            }
          }
          if(flag){
            this.fList.splice(id,1)
          }
          else{
            this.fList.push({
              id:id,
              ans:event.currentTarget.value
            })
          }
          console.log(this.fList)
        },
        //提交试卷
        EvaOK:function () {
          console.log(this.cList);
          console.log(this.fList);
          console.log(this.pList);
          console.log(this.jList);
          console.log(this.cmList);
        }
      },
      created(){
          this.eid =this.$route.query.id
        this.getExamList()
        console.log(this.chooseqList)
      }
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
