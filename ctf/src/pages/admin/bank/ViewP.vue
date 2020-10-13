<template>
<!--查看程序题，可以修改-->
  <div id="waimian">
    <h2>题目：{{programList.pqtitle}}</h2>
    <p><i class="el-icon-s-custom"></i>创建人：{{authName}}</p>
    <hr/>
    <div>
      <p><strong>题目背景</strong></p>
      <p>{{programList.pqback}}</p>
    </div>
    <HR/>
    <div>
      <p><strong>题目描述</strong></p>
      <p>{{programList.pqdescri}}</p>
    </div>
    <HR/>
    <div>
      <p><strong>输入格式</strong></p>
      <p>{{programList.pqinputB}}</p>
    </div>
    <HR/>
    <div>
      <p><strong>输出格式</strong></p>
      <p>{{programList.pqoutputB}}</p>
    </div>
    <HR/>
    <div>
      <p><strong>输入输出样例</strong></p>
      <p>{{programList.pqcase}}</p>
    </div>
    <HR/>
    <div>
      <p><strong>说明</strong></p>
      <p>{{programList.pqother}}</p>
    </div>
    <HR/>
    <div>
      <p><strong>标签</strong></p>
      <p>{{programList.pqlabel}}</p>
    </div>
    <HR/>
    <div>
      <p><strong>推荐相关</strong></p>
      <p>{{programList.pqrem}}</p>
    </div>
    <HR/>
    <div>
      <p><strong>答案</strong></p>
      <p>{{programList.pqans}}</p>
    </div>
    <HR/>
  </div>
</template>

<script>
    export default {
        name: "ViewP",
      data(){
          return {
            id:"",
            programList:[],
            authName:'',
          }
      },
      methods:{
          getProgram:function () {
            let that =this
            this.$http.post('/yii/bank/programq/queryprogram',{
              flag:5,
              id:this.id
            }).then(function (res) {
              console.log(res.data)
              that.programList = res.data.data[0]
              that.authName = res.data.data[1].data.username
              console.log(that.authName)
            }).catch(function (error) {
              console.log(error)
            })
          }
      },
      created(){
          this.id = this.$route.query.id
        this.getProgram()
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
</style>
