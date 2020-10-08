import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Register from '../pages/register'
import Forget from '../pages/forget'
import Login from '../pages/login'
import Index from '../pages/index'
//404错误
import NotFound from '../pages/Notfound'

//admin
import adminHome from '../pages/admin/Home'
import Userinfo from '../pages/admin/Userinfo'

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
          //用户信息
          path:'/admin/userinfo',
          name:'userinfo',
          meta:{
            isLogin:true
          },
          component:Userinfo
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
