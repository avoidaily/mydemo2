//src > axios.js
//引入axios库并配置
// 1、引入vue
import Vue from "vue";
// 2 引入axios库  node_modules要有axios库 百度手册下载方式 npm istall -s axios???
import axios from "axios";   
// 3、设置跨域请求 保存session   让axios带钥匙：让axios的请求携带验证信息到服务器
axios.defaults.withCredentials=true
// 4、设置发送ajax请求服务器基础路径   //axios设置ssession保留
axios.defaults.baseURL="http://127.0.0.1:3000/";//  /是有的 之后发送请求直接写就行
// 5、将axios 注册到vue 实例中 
// axios其实就是vue的ajax请求，将他放到原型对象，便于组件的继承
// xxx.vue中继承： this.axios.get()   直接this.vue访问
Vue.prototype.axios=axios
//6、

// 7、在main.js 引入axios.js即可,之后就可以发送请求了

// 跨域一定会抛弃session，缓存的数据也就丢失，多次请求时维护性就降低——axios设置ssession保留即可






