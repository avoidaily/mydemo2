<template>
  <div class="home">
    <div class="page-tabbar">
      <div class="page-wrap">
        <!-- 01:页头 -->
        <my-head></my-head>
        <!-- 03:切换面板 -->
        <!-- 外层父面板 -->
        <mt-tab-container class="page-tabbar-container" v-model="selected">
          <!-- 1、首页——子面板 -->
          <mt-tab-container-item id="home">
              <!-- 在子面板添加 首页子组件 -->
              <my-tabbar></my-tabbar>
          </mt-tab-container-item>

          <!-- 2、分类——子面板 -->
          <mt-tab-container-item id="sort">
              <!--下子面板添加 分类组件 -->
              <my-sort></my-sort>
          </mt-tab-container-item>

          <!-- 3、秒杀——子面板 -->
          <mt-tab-container-item id="seckill">
              <!--下子面板添加 秒杀组件 -->
              <my-seckill></my-seckill>
          </mt-tab-container-item>

          <!-- 4、购物车——子面板 -->
          <mt-tab-container-item id="cart">
              <!--下子面板添加 购物车组件 -->
              <my-cart></my-cart>
          </mt-tab-container-item>

            <!-- 5、我的——子面板 -->
          <mt-tab-container-item id="my">
              <!--下子面板添加 我的组件 -->
              <!-- <my-login></my-login> -->
              <!-- <mine></mine> -->
          </mt-tab-container-item>

        </mt-tab-container>

        <!-- 04:底部导航栏 -->
        <mt-tabbar v-model="selected" fixed>
          <mt-tab-item id="home" @click.native="changeState(0)">
            <tabbaricon
            :selectedImage="require('../assets/tab01.png')"
            :normalImage="require('../assets/normal01.png')"
            :focused="currentIndex[0].isSelect"
            ></tabbaricon> 首页
          </mt-tab-item>

          <mt-tab-item id="sort" @click.native="changeState(1)">
            <tabbaricon
            :selectedImage="require('../assets/tab02.png')"
            :normalImage="require('../assets/normal02.png')"
            :focused="currentIndex[1].isSelect"
            ></tabbaricon> 分类
          </mt-tab-item>

          <mt-tab-item id="seckill" @click.native="changeState(2)">
            <tabbaricon
            :selectedImage="require('../assets/tab03.png')"
            :normalImage="require('../assets/normal03.png')"
            :focused="currentIndex[2].isSelect"
            ></tabbaricon> 秒杀
          </mt-tab-item>

          <mt-tab-item id="cart" @click.native="changeState(3)">
            <tabbaricon
            :selectedImage="require('../assets/tab04.png')"
            :normalImage="require('../assets/normal04.png')"
            :focused="currentIndex[3].isSelect"
            ></tabbaricon> 购物车
          </mt-tab-item>

          <!-- <mt-tab-item id="my" @click.native="changeState(4)">
            <router-link to="login"><tabbaricon
            :selectedImage="require('../assets/tab05.png')"
            :normalImage="require('../assets/tab05.png')"
            :focused="currentIndex[4].isSelect"
            @click="tologin"
            ></tabbaricon></router-link>我的
          </mt-tab-item> -->

          <mt-tab-item id="my" >
            <router-link to="mine"><tabbaricon
            :normalImage="require('../assets/tab05.png')"
            @click="tologin"
            ></tabbaricon></router-link>我的
          </mt-tab-item>

        </mt-tabbar>




      </div>
    </div>
  </div>
</template>

<script>
// http://127.0.0.1:8080/#/home

//引入子组件
import myHead from '../components/head.vue' // 1、引入页头
import myTabbar from '../views/tabbar.vue' //引入面板
import tabbaricon from "../components/TabBarIcon.vue" //引入tabbar组件的图片子组件
import mySort from "../views/sort.vue"//分类组件面板
import mySeckill from "../views/seckill.vue"//秒杀组件面板
import myCart from "../views/cart.vue"//购物车
import myLogin from "../views/login.vue"//登录
import mine from "../views/mine.vue"//我的





export default {
  data(){ 
    return{
      selected:"home",
      // 创建数组，保留图片焦点状态
        //true：为选中； false：未选中
        currentIndex:[
            {isSelect:true},
            {isSelect:false},
            {isSelect:false},
            {isSelect:false},
            {isSelect:false}
        ]
    }
  },
  methods: {
    // 函数功能：将当前参数下标
      //对应数组值修改true，其他false
      //n:传来的参数   i：当前循环元素的下标
       
      changeState(n){
        //console.log(123);
        //1、创建数组，循环数组中的内容
        for(var i=0;i<this.currentIndex.length;i++){
        //2、判断若循环下标与n相等
        if(n==i){
        //3、当前下标元素true    
            this.currentIndex[i].isSelect=true;
        }else{
        //4、其他元素修改为false
        this.currentIndex[i].isSelect=false;
        }}
      },
      tologin:function(){
            this.$router.push('login')
        }
  },

  // 2、注册子组件（不能关键字，不影响前面其他命名）
  components:{
    myHead,//页头
    tabbaricon,//底部固定导航
    myTabbar,//首页
    mySort,//分类
    mySeckill,//秒杀
    myCart,//购物车
    myLogin,//登录
    mine,//我的



  }
}
</script>



<style scoped>
/* 溢出隐藏 */
.page-tabbar{overflow: hidden;}
/* 溢出后显示滚动条 */
.page-wrap{
overflow:auto;
padding-bottom: 60px;
} 

/* 修改 tabbar 默认文字颜色 蓝变灰 */
.mint-tabbar>.mint-tab-item{
  color:#555;
  background: #fff;
}
/* 修改默认tab选中文字样式  选中变绿 */
.mint-tabbar>.mint-tab-item.is-selected{
  background-color: transparent;
  color:#ff2400;
  background: #fff;
}


</style>