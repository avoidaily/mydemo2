
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
            <div class="sort-title">地址编辑</div>
        </div>
        
        <!-- 地址编辑 -->
        <van-address-edit
		:area-list="areaList"
		show-postal
		show-delete
		show-set-default
		show-search-result
		:search-result="searchResult"
		@save="onSave"
		@delete="onDelete"
		@change-detail="onChangeDetail"
		/>
		


    </div>
</template>

<script>
import {  AddressEdit ,Toast , Area  } from 'vant';
import myHead from '../components/head.vue' // 1、引入页头
import areaList from '../common/area.js'

export default {
    components:{
        [AddressEdit .name]:AddressEdit ,
		[Toast.name]:Toast,
        [Area.name]:Area,
		

        myHead,//页头

    },
    data(){
        return{
            areaList,
      		searchResult: []
        }
    },

    methods:{
        // 保存
        onSave(info) {
			Toast('save');
            this.$router.push("/order");
		},

		onDelete() {
			Toast('delete');
			this.$router.push("/order");
		},

		onChangeDetail(val) {
			if (val) {
				this.searchResult = [{
				name: '黄龙万科中心',
				address: '杭州市西湖区'
				}];
			} else {
				this.searchResult = [];
			}
		}


    },
}
</script>


<style scoped>
.paypage{
    background: #f0f0f0;
    width: 100%;height: auto;
}

.paypage>>>.van-address-edit__buttons{
	padding: 55px 15px 153px 15px;
}
.paypage>>>.van-field__label{
	text-align: center;
}
.paypage>>>.van-field__control{
	border: none;
	height: 20px;
}
.paypage>>>.van-cell--center{
	text-align: left;
    padding-left: 30px;
}
.paypage>>>.van-button--danger{
    background-color: #ee394b;
    border: 1px solid #ee394b;
}  
.paypage>>>.van-switch--on{
    background-color: #ee394b;
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
