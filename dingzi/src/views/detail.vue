<template>
    <div class="detail">
        <!-- 0:页头 -->
        <my-head></my-head>
        <!-- 1：商品图片轮播 -->
        <mt-swipe class="swipe" :auto="4000" >
            <mt-swipe-item><img src="../assets/d01.jpg" alt=""></mt-swipe-item>
            <mt-swipe-item><img src="../assets/d02.jpg" alt=""></mt-swipe-item>
            <mt-swipe-item><img src="../assets/d03.jpg" alt=""></mt-swipe-item>
            <mt-swipe-item><img src="../assets/d04.jpg" alt=""></mt-swipe-item>
            <mt-swipe-item><img src="../assets/d05.jpg" alt=""></mt-swipe-item>
        </mt-swipe>
        <!-- 2：图标*3 定位+堆叠 -->
        <div class="icon">
            <div class="icon-left">
                <img @click="goBack" class="r1" src="../assets/backicon.png" alt="">
                <router-link to="/"><img src="../assets/homeicon.png" alt=""></router-link>
            </div>
            <img class="icon-img" src="../assets/shareicon.png" alt="">
        </div>
        <!-- 3：商品信息 -->
        <div class="detail-info">
            <!-- 3.1：标题 -->
            <div class="detail-title">自带充电仓+双耳迷你无线蓝牙耳机手机通用入耳塞</div>
            <!-- 3.2：价格+倒计时 -->
            <div class="detail-intr">
                <!-- 1 -->
                <div class="detail-priceall">
                    ￥<em class="detail-price">29.9</em>
                    <i class="detail-subprice">￥209</i>
                </div>
                <!-- 2 -->
                <div class="detail-time">
                    <img src="../assets/dtime.png" alt="">
                    <span>距离结束 {{countDownList}}</span>
                </div>
            </div>
            <!-- 3.3：已售数量+快递费+地址 -->
            <div class="other">
                <span>已售 7992</span>
                <span>快递：￥0</span>
                <span>广东东莞市</span>
            </div>
            <!-- 3.4：服务承诺 组件 -->
            <div class="page-actionsheet-wrapper">
              <button class="mint-button  mint-button--large mint-button-text" @click="openShow">
                <div class="mint-button-flex">
                    <i class="mint-logo"></i><span class="mint-right">钉子电商</span>
                    <i class="mint-logo"></i><span class="mint-right">正品保证</span>
                    <i class="mint-logo"></i><span class="mint-right">极速发货</span>
                </div>
                <van-icon name="arrow"/>
              </button>
            </div>
            <!-- 服务承诺 内容 -->
            <van-popup v-model="show" position="bottom" :overlay="true">
                <div class="toasts-inner" id="menu" >
                    <div class="detail_popList_wrapper">
                        <div class="detail_popList_title">服务承诺</div>
                        <div class="detail_popList_list_container">
                            <ul class="detail_popList_list">
                                <!-- ******** -->
                                <li class="detail_popList_li" v-for="item in serverlist" :key="item.i">
                                    <div class="detail_popList_li_L"></div>
                                    <div class="detail_popList_li_R">
                                        <span class="promise_title">{{item.title}}</span>
                                        <div class="promise_detail">{{item.subtitle}}</div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="detail_popList_bot_confirm" @click="hideShow">确定</div>
                    </div>
                </div>
            </van-popup>

            <!-- 3.5：商品介绍 -->
            <div class="detail-product">
                <div class="detail-product-line"></div>
                <div class="detail-product-title">商品介绍</div>
                <div class="detail-product-subtitle">自带移动充电仓 随时充电 单双耳佩戴 一分为二 自由选择 高清通话 震撼立体声 自动配对 迷你小巧 贴身便携 释放双手！</div>
            </div>
        </div>


        <!-- 4：用户评价 跳转更多下拉加载 -->
        <div class="commentcard">
            <div class="commentTop">
                <span>用户评论（999+）</span>
                <span @click="morecomment">更多<van-icon name="arrow"/></span>
            </div>
            <div class="commentBody">
                <!-- 1:头像 -->
                <div class="commentimg">
                    <img src="../assets/female-130.png" alt="">
                </div>
                <!-- 2：内容 -->
                <div class="commentC">
                   <div class="commentname">水***亮</div> 
                   <div class="commentmore">
	                	耳机果然没让我失望，这款双耳蓝牙耳机质量还不错，白色简约。这是我买过比较好看的蓝牙耳机。做工感觉挺精致，音质清晰无杂音，外观大气有档次，这蓝牙耳机实在是强大，音质也是杠杠的，质量非常强硬，性价比非常高。
	                </div>
                    <div class="commentsort">
                        <span class="commentcolor">颜色分类: 黑色</span>
                        <span class="commenttime">2019.06.20</span>
                    </div>
                </div>
                
            </div>
        </div>

        <div class="other-detail">
            <!-- 5：联系客服 -->
            <div class="contact-servant">
                <div class="contact-kefu">
                    <i class="contact-img"></i>
                    <span>联系客服</span>
                </div>
                <van-icon class="icon-arrow" name="arrow"/>
            </div>
            
            <!-- 6：商品详情+参数+售后  组件 -->
            <van-tabs type="card">
                <van-tab class="pic-detail" title="图文详情">
                    <img src="../assets/detail01.jpg" alt="">
                    <img src="../assets/detail02.jpg" alt="">
                    <img src="../assets/detail03.jpg" alt="">
                    <img src="../assets/detail04.jpg" alt="">
                    <img src="../assets/detail05.jpg" alt="">
                    <img src="../assets/detail06.jpg" alt="">
                    <img src="../assets/detail07.jpg" alt="">
                    <img src="../assets/detail08.jpg" alt="">
                    <img src="../assets/detail09.jpg" alt="">
                    <img src="../assets/detail10.jpg" alt="">
                    <img src="../assets/detail12.jpg" alt="">
                    <img src="../assets/detail13.jpg" alt="">
                    <img src="../assets/detail14.jpg" alt="">
                </van-tab>
                <van-tab class="tab02" title="商品参数">
                    <div class="paramBox_wrapper">
                        <div class="paramBox_line">
                            <span class="paramBox-title">售后服务</span>
                            <span>其他</span>
                        </div>
                        <div class="paramBox_line">
                             <span class="paramBox-title">蓝牙版本</span>
                            <span>4.2</span>
                        </div>
                        <div class="paramBox_line">
                            <span class="paramBox-title">使用方式</span>
                            <span>挂耳式</span>
                        </div>
                    </div>
                </van-tab>
                <van-tab title="商家售后">
                    <div class="product_paramBox">
                        <div class="shop-service">
                            <div class="paramBox_line">
                                <span class="shop-left">商家名称</span>
                                <span>趣加数码专营店</span>
                            </div>
                            <div class="paramBox_line">
                                <span class="shop-left">所在地区</span>
                                <span>广东 东莞</span>
                            </div>
                            <div class="paramBox_line">
                                <span class="shop-left">联系电话</span>
                                <span>13800138000</span>
                            </div>
                            <div class="paramBox_line">
                                <span class="shop-left">工商执照</span>
                                <img src="../assets/wordcard.png" alt="">                                
                            </div>
                            <div class="paramBox_line">
                                <span class="shop-left">行业执照</span>
                                <img src="../assets/rowcard.png" alt="">
                            </div>
                        </div>
                        <!-- 关注号 -->
                        <div class="service-num">
                            <p class="service_line">本商家商品保证正品行货</p>
                            <p class="service_line">严格按照国家三包政策提供售后服务</p>
                            <p class="service_line">关注爱奇艺商城微信服务号 (微信号iqiyistore)</p>
                            <p class="service_line">获取更多售后客服支持</p>
                            <img src="../assets/mycode.png" alt="">
                        </div>
                    </div>
                </van-tab>
            </van-tabs>
        </div>

        <!-- 7：底部固定导航条 组件 -->
        <div class="footer">
            <div class="fl">
                <a class="foot_buyCar" href="javascript:;">
                    <i class="iconcollect icon-img"></i>
                    <span>收藏</span>
                </a>
                <router-link to="cart">
                    <a class="foot_buyCar fl-right" href="javascript:;">
                        <i class="iconcar icon-img"></i>
                        <span>购物车</span>
                        <i class="buyCar_nub">6</i>
                        <!-- 购物车图标数量 -->
                        <!-- <i class="buyCar_nub" v-show="cartCounter > 0">{{ cartCounter }}</i> -->
                    </a>
                </router-link>
            </div>
            <div class="fr">
                <!-- 8：加入购物车 立即购买 -->
                <van-sku
                v-model="showBase"
                :sku="sku"
                :goods="goods"
                :goods-id="sku.goods_id"
                :hide-stock="sku.hide_stock"
                :quota="sku.quota"
                :quota-used="sku.quota_used"

                :custom-stepper-config="customStepperConfig"
                :initial-sku="initialSku"        

                :close-on-click-overlay="closeOnClickOverlay" 
                @buy-clicked="onBuyClicked"
                @add-cart="onAddCartClicked"
                
                />

                <a @click="showBase = true" href="javascript:;" class="add_buyCarBtn">加入购物车</a>
                <a @click="showBase = true" href="javascript:;" class="buy_btn">立即购买</a>
            </div>
        </div>    

    </div>
</template>



<script>
import { Icon, Tab, Tabs, Sku,Toast,Button,Popup } from 'vant';
import myHead from '../components/head.vue' // 1、引入页头


export default {
    // 2、注册子组件（不能关键字，不影响前面其他命名）
    components:{
        myHead,//页头
        [Icon .name]:Icon, 
        [Tab .name]:Tab, 
        [Tabs .name]:Tabs, 
        [Sku.name]:Sku,
        [Toast.name]:Toast,
        [Button.name]:Button,
        [Popup.name]:Popup,
    },
    data(){
        return{
            // 倒计时
            countDownList: '00天00时00分00秒',
        　　actEndTime: '2019-7-28 18:00:00',
            // 商品介绍
            show: false,
            serverlist:[
                {title:"钉子商城",subtitle:"钉子旗下电商，品牌保障，放心购买。"},
                {title:"正品保证",subtitle:"质检审核全流程覆盖 所有商品保证正品。"},
                {title:"极速发货",subtitle:"除定制商品、约定发货时间外， 订单48小时内发货。"},
                {title:"运费说明",subtitle:"商品因不同地区运费不同 请以实际支付订单页为准"},
                {title:"7天无理由",subtitle:"定制，手机等特殊商品不支持无理由退货 请以商品详情页说明为准。"}
            ],
            // 商品规格
            showBase: false,
            closeOnClickOverlay: true,
            initialSku:{
                s1: '30349',
                s2: '1193',
                selectedNum: 3
            },
            // 1:
            sku: {
                tree:[
                        {
                            k: '颜色分类',
                            k_id: '1',
                            v:[
                                {
                                    id: '30349',
                                    name: '黑色',
                                    imgUrl:'https://mall5.iqiyipic.com/mall/20190310/74/e0/mall_5c851d15d2999d0923ef74e0_1x1.jpg'  
                                      
                                },
                                {
                                    id: '1215',
                                    name: '白色'
                                }
                            ],
                            k_s: 's1',
                            count: 2
                        },
                    ],

                list:[
                        {
                            id: 2259,
                            price: 3550, //价格
                            discount: 122, 
                            s1: '1215',
                            s2: '1193',  
                            stock_num: 20, //库存 
                            goods_id: 946755
                        },
                        {
                            id: 2257,
                            price: 2990,
                            discount: 132, 
                            s1: '30349',
                            s2: '1193', 
                            stock_num: 40, //库存 
                            goods_id: 946755
                        },
                    ],

                    price: '29.9',
                    stock_num: 3324, // 商品总库存
                    collection_id: 2261, //无规格商品skuId取collection_id，否则取所选sku组合对应的 id 
                    none_sku: false, // 是否无规格商品
                    hide_stock: false  // 是否隐藏剩余库存
                },

                goods_id: '946755', 
                quota: 10, //限购数量 
                quota_used: 0,  //已经购买过的数量

            // 2：
            goods:{
                title: '自带充电仓+双耳迷你无线蓝牙耳机手机通用入耳塞',
                picture:
                'https://mall3.iqiyipic.com/mall/20181206/85/69/mall_5c0941f774d579560a1f8569_1x1.jpg' 
            },

            // 3：
            initialSku:{
                s1: "0001",
                s2: "1001",
                // 初始选中数量
                selectedNum: 1
            },

            //4：   
            customStepperConfig: {
                // 自定义限购文案
                quotaText: '每次限购10件',
                // 自定义步进器超过限制时的回调
                handleOverLimit: (data) => {
                    const { action, limitType, quota, quotaUsed } = data;

                    if (action === 'minus') {
                    Toast('至少选择一件商品');
                    } else if (action === 'plus') {
                    // const { LIMIT_TYPE } = Sku.skuConstants;
                    if (limitType === LIMIT_TYPE.QUOTA_LIMIT) {
                        let msg = `单次限购${quota}件`;
                        if (quotaUsed > 0) msg += `，你已购买${quotaUsed}`;
                        Toast(msg);
                    } else {
                        Toast('库存不够了');
                    }
                    }
                },
            },

        }
    },

    // 生命周期 组件创建成功后
    created() {
        // 倒计时
        this.countDown();
        // // 接口
        // this.loadMore();
        // // 详情页
        // this.$route.params.id;
    },

    //生命周期 挂载后
    mounted(){
        // 获取了某一商品的详情信息
        // this.id = this.$route.params.id;
        // console.log(this.id);
        // this.detail(this.id);
        
    },

    // 计算属性——购物车图标数量
    computed: {
        cartCounter () {
            return this.$store.state.cartCounter;
        },
    },

    methods:{
        // // 3、接口
        // loadMore(){//加载数据
        //     // 1、创建url
        //     var url="detail";
        //     // 2、发送ajax请求
        //     this.axios.get(url).then(result=>{
        //         // 将请求到的主句添加到list数组中
        //         this.list=result.data.data;
        //         console.log(list);
        //     })
        // },

        goBack () {
            window.history.length > 1
                ? this.$router.go(-1)
                : this.$router.push('/')
        }, 

        // 商品规格
        onBuyClicked(data) {
            // this.$toast('buy:' + JSON.stringify(data));
            this.$toast('请选择商品规格');
            console.log(JSON.stringify(data))
        },
        onAddCartClicked(data) {
            // this.$toast('add cart:' + JSON.stringify(data));
            this.$toast('请选择商品规格');
        }, 

        openShow(){
            this.show=true;
       },
       hideShow(){
           this.show=false;
       },
        // 跳转更多评论
        morecomment(){
            this.$router.push('/moreComment');
        },

        // 倒计时
        timeFormat(param) {
　　　　　　return param < 10 ? '0' + param : param;
　　　　},
　　　　countDown(it) {
　　　　　　var interval = setInterval(() => {
　　　　　　　　// 获取当前时间，同时得到活动结束时间数组
　　　　　　　　let newTime = new Date().getTime();
　　　　　　　　// 对结束时间进行处理渲染到页面
　　　　　　　　let endTime = new Date(this.actEndTime).getTime();
　　　　　　　　let obj = null;
　　　　　　　　// 如果活动未结束，对时间进行处理
　　　　　　　　if (endTime - newTime > 0) {
　　　　　　　　　　let time = (endTime - newTime) / 1000;
　　　　　　　　　　// 获取天、时、分、秒
　　　　　　　　　　let day = parseInt(time / (60 * 60 * 24));
　　　　　　　　　　let hou = parseInt(time % (60 * 60 * 24) / 3600);
　　　　　　　　　　let min = parseInt(time % (60 * 60 * 24) % 3600 / 60);
　　　　　　　　　　let sec = parseInt(time % (60 * 60 * 24) % 3600 % 60);
　　　　　　　　　　obj = {
　　　　　　　　　　　　day: this.timeFormat(day),
　　　　　　　　　　　　hou: this.timeFormat(hou),
　　　　　　　　　　　　min: this.timeFormat(min),
　　　　　　　　　　　　sec: this.timeFormat(sec)
　　　　　　　　　　};
　　　　　　　　} else { // 活动已结束，全部设置为'00'
　　　　　　　　　　obj = {
　　　　　　　　　　　　day: '00',
　　　　　　　　　　　　hou: '00',
　　　　　　　　　　　　min: '00',
　　　　　　　　　　　　sec: '00'
　　　　　　　　　　};
　　　　　　　　　　clearInterval(interval);
　　　　　　　　}
　　　　　　　　this.countDownList = obj.day + '天' + obj.hou + ":" + obj.min + ":" + obj.sec;
　　　　　　}, 1000);
　　　　}
    },

}
</script>



<style scoped>


.detail>>>.van-button:nth-child(2){
    /* display: none; */
    width: 100%;
    background: -webkit-gradient(linear,left top,right top,color-stop(0%,#ff376d),color-stop(100%,#ff826e));
}
.detail>>>.van-button:nth-child(1){
    width: 100%;
    background: -webkit-gradient(linear,left top,right top,color-stop(0%,#ff376d),color-stop(100%,#ff826e));
}





.detail{background-color: #eee;}
/* 1、轮播 */
.swipe{width: 100%;height:414px;}
.swipe img{
    width: 100%;
    height: 414px;
}
.swipe>>>.mint-swipe-indicator{
    background: #ee394b;
    opacity: .4;
}
/* 2、图标 */
.icon{
    display:flex;
    justify-content: space-between;
    position: relative;
    z-index: 999;
}
.icon img{
    background-color: #000;
    border-radius: 50%;
    width: 30px;height:30px;
    padding:5px 5px;
    opacity: .4;
}
.icon-left{
    position: absolute;
    top:-405px;left:10px;
}
.icon-img{
    position: absolute;
    top:-405px;left:370px;
}
.r1{
    margin-right: 10px;
}
/* 3、商品信息 */
.detail-info{
    padding: 10px 10px 0 10px;
    background-color: #fff;
    overflow: hidden;
}
/* 标题 */
.detail-title{
    font-size: 15px;
    line-height: 21px;
    color: #333;
    padding-bottom:10px; 
    text-align: left;
}

/* 价格倒计时 */
.detail-intr{
    display: flex;
    justify-content: space-between;
    overflow: hidden;
    padding-bottom: 5px;
}
.detail-priceall{
    display: inline-block;
    color: #ee394b;
    font-size: 14px;
    /* height: 35px; */
}
.detail-price{
    font-style: normal;
    font-size: 27px;
    font-weight: 700;
    color: #ee394b;
}
.detail-subprice{
    display: inline-block;
    color: #999;
    font-size: 12px;
    margin-left: 6px;
    text-decoration: line-through;
    line-height: 38px;
    font-style: normal;
}
.detail-time{
    display: inline-block;
    height: 17px;
    line-height: 17px;
    border-radius: 17px;
    padding-left:8px;
    position: relative;
    padding-right: 8px;
    background: #ee394b;
    font-size: 10px;
    color: #fff;
    top: 10.5px;
}
.detail-time img{
    display: inline-block;
    width: 11px;
    height: 11px;
    background-size: cover;
    margin-right: 5px;
    vertical-align: middle;
}
/* 地址快递费 */
.other{
    display:flex;
    justify-content:space-between;
    clear: both;
    overflow: hidden;
    padding-bottom: 10px;
    font-size: 12px;
    color: #999;
}

/* 3、服务承诺 */
/* 下拉菜单 */
.mint-button-text{
    display: flex;
    justify-content: space-between;
}
.mint-button--default{
    background-color: #fff;
    box-shadow: none;    
}
.mint-button-flex{
    width: 100%;
    display:flex;
    justify-content:flex-start;
    font-size: 12px;
}
.mint-right{
    padding-right: 50px;
}
.mint-logo{
    width: 12px;height:12px;
    background-image: url("../assets/dpromise.png");
    background-size: cover;
    margin-top: 4px;
    margin-right: 8px;
}
/* 菜单内容 */
.toasts-inner{
    position: fixed;
    bottom: 0;
    left: 0;right: 0;
    z-index: 3000;
}
.detail_popList_wrapper{
    background: #fff;
    max-height: 390px;

}
/* 标题 */
.detail_popList_title{
    font-size: 16px;
    height: 40px;
    line-height: 55px;
    text-align: center;
    color: #666;
    margin: 10px 0;
}
/* 列表内容 */
.detail_popList_list_container{
    max-height: 296px;
    overflow-y: scroll;
}
.detail_popList_list{
    padding-left: 10px;
    padding-right: 20px;
}
.detail_popList_li{
    height: 73px;
    display: flex;
    justify-content: flex-start;
    margin: 20px 0;
}
/* 左 */
.detail_popList_li_L{
    width: 15px;
    height: 15px;
    display: block;
    margin-top: 2px;
    background-image: url("../assets/dpromise.png");
    background-size: cover;
}
/* 右 */
.detail_popList_li_R{
    margin-left: 10px;
    display: flex;
    flex-direction: column;
}
.promise_title{
    display: inline-block;
    line-height: 20px;
    font-size: 16px;
    color: #666;
    text-align: left;
}
.promise_detail{
    margin-top: 7px;
    font-size: 12px;
    color: #999;
    line-height: 15px;
    height: 46px;
    overflow: hidden;
    text-align: left;
}
/* 确定 */
.detail_popList_bot_confirm{
    text-align: center;
    line-height: 48px;
    background-color: #ee394b;
    color: #fff;
    font-size: 15px;
    height: 49px;
    padding: 0 40%;
}


/* 商品介绍 */
.detail-product{
    text-align: left;
    font-size: 13px;
    color: #999;
    padding: 20px 0;
}
.detail-product-line{
    border-bottom: 1px solid #eee;
    width: 100%;
    margin-bottom: -17px;
}
.detail-product-title{
    width:72px;
    background-color: #fff;
    margin:0 auto;
    padding:6px 10px;
}
/* 用户评论 */
.commentcard{
    margin: 10px 0;
    padding: 0 10px;
    background-color: #fff;
    font-size: 12px;
    color: #555;
}
.commentTop{
    display: flex;
    justify-content:space-between;
    padding-top: 10px;
    font-size: 13px;

}
/* 评论 */
.commentBody{
    display: flex;
    justify-content:space-between;
    padding: 10px 0;
}
.commentimg img{
    width: 30px;height:30px;
    margin-right: 4px;
}
.commentC{text-align: left;}
.commentsort{
    display: flex;
    justify-content: space-between;
    color: #999;
}

/* 其他详情 客服 */
.other-detail{
    background-color: #fff;
    color:#555;
    height: 5000;
    margin:10px 0;
}
.contact-servant{
    display: flex;
    justify-content:space-between;
    font-size: 13px;
    line-height: 40px;
    border-bottom: 1px solid #f9f9f9;
}
.contact-img{
    display: inline-block;
    width: 44px;height: 44px;
    vertical-align: bottom;
    background: url("../assets/kefu.png") no-repeat center;
    background-size: 15px 15px;
}
.icon-arrow{
    line-height: 44px;
    padding-right: 10px;
}

/* 菜单三栏 */
.pic-detail img{
    display: block;
    max-width: 100%;
    height: auto;
}

/* 商品参数 */
.paramBox_wrapper{
    padding: 15px 20px;
    background-color: #fff;
    height: 516px;
}
.paramBox_line{
    margin-bottom: 10px;
    text-align: left;
    font-size: 13px;
    color:#555;
}
.paramBox-title{
    color:#999;
    margin-right: 50px;
}

/* 商家售后 */
.product_paramBox{
    padding: 10px 20px;
    margin: 10px 0;

}
.shop-service{
    width: 100%;
    padding-bottom: 40px;
    text-align: left;
    font-size: 13px;
    color:#555;
}
.shop-left{
    color:#999;
    margin-right: 50px;
}
.paramBox_line img{
    width: 20px;height: 20px;
}
/* 关注号 */
.service-num img{
    margin: 25px 0;
    width: 112px;
    height: 112px;
}

/* 底部固定导航条 */
.footer{
    position: fixed;
    left: 0px;right: 0px;
    bottom: 0px;z-index: 99;
    display: flex;
    justify-content: space-between;
}
/* f left */
.fl{
    width: 33%;
    vertical-align: top;
    border-top:  1px solid #ddd;
    display: flex;
    justify-content: space-around;
    background-color: #fff;
}
/* a */
.foot_buyCar{
    display: flex;
    flex-direction: column;
    align-items: center;

}

.iconcollect{
    background: url("../assets/detail-cang.png")no-repeat;
    top: 0 ;left:20px ;
}
.iconcar{
    background: url("../assets/detail-cart.png")no-repeat;
    top: 0 ;left:8px ;
}
.icon-img{
    background-size: 100% 100%;
    width: 25px;height: 25px;
    margin-top: 5px;
}

.foot_buyCar span{
    color:#555;
    font-size: 14px;
    margin-top: 28px;
}

/* f right */
.fr{
    width: 67%;
    vertical-align: top;
    height: auto;
}
/* a */
.add_buyCarBtn{
    font-size: 15px;
    line-height: 49px;
    display: inline-block;
    width: 50%;height: 52px;
    text-align: center;
    color: #fff;
    background: #fd7b7b;
}
.buy_btn{
    font-size: 15px;
    line-height: 49px;
    display: inline-block;
    width: 50%;height: 52px;
    text-align: center;
    color: #fff;
    background: -webkit-gradient(linear,left top,right top,color-stop(0%,#ff396d),color-stop(100%,#ff826e));
}
.fl-right{position: relative;}
.buyCar_nub{
    font-size: 9px;
    font-style: normal;
    line-height: 14px;
    position: absolute;
    top: 5%;left: 50%;
    display: block;
    width: 14px;height: 14px;
    margin-left: 8px;
    color: #fff;
    border-radius: 50%;
    background: #ee394b;
}

/* 商品规格 */
/* 价格 */
.detail>>>.van-sku__goods-price{
    text-align: left;
}
/* 颜色分类 */
.detail>>>.van-sku-group-container{
    text-align: left;
}
/* 数量按钮 */
.detail>>>.van-sku__stepper{
    display: flex;
}
.detail>>>.van-stepper__input{
    color: #333;
    background-color: #f2f3f5;
    width: 16px;
    height: 15px;
    padding: 6px 6px;
    margin: 0 5px;
    line-height: 30px;
}

/* 微调 */
.detail>>>.van-sku-stepper-stock{
    padding: 15px 0 50px 0;
}
.detail>>>.van-sku-stepper-container{
    margin:0 225px 10px 0;
}
.detail>>>.van-sku-stepper-stock{
    text-align: left;
}

</style>
