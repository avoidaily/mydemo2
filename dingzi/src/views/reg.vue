<template>
    <div class="page-login">
        <div class="goback"><router-link to="login"><mt-button class="back" icon="back"></mt-button></router-link></div>
        <h3>注册</h3>
        <!-- 1、账号 -->
        <div class="content">
            <span class="iconfont icon-yonghu" ></span>
            <mt-field 
            placeholder="用户名 3-10位字母或数字" 
            v-model="uname"
            class="myinput">
            </mt-field>
        </div>

        <!-- 2、手机号码 -->
        <div class="content">
            <span class="iconfont icon-mobile" ></span>
            <mt-field 
            placeholder="请输入11位有效号码" 
            v-model="phone"
            class="myinput">
            </mt-field>
        </div>

        <!-- 3、验证码 -->
        <div class="content yzm">
            <div>
                <span class="iconfont icon-yanzhengma"></span>
                <input placeholder="请输入校验码" type="text"  class="form-control">
            </div>
            <div>
                <div v-show="!show" class="register-msg-btn lineheight">{{count}} s</div>
                <button class="register-msg-btn"  v-show="show" v-on:click="getCode">获取验证码</button>
            </div>
            
        </div>

        <!-- 4、密码 -->
        <div class="content">
            <span class="iconfont icon-mima"></span>
            <mt-field 
            placeholder="密码 3-8位字母或数字" 
            type="password" 
            v-model="upwd" 
            class="myinput"></mt-field>
        </div>
        
        <!-- 5、勾选按钮 -->
        <div class="agree">
            <input  type="checkbox" v-model="isAgree">同意
            <a href="JavaScript:;">《用户协议》、</a>
            <a href="JavaScript:;">《隐私政策》</a>
        </div>

        <!-- 6、注册按钮 -->
        <mt-button 
        class="mybutton" 
        size="normal" 
        @click="login" :disabled="isAgree==false">注册</mt-button>

        <!-- 7、登录+其他方式 -->
        <div class="reg">
            <router-link to="login">已有账号?去登录 |</router-link>
            <router-link to="/"> 返回首页 </router-link> 
        </div>

        
    </div>
</template>


<script>
export default {
    data(){
        return{
            uname:"",//初始用户名
            phone:"",//初始化号码
            upwd:"",//初始密码
            isAgree:false,
            // 验证码
            show: true,
            count: '',
            timer: null,
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
            var t=this.phone;
            var p=this.upwd;
            // 3、创建三个正则表达式
            var nreg=/^[a-zA-Z0-9]{3,10}$/;  // [a-zA-Z0-9]=> \w +_
            var treg=/^1[3-8]\d{9}$/;
            var preg=/^[a-zA-Z0-9]{3,8}$/;
            // 4、判断用户名格式不正确  提示出错   验证正则表达式：text
            if(!nreg.test(n)){
                this.$toast("用户名格式不正确");
                return;
            }
            // 5、判断手机格式不正确  提示出错   验证正则表达式：text
            if(!treg.test(t)){
                this.$toast("号码格式不正确");
                return;
            }
            // 6、判断密码格式不正确  提示出错   验证正则表达式：text
            if(!preg.test(p)){
                this.$toast("密码格式不正确");
                return;
            }

            // 7、将用户名、号码和密码发送 ajax请求  url变量：请求路径
            var url="reg";//服务器app.js的get方法写了一个请求路径，一样就行
            var obj={uname:n,phone:t,upwd:p};
            // 7、并且获得服务器返回的结果   body-params中间件
            this.axios.get(url,{params:obj}).then(result=>{//params 参数
            //result：对象，服务器返回的结果，很复杂，f12查看，要另外找到自己要的结果数据——data
            // console.log(result.data.code);//对象.属性.值
            // console.log(result.data.msg);

            if(result.data.code==200){
              // this.$messagebox("消息",result.data.msg);
              // 登录成功跳转到指定组件
              this.$router.push("/login")
            }
            })
            // 8、返回失败  提示
            // 9、返回成功  跳转Home.vue
        },
        // 验证码
        getCode(){
        this.show = false;
        const TIME_COUNT = 60;      
          if (!this.timer) {        
            this.count = TIME_COUNT;        
            this.show = false;        
            this.timer = setInterval(() => {        
              if (this.count > 0 && this.count <= TIME_COUNT) {
               this.count--;         
            } else {          
                this.show = true;          
                clearInterval(this.timer);          
                this.timer = null;         
            }        
          }, 1000)       
        }    
      }  

    },//methods-end
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
.content{position: relative;}
.content >>> .mint-field-core{
    margin-bottom: 0;
    border:0;
}
.icon-yonghu{
    position: absolute;
    top:13px;left:19px;
    z-index: 20;
    font-size: 18px;
    color: #999;
}
.icon-mobile{
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

.myinput{
    width: 95%;margin:10px 0 0 10px;
    border-radius: 5px;
    padding-left: 10px;
}
/* 验证码 */
.yzm{
    margin:10px 6px -12px 5px;
    display:flex;
    justify-content:space-around;
}
.icon-yanzhengma{
    position: absolute;
    top:13px;left:15px;
    z-index: 20;
    font-size: 18px;
    color: #999;
}
.form-control{
    width: 300px; height: 48px; 
    border-radius:8px;
    border:0;
    padding-left:38px;
    display:inline-block;
}
.register-msg-btn{
    background-color:#ee394b;
    color:#fff;
    border-radius:5px;border:0;
    width:88px;height:45px;
    display:inline-block;
    font-size: 14px;
}
.lineheight{line-height:45px;}
.mybutton{
    color:#fff;
    font-size: 20px;
    height: 55px;width:90%;
    vertical-align: middle;
    background-color: #ee394b;
}
.reg{
    margin-top: 40px;
    font-size: 16px;
}
.reg a{color:#555;}
.test-code{color:#ee394b;}
.agree{
    margin:30px 0 20px 0;
    font-size: 15px;
}
.agree a{color:#ee394b;}

.page-login>>>.mint-cell-wrapper{
    background: #fff!important;
}
.page-login>>>.mint-cell{
    background: #fff!important;
}

</style>