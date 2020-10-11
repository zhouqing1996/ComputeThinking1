import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
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

//图书信息
import Book from '../pages/admin/book/Book'

//试卷信息
//创建试卷
import Create from '../pages/admin/exam/Create'


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
    // {
    //   //主页
    //   path: '/home',
    //   name: 'Home',
    //   meta:{
    //     isLogin:true,//需要登录
    //   },
    //   component: Home
    // },
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
