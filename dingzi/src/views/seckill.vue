<template>
    <div class="seckill">
        <!-- 1、按钮 秒杀标题 -->
        <div class="seckill-head">
            <mt-button class="back" icon="back"></mt-button>
            <div class="seckill-title">秒杀</div>
        </div>
        <!-- 2、页头商品 -->
        <div class="grouptop">
            <!-- 图标+保证 -->
            <ul class="promiseList">
                <li v-for="(item,index) in promiselist" :key="index">
                    <img  :src="item.img" alt="">
                    <em>{{item.title}}</em>
                </li>
            </ul>
            <!-- 标题大图 -->
            <div class="silder_ul">
                <img src="../assets/ms01.jpg" alt="">
            </div>
        </div>
        <!-- 3、横向导航条 滚动固定顶部 -->
        <mt-navbar v-model="selected" class="navhead">
            <mt-tab-item class="select-red" v-for="(item,index) in types" :key="index" :id="item.id">
                <a class="nav" :class="{ red:changeRed == index}" @click="reds(index)" href="javascript:;" >{{item.text}}</a>
            </mt-tab-item>
        </mt-navbar>
        <!-- 4、商品列表 -->
        <mt-tab-container v-model="selected" class="groupseckill">
            <mt-tab-container-item id="1">
                
                <div class="groupone" v-for="(item,index) in list" :key="index" >
                    <!-- <router-link :to="{name:'detail',params:{id:item.good_id}}"> -->
                    <router-link to="detail">
                    <!-- 商品图片 -->
                    <!-- 用params传参这里是命名路由，用name -->
                    <!-- 先在item里面生成一个独一无二的id数值 -->
                    <!-- 把item.id通过params传递 -->

                    <!-- router.is: {path: /good/:id} 将id数值放在url中 -->
                    <!-- 刷新后在created钩子函数中，通过params里面的id获取相应的数据 -->
                    
                        <div class="sekimg">
                            <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
                        </div>
                        
                    </router-link>
                    
                    <!-- 倒计时 -->
                    <div class="timeout">
                        <img src="../assets/time.png" alt="">
                        <span class="countDownList">还剩 {{countDownList}}</span>
                    </div>
                    <!-- 商品信息 -->
                    <div class="sekinfo">
                        <p class="info-title">{{item.title}}</p>
                        <div class="info-subtitle">{{item.subtitle}}</div>
                        <div class="info-details">
                            <div class="info-number">
                                <span class="info-price">￥{{item.price}}</span>
                                <span class="info-subprice">￥{{item.subprice}}</span>
                                <p class="info-sendnum">已售 {{item.count}} 件</p>
                            </div>

                            <mt-button v-show="isHide" @click="change" class="now-pay">立即抢购</mt-button>

                            <mt-button v-show="isShow" class="btnc-l"  @click = "countersub">-</mt-button>     
                            <input v-show="isShow" class="count" type="text" value="0" size="1" v-model="count">
                            <mt-button v-show="isShow" class="btnc-r" @click = "counteradd">+</mt-button>
                        </div>
                    </div>
                    <!-- </router-link> -->
                </div>
                

            </mt-tab-container-item>

            <mt-tab-container-item id="2">
                <div class="groupone" v-for="(item,index) in se02" :key="index" @click="selectItem(item)">
                    <!-- 商品图片 -->
                    <div class="sekimg">
                        <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
                    </div>
                    <!-- 倒计时 -->
                    <div class="timeout">
                        <img src="../assets/time.png" alt="">
                        <span class="countDownList">还剩 {{countDownList}}</span>
                    </div>
                    <!-- 商品信息 -->
                    <div class="sekinfo">
                        <p class="info-title">{{item.title}}</p>
                        <div class="info-subtitle">{{item.subtitle}}</div>
                        <div class="info-details">
                            <div class="info-number">
                                <span class="info-price">￥{{item.price}}</span>
                                <span class="info-subprice">￥{{item.subprice}}</span>
                                <p class="info-sendnum">已售 {{item.count}} 件</p>
                            </div>
                            <mt-button class="now-pay">立即抢购</mt-button>
                        </div>
                    </div>
                </div>
            </mt-tab-container-item>

            <mt-tab-container-item id="3">
                <div class="groupone" v-for="(item,index) in se03" :key="index" @click="selectItem(item)">
                    <!-- 商品图片 -->
                    <div class="sekimg">
                        <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
                    </div>
                    <!-- 倒计时 -->
                    <div class="timeout">
                        <img src="../assets/time.png" alt="">
                        <span class="countDownList">还剩 {{countDownList}}</span>
                    </div>
                    <!-- 商品信息 -->
                    <div class="sekinfo">
                        <p class="info-title">{{item.title}}</p>
                        <div class="info-subtitle">{{item.subtitle}}</div>
                        <div class="info-details">
                            <div class="info-number">
                                <span class="info-price">￥{{item.price}}</span>
                                <span class="info-subprice">￥{{item.subprice}}</span>
                                <p class="info-sendnum">已售 {{item.count}} 件</p>
                            </div>
                            <mt-button class="now-pay">立即抢购</mt-button>
                        </div>
                    </div>
                </div>
            </mt-tab-container-item>

            <mt-tab-container-item id="4">
                <div class="groupone" v-for="(item,index) in se04" :key="index" @click="selectItem(item)">
                    <!-- 商品图片 -->
                    <div class="sekimg">
                        <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
                    </div>
                    <!-- 倒计时 -->
                    <div class="timeout">
                        <img src="../assets/time.png" alt="">
                        <span class="countDownList">还剩 {{countDownList}}</span>
                    </div>
                    <!-- 商品信息 -->
                    <div class="sekinfo">
                        <p class="info-title">{{item.title}}</p>
                        <div class="info-subtitle">{{item.subtitle}}</div>
                        <div class="info-details">
                            <div class="info-number">
                                <span class="info-price">￥{{item.price}}</span>
                                <span class="info-subprice">￥{{item.subprice}}</span>
                                <p class="info-sendnum">已售 {{item.count}} 件</p>
                            </div>
                            <mt-button class="now-pay">立即抢购</mt-button>
                        </div>
                    </div>
                </div>
            </mt-tab-container-item>

            <mt-tab-container-item id="5">
                <div class="groupone" v-for="(item,index) in se05" :key="index" @click="selectItem(item)">
                    <!-- 商品图片 -->
                    <div class="sekimg">
                        <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
                    </div>
                    <!-- 倒计时 -->
                    <div class="timeout">
                        <img src="../assets/time.png" alt="">
                        <span class="countDownList">还剩 {{countDownList}}</span>
                    </div>
                    <!-- 商品信息 -->
                    <div class="sekinfo">
                        <p class="info-title">{{item.title}}</p>
                        <div class="info-subtitle">{{item.subtitle}}</div>
                        <div class="info-details">
                            <div class="info-number">
                                <span class="info-price">￥{{item.price}}</span>
                                <span class="info-subprice">￥{{item.subprice}}</span>
                                <p class="info-sendnum">已售 {{item.count}} 件</p>
                            </div>
                            <mt-button class="now-pay">立即抢购</mt-button>
                        </div>
                    </div>
                </div>
            </mt-tab-container-item>

            <mt-tab-container-item id="6">
                <div class="groupone" v-for="(item,index) in se06" :key="index" @click="selectItem(item)">
                    <!-- 商品图片 -->
                    <div class="sekimg">
                        <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
                    </div>
                    <!-- 倒计时 -->
                    <div class="timeout">
                        <img src="../assets/time.png" alt="">
                        <span class="countDownList">还剩 {{countDownList}}</span>
                    </div>
                    <!-- 商品信息 -->
                    <div class="sekinfo">
                        <p class="info-title">{{item.title}}</p>
                        <div class="info-subtitle">{{item.subtitle}}</div>
                        <div class="info-details">
                            <div class="info-number">
                                <span class="info-price">￥{{item.price}}</span>
                                <span class="info-subprice">￥{{item.subprice}}</span>
                                <p class="info-sendnum">已售 {{item.count}} 件</p>
                            </div>
                            <mt-button class="now-pay">立即抢购</mt-button>
                        </div>
                    </div>
                </div>
            </mt-tab-container-item>

            <mt-tab-container-item id="7">
                <div class="groupone" v-for="(item,index) in se07" :key="index" @click="selectItem(item)">
                    <!-- 商品图片 -->
                    <div class="sekimg">
                        <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
                    </div>
                    <!-- 倒计时 -->
                    <div class="timeout">
                        <img src="../assets/time.png" alt="">
                        <span class="countDownList">还剩 {{countDownList}}</span>
                    </div>
                    <!-- 商品信息 -->
                    <div class="sekinfo">
                        <p class="info-title">{{item.title}}</p>
                        <div class="info-subtitle">{{item.subtitle}}</div>
                        <div class="info-details">
                            <div class="info-number">
                                <span class="info-price">￥{{item.price}}</span>
                                <span class="info-subprice">￥{{item.subprice}}</span>
                                <p class="info-sendnum">已售 {{item.count}} 件</p>
                            </div>
                            <mt-button class="now-pay">立即抢购</mt-button>
                        </div>
                    </div>
                </div>
            </mt-tab-container-item>

            <mt-tab-container-item id="8">
                <div class="groupone" v-for="(item,index) in se08" :key="index" @click="selectItem(item)">
                    <!-- 商品图片 -->
                    <div class="sekimg">
                        <img :src="`http://127.0.0.1:3000/`+item.img" alt="">
                    </div>
                    <!-- 倒计时 -->
                    <div class="timeout">
                        <img src="../assets/time.png" alt="">
                        <span class="countDownList">还剩 {{countDownList}}</span>
                    </div>
                    <!-- 商品信息 -->
                    <div class="sekinfo">
                        <p class="info-title">{{item.title}}</p>
                        <div class="info-subtitle">{{item.subtitle}}</div>
                        <div class="info-details">
                            <div class="info-number">
                                <span class="info-price">￥{{item.price}}</span>
                                <span class="info-subprice">￥{{item.subprice}}</span>
                                <p class="info-sendnum">已售 {{item.count}} 件</p>
                            </div>
                            <mt-button class="now-pay">立即抢购</mt-button>
                        </div>
                    </div>
                </div>
            </mt-tab-container-item>


        </mt-tab-container>
    </div>
</template>


<script>
import { Tab, Tabs ,Stepper} from 'vant';
export default {
    components:{
        [Tab .name]:Tab,
        [Tabs .name]:Tabs,
        [Stepper .name]:Stepper,


    },
    data(){
        return{
            // 商品数量
            isHide:true, //显示
            isShow:false, //隐藏
            count:1,

            // 1、准备一个数组，保存服务器返回数据
            list:[],
            // 分类
            se01:[],
            se02:[],
            se03:[],
            se04:[],
            se05:[],
            se06:[],
            se07:[],
            se08:[],

            // 导航条
            navBarFixed:false,//固定
            selected: '1',
            changeRed:0,
            types:[
                {'text':"全部",id:"1"},
                {'text':"今日上新",id:"2"},
                {'text':"数码潮品",id:"3"},
                {'text':"一元付邮",id:"4"},
                {'text':"居家日用",id:"5"},
                {'text':"追剧美食",id:"6"},
                {'text':"京东直购",id:"7"},
                {'text':"美妆潮服",id:"8"},
            ],
            // 保证
            promiselist:[
                {img:require("../assets/gl01.png"),title:"特卖免运费"},
                {img:require("../assets/gl02.png"),title:"48小时发货"},
                {img:require("../assets/gl03.png"),title:"7天无理由退货"},
                {img:require("../assets/gl04.png"),title:"30天低价"},
            ],
            // 倒计时
            countDownList: '00天00时00分00秒',
        　　actEndTime: '2019-07-28 20:40:00'
        }
    },
    // 创建后
    created() {
        // 倒计时
        this.countDown()
        //2、组件创建完成就调用 加载函数
        this.loadMore()
    },

    // 挂载入后：事件监听，监听滚动条。
    // mounted (){
    //   window.addEventListener('scroll', this.handleScroll)
    // },
    // // 销毁后：离开该页面需要移除这个监听的事件
    // destroyed () {
    // window.removeEventListener('scroll', this.handleScroll)
    // },
    
    methods:{
        change(){
            this.isShow = !this.isShow;
            this.isHide = false;
        },
        // 
        counteradd(){
            this.count++;
        },
        // 
        countersub(){
            if (this.count<=1){
                // alert('受不了啦，宝贝不能再减少啦');
                this.$toast("受不了啦，宝贝不能再减少啦");
                return;
            }else {
                this.count-=1;
            }
        },
        // handleScroll 方法
    //     handleScroll () {
    //     var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
    //     // 控制台打印当前的scrollTop,
    //     console.log(scrollTop)

    //     // 监听元素到顶部的距离  并判断滚动的距离如果大于了元素到顶部的距离时，设置searchBar为true,否则就是false
    //     //  当滚动超过 50 时，实现吸顶效果
    //     if (scrollTop > 300) {
    //       this.navBarFixed = true
    //     } else {
    //       this.navBarFixed = false
    //     }
    //  },

        // 3、接口
        loadMore(){//加载数据
            // 1、创建url
            var url="discount";
            // 2、发送ajax请求
            this.axios.get(url).then(result=>{
                // 将请求到的主句添加到list数组中
                this.list=result.data.data;

                var list=this.list;
                var secklist=[];//保存分类的数组  10类
                for(var i=0;i<list.length;i++){
                    if(!secklist[list[i].dis_id]){
                        var arr=[];
                        arr.push(list[i]);
                        secklist[list[i].dis_id]=arr;
                    }else{
                        secklist[list[i].dis_id].push(list[i]);
                    }
                }
                console.log(secklist);
                this.se01=secklist[1];
                this.se02=secklist[2];
                this.se03=secklist[3];
                this.se04=secklist[4];
                this.se05=secklist[5];
                this.se06=secklist[6];
                this.se07=secklist[7];
                this.se08=secklist[8];

            })
        },
        // 滚动导航条的切换
        reds(index){
            this.changeRed = index;
        },
        // 倒计时
        timeFormat(param) {
　　　　　　return param < 10 ? '0' + param : param;
　　　　},
　　　　countDown(it) {
　　　　　　var interval = setInterval(() => {
　　　　　　　　// 获取当前时间，同时得到活动结束时间数组
　　　　　　　　let newTime = new Date().getTime();
　　　　　　　　// 对结束时间进行处理渲染到页面
　　　　　　　　let endTime = new Date(this.actEndTime).getTime();
　　　　　　　　let obj = null;
　　　　　　　　// 如果活动未结束，对时间进行处理
　　　　　　　　if (endTime - newTime > 0) {
　　　　　　　　　　let time = (endTime - newTime) / 1000;
　　　　　　　　　　// 获取天、时、分、秒
　　　　　　　　　　let day = parseInt(time / (60 * 60 * 24));
　　　　　　　　　　let hou = parseInt(time % (60 * 60 * 24) / 3600);
　　　　　　　　　　let min = parseInt(time % (60 * 60 * 24) % 3600 / 60);
　　　　　　　　　　let sec = parseInt(time % (60 * 60 * 24) % 3600 % 60);
　　　　　　　　　　obj = {
　　　　　　　　　　　　day: this.timeFormat(day),
　　　　　　　　　　　　hou: this.timeFormat(hou),
　　　　　　　　　　　　min: this.timeFormat(min),
　　　　　　　　　　　　sec: this.timeFormat(sec)
　　　　　　　　　　};
　　　　　　　　} else { // 活动已结束，全部设置为'00'
　　　　　　　　　　obj = {
　　　　　　　　　　　　day: '00',
　　　　　　　　　　　　hou: '00',
　　　　　　　　　　　　min: '00',
　　　　　　　　　　　　sec: '00'
　　　　　　　　　　};
　　　　　　　　　　clearInterval(interval);
　　　　　　　　}
　　　　　　　　this.countDownList = obj.day + '天' + obj.hou + ":" + obj.min + ":" + obj.sec;
　　　　　　}, 1000);
　　　　}
  },
    
}
</script>



<style scoped>

/* 1、头布局 */
.seckill-head{
    display: flex;
    justify-content: space-between;
}
 /* 按钮 */
.back{
    text-align: left;
    background-color: transparent;
    font-weight: bold;
    margin-right: 10px;
    margin-top: 5px;
    font-size: 24px;
    border: 1px solid #fff;
}
/* 去掉button边框阴影 */
.mint-button--default{
    box-shadow: none;
}
/* 标题 */
.seckill-title{
    margin-right: 45%;
    line-height: 50px; 
    font-weight: bold;
    font-size: 20px;
}
/* 2、标题大图 */
.silder_ul img{
    width: 100%;height:100%;
    background-size: cover;
}
/* 保证 */
.promiseList{/* ul */
    position: absolute;
    top: 50px;left: 0;
    z-index: 1;
    width: 100%;height: 30px;
    text-align: center;
}
.promiseList li{ /* li */
    display: inline-block;
    line-height: 30px;
    margin: 0 10px;
}
.promiseList li img{ /* img */
    width: 13px;height: 13px;
    margin-right: 5px;
}
.promiseList li em{  /* em */
    font-style: normal;
    vertical-align: middle;
    font-size: 12px;
    color:#fff;
    line-height: 13px;

}
/* 横向导航条 */
.seckill>>>.mint-tab-item{padding:0;}
.navhead{
    display:inline;
    white-space: nowrap;
    display: flex;
    justify-content: flex-start;
    overflow-x:scroll;
    overflow-y:hidden;
    border-bottom: 1px solid #f3f3f3;
}

.select-red a{
  display:inline-block;
  height:50px;
  line-height: 50px;
  padding-left:20px;
  padding-right: 15px;
  font-size: 16px;
}
/* a */
.nav{
    color:#000;
    display:inline;
    white-space: nowrap;
    display: flex;
    justify-content: flex-start;
    overflow-x:scroll;
    overflow-y:hidden;
    border-bottom: 1px solid #f3f3f3;
}
.red {
    font-weight: bold;
    font-size: 18px; 
    border-bottom: 2px solid #ee394b;
    color: #ee394b;  
}
/* 商品列表 */
.groupone{position: relative;}
/* 商品图片 */
.groupone img{
    width: 100%;
    background-size: contain;
}
/* 倒计时 */
.timeout{
    position: absolute;
    top: 20px;left: 280px;
    z-index: 1;
}
.timeout img{
    display: inline-block;
    width: 11px;
    height: 11px;
    background-size: cover;
    margin-right: 5px;
    vertical-align: middle;
}
.countDownList{
    font-size: 12px;
    color: #ee394b;
}
/* 商品信息 */
.sekinfo{padding: 5px 10px 20px 10px;}
.info-title{
    color:#333;
    text-align: left;
    font-size: 13px;
    margin:0;
}
.info-subtitle{
    color:#999;
    text-align: left;
    font-size: 10px;
    margin-bottom: 20px;
}
/* 价格 */
.info-details{
    display: flex;
    justify-content: space-between;
    border-bottom: 1px solid #e9e9e9;
}
.info-price{
    font-size: 20px;
    color: #ee394b;
    margin-right: 6px;
}
.info-subprice{
    font-size: 12px;
    color: #999;
    text-decoration: line-through;
}
.info-sendnum{
    font-size: 12px;
    color: #999;
    margin-right: 20px;
}
.now-pay{
    color: #fff;
    background: #ee394b;
    background:linear-gradient(to right top,#ff396d,#ff826e);
    width: 75px;
    height: 30px;
    line-height: 18px;
    font-size: 12px;
    border-radius: 27px;
    margin-top: 5px;
    /* margin-left: 228px; */
}

.btnallcolorkind{
    margin: 5px;
}
.count{
    width: 8%;
    height: 26px;
    text-align: center;
    padding: 0;
    margin-bottom: 0;
    margin-left: 1px;
}

.btnc-l{
    width:28px;height:28px;
    vertical-align: middle;
    margin:0 5px 0 5px;
    background: #fff;
    border:1px solid #eee;
    padding-left: 8px;
    margin-left: 188px;
}
.btnc-r{
    width:28px;height:28px;
    vertical-align: middle;
    margin:0 5px 0 5px;
    background: #fff;
    border:1px solid #eee;
    padding-left: 7px;
}





</style>