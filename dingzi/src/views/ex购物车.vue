<template>
    <div class="paypage">


<!--<header class="mui-bar mui-bar-nav">
			<h1 class="mui-title">首页</h1>
		</header>-->
		<!--最外层div 透明遮罩-->
		<div id="cont">
			<!--居中显示视图-->
			<!-- <div class="dislog" style="display: {{nones}};"> -->
				<!--内容-->
				<!-- <div class="dis_cont">
					<div class="cont_dis">
朋友，给老五点个赞好吗？
					</div>
 
					<div class="dis_bott">
						<label class="left_name" onclick="cances()">取消</label>
						<label class="right_name" onclick="submits()">确认</label>
 
					</div>
 
				</div>
 
			</div> -->
	<!--列表-->
			<div id="list" v-for="(item,index) in list" :key="item.i">
<!-- icon选中/未选中ICON  img/radio_show.png -->
				<img v-if="item.selected" class="list_icon" @click="radios(index)" src="../assets/company.png" />
				<img v-else-if="!item.selected" class="list_icon" @click="radios(index)" src="../assets/company.png" />
<!--列表图片-->
				<img class="list_img" src="../assets/d01.jpg" @click="delerte(index)" />
				<!--列表名称-->
				<label class="list_name">{{item.name}}</label>
				<!--列表标题-->
				<label class="list_title">{{item.title}}</label>
				<!--列表价格-->
				<label class="money">{{item.money}}</label>
			<!--加减功能  文本框数量-->
				<div class="sum_cont">
					<label class="minute" @click="btn_minute(index)">-</label>
					<input class="input" v-model="item.num"  />
					<label class="add" @click="btn_add(index)">+</label>
				</div>
			</div>
 
 
			<!--底部固定样式-->
			<div class="bottom">
				<!--已获得数量-->
				<label class="bott_num">已获得：{{num}}</label>
				<!--总价-->
				<label class="bott_money">总和：{{money}}</label>
				<!--点赞-->
				<label class="btn_sub" onclick="btn_sub()">点赞</label>
			</div>
 
		</div>
		<!-- <script type="text/javascript" src="js/vue.min.js"></script>
		
		<script src="https://cdn.jsdelivr.net/npm/vue"></script> -->
 
		<!--<script src="js/mui.js" type="text/javascript" charset="utf-8"></script>-->








    </div>
</template>

<script>
export default {
    data(){
        return{
            //默认总价
            money: 0,
            //默认总数量
            num: 0,
            //					购物车假数据
            list: [{
                name: "养护液",
                num: 1,
                money: 10,
                src: "../assets/d01.jpg",
                title: "养护液",
                selected: true
            }, {
                name: "养护液",
                num: 1,
                money: 10,
                src: "../assets/d02.jpg",
                title: "养护液",
                selected: false
            }, {
                name: "养护液",
                num: 1,
                money: 10,
                src: "../assets/d03.jpg",
                title: "养护液",
                selected: true
            }]


        }
    },
    //初始化加载   显示总价总数量
    created: function() {
        var price = 0;
        var numb = 0;
        var list = this.list;
        for(var i = 0; i < list.length; i++) {
            if(list[i].selected) {
                price += list[i].num * list[i].money;
                numb += list[i].num;
            }
        }
        this.money = price;
        this.num = numb;
        console.log(numb);
        console.log(price);
    },

    methods: {
        //总价总数量方法   方便调用   再次多写了一次[可以跟初始化封装为一个方法]
        hh: function() {
            var price = 0;
            var numb = 0;
            var list = this.list;
            for(var i = 0; i < list.length; i++) {
                if(list[i].selected) {
                    price += list[i].num * list[i].money;
                    numb += list[i].num;
                }
            }
            this.money = price;
            this.num = numb;
            console.log(numb);
        },
        //删除购物车列表
        delerte: function(index) {
            this.list.splice(index, 1);
        },
        //选中未选中
        radios: function(index) {
            var list = this.list;
            list[index].selected = !list[index].selected;
            this.hh();
            console.log(list[index].selected)
        },

        
        //添加
        btn_add: function(index) {
            

            var list = this.list;
            var num = list[index].num;
            num = num + 1;
            list[index].num = num;
            this.hh();
        },
        //减去
        btn_minute: function(index) {
            var list = this.list;
            var num = list[index].num;
            if(num > 1) {
                num = num - 1;
                list[index].num = num;
            }
            this.hh();
        },
        
    }


}
</script>


<style scoped>


/*清除一下margin-padding*/
		
		body {
			margin: 0 auto;
			padding: 0;
			background-color: #f5f5f5;
		}
		/*购物车列表样式*/
		
		#list {
			position: relative;
			top: 10px;
			width: 100%;
			height: 120px;
			background-color: #fff;
			margin-bottom: 10px;
		}
		/*选中未选中ICON*/
		
		.list_icon {
			position: absolute;
			width: 35px;
			height: 35px;
			top: 35px;
			left: 20px;
		}
		/*列表图*/
		
		.list_img {
			position: absolute;
			width: 80px;
			height: 80px;
			left: 80px;
			top: 20px;
		}
		/*列表名称*/
		
		.list_name {
			position: absolute;
			top: 30px;
			left: 180px;
		}
		/*列表标题*/
		
		.list_title {
			position: absolute;
			top: 55px;
			left: 180px;
			font-size: 15px;
			color: #CCCCCC;
		}
		/*money*/
		
		.money {
			position: absolute;
			top: 78px;
			left: 180px;
			font-size: 15px;
			color: #EC971F;
		}
		/* 总数量*/
		
		.sum_cont {
			position: absolute;
			right: 0;
			bottom: 10px;
			width: 130px;
			height: 30px;
			line-height: 30px;
		}
		/*减号*/
		
		.minute {
			position: absolute;
			width: 25px;
			text-align: center;
			height: 30px;
			line-height: 30px;
			left: 10px;
			font-size: 18px;
			border: 1px solid #DD524D;
		}
		/*加号*/
		
		.add {
			width: 25px;
			border: 1px solid #DD524D;
			height: 30px;
			line-height: 30px;
			text-align: center;
			position: absolute;
			right: 10px;
			font-size: 18px;
		}
		/*文本框*/
		
		.input {
			width: 40px;
			height: 26px;
			display: inline-block;
			line-height: 30px;
			text-align: center;
			position: absolute;
			right: 45px;
		}
		/*底部固定样式*/
		
		.bottom {
			position: fixed;
			width: 100%;
			height: 60px;
			line-height: 60px;
			bottom: 0px;
			background-color: #323232
		}
		/*总价*/
		
		.bott_money {
			padding-left: 20px;
			color: #fff;
		}
		/*总数量*/
		
		.bott_num {
			padding-left: 50px;
			color: #fff;
		}
		/*点赞*/
		
		.btn_sub {
			position: absolute;
			right: 0;
			width: 100px;
			height: 60px;
			line-height: 60px;
			background-color: #CF2D28;
			color: #fff;
			text-align: center;
		}
		/*弹窗*/
		
		.dislog {
			position: fixed;
			z-index: 999;
			width: 100%;
			height: 100%;
			display: none;
			text-align: center;
			background-color: #000;
			opacity: 0.8;
		}
		
		.dis_cont {
			position: relative;
			border-radius: 10px;
			top: 25%;
			width: 80%;
			display: inline-block;
			height: 160px;
			background-color: #2AC845;
		}
		/*确认取消*/
		
		.dis_bott {
			position: absolute;
			border-bottom-left-radius: 10px;
			border-bottom-right-radius: 10px;
			border-top: 1px solid #ddd;
			width: 100%;
			height: 70px;
			background-color: #f5f5f5;
			bottom: 0px;
		}
		/*取消按钮*/
		
		.left_name {
			position: absolute;
			border-bottom-left-radius: 10px;
			text-align: center;
			left: 0px;
			width: 50%;
			height: 70px;
			line-height: 70px;
			background-color: #fff;
		}
		/*确认*/
		
		.right_name {
			position: absolute;
			text-align: center;
			border-bottom-right-radius: 10px;
			right: 0px;
			width: 49%;
			height: 70px;
			line-height: 70px;
			background-color: #fff;
		}
		/* 提示*/
		
		.cont_dis {
			position: relative;
			border-radius: 10px;
			text-align: center;
			width: 100%;
			height: 90px;
			font-size: 20px;
 
			display: flex;
			align-items: center;
			color: #fff;
			box-sizing: border-box;
			padding: 20px 20px;
		}






</style>
