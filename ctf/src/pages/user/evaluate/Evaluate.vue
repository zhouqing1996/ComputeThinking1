<template>
  <div>
    <el-breadcrumb separator-class="el-icon-arrow-right" class="breadcrumb-css">
      <el-breadcrumb-item :to="{ path: '/user/index' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>测评</el-breadcrumb-item>
    </el-breadcrumb>
    <div><hr/></div>
    <div class="display1">
      <el-tabs type="border-card">
        <el-tab-pane>
          <span slot="label"><i class="el-icon-date"></i> 试卷列表</span>
          <div class="display2">
            <div class="searchmem">
              <div class="meeting" >
                <el-input v-model="inputname" placeholder="模糊查找" size="mini"></el-input>
              </div>
              <button class="btn2 el-icon-search" v-on:click="getExamList(4)">搜索试卷</button>
              <button class="btn2 el-icon-circle-plus-outline" @click="dialogFormVisibleAdd=true">自动组卷</button>
              <el-dialog title="自动组卷" :visible.sync="dialogFormVisibleAdd">
                <el-form :model="addexam">
                  <el-form-item label="试卷名称" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addexam.name" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="选择题数" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addexam.nc" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="填空题数" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addexam.nf" auto-complete="off"></el-input>
                  </el-form-item>
                  <el-form-item label="程序题数" :label-width="formLabelWidth">
                    <el-input style="width: 350px;" v-model="addexam.np" auto-complete="off"></el-input>
                  </el-form-item>
                </el-form>
                <div slot="footer" style="align-content: center" class="dialog-footer">
                  <el-button type="primary" @click="AddExam">提交</el-button>
                  <el-button @click="dialogFormVisibleAdd=false">退出</el-button>
                </div>
              </el-dialog>
              <button class="btn2 el-icon-folder" @click="getExamList(1)">有效试卷</button>
              <button class="btn2 el-icon-folder-remove" @click="getExamList(2)">无效试卷</button>
              <button class="btn2 el-icon-folder-checked" @click="getExamList(3)">所有试卷</button>
            </div>
            <br>
            <br>
            <el-divider></el-divider>
            <table >
              <tr>
                <th>序号</th>
                <th>试卷编号 </th>
                <th>试卷名</th>
                <th>创建时间</th>
                <th>作者编号</th>
                <th>状态</th>
                <th>操作</th>
              </tr>
              <tr v-for=" (exam,key) in currentPageData" :key="key">
                <td>{{ key+1 }}</td>
                <td>{{exam.exid}}</td>
                <td>{{exam.exname}}</td>
                <td>{{exam.createtime}}</td>
                <td>{{exam.auth}}</td>
                <td v-if="exam.exstatus==1">有效</td>
                <td v-if="exam.exstatus==0">无效
                  <span @click="changeExamstatus(exam.exid)" class="span2">修改</span>
                </td>
                <td>
                  <span v-if="exam.exstatus==1" class="span2" @click="lookexam(exam.exid)">查看试卷
                  </span>
                  <span v-if="exam.exstatus==1"@click="deleteExam(1,exam.exid)" class="span1"><i class="el-icon-delete">删除试卷</i></span>
                  <span v-if="exam.exstatus==0" @click="deleteExam(2,exam.exid)" class="span1"><i class="el-icon-delete">永久删除</i></span>
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
        name: "Evaluate",
      data(){
          return{
            EvaList:[],

          }
      },
      methods:{

      },
      created(){

      }
    }
</script>

<style scoped>

</style>
