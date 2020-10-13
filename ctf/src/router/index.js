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

//图书信息
import Book from '../pages/admin/book/Book'

//试卷信息
//创建试卷
import Create from '../pages/admin/exam/Create'
//查看试卷
import View from '../pages/admin/exam/Viewexam'




//用户身份
//框架
import UserHome from '../pages/user/Home'
//首页
import UserIndex from '../pages/user/Index'
//测评
import UserEvaluate from '../pages/user/evaluate/Evaluate'
//排名
import UserRank from '../pages/user/rank/Rank'
//练习
import UserExercise from '../pages/user/exercise/Exercise'
//我的
import UserMy from '../pages/user/my/My'
import Userchangepwd from '../pages/user/my/Changepwd'



//我的信息
//修改密码
import Changepwd from '../pages/admin/my/Changepwd'
//我的资料
import My from '../pages/admin/my/My'


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
          name:'evaluate',
          meta:{
            isLogin:true
          },
          component:UserEvaluate
        },
        {
        //  练习
          path:'/user/exercise',
          name:'exercise',
          meta:{
            isLogin:true
          },
          component:UserExercise
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
