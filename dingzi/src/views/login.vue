<template>
    <div class="page-login">
        <div class="goback">
            <!-- <router-link to="mine">&lt;</router-link> -->
            <router-link to="mine"><mt-button class="back" icon="back"></mt-button></router-link>
            
        </div>
        <h3>登录</h3>
        <!-- 1、账号 -->
        <div class="content">
            <span class="iconfont icon-yonghu" ></span>
            <mt-field 
            placeholder="请输入用户名" 
            v-model="uname"
            class="myinput">
            </mt-field>
        </div>

        <!-- 2、密码 -->
        <div class="content">
            <span class="iconfont icon-mima"></span>
            <mt-field 
            placeholder="请输入密码" 
            type="password" 
            v-model="upwd" 
            class="myinput"></mt-field>
        </div>

        <!-- 3、忘记密码 -->
        <div class="lose-pwd">忘记密码</div>
        <!-- 4、登录按钮 -->
        <mt-button 
        class="mybutton" 
        size="normal" 
        @click="login">登录</mt-button>
        <!-- 5、注册 -->
        <div class="reg">
            <router-link to="reg">注册账号 |</router-link>
            <a href="javascript:;"> 其他登录方式</a> 
        </div>
        <!-- 6、其他登录方式 -->
        <div class="other">
            <span class="iconfont icon-weixin"></span>
            <span class="iconfont icon-weibo"></span>
            <span class="iconfont icon-qq"></span>
        </div>
    </div>
</template>


<script>
export default {
    data(){
        return{
            uname:"",//初始用户名
            upwd:"",//初始密码
        }
    },
    methods: {
        login(){
            // console.log(123);
            //axios:发送请求
            //完成用户登录：
            // 1、获取用户输入用户名  3~10   / /
            // 2、获取用户输入密码    3~8   / \w{3,8} /   [范围条件]{规定个数}
            var n=this.uname;
            var p=this.upwd;
            // 3、创建两个正则表达式
            var nreg=/^[a-zA-Z0-9]{3,10}$/;  // [a-zA-Z0-9]=> \w +_
            var preg=/^[a-zA-Z0-9]{3,8}$/;
            // 4、判断用户名格式不正确  提示出错   验证正则表达式：text
            if(!nreg.test(n)){
                this.$toast("用户名格式不正确");
                return;
            }
            // 5、判断密码格式不正确  提示出错
            if(!preg.test(p)){
                this.$toast("密码格式不正确");
                return;
            }
            // 6、将用户名和密码发送 ajax请求  url变量：请求路径
            var url="login";//服务器app.js的get方法写了一个请求路径，一样就行
            var obj={uname:n,upwd:p};
            // 7、并且获得服务器返回的结果   body-params中间件
            this.axios.get(url,{params:obj}).then(result=>{//params 参数
            //result：对象，服务器返回的结果，很复杂，f12查看，要另外找到自己要的结果数据——data
            console.log(result);
            // console.log(result.data.code);//对象.属性.值
            // console.log(result.data.msg);

            // var ses=window.sessionStorage;
            //     console.log(result.data);
            // // var uname=JSON.stringify(result.data.uname);//sessionStorage接收到的 是string所以把data解析成json字符串
            // var uname=result.data.uname
            //     console.log(uname) //undefined
            // ses.setItem("data",uname)//将id存储到data字段

            // var data1=sessionStorage.getItem(id)
            // console.log(data1);

            if(result.data.code==1){

              this.$router.push("/mine")
            }else{  //  -1
              this.$messagebox("消息",result.data.msg);
            }

 
            })
            // 8、返回失败  提示
            // 9、返回成功  跳转Home.vue
        }//login——end
    },
}
</script>


<style scoped>
.back{
    background-color: transparent;
    font-weight: bold;
}
/* 去掉button边框阴影 */
.mint-button--default{
    box-shadow: none;
}
.goback{
    font-size:35px;
    margin: 15px 0 20px 10px;
    text-align: left;
}
h3{
    margin-bottom: 60px;
    font-weight: normal;
}
.lose-pwd{
    text-align:right;
    margin:20px 10px 20px 0;
    color:#ee394b;
    font-size: 16px;
}
.content{
    position: relative;
}
.content >>> .mint-field-core{
    border:0;
    margin-bottom: 0;
}

.icon-yonghu{
    position: absolute;
    top:13px;left:19px;
    z-index: 20;
    font-size: 18px;
    color: #999;
}
.icon-mima{
    position: absolute;
    top:13px;left:19px;
    z-index: 20;
    font-size: 18px;
    color: #999;
}
.other{
    display:flex;
    justify-content:space-around;
    width: 50%;
    margin: 30px 0 10px 100px;
}
.icon-weixin{
    color:#00bc0d;
    font-size: 35px;
}
.icon-weibo{
    color: #f3260b;
    font-size: 35px;
}
.icon-qq{
    color:#18b6ed;
    font-size: 35px;
}
.myinput{
    width: 95%;margin:10px 0 0 10px;
    border-radius: 5px;
    padding-left: 10px;
    margin-bottom: 0;
    border:0;
}

.mybutton{
    color:#fff;
    font-size: 20px;
    height: 55px;width:90%;
    vertical-align: middle;
    background-color: #ee394b;
    /* margin-left: 20px;  */
}
.reg{
    margin-top: 40px;
    font-size: 16px;
}
.reg a{color:#555;}
.mint-field-core{border:0}

.page-login>>>.mint-cell-wrapper{
    background: #fff!important;
}
.page-login>>>.mint-cell{
    background: #fff!important;
}


</style>