<template>
    <div class="refill">
        <!-- 1:：固定页头 -->
        <div class="head-title">
            <!-- 左侧：按钮 -->
            <router-link to="/"><mt-button class="back" icon="back"></mt-button></router-link>
            <!-- 中间：标题 -->
            <div class="photorefill">手机充值</div>
            <!-- 右侧：订单 -->
            <mt-button class="order" @click="nothing">订单</mt-button>
        </div>
        <!-- 占位符 -->
        <div style="height:50px"></div>
        <!-- 2：输入手机号码框 v-model="phone" -->
        <van-cell-group class="myinput">
            <!-- <span>请输入手机号码</span> -->
            <van-field
            placeholder="请输入手机号码"
            />
        </van-cell-group>
        
        <!-- v-model="active"  -->
        <van-tabs  class="list-items">
            <!-- 1  @click="paycall"-->
            <van-tab class="call" title="充话费" style="title-active-color:#ff7e00;">
                <!-- 切换 充话费 -->
                <!-- 3.1话费流量套餐 -->
                <div class="con">
                    <ul class="con-list">
                        <li class="con-item" v-for="(item,index) in list" :key="index" @click="son(item,index)" :class='index==isActive?"isActive":""'>
                            <i class="con-pay" @click="son(item,index)" :class='index==s1?"s1":""'>{{item.pay}}元</i>
                            <i class="con-pre" @click="son(item,index)" :class='index==s2?"s2":""'>售价{{item.pre}}元</i>
                        </li>
                    </ul>
                </div>
            </van-tab>
            <!-- 2 @click="payflow"-->
            <van-tab class="flow" title="充流量">
                 <!-- 切换 充流量   -->
                <div class="tab">
                    <!-- 3.1:流量套餐 -->
                    <div class="con">
                        <ul class="con-list">
                            <li class="con-item" v-for="(item,index) in list2" :key="index" @click="son(item,index)" :class='index==isActive?"isActive":""'>
                                <i class="con-pay" @click="son(item,index)" :class='index==s1?"s1":""'>{{item.flow}}</i>
                                <i class="con-pre" @click="son(item,index)" :class='index==s2?"s2":""'>售价{{item.mons}}元</i>
                            </li>
                        </ul>
                    </div>
                    <!-- 3.2优惠券 -->
                    <mt-cell class="Coupon" title="优惠抵扣" value="暂无优惠"></mt-cell>
                    <!-- 3.3支付金额 -->
                    <div class="pay">
                        <div class="detail">
                            <p class="pay-title">支付金额</p>
                            <i>全国可用，月底失效</i>
                        </div>
                        <span>50.00<i>元</i></span>
                    </div>
                    <!-- 3.4：支付按钮 -->
                    <mt-button class="now-pay" size="large">立即购买</mt-button>
                </div>
            </van-tab>

        </van-tabs>





        <!-- 4：广告图 -->
        <div class="advertisement">
            <img src="../assets/refill-banner.png" alt="">
        </div>
        <!-- 5：更多充值 -->
        <div class="morerefill">
            <div class="more-title">更多充值</div>
            <div class="more-img">
                <img class="more-card" src="../assets/refill-card.png" alt="">
                <img class="more-Discount" src="../assets/refill-de.png" alt="">
                <p>购物卡券</p>
            </div>
        </div>
        <!-- 6：订单 -->
        <div class="other">
            <p class="myorder">我的订单 |</p>
            <p class="problem"> 常见问题</p>
        </div>
    </div>
</template>


<script>
import { Field,Toast,Tab,Tabs,Cell, CellGroup } from 'vant';

// import { NavBar } from 'vant';
export default {
    components:{
        [Field .name]:Field,
        [Tab .name]:Tab,
        [Tabs .name]:Tabs,
        [Cell .name]:Cell,
        [CellGroup .name]:CellGroup,
    },
    data(){
        return{
            isActive:0,
            s1:0,
            s2:0,
            // 切换
            changeRed:0,
            isSelect:true,
            // 话费
            list: [
               {pay:30,pre:29.97}, 
               {pay:50,pre:49.95}, 
               {pay:100,pre:99.90}, 
               {pay:200,pre:199.80}, 
               {pay:300,pre:299.70}, 
               {pay:500,pre:499.50}
            ],
            // 流量
            list2:[
                {flow:'100M',mons:"6.00"}, 
                {flow:'300M',mons:"12.00"}, 
                {flow:'500M',mons:"20.90"}, 
                {flow:'1G',mons:"28.00"}, 
                {flow:'2G',mons:"50.00"}, 
                {flow:'3G',mons:"68.00"}
            ]
        }
    },
    methods:{
        nothing(){
            this.$toast({
                message:"没有更多了！！",
                position:'middle',
                duration:'1500'
            })
        },
        son(item,index){
        this.isActive=index;
        this.s1=index;
        this.s2=index;

        }
    },
}
</script>


<style scoped>

.isActive{
    background-color: #ff7e00;
    color: #fff;
}
.s1{
    color: #fff;
}
.s2{
    color: #fff;
}


.nav{color:#000;}

/* 页头 */
.head-title{
    background: #191919;
    display: flex;
    justify-content: space-between;
}
 /* 按钮 */
.back{
    background: #191919;
    font-weight: bold;
}
.photorefill{
    color: #fff;
    font-size: 20px;
}
.order{
    background: #191919;
    color: #fff;
    box-shadow: 0;
}
/* 去掉button边框阴影 */
.mint-button--default{
    box-shadow: none;
}
/* 输入手机号码 */
.myinput>>>.van-field__control{
    border:0;
    border-bottom: 1px solid #999;
    font-size: 30px;
    margin-top:10px;
}

/* 切换面板——话费 */
.refill>>>.van-tab{
    font-size: 19px;
    color:#555;
}
.list-items>>>.van-tab--active{
    color:#ff7e00;
    font-weight: 500;
}
.list-items>>>.van-tabs__line{
    background-color: #ff7e00;
}

/* 套餐 */
.con{padding:25px 10px 20px 10px;}
.con-item{
    padding:10px;
    text-align: center;
    border-radius:5px;;
    color: #ff7e00;
    border: 1px solid #ff7e00;
    width: 115px;height:67px;
    line-height: 25px;
    display: flex;
    flex-direction: column;
}
.con-list{
    height:166px;
    display:flex;
    justify-content: space-around;
    flex-wrap: wrap;
}
.con-item i{
    font-style: normal;
}
.con-pay{
    font-weight: bold;
    font-size: 20px;
}
.con-pre{
    font-size: 12px;
}
.now-pay{
    width: 85%;
    margin: 20px auto;
    background-color: #ff7e00;
    color:#fff;
    border-radius: 45px;
}


/* 图片 */
.advertisement img{
    width: 100%;
    height: 110px;
}
/* 更多充值 */
.morerefill{
    padding:10px 10px;
    text-align: left;
}
.more-title{
    padding: 20px 0;
    font-size: 20px;
    line-height: 20px;
}
.more-img{
    margin-left: 20px;
}
.more-card{
    width: 28px;height: 28px;
}
.more-Discount{
    width: 40px;height: 14px;
    margin-bottom: 20px;
}

/* 订单 */
.other{
    display:flex;
    justify-content: center;
}


.Coupon{
    text-align: left;
    border-bottom: 1px solid #f3f3f3;
    margin-bottom: 20px;
}
.Coupon>>>.mint-cell-wrapper{
    background: #fff;
}
.pay{
    display:flex;
    justify-content: space-between;
    margin:0 10px;
}
.pay i{
    font-size: 12px;
    font-style: normal;
    color:#666;
}
.pay-title{
    color:#333;
    font-size: 16px;
    margin-bottom:5px;
    width: 67px;
}
.pay span{
    font-size: 30px;
    line-height: 54px;
}



</style>