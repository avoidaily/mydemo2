<template>
    <div class="moreComment">
        <!-- 页头 -->
        <my-head></my-head>
        <!-- 1:标题 -->
        <div class="sort-head">
            <router-link  to="/" class="sort-icon">
                <mt-button @click="back" class="back" icon="back"></mt-button>
                <i class="iconfont icon-shouye"></i>
            </router-link>
            <div class="sort-title">用户评论</div>
        </div>
        <!-- 4：用户评价 跳转更多下拉加载 -->
        <div class="commentcard" v-for="(item,index) in list" :key="index">
            <div class="commentBody">
                <!-- 1:头像 -->
                <div class="commentimg">
                    <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
                </div>
                <!-- 2：内容 -->
                <div class="commentC">
                   <div class="commentname">{{item.cname}}</div> 
                   <div class="commentmore">{{item.content}}</div>
                    <div class="commentsort">
                        <span commentcolor>{{item.colorsort}}</span>
                        <span class="commenttime">{{item.ctime}}</span>
                    </div>
                </div>   
            </div>
            <!-- 下划线 -->

        </div>
    </div>
</template>



<script>
import { Icon } from 'vant'
import myHead from '../components/head.vue' // 1、引入页头
export default {
    components:{
        myHead,//页头
        [Icon.name]:Icon,
    },
    data(){
        return{
            list:[], //接收服务器数据
        }
    },
    created(){
        this.loadMore();
    },
    methods:{
        loadMore(){
            var url="morecoment";
            this.axios.get(url).then(result=>{
                this.list=result.data.data;
            })
        },
        back(){
            this.$router.go(-1); //返回上一层
        },
    },
}
</script>


<style scoped>
/* 标题 */
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
    line-height: 40px;
}
.sort-icon{
    display: flex;
    line-height: 35px;
    padding-top: 5px;
}
.sort-head{
    display:flex;
    justify-content: space-between;
}
.sort-title{
    margin-right: 160px;
    line-height: 50px; 
    font-weight: bold;
    font-size: 20px;
}

/* 用户评论 */
.commentcard{
    margin: 10px 0;
    padding: 0 10px;
    background-color: #fff;
    font-size: 12px;
    color: #555;
}

/* 评论 */
.commentBody{
    display: flex;
    justify-content:flex-start;
    padding: 5px 0;
    border-bottom: 1px solid #ddd;
    padding-bottom: 20px;
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





















</style>