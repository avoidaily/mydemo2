<template>
    <div class="tab-title">
        <!-- 1、搜索框 -->
        <div class="myinput">
            <input class="search" type="text" placeholder="搜索">
            <mt-button class="cancelBtn"><i class="iconfont icon-search copy"></i></mt-button>
        </div>
        <!-- 2、轮播 -->
        <mt-swipe class="swipe" :auto="4000" >
            <mt-swipe-item><img src="../assets/banner01.jpg" alt=""></mt-swipe-item>
            <mt-swipe-item><img src="../assets/banner02.jpg" alt=""></mt-swipe-item>
            <mt-swipe-item><img src="../assets/banner03.jpg" alt=""></mt-swipe-item>
            <mt-swipe-item><img src="../assets/banner04.jpg" alt=""></mt-swipe-item>
            <mt-swipe-item><img src="../assets/banner05.jpg" alt=""></mt-swipe-item>
            <mt-swipe-item><img src="../assets/banner06.jpg" alt=""></mt-swipe-item>
        </mt-swipe>
        <!-- 3、商城固定导航 -->
        <div >
            <ul class="ul-img">
                <li class="li-img" v-for="(item,index) in navlist" :key="index"><router-link to="refill"><img class="action-img" :src="item.img" alt=""></router-link>{{item.title}}</li>
            </ul>
        </div>
        <!-- 4、限时秒杀 -->
        <div class="content">
            <div>
                <p><img class="timeout-img" src="../assets/xianshi.png" alt=""></p>
                <span class="cont-band">大牌正品 每日上新</span>
            </div>
            <div class="searchall" >查看全部<i class="iconfont icon-dayu"></i></div>
        </div>
        <!-- 5、导航商品  *8 -->
        <div class="nav-product" id="parent">
            <ul class="nav-product-wrap" >
                <li class="nav-flex" v-for="(item,index) in list" :key="index">
                    <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
                    <p class="nav-price">￥{{item.price}}</p>
                    <span class="nav-subprice">￥{{item.subprice}}</span>
                </li>
            </ul>
        </div>

        <!-- 6、精选活动 -->
        <div class="activity">
            <h3>精选活动</h3>
            <span class="good-title">挑好货 享低价</span>
        </div>
        <!-- 7、商品 -->
        <!-- F1 -->
        <div class="floor1" >
            <!-- 标题大图 5+1 个商品-->
            <indexProduct></indexProduct>
        </div>
   </div>
</template>


        

<script>
import indexProduct from "../components/indexProduct.vue"


export default {
    data(){
        return{
            // 1、准备一个数组，保存返回数据
            list:[],
            navlist:[
                {img:require("../assets/sb01.png"),title:"积分商城"},
                {img:require("../assets/sb02.png"),title:"限时秒杀"},
                {img:require("../assets/sb03.png"),title:"视频购"},
                {img:require("../assets/sb04.png"),title:"热剧同款"},
                {img:require("../assets/sb05.png"),title:"流量充值"},
            ],
        }
    },
    created(){
        //2、组件创建完成就调用 加载函数
        this.loadMore();
    },
    methods:{
        // 3、接口
        loadMore(){//加载数据
            // 1、创建url
            var url="navProduct";
            // 2、发送ajax请求
            this.axios.get(url).then(result=>{
                // 将请求到的主句添加到list数组中
                this.list=result.data.data;
            })
        },
    },
    components:{
        indexProduct,

    }
}
</script>


<style scoped>

/* 2、搜索框 */
.myinput{
    width:90%;height:40px;
    margin:10px auto;
    display: flex;
    justify-content:center;
}
.search{
    height:35px;
    border-bottom-left-radius: 35px;
    border-top-left-radius: 35px;
}
.cancelBtn{
    width: 60px;height:35px;
    background-color: #ee394b;
    border-bottom-right-radius: 35px;
    border-top-right-radius: 35px;
}
.copy{
    font-size: 20px;
    color:#fff;
}
/* 3、轮播 */
.swipe{width: 100%;height:127px;}
.swipe img{
    width: 90%;
    height: 127px;
    border-radius: 10px;
}
/* 3、商城 */
.ul-img{
    display: flex;
    justify-content:space-around;
    font-size: 12px;
    padding: 35px 0;
    background-color: transparent;
}
.li-img{
    display: flex;
    flex-direction: column;
    justify-content:center;
}
.action-img{
    width:45px;height:45px; 
    margin: 0 0 5px 7px;
    width: 31px;height:31px;
}
/* 4、限时秒杀 */
.content{
    display: flex;
    justify-content: space-between;
    margin:0px 10px;
}
.content p{margin:0;}
.timeout-img{
    height: 30px;
}
.cont-band{
    color:#999;
    font-size: 14px;
}
.searchall{
    color:#999;
    font-size: 15px;
    padding-top: 18px;
}
/* 右侧箭头 */
.icon-dayu{
    font-size: 10px;
    font-weight: bold;
    color:#c8c8cd;
    padding: 0 3px;
}
/* 5、导航商品 */
.nav-product{
    width: -5000px;
    margin: 10px 0;
}
.nav-product-wrap{
    white-space: nowrap;
    overflow-x:scroll;
    overflow-y:hidden;
    border-bottom: 1px solid #eee;
    width: 100%;
    float: left;
    background-color: #fff;
}
.nav-flex{
    display:inline-block;
    height:50px;
    line-height: 50px;
    padding-left:5px;
    padding-right: 5px;
}
/* 横向导航商品清除浮动 */
#parent::after{
    content:"";
    display:block;
    clear:both;
}
/* 5：商品信息 */
.nav-product-wrap img{width: 94px;height:92px;}
.nav-price{
    margin:-30px;
    font-weight: bold;
    color:#ee394b;
    font-size: 15px;
}
.nav-subprice{
    display: inline-block;
    text-decoration: line-through;
    color:#999;
    font-size: 14px;
}
/* 6、精选活动 */
.activity{
    text-align: left;
    margin: 25px 0 20px 15px;
    font-size: 14px;
    color:#000;
}
.good-title{color:#999;}











</style>