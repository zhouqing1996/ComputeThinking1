<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadcrumb-css">
      <el-breadcrumb-item :to="{ path: '/user/exercise' }">练习</el-breadcrumb-item>
      <el-breadcrumb-item>填空题</el-breadcrumb-item>
    </el-breadcrumb>
    <!--填空题-->
    <div id="waimian" >
      <div v-for="(f,index) in List">
        <div>
          <h3>{{f.fqitem}}（填空题）</h3>
          <input type="text"  :name="f.fqid" @input="Click(f.fqid,$event)"><br>
        </div>
        <hr/>
        <div v-if="Visable==true">
          <span>答案：{{f.fqans}}</span><br>
          <span>相关知识点：{{f.fqrem}}</span><br>
          <span>详解：{{f.fqtail}}</span><br>
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
        name: "ViewFill",
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
            flag:2,
            fqid:this.qid
          }).then(function (res) {
            console.log(res.data.data)
            this.List =res.data.data
          }).catch(function (error) {
            console.log(error)
          })
        },
        Click:function(id,event){
          let flag = true
          for(let i=0;i< this.Ans.length;i++)
          {
            if(this.Ans[i]['id']==id)
            {
              flag=false
              this.Ans[i]['ans'] = event.currentTarget.value
              break
            }
          }
          if(flag){
            this.Ans.push({
              id:id,
              ans:event.currentTarget.value
            })
          }
          console.log(this.Ans)
        },
        Submit:function () {
          this.$http.post('/yii/student/exercise/submitanser',{
            flag:2,
            uid:this.uid,
            qid:this.qid,
            ans:this.Ans
          }).then(function (res) {
            console.log(res.data)
            if(res.data.message=="练习填空题成功")
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
