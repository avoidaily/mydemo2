<template>
    <div class="sort" id="parent">
        <!-- 分类标题 -->
        <div class="sort-head">
            <router-link  to="/" class="sort-icon">
                <mt-button @click="back" class="back" icon="back"></mt-button>
                <i class="iconfont icon-shouye"></i>
            </router-link>
            <div class="sort-title">分类</div>
        </div>
        <!-- 搜索框 -->
        <div class="myinput">
            <i class="iconfont icon-search copy"></i>
            <input class="search" type="text" placeholder="VR眼镜">
            <mt-button class="cancelBtn">搜索</mt-button>
        </div>

        <!-- 商品 左+右 -->
        <div class="page-navbar">
            <!-- 左：navbar -->
            <mt-navbar class="page-part" v-model="selected">
                <div class="nav-flex">
                    <mt-tab-item class="page-item" :id="item.id" v-for="item of types" :key="item.i">{{item.name}}</mt-tab-item>
                </div>
            </mt-navbar>

            <!-- 右：tabcontainer -->
            <mt-tab-container class="page-wrap" v-model="selected">

                <mt-tab-container-item id="1">
                    <div class="F1">
                        <div class="big-img">
                            <img src="../assets/sort-01.jpg" alt="">
                        </div>
                        <!-- F1 -->
                        <div class="floor-title">精选分类</div>
                        <div class="allCate_List">
                            <div class="cate" v-for="(item,index) in sort01.slice(0,12)" :key="index">
                                <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                                <p class="cate-title">{{item.title}}</p>
                            </div>
                        </div>
                        <!-- F2 -->
                        <div class="floor-title">影视周边</div>
                        <div class="allCate_List">
                            <div class="cate" v-for="(item,index) in sort01.slice(12)" :key="index">
                                <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                                <p class="cate-title">{{item.title}}</p>
                            </div>
                        </div>
                    </div>
                </mt-tab-container-item>

                <mt-tab-container-item id="2">
                    <div class="F2">
                    <div class="big-img">
                        <img src="../assets/sort-02.jpg" alt="">
                    </div>
                    <!-- F1 -->
                    <div class="floor-title">精选周边</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort02.slice(0,3)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                    <!-- F2 -->
                    <div class="floor-title">数码3C</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort02.slice(3,12)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                    <!-- F3 -->
                    <div class="floor-title">手机</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort02.slice(12,18)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                    <!-- F4 -->
                    <div class="floor-title">智能设备</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort02.slice(18,23)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                    <!-- F5 -->
                    <div class="floor-title">美妆个护</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort02.slice(23,34)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                    <!-- F6 -->
                    <div class="floor-title">食品饮料</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort02.slice(34,41)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                    <!-- F7 -->
                    <div class="floor-title">家具生活</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort02.slice(41,48)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                </div>
                </mt-tab-container-item>

                <mt-tab-container-item id="3">
                    <div class="F3">
                    <div class="big-img">
                        <img src="../assets/sort-03.jpg" alt="">
                    </div>
                    <!-- F1 -->
                    <div class="floor-title">时尚潮品</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort03.slice(0,3)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>   
                    </div>
                    <!-- F2 -->
                    <div class="floor-title">3C数码</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort03.slice(3,5)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>   
                    </div>
                </div>
                </mt-tab-container-item>

                <mt-tab-container-item id="4">
                    <div class="F4">
                    <div class="big-img">
                        <img src="../assets/sort-04.jpg" alt="">
                    </div>
                    <!-- F1 -->
                    <div class="floor-title">热播IP</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort04.slice(0,14)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>  
                    <!-- F2 -->
                    <div class="floor-title">电影</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort04.slice(14,39)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div> 
                    <!-- F3 -->
                    <div class="floor-title">电视剧</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort04.slice(39,59)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div> 
                    <!-- F4 -->
                    <div class="floor-title">综艺</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort04.slice(59,68)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div> 
                </div>
                </mt-tab-container-item>

                <mt-tab-container-item id="5">
                    <div class="F5">
                    <div class="big-img">
                        <img src="../assets/sort-05.jpg" alt="">
                    </div>
                    <!-- F1 -->
                    <div class="floor-title">人气动画</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort05.slice(0,18)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div> 
                    </div>  
                    <!-- F2 -->
                    <div class="floor-title">动漫分类</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort05.slice(18,24)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div> 
                    </div>   
                    </div>
                </mt-tab-container-item>

                <mt-tab-container-item id="6">
                    <div class="F6">
                    <!-- F1 -->
                    <div class="floor-title">卡通动画</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort06.slice(0,9)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>  
                    </div>  
                    <!-- F2 -->
                    <div class="floor-title">卡通形象</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort06.slice(9,12)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>  
                    </div>
                    <!-- F3 -->
                    <div class="floor-title">萌娃最爱</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort06.slice(12,18)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>  
                    </div>    
                </div>
                </mt-tab-container-item>

                <mt-tab-container-item id="7">
                    <div class="F7">
                    <div class="big-img">
                        <img src="../assets/sort-07.jpg" alt="">
                    </div>
                    <!-- F1 -->
                    <div class="floor-title">热卖榜单</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort07.slice(0,8)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div> 
                    <!-- F2 -->
                    <div class="floor-title">文学艺术</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort07.slice(8,17)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                    <!-- F3 -->
                    <div class="floor-title">童话绘本</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort07.slice(17,26)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                    <!-- F4 -->
                    <div class="floor-title">经营</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort07.slice(26,35)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div> 
                </div>
                </mt-tab-container-item>

                <mt-tab-container-item id="8">
                    <div class="F8">
                    <!-- F1 -->
                    <div class="floor-title">智能夯货</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort08.slice(0,3)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div> 
                    <!-- F2 -->
                    <div class="floor-title">影音潮品</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort08.slice(3,6)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                    <!-- F3 -->
                    <div class="floor-title">电脑周边</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort08.slice(6,9)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                    <!-- F4 -->
                    <div class="floor-title">其他配件</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort08.slice(9,12)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>  
                </div>
                </mt-tab-container-item>

                <mt-tab-container-item id="9">
                    <div class="F9">
                    <!-- F1 -->
                    <div class="floor-title">家居家纺</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort09.slice(0,8)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>  
                    <!-- F2 -->
                    <div class="floor-title">日用百货</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort09.slice(8,13)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div> 
                </div>
                </mt-tab-container-item>

                <mt-tab-container-item id="10">
                    <div class="F10">
                    <!-- F1 -->
                    <div class="floor-title">水果生鲜</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort10.slice(0,3)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                    <!-- F2 -->
                    <div class="floor-title">休闲食品</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort10.slice(3,9)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                    <!-- F3 -->
                    <div class="floor-title">酒水饮料</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort10.slice(9,15)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                    <!-- F4 -->
                    <div class="floor-title">进口食品</div>
                    <div class="allCate_List">
                        <div class="cate" v-for="(item,index) in sort10.slice(15,18)" :key="index">
                            <img class="cate-img" :src="`http://127.0.0.1:3000/`+item.img" alt="">
                            <p class="cate-title">{{item.title}}</p>
                        </div>
                    </div>
                </div>
                </mt-tab-container-item>

            </mt-tab-container>

        </div>

    </div>
</template>


<script>
export default {
    name: 'page-navbar',

    data(){
        return{
            types:[
                {name:"精选推荐",id:"1"},
                {name:"次日达",id:"2"},
                {name:"i71原创",id:"3"},
                {name:"影视周边",id:"4"},
                {name:"动漫周边",id:"5"},
                {name:"儿童周边",id:"6"},
                {name:"正版图书",id:"7"},
                {name:"数码3C",id:"8"},
                {name:"品质居家",id:"9"},
                {name:"享遍美食",id:"10"},


            ],
            // 侧边导航
            selected: '1',
            // 准备一个数组，保存返回数据
            list:[],
            // 分类
            sort01:[],
            sort02:[],
            sort03:[],
            sort04:[],
            sort05:[],
            sort06:[],
            sort07:[],
            sort08:[],
            sort09:[],
            sort10:[],
        }
    },
    created(){
        this.loadMore();
    },
    methods:{
        // 返回上一页
        back:function(){
            this.$router.go(-1)
        },
        // 3、接口
        loadMore(){//加载数据
            // 1、创建url
            var url="sortproduct";

            // 2、发送ajax请求
            this.axios.get(url).then(result=>{
                // 将请求到的主句添加到list数组中
                this.list=result.data.data;

                var list=this.list;
                var sortlist=[];//保存分类的数组  10类
                for(var i=0;i<list.length;i++){
                    if(!sortlist[list[i].SnFn_id]){
                        var arr=[];
                        arr.push(list[i]);
                        sortlist[list[i].SnFn_id]=arr;
                    }else{
                        sortlist[list[i].SnFn_id].push(list[i]);
                    }
                }
                // console.log(sortlist);
                this.sort01=sortlist[1];
                this.sort02=sortlist[2];
                this.sort03=sortlist[3];
                this.sort04=sortlist[4];
                this.sort05=sortlist[5];
                this.sort06=sortlist[6];
                this.sort07=sortlist[7];
                this.sort08=sortlist[8];
                this.sort09=sortlist[9];
                this.sort10=sortlist[10];

            })
           
        },
    },
}
</script>


<style scoped>

.sort{
    width: 100%;
    height: 100%;
    position: relative;
}

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
    margin-right: 45%;
    line-height: 50px; 
    font-weight: bold;
    font-size: 20px;
}
/* 搜索框 */
.myinput{
    width:95%;height:35px;
    margin:10px auto;
    display: flex;
    justify-content:center;
    position: relative;
}
.search{
    height:35px;
    border-radius: 35px;
    background-color: #f3f3f3;
    font-size: 15px;
    padding-left: 35px;
    border-color: #ddd;
}
.cancelBtn{
    width: 55px;height:35px;
    font-size: 15px;
    color:#333;
    background-color: transparent;
}
.copy{
    font-size: 20px;
    color:#555;
    position: absolute;
    top:7px;left:10px;
}

/* 商品 左+右 */
.page-navbar{
    position: relative;
    overflow: scroll;
}

/* 左侧 */
.page-part{
    height: 589px;
    position: relative;
    overflow: scroll;
    width: 25%;
    float: left;
}
.nav-flex{
    display:flex;
    flex-direction: column;
    width: 100%;
}

.mint-tab-item{
    background-color: #f6f6f6;
    color: #333;
    border:1px solid #f3f3f3;
}
.mint-navbar .mint-tab-item.is-selected{
    border-bottom:none;
    border-left: 2px solid #ee394b;
    background-color: #fff;
}
.page-item>>>.mint-tab-item-label{
    font-size: 14px;
    line-height: 2;
    color: #555;
}

/* 右侧 */
.page-wrap{
    height: 589px;
    position: relative;
    overflow: scroll;
    width: 75%;
}

/* 大图 */
.big-img img{
    width: 288px;height: 99px;
}
/* 小图 */
.allCate_List{
    display: flex;
    justify-content: flex-start;
    flex-wrap: wrap;
}
.cate{width: 33%;}
.cate-img{width: 75%;height: 70%;}
.cate-title{
    margin-bottom:15px;
    font-size: 12px;
    line-height: 12px;
}
/* 楼层 */
.floor-title{
    line-height: 30px;
    color: #666;
    font-size: 14px;
    text-align: left;
    padding: 0 4%;
}






</style>