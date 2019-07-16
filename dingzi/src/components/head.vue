<template>
<div class="head-top">
    <!-- 1、固定页头 -->
    <div class="head-title">
        <!-- 左侧：标题 -->
        <h3><a href="/">钉子商城</a></h3>
        <!-- 右侧：图标+注册登录 -->
        <div class="right">
            <div class="iconfont icon-search"></div>
            <div class="iconfont icon-shizhong"></div>
            <!-- <router-link to="mine">我的</router-link> -->
            <div class="iconfont icon-liebiao"></div>
        </div>
    </div>
    <!-- 2、占位 -->
    <div style="height:48px;"></div>

</div>
</template>


<script>

export default {
    changeRed:0,
    // 组件间通信：父传子
    props:{
        // headTitle:{default:"123"},
    },
    data(){
        return{

        }
    },
    methods:{

    },
}
</script>

<style>

.head-title{
    width: 100%;height: 48px;
    display:flex;
    justify-content:space-between;
    align-items: center;
    padding: 0 10px;
    position: fixed;top:0;
    z-index: 999;
    background-color: #ee394b;
}
h3>a{color:#fff;}
.right{
    width: 30%;
    display:flex;
    justify-content: space-between;
} 
.iconfont{font-size: 24px}
.icon-search{color: #fff;}
.icon-shizhong{color: #fff;}
.icon-liebiao{color:#fff;}

/* 导航 */
.nav-tabs{
    background-color: #fff;
    /* width:100%; */
    display:inline;
    white-space: nowrap;
    display: flex;
    justify-content: flex-start;
    overflow-x:scroll;
    overflow-y:hidden;
}
.nav-list a{
    display:inline-block;
    height:50px;
    line-height: 50px;
    padding-left:10px;
    padding-right: 10px;
}
.nav{color:#000;}
.red {
    color:#f69730;
    font-weight: bold;
    font-size: 18px;   
}



</style>








