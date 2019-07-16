<template>
    <div class="receipt">
        <!-- 01:页头 -->
        <my-head></my-head>
        <!-- 分类标题 -->
        <div class="sort-head">
            <router-link  to="order" class="sort-icon">
                <mt-button class="back" icon="back"></mt-button>
                <i class="iconfont icon-shouye"></i>
            </router-link>
            <div class="sort-title">发票开具</div>
        </div>

        <div class="body">
            <div class="add">发票开具</div>

            <!-- 切换 -->
            <van-tabs v-model="active">
                <van-tab title="个人"  ></van-tab>
                <van-tab title="单位"  class="company">
                    <div class="companySection">
                        <div class="title">抬头及税号</div>
                        <van-cell-group>
                        <van-field
                            label="发票抬头："
                            placeholder="必填，请填写发票抬头，如单位名称"
                        />
                        <van-field
                            label="添加税号："
                            placeholder="必填，请填写纳税人识别号"
                        />
                        </van-cell-group>
                    </div>
                </van-tab>

                <div class="content">发票内容</div>

                <van-tabs v-model="select" class="invoiceCon">
                    <van-tab title="明细"  ></van-tab>
                    <van-tab title="办公用品"  ></van-tab>
                    <van-tab title="电脑配件"  ></van-tab>
                    <van-tab title="耗材"  ></van-tab>
                </van-tabs>
            </van-tabs>

            <!-- 发票须知 -->
            <div class="invoiceTreceiptt">
                <div class="treceiptttitle">发票须知</div>
                <ul class="ul">
                    <li>1、第三方卖家销售的商品发票由卖家开具、寄出，发票内容由卖家决定，请以实际收取发票为准。</li>
                    <li>2、自2017年7月1日起，发票抬头选择公司单位（企业、有税号的非企业性单位和个体工商户）需要提供纳税人识别号。</li>
                    <li>3、保税仓发货商品与海外直邮商品属于跨境海外商品，无法开具国内发票。</li>
                </ul>
            </div>

            <!-- 确定按钮 固定 -->
            <van-button size="large" class="yes" >确定</van-button>

        </div>

    </div>
</template>

<script>
import {  Tab,Tabs,Field,Cell, CellGroup,Button   } from 'vant';
import myHead from '../components/head.vue' // 1、引入页头

export default {
    components:{
        [Tab.name]:Tab,
        [Tabs.name]:Tabs,
        [Field.name]:Field,
        [Cell.name]:Cell,
        [CellGroup.name]:CellGroup,
        [Button.name]:Button,



        myHead,//页头

    },
    data(){
        return{
            // 切换
            // changeRed:0,
            isSelect:true,
            // 个人/单位
            active: 0,
            // 发票内容
            select: 0,
    }
},
    methods:{

    },
}
</script>


<style scoped>
.receipt{background: #f0f0f0;}
.sort-head{background-color: #fff;}

.receipt>>>.van-tabs__nav{
    padding-left:10px;
    margin-bottom:15px;
}
.receipt>>>.van-tabs__line{
    height:0;
}
.receipt>>>.van-tab{
    color:#333;
    background-color: #f6f6f6;
    flex:none;
    border-radius: 45px;
    width: 80px;
    height: 30px;
    line-height: 30px;
    margin: 0 5px;
}
.receipt>>>.van-tab--active{
    color:#fff;
    background-color: #ee304b;
}
/* 发票内容 */
.content{
    color: #333;
    background-color: #fff;
    text-align: left;
    padding:10px 15px;
}
.van-tab__pane{padding: 10px 0;}

/* 抬头税号 */
.van-cell{
    line-height:42px; 
    padding: 0 5px;
}
.receipt>>>.van-field__control{border:none;}
.title{
    padding: 13px 15px;
    text-align: left;
    background-color: #fff;
    font-size: 16px;
}

/* 发票须知 */
.invoiceTreceiptt{
    background-color: #f0f0f0;
    padding-top: 20px;
    padding-bottom: 270px;
    font-size: 14px;
    color:#999;
}
.treceiptttitle{
    margin-bottom: 10px;
}
.ul {
    padding:0 10px 100px 10px;
    font-size: 13px;
    color: #999;
    height:100px;
    line-height: 22px;
    text-align: left;
}

.add{
    font-size: 16px;
    color:#333;
    text-align: left;
    padding: 15px;
    background-color: #fff;
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
/* 确定按钮 */
.yes{
    background-color:#ee304b;
    color: #fff;
    position: fixed;
    bottom:0;left: 0;
}

</style>
