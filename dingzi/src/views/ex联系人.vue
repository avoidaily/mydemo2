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
        <!-- 地址栏 -->
        <!-- 联系人卡片 -->
        <van-contact-card
        :type="cardType"
        :name="currentContact.name"
        :tel="currentContact.tel"
        :address="currentContact.address"
        @click="showList = true" 
        />

        <!-- 联系人列表 -->
        <van-popup v-model="showList" position="bottom">
        <van-contact-list
            v-model="chosenContactId"
            :list="list"
            @add="onAdd"  
            @edit="onEdit"
            @select="onSelect"
        />
        </van-popup>

        <!-- 联系人编辑 -->
        <van-popup v-model="showEdit" position="bottom">
        <van-contact-edit
            :contact-info="editingContact"
            :is-edit="isEdit"
            @save="onSave"
            @delete="onDelete"
        />
        </van-popup>

    </div>
</template>

<script>
import {  ContactCard, ContactList, ContactEdit ,Popup  } from 'vant';
import myHead from '../components/head.vue' // 1、引入页头

export default {
    components:{
        [ContactCard.name]:ContactCard,
        [ContactList.name]:ContactList,
        [ContactEdit.name]:ContactEdit,
        [Popup.name]:Popup, // 底部 弹出层

        myHead,//页头

    },
    data(){
        return{
            chosenContactId: null,
            editingContact: {},
            showList: false,
            showEdit: false,
            isEdit: false,
            list: [{
                name: '张三',
                tel: '13000000000',
                id: 0,
                address: '浙江省杭州市西湖区文三路 138 号东方通信大厦 7 楼 501 室'
            }]
        }
    },
    computed: {
        cardType() {
            return this.chosenContactId !== null ? 'edit' : 'add';
        },
        currentContact() {
            const id = this.chosenContactId;
            return id !== null ? this.list.filter(item => item.id === id)[0] : {};
        }
    },
    methods:{
        // 添加联系人
        onAdd() {
            this.editingContact = { id: this.list.length };
            this.isEdit = false;
            this.showEdit = true;
        },
        // 编辑联系人
        onEdit(item) {
            this.isEdit = true;      
            this.showEdit = true;
            this.editingContact = item;
        },
        // 选中联系人
        onSelect() {
            this.showList = false;
        },
        // 保存联系人
        onSave(info) {
            this.showEdit = false;
            this.showList = false;
            
            if (this.isEdit) {
                this.list = this.list.map(item => item.id === info.id ? info : item);
            } else {
                this.list.push(info);
            }
                this.chosenContactId = info.id;
        },
        // 删除联系人
        onDelete(info) {
            this.showEdit = false;
            this.list = this.list.filter(item => item.id !== info.id);
            if (this.chosenContactId === info.id) {
                this.chosenContactId = null;
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
}
.sort-title{
    margin-right: 35%;
    line-height: 53px; 
    font-weight: 600;
    font-size: 18px;
    color:#333;
}
</style>
