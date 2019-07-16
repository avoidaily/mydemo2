<template>
    <div class="paypage">
        <!-- 01:页头 -->
        <my-head></my-head>
        <!-- 分类标题 -->
        <div class="sort-head">
            <router-link  to="/" class="sort-icon">
                <mt-button class="back" icon="back"></mt-button>
                <i class="iconfont icon-shouye"></i>
            </router-link>
            <div class="sort-title">确认订单</div>
        </div>
        
        <!-- 地址列表 -->
        <van-address-list
        v-model="chosenAddressId"
        :list="list"
        :disabled-list="disabledList"
        disabled-text="以下地址超出配送范围"
        @add="onAdd"
        @edit="onEdit"
        />

    </div>
</template>

<script>
import {  AddressList ,Toast  } from 'vant';
import myHead from '../components/head.vue' // 1、引入页头

export default {
    components:{
        [AddressList.name]:AddressList,
        [Toast.name]:Toast,

        myHead,//页头

    },
    data(){
        return{
            chosenAddressId: '1',
            list: [
                {
                id: '1',
                name: '张三',
                tel: '13000000000',
                address: '浙江省杭州市西湖区文三路 138 号东方通信大厦 7 楼 501 室'
                },
                {
                id: '2',
                name: '李四',
                tel: '1310000000',
                address: '浙江省杭州市拱墅区莫干山路 50 号'
                }
            ],
            // 不可选
            disabledList: [
                {
                id: '3',
                name: '王五',
                tel: '1320000000',
                address: '浙江省杭州市滨江区江南大道 15 号'
                }
            ]


        }
    },

    methods:{
        onAdd() {
            Toast('新增地址');
        },

        onEdit(item, index) {
            Toast('编辑地址:' + index);
        }


    },
}
</script>


<style scoped>
.paypage{
    background: #f0f0f0;
    width: 100%;height: auto;
}

.van-address-list{
    padding-bottom: 392px;
}









/* 页头 */
.back{
    text-align: left;
    background-color: transparent;
    font-weight: bold;
    margin-right: 10px;
    font-size: 24px;
    border: 1px solid #fff;
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
