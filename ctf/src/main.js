// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import App from './App'
import router from './router'
import store from './store/index'
import Vuerouter from 'vue-router'
import VueResource from 'vue-resource'
import axios from 'axios'
//适配
import 'lib-flexible/flexible'
// 添加请求拦截器，在请求头加token
axios.interceptors.request.use(
  config=>{
    if(localStorage.getItem('Token'))
    {
      config.headers.Token = localStorage.getItem('Token')
    }
    return config;
  },
  error => {
    return Promise.reject(error)
  }
);
Vue.prototype.$http = axios
//
router.beforeEach((to,from,next)=>{
  let stoken = store.getters.getsToken
  let user = store.getters.getsName
  console.log(stoken)
  console.log(user)
  if(to.meta.isLogin==true)
  {
    if(!user)
    {
      //获取不到登录信息
      next({path:'/login'})
    }
    else
    {
      return next()
    }
  }else{
    return next();
  }

  // console.log(stoken)
  // if (stoken) {
  //   // next()
  //   //已经登录的
  //   if(!to.meta.isLogin==true)
  //   {
  //     console.log("已经登录过了，先退出登录")
  //   }
  //   next()
  // }
  // else {
  //   if(to.meta.isLogin){
  //     next('/login')
  //     console.log("需要登录")
  //   }
  //   else{
  //     next()
  //   }
  // }
})
Vue.use(VueResource)
Vue.use(Vuerouter)
// Vue.use(VueAxios,axios)//注册
Vue.use(ElementUI);
Vue.config.productionTip = false
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
