<template>
    <div class="mine">
        <!-- 01:页头 -->
        <my-head></my-head>
        <!-- 03:登录 -->  
        <div class="one">
            <div class="head-img">
                <img class="unlogin-img" src="../assets/unlogin-img.png" alt=""> 
            </div>   
            <mt-cell class="unlogin" title="未登录用户" to="login" label="登录后可享受更多云服务" is-link value="立即登录"></mt-cell>
        </div>

        <!-- 04:绿色*4 -->
        <div class="two">
            <!-- 04.1 -->
            <mt-cell class="mt-cell" title="播放记录">
                <span>记录看过的精彩</span>
                <i class="iconfont icon-dayu"></i>
                <i class="play-icon haves" slot="icon"></i>
            </mt-cell>
            <!-- 04.2 -->
            <mt-cell class="mt-cell" title="点赞记录">
                <i class="iconfont icon-dayu"></i>
                <i class="snap-icon haves" slot="icon"></i>
            </mt-cell>
            <!-- 04.3 -->
            <mt-cell class="mt-cell" title="收藏">
                <i class="iconfont icon-dayu"></i>
                <i class="collect-icon haves" slot="icon"></i>
            </mt-cell>
            <!-- 04.4 -->
            <mt-cell class="mt-cell" title="关注">
                <span>发现未知的精彩</span>
                <i class="iconfont icon-dayu"></i>
                <i class="focus-icon haves" slot="icon"></i>
            </mt-cell>
        </div>

        <!-- 05:蓝色*5 -->
        <div class="three">
            <!-- 04.1 -->
            <mt-cell class="mt-cell" title="免流量追剧">
                <i class="iconfont icon-dayu"></i>
                <i class="flow-icon haves" slot="icon"></i>
            </mt-cell>
            <!-- 04.2 -->
            <mt-cell class="mt-cell" title="借钱">
                <span>新手见面双重礼</span>
                <i class="iconfont icon-dayu"></i>
                <i class="new-icon haves" slot="icon"></i>
            </mt-cell>
            <!-- 04.3 -->
            <mt-cell class="mt-cell" title="办信用卡">
                <span>最快当天下卡</span>
                <i class="iconfont icon-dayu"></i>
                <i class="card-icon haves" slot="icon"></i>
            </mt-cell>
            <!-- 04.4 -->
            <mt-cell class="mt-cell" title="安全中心">
                <i class="iconfont icon-dayu"></i>
                <i class="safety-icon haves" slot="icon"></i>
            </mt-cell>
            <!-- 04.5 -->
            <mt-cell class="mt-cell" title="隐私设置">
                <span>发现未知的精彩</span>
                <i class="iconfont icon-dayu"></i>
                <i class="privacy-icon haves" slot="icon"></i>
            </mt-cell>
        </div>
        <!-- 06:意见 -->
        <div class="four">
            <mt-cell class="mt-cell" title="意见反馈">
                <i class="iconfont icon-dayu"></i>
                <i class="option-icon haves" slot="icon"></i>
            </mt-cell>
        </div>
        <!-- 07:我们 -->
        <div class="five">
            <mt-cell class="mt-cell" title="关于我们">
                <i class="iconfont icon-dayu"></i>
                <i class="about-icon haves" slot="icon"></i>
            </mt-cell>
        </div>
        <!-- 退出登录 -->
        <mt-button size="large" class="logout">退出登录</mt-button>
    </div>
</template>

<script>
import myHead from '../components/head.vue'

export default {
    data(){
        return{

        }
    },
    // 2、注册子组件（不能关键字，不影响前面其他命名）
    components:{
        myHead,
    },



}
</script>

<style scoped>
.mine>>> .mint-cell-wrapper {background: #fff;}
/* 第一部分：登录组件 */
/* 去掉下划线 */
.one >>>.unlogin{
    text-align: left;
    margin-bottom:5px;
    color:#f69730;
}
/* 头像 */
.head-img{
    border-top: 1px solid #eee;
    background-color: #fff;
}
/* 头像图片 */
.unlogin-img{
    width:64px;height:64px;
    border-radius:50%;
    margin-top:5px;
}

/* 第二部分：绿色 */
.two{margin-bottom:5px;}
/* 去掉下划线 */
.two >>>.mt-cell{
    text-align: left;
    border-bottom:1px solid #eee;
}
/* 右侧箭头 */
.icon-dayu{
    font-size: 10px;
    font-weight: bold;
    color:#c8c8cd;
    padding: 0 3px;
}
/* 图标共有 */
.haves{
    display:inline-block;
    width: 21px;height: 21px;
    background-size: 10rem auto;
    background-image: url("../assets/c-myicon-20190527.png");
}
/* 图标位置 */
.play-icon{background-position: -20px 0px;}
.snap-icon{background-position: 40px -40px;}
.collect-icon{background-position: -40px 0px;}
.focus-icon{background-position: -60px 0px;}

/* 第三部分：蓝色 */
.three{margin-bottom:5px;}
/* 去掉下划线 */
.three>>>.mt-cell{
    text-align: left;
    border-bottom:1px solid #ddd;
}
.three >>>.mt-cell:last-child{
    border:none!important;
}
/* 图标位置 */
.flow-icon{background-position: 60px 2px;}
.new-icon{background-position: -20px -58px;}
.card-icon{background-position: 20px -39px;}
.safety-icon{background-position: -119px 2px;}
.privacy-icon{background-position: 61px -39px;}

/* 第四部分：意见反馈 */
.four>>>.mt-cell{
    text-align: left;
    margin-bottom:5px;
}
/* 图标位置 */
.option-icon{background-position: 0px -59px;}

/* 第五部分：关于我们 */
.five>>>.mt-cell{
    text-align: left;
    /* margin-bottom:10px; */
}
/* 图标位置 */
.about-icon{background-position: 21px 80px;}
/* 退出登录 */
.logout{
    width:95%;
    margin: 20px auto;
    background-color:#ee394b;
    color:#fff;
}








</style>