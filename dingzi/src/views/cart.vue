<template>
    <div class="cart">
        <!-- 1、按钮 购物车标题 -->
        <div class="cart-head">
            <mt-button class="back" icon="back"></mt-button>
            <div class="cart-title">购物车</div>
        </div>
        <!-- 2、商品列表 -->
        <div class="buyCar_warp">

            <!-- 一个商品 循环列表 -->
            <div class="center_item" v-for="(item,index) in list" :key="index">
                <!-- 左侧 单个选中删除复选框 -->
                <div class="leftchecked">
                    <!-- <input class="checkbox" type="checkbox" v-model="item.cb">   @click="selectedProduct(item)"  -->
                    <van-checkbox v-model="item.checked" checked-color="#ee394b" :class="{'check':item.checked}" ></van-checkbox>
                </div>
                <!-- 中间图片 -->
                <div class="cartlistimg">
                    <img :src="item.img" alt="">
                </div>
                <!-- 右侧商品信息 -->
                <div class="rightinfo">
                    <!-- 商品信息标题 -->
                    <div class="title">{{item.title}}</div>
                    <!-- 商品信息分类 -->
                    <div class="colorkind">{{item.kind}}</div>

                    <!-- 商品数量 加减功能  文本框数量 -->
                    <div class="btnall">
                        <mt-button class="btnc"  @click="counter(item,-1)">-</mt-button>
                        <input class="count" type="text" v-model="item.num">
                        <mt-button class="btnc" @click="counter(item,1)">+</mt-button>
                        <!-- <van-stepper input-width="25px" v-model="value" min="1" max="5" /> -->
                    </div>

                    <!-- 商品价格和删除按钮 -->
                    <div class="priceanddel">
                        <div class="priceall">
                            <span class="price">￥{{item.money}}</span>
                            <span class="subprice">￥{{item.subprice}}</span>
                        </div>
                         <!-- 自定义属性data-id 获得当前id -->
                        <mt-button class="delsingle" @click="delItem(index,item.id)" :key="item.id" >删除</mt-button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 占位符 -->
        <div style="height:80px"></div>
        <!-- 3、底部固定结算 -->
        <div class="buyCar-footer">
            <div class="for-flex">
                <!-- 左侧按钮价格 -->
                <div class="buyCar_footerL">
                    <input type="checkbox" class="checkbox"  @change="selectAll">
                    <span class="selecteall" :class="{'check':checkAllFlag}" @click="checkAll(true)">全选</span> 
                    <!-- <span class="selecteall" @click="checkAll(false)">取消全选</span> -->

                    
                </div>
                <!-- 右侧按钮 -->
                <div class="btnend">
                    <!-- 中间：清空购物车 -->
                    <!-- <mt-button class="delsingle delall" @click="delAll">清空</mt-button> -->
                    <div class="money-right">
                        <span class="allCount" >合计 (不含运费)</span>
                        <b class="priceall">￥{{ money|toFixed(2) }}</b>
                    </div>
                    <!-- 右侧结算 -->
                    <router-link to="order">
                        <mt-button class="delsingle accounts"><a class="gopay" href="javascript:;">去结算({{num}})</a></mt-button>
                    </router-link>
                </div>
            </div>
        </div>
    </div>
</template>


<script>



import { Checkbox, CheckboxGroup,Stepper } from 'vant';
export default {
    components:{
        [Checkbox.name]:Checkbox,
        [Stepper.name]:Stepper,
    },
    data(){
        return{
            // 准备一个数组，保存返回数据
             list: [
                 {
                img: require("../assets/d01.jpg"),
                title: "自带充电仓+双耳迷你无线蓝牙耳机手机通用入耳塞",
                kind: "颜色分类：白色",
                money: 29.9,
                subprice:299,
                num: 1,
                checked: false
            },{
                img: require("../assets/ms08.jpg"),
                title: "掌上游戏机400种经典怀旧FC掌上游戏迷你儿童游戏掌机",
                kind: "颜色分类：红色",
                money: 49,
                subprice:198,
                num: 1,
                checked: false
            },{
                img: require("../assets/ms06.jpg"),
                title: "触屏儿童智能电话手表插卡可拍照定位男女孩多功能手表带灯",
                kind: "颜色分类：粉色",
                money: 58,
                subprice:136,
                num: 1,
                checked: false
            },{
                img: require("../assets/ms05.jpg"),
                title: "CRDBNSCJ 大容量移动电源充电宝手机适用20000毫安快充充电宝",
                kind: "颜色分类：白色",
                money: 29.9,
                subprice:249.5,
                num: 1,
                checked: false
            },{
                img: require("../assets/ms03.jpg"),
                title: "CRDBNSCJ 智能运动手环 来电信息提醒微信 多功能智能手环手表",
                kind: "颜色分类：黑色",
                money: 1,
                subprice:99,
                num: 1,
                checked: false
            }
        ],
           //默认总价
            money: 0,
            //默认总数量
            num: 0,
            // 选中全部
            checkAllFlag: false,
        }
    },
    created(){
        this.loadMore();
        // 初始化加载   显示总价总数量
        var price = 0;
        var numb = 0;
        var list = this.list;
        for(var i = 0; i < list.length; i++) {
            if(list[i].checked) {
                price += list[i].num * list[i].money;
                numb += list[i].num;
            }
        }
        this.money = price;
        this.num = numb;
        console.log(numb);
        console.log(price);
    },
    methods:{
        // 全选
        checkAll(flag){
            this.checkAllFlag = flag;
            if(this.productList){
            this.productList.forEach((item, index) => {
                if(typeof item.checked == 'undefined') {//检测属性是否存在
                    this.$set(item, "checked", this.checkAllFlag);//局部注册
                }else{
                    item.checked = this.checkAllFlag;//状态取反
                }
            })};
            this.calcTotalPrice();//全选时调用计算总金额函数
        },

        // 单选按钮的选中状态
        selectedProduct(item){ //选中商品
            if(typeof item.checked == 'undefined') {//检测属性是否存在
                //Vue.set(item, "checked", true);
                this.$set(item, "checked", true);//局部注册
            }else{
                item.checked = !item.checked;//状态取反
            }
            //如果取消一个商品的选中，全选也取消
            // var itemisChecked = [];
            // if(this.productList){
            // this.productList.forEach((item, index)=>{
            //     if (item.checked === true ) {
            //         itemisChecked.push(item);
            //     }
            // })};
            // // 
            // if (itemisChecked.length === this.productList.length ) {
            //     this.checkAllFlag = true;
            // }else{
            //     this.checkAllFlag = false;
            // }
            this.hh();//这个位置调用计算总金额的函数
        },

        //总价总数量方法   方便调用   再次多写了一次[可以跟初始化封装为一个方法]
        hh() {
            var price = 0;//声明变量来保存 选中的商品 总价
            var numb = 0;//声明变量来保存 选中的商品 数量
            var list = this.list;
            console.log(list);
            for(var i = 0; i < list.length; i++) {
                if(list[i].checked) {
                    price += list[i].num * list[i].money;
                    numb += list[i].num;
                }
            }
            this.money = price;
            this.num = numb;
            console.log(this.money);
            console.log(this.num);
            
        },

        // 加减功能  文本框数量
        counter(item,way){
            if(way>0){
                item.num++;
            }else{
                item.num--;
                if(item.num<1){ //限制数量最少为0
                    item.num=1;
                }
            }
            // this.calcTotalPrice();//每次改变商品数量就调用计算总金额函数
            this.hh();
        },

        // 1：商品加载
        loadMore(){
            var url="cart";
            this.axios.get(url).then(result=>{
                // this.list=result.data.data
                // 全选->选中所有商品 注意顺序
                // 1、获取数组(数据库sp)
                var rows=result.data.data;
                // 2、创建循环为数组中元素添cb属性  chekbox
                for(var item of rows){
                    // 自己cd属性，默认值为false.就是商品选中状态
                    item.checked=false;
                }
                // 3、将修改后购物车数组数据赋值list
                // this.list=rows;
                // console.log(list);
            })
        },

        //2：删除指定购物车商品
        delItem(index,id){
            // 0 确认的提示消息
            this.$messagebox({
                title:"消息",
                message:"是否删除指定数据",
                showConfirmButton:true,
                showCancelButton:true
            }).then(result=>{
                // console.log(result);
                // 若用户选中取消按钮，就停止执行
                if("cancel"==result){
                    return;
                }else{
                    this.list.splice(index, 1);
                    this.loadMore();
                }
            })
        },

        calcTotalPrice() {
            this.totalMoney = 0;//每次遍历商品之前对总金额进行清零
            if(this.productList){
            this.productList.forEach((item, index) => {//遍历商品，如果选中就进行加个计算，然后累加
                if (item.checked){
                    this.totalMoney += item.productPrice*item.productQuantity;//累加的
                }
            })};
        },

        // 全选按钮  与 取消全选
        checkAll(flag) {
            this.checkAllFlag = flag;
            if(this.productList){
            this.productList.forEach((item, index) => {
                if(typeof item.checked == 'undefined') {//检测属性是否存在
                    this.$set(item, "checked", this.checkAllFlag);//局部注册
                }else{
                    item.checked = this.checkAllFlag;//状态取反
                }
            })};
            this.calcTotalPrice();//全选时调用计算总金额函数
        },

        // 3：全选按钮  e.target.checked 事件对象.属性 返回属性值(true/false)
        selectAll(event){
            // 1、获取当前 全选按钮状态
            var rs=event.target.checked;
            // 2、获取购物车（循环）数组列表 rs
            // 3、创建循环
            for(var item of this.list){
                // 4、将当前列表的状态修改为全选状态
                item.checked=rs;
            }
        },

        // 4：清空购物车中所有商品
        // delAll(){
        // // 0、确认框
        // // 1、创建变量，保存空字符串
        // var str="";
        // // 2、创建循环,来遍历数组
        // for(var item of this.list){
        // // 3、获取当前元素id拼接字符串  "1,2,3,"    
        //     str+=item.id+","
        // }
        // if(str.length==0){
        //     this.$messagebox("提示","请选中删除商品")
        //     return;
        // }
        // // 4、希望结果"1,2,3"
        // str=str.substring(0,str.length-1);//js函数，截取字符串。去掉最后的逗号
        // // 5、就发送ajax请求获取数据
        // // 创建url  delAll 接口
        // var url="delAll";
        // // 创建obj
        // var obj={ids:str}
        // // 发送ajax请求
        // this.axios.get(url,{params:obj}).then(result=>{
        //     // console.log(result);
        //     // 发完，购物车就全清空，即刷新页面
        //     this.loadMore();
        //     })
        // },
        
    },
}
</script>


<style scoped>

/* 1、头布局 */
.cart-head{
    display: flex;
    justify-content: space-between;
}
 /* 按钮 */
.back{
    text-align: left;
    background: transparent;
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
.cart-title{
    margin-right: 45%;
    line-height: 50px; 
    font-weight: bold;
    font-size: 20px;
}   
/* 商品列表 */
.center_item{
    display: flex;
    justify-content: space-around;
    align-items: center;
    background-color: #f6f6f5;
    height: 160px;
    margin: 0 0 25px 0;
}
.buyCar_warp{margin-top: 10px;}


/* 删除复选框 */
.leftchecked{
    /* line-height: 120px; */
    margin:0 10px;
    /* text-align: center; */
}


/* 图片 */
.cartlistimg img{
    width: 110px;height:120px;
    background-size: cover;
}

/* 右侧信息 */
/* 标题分类 */
.rightinfo{
    text-align: left;
    margin:0 12px;
}
.title{
    font-size: 15px;
    color: #333;
}
.colorkind{
    font-size: 13px;
    color: #999;
    padding-bottom:15px;
}

/* 按钮 */
.btnall{margin-bottom: 10px;}
.btnall>>>.van-stepper__input{
    padding: 0;margin: 0;
    height: 22px;
}
.btnc{
    width:28px;height:28px;
    vertical-align: middle;
    margin:0 5px 0 5px;
    background: #fff;
    border:1px solid #eee;
    padding-left: 8px;
}


/* 价格+删除按钮 */
.priceanddel{
    line-height:30px;
    display: flex;
    justify-content:space-between;
}
.price{
    color: #333;
    font-size: 17px;
    font-weight:bold;
}
.subprice{
    color: #999;
    font-size:13px;
    text-decoration: line-through;
    margin-left:5px;
}
.delsingle{
    color: #fff;
    background: #ee394b;
    background:linear-gradient(to right top,#ff396d,#ff826e);
    width: 65px;
    height: 30px;
    line-height: 18px;
    font-size: 12px;
    border-radius: 27px;
}
.accounts{
    width: 75px;
}

/* 3、底部固定结算 */
.buyCar-footer{
    position: fixed;
    left: 0;bottom: 42px;
    width: 100%;
    height: 65px;
    line-height: 30px;
    z-index: 100;
}
.for-flex{
    display:flex;
    justify-content:space-between;
    background: #f8f8f8;
    border-top: 1px solid #dcdcdc;
    border-bottom: 1px solid #f9f9f9;
    padding:10px 10px;
    font-size: 14px;
    line-height: 30px;
}
.leftchecked>>> .van-icon-success{
    font-size: 14px;
    border:1px solid #bbb;
}
.priceall{
    padding-left: 5px;
    font-size: 20px;
    color: #ee394b;
}
.money-right{
    margin-right: 8px;
}

.checkbox{
    position: absolute;
    top:20px;left: 13px;
}
.selecteall{
    display: inline-block;
    margin: -15px -15px 0px 20px;
}
.gopay{
    color:#fff;
    width: 60px;
}



.btnallcolorkind{
    margin: 5px;
}
.count{
    width: 13%;
    height: 26px;
    text-align: center;
    padding: 0;
    margin-bottom: 0;
}


.btnend{
    display: flex;

}









</style>