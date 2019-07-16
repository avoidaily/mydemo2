//app.js node.js 服务器
//1:第三方模块 
//  express          web服务器
//  cors             跨域
//  express-session  session
//  body-parser      处理post数据
//  multer           上传文件
//  fs               文件操作(内置)
//  mysql            mysql驱动模块 
//下载指令:联网   两个分开安装！
//npm i express-session body-parser 安装！
//npm i multer mysql express cors  安装！
//安装完成会生成一个node_modules文件夹


//1:引入二个模块  express mysql
const express = require("express");
const mysql = require("mysql");


//2:创建连接池：目的减少创建连接和回收连接的次数day04.06视频
var pool = mysql.createPool({
  host:"127.0.0.1",
  user:"root",
  password:"",
  port:3306,
  database:"dz",
  connectionLimit:15
})


//3:创建express对象
var server = express();

//4:指定静态目录：图片
server.use(express.static("public"));
// http://127.0.0.1:3000/p1.png   可以查看到图片


//5:处理跨域请求(node.js:脚手架8080; mysql:3000)
// 跨域一定会抛弃session，缓存的数据也就丢失，多次请求时维护性就降低——axios.js设置ssession保留即可
const cors=require("cors");
  server.use(cors({
  // 允许脚手架允许访问
  origin:["http://127.0.0.1:8080","http://localhost:8080"],
  credentials:true
}))


// 6：添加session功能——登录时使用
//引入模块
const session=require("express-session")
//配置模块
server.use(session({
  secret:"128位字符串",//安全字符：保存session加密算法后的128位字符串，更安全
  resave:true,//每次登录就更新数据
  saveUninitialized:true//保存初始数据
}))


//9:绑定监听端口
server.listen(3000);

//10：接收用户登录请求
//检查数据库 t_login表
//启动数据库  启动node.js ： 根目录终端 node app.js
//地址栏访问



// 功能一：登录页面：接口一
// http://127.0.0.1:3000/login?uname=tom&upass=123
server.get("/login",(req,res)=>{
   //1:接收脚手架参数 uname upwd
   var uname = req.query.uname;
   var upwd = req.query.upwd;
   //2:sql语句
  var sql= "SELECT id,uname,upwd FROM dz_user WHERE uname=? AND upwd= ?";

   //3:返回结果 
   //  {code:1,msg:"登录成功"}
   //  {code:-1,msg:"用户名或密码有误"}
   pool.query(sql,[uname,upwd],(err,result)=>{
     if(err)throw err;
     if(result.length==0){
       res.send({code:-1,msg:"用户名或密码有误"});
     }else{
       //result=[{id：1}] result是数组,数组里有js对象
      //  req.session.id= result[0].id
       //拿到数组的 对象的 id -> =result[0].id
      //  保存登录id
      
      //  req.session.id=result.id
      //  console.log(req.session.id);
      //  res.send({code:1,msg:"登录成功"});

       req.session.id=result.id
       console.log(req.session.id);
       res.send({code:1,msg:"登录成功"});
       
     }
   });
});

//修改登录页面 mine 
server.get("/mine",(req,res)=>{
 var id=req.session.id;
 var sql="SELECT pic,unmae FROM dz_user WHERE id=?"
 pool.query(sql,[id],(err,result)=>{
   if(err)throw err;
   res.send({code:1,msg:"查询成功"});
 })
})


// 功能二：用户注册：接口二
// http://127.0.0.1:3000/reg?uname=jay&upass=123
server.get("/reg",(req,res)=>{
  //1:接收脚手架参数 uname phone upwd
  var uname=req.query.uname;
  var phone=req.query.phone;
  var upwd=req.query.upwd;
  // 2、sql语句
  var sql="INSERT INTO dz_user SET uname=?,phone=?,upwd=?";

  // 3、返回结果
  pool.query(sql,[uname,phone,upwd],(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:200,msg:"注册成功!"})
    }
  })
})



// 请求数据：
// 2、导航商品接口
// http://localhost:3000/navProduct
server.get("/navProduct",(req,res)=>{
  // sql语句
  var sql="SELECT nid,img,price,subprice FROM dz_nav_product";
  // 连接池
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"查询成功",data:result});
  })
})

// 3、首页商品图片——多个小图
// http://localhost:3000/product
server.get("/product",(req,res)=>{
  //1:参数： pno页码 pageSize页大小=数量     start=（页码-1）*数量
  var pno=req.query.pno;
  var ps=req.query.pageSize; //count==pageSize
  //2：参数默认值
  if(!pno){pno=1};
  if(!ps){ps=3};

  // sql语句
  var sql="SELECT pid,bid,pimg,title,price,subprice FROM dz_index_product";

  var offset=(pno-1)*ps;
  ps=parseInt(ps);//将转为整数。防屌丝在页面查询小数的页码

  // 连接池
  pool.query(sql,[offset,ps],(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"查询成功",data:result});
  })
})




// 5、：秒杀商品列表
// http://localhost:3000/discount
server.get("/discount",(req,res)=>{
  // sql语句
  var sql="SELECT did,dis_id,img,title,subtitle,price,subprice,count FROM dz_discount_product";
  // 连接池
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"查询成功",data:result});
  })
})



// 6、：购物车商品列表
// http://localhost:3000/cart
server.get("/cart",(req,res)=>{
  // sql语句
  var sql="SELECT id,img,title,kind,count,price,subprice FROM dz_cart_list";
  // 连接池
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"查询成功",data:result});
  })
})

// 7、删除指定购物车的一个商品(删除一条)
// http://127.0.0.1:3000/del?id=5
server.get("/del",(req,res)=>{
  //1 获得客户端传来的参数值
  var id=req.query.id;
  //2 sql语句
  var sql="DELETE FROM dz_cart_list WHERE id=?"
  pool.query(sql,id,(err,result)=>{
    if(err)throw err;
    res.send({ code:1,msg:"删除成功"})
  })
})


// 8:清空购物车
//http://127.0.0.1:3000/car
server.get("/delAll",(req,res)=>{
  //获取参数  类似6,7,9
  var ids=req.query.ids;
  //sql
  var sql=`DELETE FROM dz_cart_list WHERE id IN(${ids})`;
  //rs
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    //insert update delete
    //result不是数组是一个对象
    //affectedRows  影响行数
    if(result.affectedRows>0){
      res.send({code:1,msg:"删除成功！"});
    }else{
      res.send({ code:-1,msg:"删除失败！"});
    }
  })
})



// 商品详情页
// 根据 获取商品id 来查询相关数据 返回给页面
//http://127.0.0.1:3000/detail
server.get("/detail",(req,res)=>{
    //1:接收脚手架参数 id
    var id=req.query.id;

    // 2、sql语句
    var sql="SELECT id,img1,img2,img3,img4,img5,title,price,subprice,count,postage,addr,introduction,commentname,comment,commentsort,commenttime,pic1,pic2,pic3,pic4,pic5,pic6,pic7,pic8,pic9,pic10,pic11,pic12,pic13,pic14,floor1title,floor1content,floor2title,floor2content,floor3title,floor3content,floor4title,floor4content,shopname,addrs,tel FROM dz_goods_detail";
  
    // 3、返回结果
    pool.query(sql,[id],(err,result)=>{
      if(err)throw err;
      if(result.affectedRows>0){
        res.send({code:1,msg:"查询成功",data:result});
      }
    })
})




// 9:用户评论
//http://127.0.0.1:3000/morecoment
server.get("/morecoment",(req,res)=>{
    // sql语句
    var sql="SELECT id,img,cname,content,colorsort,ctime FROM dz_morecomment";
    // 连接池
    pool.query(sql,(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"查询成功",data:result});
    })
})







// 10:分类商品的子标题
// http://127.0.0.1:3000/sortsontitle
// server.get("/sortsontitle",(req,res)=>{
//   //sql
//   var sql="SELECT id,nav_id,title FROM dz_sort_sontitle";
//   // 连接池
//   pool.query(sql,(err,result)=>{
//     if(err)throw err;
//     res.send({code:1,msg:"查询成功",data:result});
//   })
// })


// 12:分类商品的商品小图
// http://127.0.0.1:3000/sortproduct
server.get("/sortproduct",(req,res)=>{
  //sql
  var sql="SELECT id,SnFn_id,img,title FROM dz_sort_product";
  // 连接池
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    res.send({code:1,msg:"查询成功",data:result});
  })
})





//  先安装各个模块
//  创建数据库
//  浏览模拟脚手架 测试数据库
//  node app.js 启动服务器  在vue_server_00文件夹打开终端
//  url：http://127.0.0.1:3000/login?uname=tom&upwd=123



// const appData=require('./public/json/detailswipe.json')




























