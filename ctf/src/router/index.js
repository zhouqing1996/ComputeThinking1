import Vue from 'vue'
import Router from 'vue-router'
import Register from '../pages/register'
import Forget from '../pages/forget'
import Login from '../pages/login'
import Index from '../pages/index'
//404错误
import NotFound from '../pages/404'

//admin
//全部公共页
import adminHome from '../pages/admin/Home'
//首页
import adminIndex from '../pages/admin/Index'
//我的信息
//修改密码
import Changepwd from '../pages/admin/my/Changepwd'
//我的资料
import My from '../pages/admin/my/My'

//用户信息
import Userinfo from '../pages/admin/user/Userinfo'
//添加用户
import Adduser from '../pages/admin/user/Adduser'

//题库信息
//选择题
import Choose from '../pages/admin/bank/Choose'
//填空题
import Fill from '../pages/admin/bank/Fill'
//程序题
import Program from '../pages/admin/bank/Program'
import ViewP from '../pages/admin/bank/ViewP'

import ProgramN from  '../pages/admin/bank/Programn'
//判断题
import Judge from '../pages/admin/bank/Judge'
//多选题
import ChooseM from '../pages/admin/bank/Choosem'


//图书信息
import Book from '../pages/admin/book/Book'

//试卷信息
//创建试卷
import Create from '../pages/admin/exam/Create'
//查看试卷
import View from '../pages/admin/exam/Viewexam'
//手动组卷（题库中选择）
import SelfCreate from '../pages/admin/exam/Selfcreate'
//创建试卷
import NewCreate from '../pages/admin/exam/Newcreate'




//教师用户
//教师主页
import TeacherHome from '../pages/teacher/Home'
import TeacherIndex from '../pages/teacher/Index'
//教师我的信息
import Teachermy from '../pages/teacher/my/My'
//教师修改密码
import Teacherchgpwd from '../pages/teacher/my/Changepwd'
//教师创建试卷主页
import TeacherCreate from '../pages/teacher/teach/Create'
//教师预览试卷
import TeacherView from '../pages/teacher/teach/Viewexam'
//教师手动创建试卷（从题库中选择）
import TeacherSelfCreate from '../pages/teacher/teach/Selfcreate'
//教师创建试卷（从无到有）
import TeacherNewCreate from '../pages/teacher/teach/Newcreate'
//教师管理学生
import TeacherSManage from '../pages/teacher/student/SManage'



//用户身份
//框架
import UserHome from '../pages/user/Home'
//首页
import UserIndex from '../pages/user/Index'
//测评
import UserEvaluate from '../pages/user/evaluate/Evaluate'
//进入测评
import UserGoEva from '../pages/user/evaluate/Goeva'

//排名
import UserRank from '../pages/user/rank/Rank'
//练习
import UserExercise from '../pages/user/exercise/Exercise'
// 练习题目 选择题
import UserExerciseChoose from '../pages/user/exercise/ViewChoose'
//填空题
import UserExerciseFill from '../pages/user/exercise/ViewFill'
//程序题
import UserExerciseProgram from '../pages/user/exercise/ViewProgram'
//判断题
import UserExerciseJudge from '../pages/user/exercise/ViewJudge'
//多选题
import UserExerciseChoosem from '../pages/user/exercise/ViewChoosem'

//我的
import UserMy from '../pages/user/my/My'
import Userchangepwd from '../pages/user/my/Changepwd'






Vue.use(Router)
const  router = new Router({
  mode:'history',
  routes: [
    {
      //测试
      path: '/',
      name: 'Index',
      meta:{
        isLogin:true,//需要登录
      },
      component: Index
    },
    {
      //注册
      path: '/register',
      name: 'Register',
      meta:{
        isLogin:false,
      },
      component: Register
    },
    {
      //忘记密码
      path:'/forget',
      name:'Forget',
      meta:{
        isLogin:false,
      },
      component:Forget
    },
    {
      //登录
      path:'/login',
      name:'Login',
      meta:{
        isLogin:false,
      },
      component:Login
    },
    {
      path:'*',
      name:'notfound',
      meta:{
        isLogin:false
      },
      component:NotFound
    },
    {
      //管理员
      path:'/admin',
      name:'AdminHome',
      meta:{
        isLogin:true
      },
      component:adminHome,
      children:[
        {
          //管理员首页
          path:"/admin/index",
          name:"adminindex",
          meta:{
            isLogin:true
          },
          component:adminIndex
        },
        {
          //用户信息：用户信息
          path:'/admin/user/userinfo',
          name:'userinfo',
          meta:{
            isLogin:true
          },
          component:Userinfo
        },
        {
          //用户信息：添加用户
          path:'/admin/user/adduser',
          name:'adduser',
          meta:{
            isLogin:true
          },
          component:Adduser
        },
        //题库信息
        {
          path:'/admin/bank/choose',
          name:'choose',
          meta:{
            isLogin:true
          },
          component:Choose
        },
        {
          path:'/admin/bank/fill',
          name:'fill',
          meta:{
            isLogin:true
          },
          component:Fill
        },
        {
          path:'/admin/bank/program',
          name:'program',
          meta:{
            isLogin:true
          },
          component:Program
        },
        {
          path:'/admin/bank/viewP',
          name:'viewP',
          meta:{
            isLogin:true
          },
          component:ViewP
        },
        {
          path:'/admin/bank/programn',
          name:'programn',
          meta:{
            isLogin:true
          },
          component:ProgramN
        },
        {
          path:'/admin/bank/judge',
          name:'judge',
          meta:{
            isLogin:true
          },
          component:Judge
        },
        {
          path:'/admin/bank/choosem',
          name:'choosem',
          meta:{
            isLogin:true
          },
          component:ChooseM
        },
        //图书
        {
          path:'/admin/book',
          name:'book',
          meta:{
            isLogin:true
          },
          component:Book
        },
        //试卷
        //创建试卷
        {
          path:'/admin/exam/create',
          name:'create',
          meta:{
            isLogin:true
          },
          component:Create
        },
        //查看试卷
        {
          path:'/admin/exam/viewexam',
          name:'viewexam',
          meta:{
            isLogin:true
          },
          component:View
        },
        {
          path:'/admin/exam/selfcreate',
          name:'selfcreate',
          meta:{
            isLogin:true
          },
          component:SelfCreate
        },
        {
          path:'/admin/exam/newcreate',
          name:'newcreate',
          meta:{
            isLogin:true
          },
          component:NewCreate
        },
        {
          //我的信息:修改密码
          path:'/admin/my/changepwd',
          name:'changepwd',
          meta:{
            isLogin:true
          },
          component:Changepwd
        },
        {
          //我的信息:我的资料
          path:'/admin/my/my',
          name:'my',
          meta:{
            isLogin:true
          },
          component:My
        },

      ]
    },
    {
      path:'/teacher',
      name:'TeacherHome',
      meta:{
        isLogin:true
      },
      component:TeacherHome,
      children:[
        {
          //首页
          path:'/teacher/index',
          name:'Teacherindex',
          meta:{
            isLogin:true
          },
          component:TeacherIndex
        },
        {
          //我的信息
          path:'/teacher/my',
          name:'Teachermy',
          meta:{
            isLogin:true
          },
          component:Teachermy
        },
        {
          //修改密码
          path:'/teacher/changepwd',
          name:'Teacherchapwd',
          meta:{
            isLogin:true
          },
          component:Teacherchgpwd
        },
        {
        //  教师创建试卷主页
          path:'/teacher/create',
          name:'TeacherCreate',
          meta:{
            isLogin:true
          },
          component:TeacherCreate
        },
        {
        //  教师创建试卷（手动）
          path:'/teacher/selfcreate',
          name:"TeacherSelfCreate",
          meta:{
            isLogin:true
          },
          component:TeacherSelfCreate
        },
        {
        //  教师创建新问卷
          path:'/teacher/newcreate',
          name:'TeacherNewCreate',
          meta:{
            isLogin:true
          },
          component:TeacherNewCreate
        },
        {
        //  教师预览试卷
          path:'/teacher/viewexam',
          name:'TeacherViewexam',
          meta:{
            isLogin:true
          },
          component:TeacherView
        },
        {
        //  教师管理学生
          path:'/teacher/stuManage',
          name:'TeacherStuManage',
          meta:{
            isLogin:true
          },
          component:TeacherSManage
        }
      ]
    },
    {
      path:'/user',
      name:'UserHome',
      meta:{
        isLogin:true
      },
      component:UserHome,
      children: [
        {
          //首页
          path:'/user/index',
          name:'userindex',
          meta:{
            isLogin:true
          },
          component:UserIndex
        },
        {
        //  测评
          path:'/user/evaluate',
          name:'Userevaluate',
          meta:{
            isLogin:true
          },
          component:UserEvaluate
        },
        {
          //  进入测评
          path:'/user/evaluate/goeva',
          name:'Usergoeva',
          meta:{
            isLogin:true
          },
          component:UserGoEva
        },
        {
        //  练习
          path:'/user/exercise',
          name:'Userexercise',
          meta:{
            isLogin:true
          },
          component:UserExercise
        },
        {
        //  用户练习选择题
          path:'/user/exercisre/pchoose',
          name:'UserpChoose',
          meta:{
            isLogin:true
          },
          component:UserExerciseChoose
        },
        {
        //  用户练习填空题
          path:'/user/exercise/pfill',
          name:'UserpFill',
          meta:{
            isLogin:true
          },
          component:UserExerciseFill
        },
        {
        //  用户练习程序题
          path:'/user/exercise/pprogram',
          name:'UserpProgram',
          meta:{
            isLogin:true
          },
          component:UserExerciseProgram
        },
        {
        //  用户练习判断题
          path:'/user/exercise/pjudge',
          name:"UserpJudge",
          meta:{
            isLogin:true
          },
          component:UserExerciseJudge
        },
        {
        //  用户练习多选题
          path:'/user/exercise/pchoosem',
          name:'UserpChoosem',
          meta:{
            isLogin:true
          },
          component:UserExerciseChoosem
        },
        {
        //  我的
          path:'/user/my',
          name:'usermy',
          meta:{
            isLogin:true
          },
          component:UserMy
        },
        {
        //  我的密码
          path:'/user/my/changepwd',
          name:'userchangepwd',
          meta:{
            isLogin:true
          },
          component:Userchangepwd
        },
        {
        //  排名
          path:'/user/rank',
          name:'userRank',
          meta:{
            isLogin:true
          },
          component:UserRank
        }
      ]
    }
  ]
})
// export default new Router({
//   mode:'history',
//   routes: [
//     {
//       path: '/',
//       name: 'Index',
//       meta:{
//         requireAuth:true,//需要登录
//       },
//       component: Index
//     },
//     {
//       path: '/register',
//       name: 'Register',
//       component: Register
//     },
//     {
//       path:'/forget',
//       name:'Forget',
//       component:Forget
//     },
//     {
//       path:'/login',
//       name:'Login',
//       component:Login
//     }
//   ]
// });
export default router;
