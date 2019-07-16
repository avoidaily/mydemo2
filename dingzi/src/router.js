import Vue from 'vue'
import Router from 'vue-router'

//核心：所有组件都注册到指定位置，即每个组件的.this
Vue.use(Router)

import home from './views/Home.vue'//首页
import NotFound from './views/notFound'  //404
import myHead from './components/head.vue'//页头
import login from './views/login.vue'//登录
import reg from './views/reg.vue'//注册
import tabbar from './views/tabbar.vue'//主面板
import sort from './views/sort.vue'//分类
import seckill from './views/seckill.vue'//秒杀
import cart from './views/cart.vue'//购物车
import refill from './views/refill.vue'//手机充值
import mine from './views/mine.vue'//登录页面
import detail from './views/detail.vue'//登录页面
import order from './views/order.vue'//支付




import ex from './views/ex.vue'
import indexProduct from './components/indexProduct.vue'
import moreComment from './components/moreComment.vue'
import paycoupons from './components/paycoupons.vue'
import payreceipt from './components/payreceipt.vue'
import newadd from './components/newadd.vue'
import address from './components/address.vue'









export default new Router({
  routes: [
    {path:'/', component:home},//首页
    {path:'/home', component:home},//首页
    {path:"*", component:NotFound},//404
    {path:"/myHead",component:myHead},//页头
    {path:"/login",component:login},//登录  //,meta:{needLogin:true}
    {path:"/reg",component:reg},//注册
    {path:"/tabbar",component:tabbar},//主面板
    {path:"/sort",component:sort},//分类
    {path:"/seckill",component:seckill},//秒杀
    {path:"/cart",component:cart},//购物车
    {path:"/refill",component:refill},//购物车
    {path:"/mine",component:mine},//登录页面
    {path:"/detail",component:detail},//详情页  //   /:did   ,props:true
    {path:"/order",component:order},//支付
    

    


    {path:"/ex",component:ex},
    {path:"/indexProduct",component:indexProduct},//首页商品
    {path:"/moreComment",component:moreComment},//评论
    {path:"/paycoupons",component:paycoupons},//优惠券
    {path:"/payreceipt",component:payreceipt},//发票
    {path:"/newadd",component:newadd},//地址栏
    {path:"/address",component:address},//地址编辑


    
    

    //router-link传参（商品从列表页到具体详情页跳转）
    // {path:'/detail/:id',name:'detail',component:detail},
    


  ]
})
