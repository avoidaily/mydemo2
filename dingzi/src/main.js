import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

//引入组件库：使用mint-ui的三步曲
//1、引入mint-ui库中所有组件，完整引入：
import MintUI from 'mint-ui'
//2、单独引入mint-ui组件库 样式文件
import 'mint-ui/lib/style.css'
//3、mint-ui组件库中组件注册vue实例值
Vue.use(MintUI);
// 默认生成
Vue.config.productionTip = false
// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'

// 引入组件库vant
// import Vant from 'vant'
import 'vant/lib/index.css'
// // 注册组件
// Vue.use(Vant);
// //按需
// import { Button,Icon } from 'vant'
// Vue.use(Button).use(Icon)


//1、引入axios.js  （import：ES6引入模块的语法，只在vue中使用）
import axios from './axios'


//引入图标
import './font/iconfont.css'
// 引入公用样式
import './assets/base.css'

// 引入全局过滤器
//main.js中引入并注册
import filter from "./common/filter.js"//用于处理浮点数小数位数
//全局方法Vue.filter()统一注册自定义过滤器
Object.keys(filter).forEach(key => {//返回filters对象中属性名组成的数组
  Vue.filter(key, filter[key])
})

// session
// router.beforeEach((to,from,next)=>{
//   console.log(to);
//   if(to.meta.needLogin){
//     next();
//     console.log('需登录')
//   }else{
//     alert('session为空，请登录先')
//     next('/login');
//   }
// })


//mian.js是整个页面的入
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')



