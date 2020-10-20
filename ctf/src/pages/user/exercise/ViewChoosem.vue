<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadcrumb-css">
      <el-breadcrumb-item :to="{ path: '/user/exercise' }">练习</el-breadcrumb-item>
      <el-breadcrumb-item>多选题</el-breadcrumb-item>
    </el-breadcrumb>
    <!--多选题-->
    <div id="waimian">
      <div v-for="(m,index) in List">
        <h3>{{m.mqitem}}（多选题）</h3>
        <ul>
          <li v-for="(x,i) in m.mqcho" >
            <input type="radio" :name="m.mqid+i"
                   @change="Click(m.mqid,m.mqcho[i])"/>{{x}}
          </li>
        </ul>
        <div v-if="Visable==true">
          <span>答案：{{m.mqans}}</span><br>
          <span>相关知识点：{{m.mqrem}}</span><br>
          <span>详解：{{m.mqtail}}</span><br>
          <hr/>
        </div>
        <div>
          <button class="btn2" v-if="Visable==false" @click="Submit">提交</button>
          <button class="btn2" @click="back">返回</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
    export default {
        name: "ViewChoosem",
      data(){
        return{
          qid:'',
          uid:'',
          //数据
          List:[],
          //用户答案
          Ans:[],
          //  显示答案
          Visable:false
        }
      },
      methods:{
        back:function()
        {
          this.$router.push({
            path:'/user/exercise',
          })
        },
        getQuestion:function () {
          this.$http.post('/yii/student/exercise/queryquestion',{
            flag:5,
            mqid:this.qid
          }).then(function (res) {
            console.log(res.data.data)
            let tmp = res.data.data
            for(let i=0;i<tmp.length;i++)
            {
              this.List.push({
                mqid:tmp[i].mqid,
                mqitem:tmp[i].mqitem,
                mqcho:[tmp[i].mqcho.split('---')[0],tmp[i].mqcho.split('---')[1],tmp[i].mqcho.split('---')[2],
                  tmp[i].mqcho.split('---')[3]],
                mqrem:tmp[i].mqrem,
                mqans:tmp[i].mqans,
                mqtail:tmp[i].mqtail
              })
            }
          }).catch(function (error) {
            console.log(error)
          })
        },
        Click:function(id,str){
          let flag =true
          for(let i=0;i< this.Ans.length;i++)
          {
            if(this.Ans[i]['id']==id)
            {
              flag =false
              if(this.Ans[i]['ans']==str)
              {
                this.Ans.splice(id,1)
              }
              else{
                this.Ans[i]['ans']=this.Ans[i]['ans']+'---'+str
              }
              break
            }
          }
          if(flag){
            this.Ans.push({
              id:id,
              ans:str
            })
          }
          console.log(this.List)
        },
        Submit:function () {
          this.$http.post('/yii/student/exercise/submitanser',{
            flag:5,
            uid:this.uid,
            qid:this.qid
          }).then(function (res) {
            console.log(res.data)
            if(res.data.message=="练习选择题成功")
            {
              this.Visable = true
            }
            else{
              alert(res.data.message)
            }
          }).catch(function (error) {
            console.log(error)
          })

        }
      },
      created(){
        this.qid = this.$route.query.id
        this.getQuestion()
        console.log(this.List)
        this.uid = this.$store.getters.getsId

      }
    }
</script>

<style scoped>
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
  #waimian {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    color: #2c3e50;
    margin-top: 5px;
    text-align: left;
    padding: 30px;
  }
</style>
