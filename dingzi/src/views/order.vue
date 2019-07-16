<template>
    <div class="order">
        <!-- 01:页头 -->
        <my-head></my-head>
        <!-- 分类标题 -->
        <div class="sort-head">
            <router-link  to="/" @click="back" class="sort-icon">
                <mt-button class="back" icon="back"></mt-button>
                <i class="iconfont icon-shouye"></i>
            </router-link>
            <div class="sort-title">确认订单</div>
        </div>

        <!-- 地址栏 组件 -->
        <add></add>
        <!-- 商品信息 -->
        <div class="center_item">
            <!-- 图标+发货 -->
            <div class="addrs_title">
                <img class="pack_icon" src="../assets/company.png" alt="">
                由nerve more发货
            </div>
            <!-- 商品 图片+信息   +购买数量 -->
            <div class="order_center">
                <div class="dgsc_warp">
                    <!-- 图片 -->
                    <div class="dgsc_L">
                        <img src="../assets/d01.jpg" alt="">
                    </div>
                    <!-- 信息 -->
                    <div class="dgsc_R">
                        <div class="omit">自带充电仓+双耳迷你无线蓝牙耳机手机通用入耳塞</div>
                        <div class="dtcmc_sku">颜色分类: 白色</div>
                        <div class="dgsc_priBox">
                            <span>
                                <span class="order_dis">￥29.90 </span>
                                <span class="price_origin">￥299.00</span>
                            </span>
                            <span class="order_num">x{{value}}</span>
                        </div>
                    </div>
                </div>
                <!-- 购买数量 增减 -->
                <div class="inner_item">
                    <van-cell-group class="count">
                        <van-cell title="购买数量"/>
                        <van-stepper class="count-btn" v-model="value" />
                    </van-cell-group>
                </div>
            </div>
            <!-- 配送方式 -->
            <van-action-sheet
            v-model="show"
            :actions="actions"
            @select="onSelect"
            />
            <van-cell-group>
                <van-cell @click="showmenu" title="配送方式" value="快递0元" is-link />

            <!-- 买家留言 -->
                <van-field label="买家留言：" placeholder="告诉卖家您的特殊需求" />
            </van-cell-group>
            <!-- 总计 -->
            <div class="totel">
                <span>包裹总计(含运费):</span>
                <span>￥{{value*danjia | toFixed(2)}}</span>
            </div>
        </div>

        <!-- 优惠券 -->
        <van-cell-group class="coupons">
            <img src="../assets/coupons.png" alt="">
            <van-cell class="mycoupons" title="优惠券" value="0 张可用" is-link to="paycoupons" />
        </van-cell-group>
        <!-- 发票 -->
        <van-cell-group class="coupons">
            <van-checkbox class="mychecked" v-model="checked" checked-color="#ee394b"></van-checkbox>
            <van-cell class="mycoupons" title="发票开具" value="无需发票" is-link to="payreceipt" />
        </van-cell-group>
        <!-- 价格明细 -->
        <div class="price-detail">
            <!-- 标题 -->
            <div class="price-detail-title">—————— 价格明细 ——————</div>
            <!-- 商品总额+优惠 -->
            <ul class="detil-ui">
                <li class="detail-flex">
                    <span>商品总金额：</span>
                    <span>￥{{value*danjia | toFixed(2)}}</span>
                </li>
                <li class="detail-flex">
                    <span>运费总计：</span>
                    <span>￥0</span>
                </li>
                <li class="detail-flex">
                    <span>积分优惠：</span>
                    <span>-￥0</span>
                </li>
                <li class="detail-flex">
                    <span>满减优惠：</span>
                    <span>-￥0</span>
                </li>
                <li class="detail-flex">
                    <span>平台优惠券：</span>
                    <span>-￥0</span>
                </li>
            </ul>
        </div>
        <!-- 复选框:阅读并同意 -->
        <div class="protocol_box">
            <van-checkbox class="mychecked" v-model="checked2" checked-color="#07c160"></van-checkbox>
            <span>我已阅读并同意
                <span class="agreement">《商城用户协议》</span>
            </span>
        </div>
        <!-- 提交订单 底部固定 -->
        <div class="clearing_footer">
            <div class="clearing_L">
                <span class="total">合计：
                    <span class="money">￥{{value*danjia | toFixed(2)}}</span>
                </span>
            </div>
            <div class="clearing_R" @click="openShow">
                <mt-button class="submit_btn" >提交订单</mt-button>
            </div>
            <van-popup class="pay-popup" v-model="hide" position="center" :overlay="true">
                <img class="pay-myvx" src="../assets/myvx.jpg" alt="">
            </van-popup>
        </div>

    </div>
</template>


<script>
import myHead from '../components/head.vue' // 1、引入页头
import add from '../components/add.vue' // 1、引入地址
import{Cell, CellGroup,Stepper,ActionSheet,Toast,Field,Checkbox, CheckboxGroup,Popup} from 'vant';

export default {
    components:{
        myHead,//页头
        add,// 地址
        [Cell.name]:Cell,
        [CellGroup.name]:CellGroup,
        [Stepper.name]:Stepper,
        [ActionSheet.name]:ActionSheet,//下拉菜单
        [Toast.name]:Toast,
        [Field.name]:Field,
        [Checkbox.name]:Checkbox,
        [CheckboxGroup.name]:CheckboxGroup,
        [Popup.name]:Popup,

    },
    data(){
        return{
            // 提交
            hide: false,
            // 购买数量
            value: 1,
            danjia:29.9,
            // 配送方式——下拉菜单
            show: false,
            actions: [
                { name: '配送方式1' },
                { name: '快递0元', },
                { name: '确定' }
            ],
            // 发票
            checked: true,
            // 阅读同意
            checked2:true,
        }
    },

    methods:{
        // 返回上一页
        // this.$router.go(val) => 在history记录中前进或者后退val步，当val为0时刷新当前页面、-1即为返回上一页；
        back(){
            this.$router.go(-1);
        },
         onSelect(item) {
            // 点击选项时默认不会关闭菜单，可以手动关闭
            this.show = false;
        },
        showmenu(){
            this.show = true;
        },
        // 提交
        openShow(){
            this.hide=true;
       },
    },

}
</script>


<style scoped>
.order{background: #f0f0f0;}


/* 添加联系人 */
.order>>>.van-button--danger{
    background-color: #ee394b;
    border: 1px solid #ee394b;
} 
/* 阅读并同意 */
.protocol_box{
    margin-bottom: 50px;
    display: flex;
    justify-content: flex-start;
    font-size: 14px;
    color: #777;
    line-height: 54px;
}
.agreement{
    text-decoration: underline;
}

/* 价格明细 */
/* .price-detail{margin-bottom: 80px;} */
.price-detail-title{
    padding: 10px 0px;
    font-size: 14px;
    color:#999;
}
.detil-ui{
    background-color: #fff;
    font-size: 14px;
    color:#999;
}
.detail-flex{
    display: flex;
    justify-content: space-between;
    padding: 5px 10px;
}


/* 发票 */
.mychecked{
    margin: 12px 0 12px 5px;
    width: 30px;height: 30px;
}


/* 优惠券 */
.coupons{
    margin: 10px  0;
    display: flex;
    justify-content: space-between;
}
.order>>>.mycoupons{
    padding-left: 0;
}
.coupons img{
    width: 30px;height: 30px;
    margin: 12px 0 12px 5px;
}


/* 总计 */
.totel{
    text-align: right;
    padding: 15px 10px;
    border-bottom: 1px solid #f3f3f3;
}

.totel span:nth-child(1){
    font-size: 15px;
    color:#666;
    text-align: right;
}
.totel span:nth-child(2){
    font-size: 15px;
    color:#ee394b;
    
}


/* 买家留言 */
.order>>>.van-field__label{
    width:70px;
}
.order>>>.van-field__control{
    height: 24px;
    padding: 0 15px;
    border: none;
    margin: 0;
}

/* 配送方式 */
.van-hairline--top:nth-child(1){
    text-align: left;
    padding-left: 10px;
    border-bottom: 1px solid #f3f3f3;
    font-size: 16px;
    color:#666;
}

.van-hairline--top:nth-child(2){
    margin-bottom: 80px;
    text-align: left;
    padding-left: 10px;
    font-size: 14px;
    color:#666;
}

.van-hairline--top:nth-child(3){
        background-color: #ee394b;
    color: #fff;
}



/* 购买数量 */
.count{
    display: flex;
    justify-content: space-between;
}
.van-cell{
    padding: 15px 10px;
    display: flex;
    justify-content: space-between;
    border-bottom: 1px solid #f6f6f6;
    
}
.van-cell__title{flex: none;}

/* 按钮 */
.count-btn{
    display: flex;
    justify-content: space-between;
    width: 143px;
    padding: 15px 10px;
}
.order>>>.van-stepper__input{
    width: 35%;
    height: 26px;
    margin: 0px 5px;
    padding: 0;
}



/* 商品信息 */
.center_item{
    margin-top: 10px;
    background-color: #fff;
}
/* 发货 */
.addrs_title{
    color:#666;
    font-size: 12px;
    height:40px;
    line-height: 40px;
    text-align: left;
    padding:0 10px;
}
.pack_icon{
    width: 18px;height: 15px;
    margin-right: 5px;
    vertical-align: middle;
}

/* 商品信息 */
.dgsc_warp{
    background-color: #f8f8f8;
    display: flex;
}
/* 图片 */
.dgsc_L img{
    width: 110px;height: 110px;
    margin: 10px;
}
/* 信息 */
.dgsc_R{
    margin: 10px 10px 10px 0;
    text-align: left;
    font-size: 15px;
}
.dtcmc_sku{
    font-size: 12px;
    color:#999;
    margin:5px 0 25px;
}
.dgsc_priBox{
    display: flex;
    justify-content: space-between;
}
.price_origin{
    text-decoration: line-through;
    color: #999;
    font-size: 12px;
}
.order_num{
        color: #999;
    font-size: 12px;
}



/* 底部固定提交按钮 */
.clearing_footer{
    display: flex;
    justify-content: flex-end;
    line-height: 54px;
    position: fixed;
    bottom: 0;right: 0;
    width: 100%;
    background-color: #fff;
}
.clearing_L{
    margin-right: 10px;
    font-size: 15px;
    color:#555;
}
.money{
    color:#ee394b;
    font-weight: bold;
}
.submit_btn{
    background: -webkit-gradient(linear,left top,right top,color-stop(0%,#ff396d),color-stop(100%,#ff826e));
    color: #fff;
    width: 120px;height: 54px;
    font-size: 16px;
    border-radius: 0;
}
.pay-myvx{width: 100%;}
.pay-popup{width: 80%}


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









