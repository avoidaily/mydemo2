<template>
    <div class="indexProduct">
        <!-- 5+1 个商品  *5-->
        <div class="indexTitleImg">
            <!-- 1 -->
            <div class="big-img">
                <!-- 大图 -->
                <img src="../assets/big01.jpg" alt="">

                <div class="floor">
                    <!-- 小图 -->
                    <div class="product" v-for="(item,index) of play" :key="index">
                        <div class="five">
                            <img :src="`http://127.0.0.1:3000/`+item.pimg" alt="">
                            <p class="f-title">{{item.title}}</p>
                            <span class="nav-price">￥{{item.price}}<span class="nav-subprice">￥{{item.subprice}}</span></span>
                        </div>
                        
                    </div>
                    <!-- 查看全部 -->
                    <mt-button @click="lookall" class="more">
                        <div class="more-num">
                            <span class="more-count">13</span>
                            <p class="more-sp"><span class="sp">商品</span></p>
                            <span class="more-ckqb">查看全部</span>
                        </div>
                    </mt-button>
                </div>
            </div>
        
            <!-- 2 -->
            <div class="big-img">
                <!-- 大图 -->
                <img src="../assets/big02.jpg" alt="">
                <div class="floor">
                    <!-- 小图 -->
                    <div class="product" v-for="(item,index) of book" :key="index">
                        <div class="five">
                            <img :src="`http://127.0.0.1:3000/`+item.pimg" alt="">
                            <p class="f-title">{{item.title}}</p>
                            <span class="nav-price">￥{{item.price}}<span class="nav-subprice">￥{{item.subprice}}</span></span>
                        </div>
                    </div>
                    <!-- 查看全部 -->
                    <mt-button @click="lookall" class="more">
                        <div class="more-num">
                            <span class="more-count">11</span>
                            <p class="more-sp"><span class="sp">商品</span></p>
                            <span class="more-ckqb">查看全部</span>
                        </div>
                    </mt-button>                    
                </div>
            </div>

            <!-- 3 -->
            <div class="big-img">
                <!-- 大图 -->
                <img src="../assets/big03.jpg" alt="">
                <div class="floor">
                    <!-- 小图 -->
                    <div class="product" v-for="(item,index) of view" :key="index">
                        <div class="five">
                            <img :src="`http://127.0.0.1:3000/`+item.pimg" alt="">
                            <p class="f-title">{{item.title}}</p>
                            <span class="nav-price">￥{{item.price}}<span class="nav-subprice">￥{{item.subprice}}</span></span>
                        </div>
                    </div>
                    <!-- 查看全部 -->
                    <mt-button @click="lookall" class="more">
                        <div class="more-num">
                            <span class="more-count">11</span>
                            <p class="more-sp"><span class="sp">商品</span></p>
                            <span class="more-ckqb">查看全部</span>
                        </div>
                    </mt-button>
                </div>
            </div>

            <!-- 4 -->
            <div class="big-img">
                <!-- 大图 -->
                <img src="../assets/big04.jpg" alt="">
                <div class="floor">
                    <!-- 小图 -->
                    <div class="product" v-for="(item,index) of show" :key="index">
                        <div class="five">
                            <img :src="`http://127.0.0.1:3000/`+item.pimg" alt="">
                            <p class="f-title">{{item.title}}</p>
                            <span class="nav-price">￥{{item.price}}<span class="nav-subprice">￥{{item.subprice}}</span></span>
                        </div>
                    </div>
                    <!-- 查看全部 -->
                    <mt-button @click="lookall" class="more">
                        <div class="more-num" >
                            <span class="more-count">12</span>
                            <p class="more-sp"><span class="sp">商品</span></p>
                            <span class="more-ckqb">查看全部</span>
                        </div>
                    </mt-button>
                </div>
            </div>

            <!-- 5 -->
            <div class="big-img">
                <!-- 大图 -->
                <img src="../assets/big05.jpg" alt="">
                <div class="floor">
                    <!-- 小图 --> 
                    <div class="product" v-for="(item,index) of movie" :key="index">
                        <div class="five">
                            <img :src="`http://127.0.0.1:3000/`+item.pimg" alt="">
                            <p class="f-title">{{item.title}}</p>
                            <span class="nav-price">￥{{item.price}}<span class="nav-subprice">￥{{item.subprice}}</span></span>
                        </div>
                    </div>
                    <!-- 查看全部 -->
                    <mt-button @click="lookall" class="more">
                        <div class="more-num" >
                            <span class="more-count">12</span>
                            <p class="more-sp"><span class="sp">商品</span></p>
                            <span class="more-ckqb">查看全部</span>
                        </div>
                    </mt-button>
                </div>
            </div>
        </div>

    </div>
</template>


<script>
// import { Script } from 'vm';
export default {
    data(){
        return{
            // 1、准备一个数组，保存返回数据
            list:[],
            play:[],
            book:[],
            view:[],
            show:[],
            movie:[],


        }
    },
    created(){
        //2、组件创建完成就调用 加载函数
        this.loadMore();
    },
        methods:{
        // 3、接口
        loadMore(){//加载数据
            // 1、创建url
            var url="product";

            // 2、发送ajax请求
            this.axios.get(url).then(result=>{
                // 将请求到的主句添加到list数组中
                this.list=result.data.data;




                var list=this.list;
                var foodList=[];  //五个 分类 总和
                    for(var i = 0; i < list.length; i++) {
                        if(!foodList[list[i].bid]){
                            var arr = [];
                            arr.push(list[i]);
                        foodList[list[i].bid] = arr;
                        }else {
                            foodList[list[i].bid].push(list[i])
                        }}
                    // console.log(foodList);
                    this.play=foodList[1];
                    this.book=foodList[2];
                    this.view=foodList[3];
                    this.show=foodList[4];
                    this.movie=foodList[5];


            })
        },
        // 查看全部
        lookall(){
            this.$messagebox({
                message: '没有更多了！',
                confirmButtonText: '确认',
            });
        }
    },
}

</script>

<style scoped>
/* 大图 */
.big-img img{
    width: 100%;height: 143px;
}
/* 6、精选活动 */
.floor{
    width: 100;height:auto;
}
.product{
    display: inline-block;
    margin-bottom:10px;  
}
.product:nth-child(2n){
    background-color: #f7f7f7;
}

.five img{
    width: 78px;height:78px;
    margin:10px 30px;
}

.f-title{
    color:#333;
    font-size: 14px;
    margin:0;
}
.nav-price{
    font-size: 13px;
    color: #ea4661;
    font-weight: bold;
}
.nav-subprice{
    font-size: .11rem;
    color: #666;
    text-decoration: line-through;
    margin-left:3px;
}
/* 查看更多 */
.more{
    width: 138px;
    height: 147px;
    background-color: #f7f7f7;
    float: right;
}
.more-num{
    width: 100%;
    height: 147px;
    display: flex;
    flex-direction: column;
    /* margin:0 auto; */
    /* color:#333; */
    padding: 15px 0;
    
}
.more-count{
    display: block;
    width: 100%;height: 49px;
    font-size: 24px;
    padding: 5px 0;
}
.more-sp{
    width: 100%;
    color:#222;
    margin: 0;
}
.sp{
    display: block;
    width: 32px;
    height: 37px;
    line-height: 37px;
    border-bottom: 1px solid #666;
    margin:0 auto;
}
.more-ckqb{
  display: block;
  width: 100%;height: 48px;
  line-height: 48px;
  font-size: 15px;
  font-weight: bold;
}
.mint-button--default{
    box-shadow: none;
}

</style>