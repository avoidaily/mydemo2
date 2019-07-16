<template>
    <div class="ex">
        <!-- 01:页头 -->
        <my-head></my-head>
        <!-- 分类标题 -->
        <div class="sort-head">
            <router-link  to="order" class="sort-icon">
                <mt-button class="back" icon="back"></mt-button>
                <i class="iconfont icon-shouye"></i>
            </router-link>
            <div class="sort-title">优惠券</div>
        </div>

        <div class="add">添加优惠券</div>

        <!-- 优惠券单元格 -->
        <van-coupon-cell 
        @click="showList = true"

        />

        <!-- 优惠券列表 -->
            <van-coupon-list
            @change="onChange"
            @exchange="onExchange"
            />

    </div>
</template>

<script>



import {  CouponList,CouponCell,    } from 'vant';
import myHead from '../components/head.vue' // 1、引入页头

export default {
    components:{
        [CouponCell.name]:CouponCell,
        [CouponList.name]:CouponList,


        myHead,//页头

    },
    data(){
        return{
            
    }
},
    methods:{
        onChange(index) {
            this.showList = false;
            this.chosenCoupon = index;
        },
        onExchange(code) {
            this.coupons.push(coupon);
        }
    },
}
</script>


<style scoped>
.ex>>>.van-coupon-list__close{
    background-color: #ee394b;
    color:#fff;
}
.ex>>>.van-cell{
    line-height: 23px;
}

.ex>>>.van-field__control{
    margin-bottom: 0;
}
.ex>>>.van-tab__pane{
    height: 442px;
}
.ex>>>.van-coupon-list__list{
    height: 442px!important;
}

.ex>>>.van-cell__title{
    text-align: left;
}

.add{
    font-size: 14px;
    color:#333;
    text-align: left;
    margin: 15px;
}
/* 页头 */
.back{
    text-align: left;
    background-color: transparent;
    font-weight: bold;
    margin-right: 10px;
    font-size: 24px;
    border: 1px solid #fff;
    line-height: 35px;
}
/* 去掉button边框阴影 */
.mint-button--default{
    box-shadow: none;
}
.icon-shouye{
    color:#555;
    font-weight: bold;
    font-size: 26px;
}
.sort-icon{
    display: flex;
    line-height: 40px;
    padding-top: 5px;
}
.sort-head{
    display:flex;
    justify-content: space-between;
    background-color: #fff;
}
.sort-title{
    margin-right: 35%;
    line-height: 53px; 
    font-weight: 600;
    font-size: 18px;
    color:#333;
}


</style>
