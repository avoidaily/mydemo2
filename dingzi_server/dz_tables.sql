#dz.sql 数据库脚本文件


SET NAMES UTF8;
DROP DATABASE IF EXISTS dz;
CREATE DATABASE dz CHARSET=UTF8;
-- USE dz;

--1：注册登录 用户表
-- USE dz;
-- CREATE TABLE dz_user(
--  id INT PRIMARY KEY AUTO_INCREMENT,
--  uname VARCHAR(25),
--  phone CHAR(11),
--  upwd VARCHAR(32)
-- );
-- INSERT INTO dz_user VALUES(null,'tom',15089423771,'123');
-- INSERT INTO dz_user VALUES(null,'lili',110120,"123");

USE dz;
CREATE TABLE dz_user(
 id INT PRIMARY KEY AUTO_INCREMENT,
 pic VARCHAR(255), 
 uname VARCHAR(25),
 phone CHAR(11),
 upwd VARCHAR(32)
);
INSERT INTO dz_user VALUES(null,"user/u01.jpg",'tom',15089423771,'123');
INSERT INTO dz_user VALUES(null,"user/u02.jpg",'lili',110120,"123");



-- 2：导航商品
USE dz;
CREATE TABLE dz_nav_product(
  nid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(255),           #图片  注意各个路径
  price DECIMAL(10,2),        #价格
  subprice DECIMAL(10,2)      #副价格
);
-- 导航商品
INSERT INTO dz_nav_product VALUES
(null,"nav/sp01.jpg","1","99"),
(null,"nav/sp02.jpg","28.9","299"),
(null,"nav/sp03.jpg","29.9","129"),
(null,"nav/sp04.jpg","99","149"),
(null,"nav/sp05.jpg","29.9","299"),
(null,"nav/sp06.jpg","99",'199'),
(null,"nav/sp07.jpg","39","129"),
(null,"nav/sp08.jpg","29.9","249.5");


-- 3：首页商品
-- 标题大图
USE dz;
CREATE TABLE dz_title_bigimg(
  bid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,
  titleImg VARCHAR(255)           
);
INSERT INTO dz_title_bigimg VALUES
(null,1,"index/big01.jpg"),
(null,2,"index/big02.jpg"),
(null,3,"index/big03.jpg"),
(null,4,"index/big04.jpg"),
(null,5,"index/big05.jpg");
  

-- 4：首页商品
USE dz;
CREATE TABLE dz_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  bid INT,                        #所属类型商品编号
  pimg VARCHAR(255),               #商品图片
  title VARCHAR(128),             #标题  
  price DECIMAL(10,2),            #价格
  subprice DECIMAL(10,2)          #副价格
);
INSERT INTO dz_index_product VALUES
-- f1商品：漫威周边
(null,1,"index/f101.jpg","入耳式耳机","59","129"),
(null,1,"index/f102.jpg","便携迷你音响","59","129"),
(null,1,"index/f103.jpg","便携迷你充电宝","89","159"),
(null,1,"index/f104.jpg","惊奇队长钥匙扣","29","59"),
(null,1,"index/f105.jpg","手机气囊支架","22","59"),

-- f2商品：童话故事
(null,2,"index/f201.jpg","双语故事书","72","120"),
(null,2,"index/f202.jpg","人偶单只装","45","89"),
(null,2,"index/f203.jpg","人偶5只装","129","150"),
(null,2,"index/f204.jpg","魔幻小城堡","359","400"),
(null,2,"index/f205.jpg","球道转盘玩具","49","80"),

-- f3商品：潮流精品
(null,3,"index/f301.jpg","卫衣套装","169","249"),
(null,3,"index/f302.jpg","正版潮流卫衣","199","239"),
(null,3,"index/f303.jpg","正版潮流卫裤","129","150"),
(null,3,"index/f304.jpg","黄金瞳帆布袋","29","400"),
(null,3,"index/f305.jpg","黄金瞳手机壳","39","59"),

-- f4商品：流浪地球
(null,4,"index/f401.jpg","流浪地球全铜杯垫","119","150"),
(null,4,"index/f402.jpg","萌版宇航员","369","400"),
(null,4,"index/f403.jpg","限量纪念版运兵车","4999","6000"),
(null,4,"index/f404.jpg","流浪地球英雄徽章","59","100"),
(null,4,"index/f405.jpg","流浪地球识别铭牌","38","60"),

-- f5商品：海王周边
(null,5,"index/f501.jpg","正版海王耳机","40","100"),
(null,5,"index/f502.jpg","海王伸缩数据线","19","40"),
(null,5,"index/f503.jpg","海王多功能笔记本","20","40"),
(null,5,"index/f504.jpg","海王Q萌公仔手办","59","90"),
(null,5,"index/f505.jpg","海王Q版钥匙扣","29","49");




-- 5、秒杀商品列表
USE dz;
CREATE TABLE dz_discount_product(
  did INT PRIMARY KEY AUTO_INCREMENT,
  dis_id INT,
  img VARCHAR(255),             #商品图片
  title VARCHAR(128),             #标题
  subtitle VARCHAR(128),          #副标题
  price DECIMAL(10,2),            #价格
  subprice DECIMAL(10,2),         #副价格
  count INT                       #已售数量
);
INSERT INTO dz_discount_product VALUES
(null,1,"seckill/ms101.jpg","I7S自带充电仓+双耳迷你无线蓝牙耳机手机通用入耳塞","带充电仓 真无线","29.9","299","7522"),
(null,1,"seckill/ms102.jpg","CRDBNSCJ 智能来电微信提醒多功能手环手表","血压心率 智能监测","28.9","100","5425"),
(null,1,"seckill/ms103.jpg","【付邮体验】米力 无线运动蓝牙耳机","金属磁吸 重低音","1","99","189"),
(null,1,"seckill/ms104.jpg","CRDBNSCJ移动电源充电宝手机适用两万毫安快充","超大容量","29.9","249.5","4684"),
(null,1,"seckill/ms105.jpg","Hnew 触屏儿童智能电话手表插卡拍照定位手表带灯","触屏定位电话手表","58","135","19"),

(null,2,"seckill/ms201.jpg","创意萌宠TWS 4.2双耳无线立体声运动蓝牙耳机","萌宠TWS运动耳机","89","238","40"),
(null,2,"seckill/ms202.jpg","李医生女士补水保湿控油淡斑深层清洁泡沫洁面乳","女士保湿洗面奶","32.9","79","647"),
(null,2,"seckill/ms203.jpg","食者聪 铁棍山药脆片105g*6包零食网红小吃","吃货福利 各种口味","27","49","222"),
(null,2,"seckill/ms204.jpg","迷你可爱小巧充电宝手机平板通用便携移动电源","迷你创意充电宝","39.8","98","21"),
(null,2,"seckill/ms205.jpg","古鹿 游戏鼠标","游戏必备 金属发光","35.4","50","382"),

(null,3,"seckill/ms301.jpg","【付邮体验】儿童读物故事书全4册彩图带拼音","小学生经典阅读","1","39.8","5349"),
(null,3,"seckill/ms302.jpg","【付邮体验】萌萌童心简笔画5000例 幼儿画画启蒙书","你想画的这里都有","1","22.8","4919"),
(null,3,"seckill/ms303.jpg","【付邮体验】数据线苹果安卓Type-c充电线三种接口可选","2条特惠装","1","29.8","817"),
(null,3,"seckill/ms304.jpg","【付邮体验】米力 6寸单色带锁液晶手写板","字迹清晰不伤眼","1","99","665"),
(null,3,"seckill/ms305.jpg","【付邮体验】独到入耳式手机线控带麦耳机","hifi体验好音质","1","49.8","684"),

(null,4,"seckill/ms401.jpg","CRDBNSCJ七彩无线蓝牙音箱插卡音响","七彩灯无线蓝牙音箱","12.12","68","16697"),
(null,4,"seckill/ms402.jpg","米力 运动蓝牙耳机跑步无线磁吸双耳入耳塞颈挂脖式","运动蓝牙耳机","25","199","134"),
(null,4,"seckill/ms403.jpg","迷你蓝牙耳机双耳充电仓运动无线耳机","蓝牙耳机双耳充电","69","445","977"),
(null,4,"seckill/ms404.jpg","蓝牙耳机男女无线超小迷你隐形开车头戴入耳运动跑步","迷你隐形蓝牙耳机","49.8","198","24"),
(null,4,"seckill/ms405.jpg","CRDBNSCJ 头戴式重低音耳麦无线蓝牙耳机","头戴式无线蓝牙","29.9","129","6906"),

(null,5,"seckill/ms501.jpg","开心朵朵本色抽纸12包","新品特惠","10.9","99.99","166"),
(null,5,"seckill/ms502.jpg","海尚良选 一壶二杯茶具套装","茶具套装","19.5","30.5","179"),
(null,5,"seckill/ms503.jpg","灭蚊灯家用捕蚊插电式静音驱蚊器防蚊灭蚊神器婴儿卧室","物理灭蚊无毒环保","26.9","89","97"),
(null,5,"seckill/ms504.jpg","乐优家 莫兰迪乳胶枕  全棉天鹅绒","天然回弹","89","199","87"),
(null,5,"seckill/ms505.jpg","时刻美男士电子手表时尚多功能户外运动腕表","大表盘防震防水","59","198","489"),

(null,6,"seckill/ms601.jpg","厨厨喵咪 麻辣小面（重庆） 三袋装 564g/袋","可汤可拌 面条Q弹","19.9","45","148"),
(null,6,"seckill/ms602.jpg","憨豆熊 水果干组合320g 蜜饯果脯芒果香蕉猕猴桃干","香甜可口 回味无穷","16.9","59","178"),
(null,6,"seckill/ms603.jpg","口水娃V字脆12包 独立小包口味随机发送","膨化锅巴零食尖角脆","13.9","42.6","257"),
(null,6,"seckill/ms604.jpg","正文酸辣粉网红速食酸辣粉  132g*6桶装","决战味蕾 火力全开","28.9","69.9","409"),
(null,6,"seckill/ms605.jpg","海洋之心维亚西班牙干红葡萄酒 750ml单支","买就送开瓶器","25","300","1134"),

(null,7,"seckill/ms701.jpg","【京东直供】九阳榨汁机","便携双杯","79","100","191"),
(null,7,"seckill/ms702.jpg","【京东直供】乐事 奇乐无穷礼盒851g","肩扛大零食","65.9","75","163"),
(null,7,"seckill/ms703.jpg","【京东直供】海威特蓝牙耳机运动","金属控体震撼低音","59.9","99","142"),
(null,7,"seckill/ms704.jpg","【京东直供】萨罗娜小麦黑啤酒 500ml*24听","口感清醇","52","149","370"),
(null,7,"seckill/ms705.jpg","【京东直供】海威特（Havit）M3蓝牙音箱","三合一功能","49.9","59.9","84"),

(null,8,"seckill/ms801.jpg","粉嫩闺蜜 祛痘净颜啫喱15g","赠送一件精美礼物","29.9","98","252"),
(null,8,"seckill/ms802.jpg","阿道夫 洗发水 亮泽丝滑520ml*1支","亮泽丝滑 香味弥漫","49","88","124"),
(null,8,"seckill/ms803.jpg","走火短袖T恤男纯棉宽印花TEE","纯棉","49","169","59"),
(null,8,"seckill/ms804.jpg","爱奇艺i71 左边玻尿酸蚕丝面膜10片/盒","保湿蚕丝面膜","39.9","129","128"),
(null,8,"seckill/ms805.jpg","李医生男士控油洗面奶去黑头深层护肤补水保湿洁面乳","男士控油洗面奶","33.9","79","415");



-- 6、购物车商品
USE dz;
CREATE TABLE dz_cart_list(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(255),               #商品图片
  title VARCHAR(128),             #标题
  kind VARCHAR(128),              #分类
  count INT,                      #购买数量
  price DECIMAL(10,2),            #价格
  subprice DECIMAL(10,2)          #副价格
);
INSERT INTO dz_cart_list VALUES
(null,"seckill/ms102.jpg","掌上游戏机400种经典怀旧FC掌上游戏迷你儿童游戏掌机","颜色分类：红色","1","49","198"),
(null,"seckill/ms103.jpg","自带充电仓+双耳迷你无线蓝牙耳机手机通用入耳塞","颜色分类：白色","1","29.9","299"),
(null,"seckill/ms104.jpg","Hnew 触屏儿童智能电话手表插卡可拍照定位男女孩多功能手表带灯","颜色分类：粉色","1","58","136"),
(null,"seckill/ms105.jpg","CRDBNSCJ 大容量移动电源充电宝手机适用20000毫安快充充电宝","颜色分类：白色","1","29.9","249.5"),
(null,"seckill/ms202.jpg","CRDBNSCJ 智能运动手环 来电信息提醒微信 多功能智能手环手表","颜色分类：黑色","1","28.9","299"),
(null,"seckill/ms203.jpg","【付邮即享】米力 无线运动蓝牙耳机 金属磁吸入耳式超重低音耳机","颜色分类：黑色","1","1","99");


-- 7、商品详情页商品 dz_goods_detail
-- 根据 获取商品id 来查询相关数据 返回给页面
USE dz;
CREATE TABLE dz_goods_detail(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img1 VARCHAR(255), 
  img2 VARCHAR(255),
  img3 VARCHAR(255),
  img4 VARCHAR(255),
  img5 VARCHAR(255),               
  title VARCHAR(128),              
  price DECIMAL(10,2),           
  subprice DECIMAL(10,2),                  
  count INT,                           #已售数量
  postage DECIMAL(10,2),               #快递邮费
  addr VARCHAR(255),                   #地址
  introduction VARCHAR(255),           #商品介绍
  commentname VARCHAR(255),            #用户名
  comment VARCHAR(255),                #用户评论
  commentsort VARCHAR(255),            #颜色分类
  commenttime DATE,                    #评论时间
  pic1 VARCHAR(255),                   #图文详情
  pic2 VARCHAR(255),                   #图文详情
  pic3 VARCHAR(255),                   #图文详情
  pic4 VARCHAR(255),                   #图文详情
  pic5 VARCHAR(255),                   #图文详情
  pic6 VARCHAR(255),                   #图文详情
  pic7 VARCHAR(255),                   #图文详情
  pic8 VARCHAR(255),                   #图文详情
  pic9 VARCHAR(255),                   #图文详情
  pic10 VARCHAR(255),                  #图文详情
  pic11 VARCHAR(255),                  #图文详情
  pic12 VARCHAR(255),                  #图文详情
  pic13 VARCHAR(255),                  #图文详情
  pic14 VARCHAR(255),                  #图文详情
  floor1title VARCHAR(255),            #售后服务标题
  floor1content VARCHAR(255),          #售后服务内容
  floor2title VARCHAR(255),            #版本标题
  floor2content VARCHAR(255),          #版本内容
  floor3title VARCHAR(255),            #使用方式标题
  floor3content VARCHAR(255),          #使用方式内容
  floor4title VARCHAR(255),            #四楼标题
  floor4content VARCHAR(255),          #四楼内容
  shopname VARCHAR(255),               #商家名称
  addrs VARCHAR(255),                  #所在地区
  tel VARCHAR(255)                     #联系电话
);
INSERT INTO dz_goods_detail VALUES
(null,"detail/d101.jpg","detail/d102.jpg","detail/d103.jpg","detail/d104.jpg","detail/d105.jpg","自带充电仓+双耳迷你无线蓝牙耳机手机通用入耳塞","29.9","299","9209","0","广东东莞市","自带移动充电仓 随时充电 单双耳佩戴 一分为二 自由选择 高清通话 震撼立体声 自动配对 迷你小巧 贴身便携 释放双手！","零***星","耳机果然没让我失望，这款双耳蓝牙耳机质量还不错，白色简约。这是我买过比较好看的蓝牙耳机。做工感觉挺精致，音质清晰无杂音，外观大气有档次，这蓝牙耳机实在是强大，音质也是杠杠的，质量非常强硬，性价比非常高。","黑色","2019.06.02","detail/detail101.jpg","detail/detail102.jpg","detail/detail103.jpg","detail/detail104.jpg","detail/detail105.jpg","detail/detail106.jpg","detail/detail107.jpg","detail/detail108.jpg","detail/detail109.jpg","detail/detail110.jpg","detail/detail111.jpg","detail/detail112.jpg","detail/detail113.jpg",null,"售后服务","其他","蓝牙版本","4.2","使用方式","挂耳式",null,null,"趣加数码专营店","广东 东莞","13267312348"),
(null,"detail/d201.jpg","detail/d202.jpg","detail/d203.jpg","detail/d204.jpg","detail/d205.jpg","掌上游戏机400种经典怀旧FC掌上游戏迷你儿童游戏掌机","49","198","876","0","广东东莞市","童年的记忆，总是一件小小的玩具或是陪伴的一个小玩偶，没有中间商赚差价，要买要卖赶紧的了，父老乡亲们走过路过不要错过哟，49买的是什么？是快乐！是最朴实是快乐啊，可赶紧的吧！","水***亮","超级好玩呐，童年的感觉，游戏好多呢，质量也有保证，喜欢的宝宝们赶紧下手吧，我是买来给男朋友的，明天是他的生日，相信他会很喜欢的叭，嘻嘻嘻，总之宝贝真是不错呢，喜欢。","红色","2019.06.30","detail/detail201.jpg","detail/detail202.jpg","detail/detail203.jpg","detail/detail204.jpg","detail/detail205.jpg","detail/detail206.jpg","detail/detail207.jpg","detail/detail208.jpg","detail/detail209.jpg","detail/detail210.jpg","detail/detail211.jpg","detail/detail212.jpg","detail/detail213.jpg","detail/detail113.jpg","售后服务","只换不修","商品版本","其他","使用方式","详见说明文档",null,null,"趣加数码专营店","广东 东莞","13267312348")




-- 8、评论
USE dz;
CREATE TABLE dz_morecomment(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(255),                #用户头像
  cname VARCHAR(128),              #用户名
  content VARCHAR(128),            #评论内容
  colorsort VARCHAR(255),                   #颜色分类
  ctime DATE                       #时间
);
INSERT INTO dz_morecomment VALUES
(null,"detail/female-130.png","水***亮","耳机果然没让我失望，这款双耳蓝牙耳机质量还不错，白色简约。这是我买过比较好看的蓝牙耳机。做工感觉挺精致，音质清晰无杂音，外观大气有档次，这蓝牙耳机实在是强大，音质也是杠杠的，质量非常强硬，性价比非常高。","颜色分类：黑色","2019.06.02"),
(null,"detail/male-130.png","星***览","蓝牙耳机用起来确实比有线耳机方便多了，不会缠绕，一些功能只需要点一下耳机就可以了，不用找手机，戴的时间长也没有觉得耳朵疼，满意的一次购物，休息的时候耳机听听歌还是非常好的，目前体验比较满意，总的来说性价比非常高了，没有杂音，听歌效果很不错。质量强硬，而且大小刚好佩戴合适。性价比很高。","颜色分类：黑色","2019.06.02"),
(null,"detail/female-130.png","本***萼","耳机小巧可爱，放在耳朵里很舒适，也很贴合，跑步时候也不容易掉下来，耳机很容易就可以连接手机，左右耳可单独连接，耳机音质也很满意，耳机与电池仓磁力吸合很好，放上就开始给耳机充电，取放很方便。质感舒适，操作简单","颜色分类：黑色","2019.05.31"),
(null,"detail/male-130.png","可***啥","耳机戴上以后特别舒服，携带也很方便，送给老公的，他很喜欢，开车接听电话方便！","颜色分类：黑色","2019.06.02"),
(null,"detail/female-130.png","沙***i","音质不错，挺好的","颜色分类：黑色","2019.06.21"),
(null,"detail/female-130.png","小***茗","还可以，就是音质不太好","颜色分类：白色","2019.06.21"),
(null,"detail/female-130.png","用***b","耳机自身声音有点大，感觉有点受不了","颜色分类：白色","2019.06.20"),
(null,"detail/female-130.png","世***论","音色很好，值","颜色分类：白色","2019.06.20"),
(null,"detail/male-130.png","九***c","做工很漂亮，连接手机很快，操作简单，戴在耳朵上很稳，不疼也不怕会掉下来，电量耐用还有就是音质特别好打电话声音很清晰，对方也听的很清楚，挺喜欢这款耳机，这个价格买到这样的耳机真是超值。 声音效果：超级棒 外观材质：白色好看带上去不容易看出来，很好 佩戴感受：很好了 续航能力：挺久。非常棒。质量很强硬","颜色分类：黑色","2019.06.19"),
(null,"detail/male-130.png","你***婚","声音效果：挺满意的，音质很好，没有杂音， 外观材质：外观很漂亮！质量非常好颜色的又百搭,隔音效果也很好,总体拿起来手感很好，做工精细，东西小巧，携带方便，挺好的！很小巧，在开会时候偷偷听歌呢很不错，续航能力还在测试中目前看还可以。耳机很不错 充电一次至少能用五个小时 充电仓很方便，放进去收这就是充电","颜色分类：黑色","2019.06.19"),
(null,"detail/male-130.png","杰***3","蓝牙耳机收到试用了几天，东西很给力，支持左右耳机单独使用，性价比表现很给力了，和手机蓝牙链接上之后，一直都很稳定的。放歌音质清晰，低音浑厚，东西的外观很好看，百搭，耳机电量也特别给力，放充电仓里面磁吸充电，一个小时左右就可以充满了，还比较快。质量很强硬了，总体体验很满意，对得起这个价位。","颜色分类：黑色","2019.06.19")


-- 9：分类

-- 9.1:标题大图
-- USE dz;
-- CREATE TABLE dz_sort_titleimg(
--   id INT PRIMARY KEY AUTO_INCREMENT,   
--   family_id INT,
--   titleImg VARCHAR(255)               #标题大图
-- );
-- INSERT INTO dz_sort_titleimg VALUES
-- (null,1,"sort/sort-01.jpg"),
-- (null,2,"sort/sort-02.jpg"),
-- (null,3,"sort/sort-03.jpg"),
-- (null,4,"sort/sort-04.jpg"),
-- (null,5,"sort/sort-05.jpg"),
-- (null,6,null),
-- (null,7,"sort/sort-07.jpg"),
-- (null,8,null),
-- (null,9,null),
-- (null,10,null)


-- 9.2：分类商品的子类
-- USE dz;
-- CREATE TABLE dz_sort_sontitle(
--   id INT PRIMARY KEY AUTO_INCREMENT,   
--   nav_id INT,                         #对应导航栏的父标题
--   title VARCHAR(255)               #商品的子标题（二级嵌套）
-- );
-- INSERT INTO dz_sort_sontitle VALUES
-- (null,1,"精选分类"),
-- (null,1,"影视周边"),
-- (null,2,"精选推荐"),
-- (null,2,"数码3C"),
-- (null,2,"手机"),
-- (null,2,"智能设备"),
-- (null,2,"美妆个护"),
-- (null,2,"食品饮料"),
-- (null,2,"家居生活"),
-- (null,3,"时尚潮品"),
-- (null,3,"3C数码"),
-- (null,4,"热播IP"),
-- (null,4,"电影"),
-- (null,4,"电视剧"),
-- (null,4,"综艺"),
-- (null,5,"人气动画"),
-- (null,5,"动漫分类"),
-- (null,6,"卡通动画"),
-- (null,6,"卡通形象"),
-- (null,6,"萌娃最爱"),
-- (null,7,"热卖榜单"),
-- (null,7,"文学艺术"),
-- (null,7,"童话绘本"),
-- (null,7,"经营"),
-- (null,8,"智能夯货"),
-- (null,8,"影音潮品"),
-- (null,8,"电脑周边"),
-- (null,8,"其他配件"),
-- (null,9,"小家电"),
-- (null,9,"家居家纺"),
-- (null,9,"日常百货"),
-- (null,9,"户外运动"),
-- (null,10,"水果生鲜"),
-- (null,10,"休闲食品"),
-- (null,10,"就睡饮料"),
-- (null,10,"进口食品")


-- 9.3：分类商品的子类所对应的商品图片+name
USE dz;
CREATE TABLE dz_sort_product(
  id INT PRIMARY KEY AUTO_INCREMENT,   
  SnFn_id INT,                         #对应商品列表的标题
  img VARCHAR(255),                    #商品图片
  title VARCHAR(255)                   #商品的子标题（二级嵌套）
);
INSERT INTO dz_sort_product VALUES
-- s1 f1-2
(null,"1-1","sort/sort01-F101.jpg","华为专区"),
(null,"1-1","sort/sort01-F102.jpg","i定制"),
(null,"1-1","sort/sort01-F103.jpg","VR魔镜"),
(null,"1-1","sort/sort01-F104.jpg","养生"),
(null,"1-1","sort/sort01-F105.jpg","精品红酒"),
(null,"1-1","sort/sort01-F106.jpg","时尚耳机"),
(null,"1-1","sort/sort01-F107.jpg","智能音箱"),
(null,"1-1","sort/sort01-F108.jpg","智酷手环"),
(null,"1-1","sort/sort01-F109.jpg","潮流卫衣"),
(null,"1-1","sort/sort01-F110.jpg","动漫玩具"),
(null,"1-1","sort/sort01-F111.jpg","IP原著"),
(null,"1-1","sort/sort01-F112.jpg","热剧同款"),
(null,"1-2","sort/sort01-F201.jpg","咕噔咕噔"),
(null,"1-2","sort/sort01-F202.jpg","hi室友"),
(null,"1-2","sort/sort01-F203.jpg","倾城时光"),
-- s2 f1-7
(null,"2-1","sort/sort02-F101.jpg","数码"),
(null,"2-1","sort/sort02-F102.jpg","玩具"),
(null,"2-1","sort/sort02-F103.jpg","图书"),
-- f2
(null,"2-2","sort/sort02-F201.jpg","耳机耳麦"),
(null,"2-2","sort/sort02-F202.jpg","无线音响"),
(null,"2-2","sort/sort02-F203.jpg","游戏手柄"),
(null,"2-2","sort/sort02-F204.jpg","键盘"),
(null,"2-2","sort/sort02-F205.jpg","鼠标"),
(null,"2-2","sort/sort02-F206.jpg","移动硬盘"),
(null,"2-2","sort/sort02-F207.jpg","拍照配件"),
(null,"2-2","sort/sort02-F208.jpg","数码相机"),
(null,"2-2","sort/sort02-F209.jpg","拍立得"),
-- f3
(null,"2-3","sort/sort02-F301.jpg","蓝牙耳机"),
(null,"2-3","sort/sort02-F302.jpg","移动电源"),
(null,"2-3","sort/sort02-F303.jpg","充电器"),
(null,"2-3","sort/sort02-F304.jpg","数据线"),
(null,"2-3","sort/sort02-F305.jpg","手机壳"),
(null,"2-3","sort/sort02-F306.jpg","苹果周边"),
-- f4
(null,"2-4","sort/sort02-F401.jpg","智能手环"),
(null,"2-4","sort/sort02-F402.jpg","智能手表"),
(null,"2-4","sort/sort02-F403.jpg","智能家居"),
(null,"2-4","sort/sort02-F404.jpg","智能眼镜"),
(null,"2-4","sort/sort02-F405.jpg","委无人机"),
-- f5
(null,"2-5","sort/sort02-F501.jpg","洁面"),
(null,"2-5","sort/sort02-F502.jpg","乳液面霜"),
(null,"2-5","sort/sort02-F503.jpg","爽肤水"),
(null,"2-5","sort/sort02-F504.jpg","面膜"),
(null,"2-5","sort/sort02-F505.jpg","护肤套装"),
(null,"2-5","sort/sort02-F506.jpg","剃须"),
(null,"2-5","sort/sort02-F507.jpg","洗发"),
(null,"2-5","sort/sort02-F508.jpg","牙膏"),
(null,"2-5","sort/sort02-F509.jpg","沐浴"),
(null,"2-5","sort/sort02-F510.jpg","唇部"),
(null,"2-5","sort/sort02-F511.jpg","香水"),
-- f6
(null,"2-6","sort/sort02-F601.jpg","牛奶乳品"),
(null,"2-6","sort/sort02-F602.jpg","糖果巧克力"),
(null,"2-6","sort/sort02-F603.jpg","休闲食品"),
(null,"2-6","sort/sort02-F604.jpg","饮料"),
(null,"2-6","sort/sort02-F605.jpg","方便食品"),
(null,"2-6","sort/sort02-F606.jpg","肉干肉脯"),
(null,"2-6","sort/sort02-F607.jpg","坚果炒货"),
-- f7
(null,"2-7","sort/sort02-F701.jpg","吹风机"),
(null,"2-7","sort/sort02-F702.jpg","电动牙刷"),
(null,"2-7","sort/sort02-F703.jpg","剃须刀"),
(null,"2-7","sort/sort02-F704.jpg","吸尘器"),
(null,"2-7","sort/sort02-F705.jpg","净化器"),
(null,"2-7","sort/sort02-F706.jpg","热水壶"),
(null,"2-7","sort/sort02-F707.jpg","锅具"),

-- s3 f1-2
(null,"3-1","sort/sort03-F101.jpg","服装鞋帽"),
(null,"3-1","sort/sort03-F102.jpg","皮具配件"),
(null,"3-2","sort/sort03-F103.jpg","居家日用"),
(null,"3-2","sort/sort03-F201.jpg","智能设备"),
(null,"3-2","sort/sort03-F202.jpg","影音视听"),

-- s4 f1-4
(null,"4-1","sort/sort04-F101.jpg","青春有你"),
(null,"4-1","sort/sort04-F102.jpg","皓镧传"),
(null,"4-1","sort/sort04-F103.jpg","原生之罪"),
(null,"4-1","sort/sort04-F104.jpg","大江大河"),
(null,"4-1","sort/sort04-F105.jpg","演员的品格"),
(null,"4-1","sort/sort04-F106.jpg","香蜜沉沉"),
(null,"4-1","sort/sort04-F107.jpg","偶像练习生"),
(null,"4-1","sort/sort04-F108.jpg","正在热映"),
(null,"4-1","sort/sort04-F109.jpg","芸汐传"),
(null,"4-1","sort/sort04-F110.jpg","扶摇"),
(null,"4-1","sort/sort04-F111.jpg","后来的我们"),
(null,"4-1","sort/sort04-F112.jpg","捉妖记2"),
(null,"4-1","sort/sort04-F113.jpg","妖猫传"),
(null,"4-1","sort/sort04-F114.jpg","白蛇传说"),

(null,"4-2","sort/sort04-F201.jpg","狄仁杰"),
(null,"4-2","sort/sort04-F202.jpg","前任3"),
(null,"4-2","sort/sort04-F203.jpg","解忧杂货铺"),
(null,"4-2","sort/sort04-F204.jpg","芳华"),
(null,"4-2","sort/sort04-F205.jpg","英伦对决"),
(null,"4-2","sort/sort04-F206.jpg","战狼2"),
(null,"4-2","sort/sort04-F207.jpg","羞羞的铁拳"),
(null,"4-2","sort/sort04-F208.jpg","春娇救志明"),
(null,"4-2","sort/sort04-F209.jpg","缝纫机乐队"),
(null,"4-2","sort/sort04-F210.jpg","追龙"),
(null,"4-2","sort/sort04-F211.jpg","心理罪"),
(null,"4-2","sort/sort04-F212.jpg","二代妖精"),
(null,"4-2","sort/sort04-F213.jpg","三生三世"),
(null,"4-2","sort/sort04-F214.jpg","大话西游"),
(null,"4-2","sort/sort04-F215.jpg","盗墓笔记"),
(null,"4-2","sort/sort04-F216.jpg","生化危机"),
(null,"4-2","sort/sort04-F217.jpg","悟空传"),
(null,"4-2","sort/sort04-F218.jpg","南极之恋"),
(null,"4-2","sort/sort04-F219.jpg","美人鱼"),
(null,"4-2","sort/sort04-F220.jpg","王牌特工"),
(null,"4-2","sort/sort04-F221.jpg","西游2"),
(null,"4-2","sort/sort04-F222.jpg","天才枪手"),
(null,"4-2","sort/sort04-F223.jpg","动物世界"),
(null,"4-2","sort/sort04-F224.jpg","加勒比海盗"),
(null,"4-2","sort/sort04-F225.jpg","绝世高手"),

(null,"4-3","sort/sort04-F301.jpg","香蜜沉沉"),
(null,"4-3","sort/sort04-F302.jpg","扶摇"),
(null,"4-3","sort/sort04-F303.jpg","白蛇传说"),
(null,"4-3","sort/sort04-F304.jpg","海上牧云记"),
(null,"4-3","sort/sort04-F305.jpg","有猫在"),
(null,"4-3","sort/sort04-F306.jpg","蜀山战纪2"),
(null,"4-3","sort/sort04-F307.jpg","三生三世"),
(null,"4-3","sort/sort04-F308.jpg","和平饭店"),
(null,"4-3","sort/sort04-F309.jpg","少年时代"),
(null,"4-3","sort/sort04-F310.jpg","择天记"),
(null,"4-3","sort/sort04-F311.jpg","楚乔传"),
(null,"4-3","sort/sort04-F312.jpg","醉玲珑"),
(null,"4-3","sort/sort04-F313.jpg","河神"),
(null,"4-3","sort/sort04-F314.jpg","绝命毒师"),
(null,"4-3","sort/sort04-F315.jpg","猎场"),
(null,"4-3","sort/sort04-F316.jpg","花千骨"),
(null,"4-3","sort/sort04-F317.jpg","欢乐颂2"),
(null,"4-3","sort/sort04-F318.jpg","废柴兄弟"),
(null,"4-3","sort/sort04-F319.jpg","神犬小七"),
(null,"4-3","sort/sort04-F320.jpg","星球大战"),

(null,"4-4","sort/sort04-F401.jpg","国家宝藏"),
(null,"4-4","sort/sort04-F402.jpg","萌宠"),
(null,"4-4","sort/sort04-F403.jpg","中国新歌声"),
(null,"4-4","sort/sort04-F404.jpg","讲究"),
(null,"4-4","sort/sort04-F405.jpg","天籁之战"),
(null,"4-4","sort/sort04-F406.jpg","奔跑吧"),
(null,"4-4","sort/sort04-F407.jpg","我为喜剧狂"),
(null,"4-4","sort/sort04-F408.jpg","姐姐好饿"),
(null,"4-4","sort/sort04-F409.jpg","极限挑战"),
-- s5 f1-2
(null,"5-1","sort/sort05-F101.jpg","名侦探柯南"),
(null,"5-1","sort/sort05-F102.jpg","航海王"),
(null,"5-1","sort/sort05-F103.jpg","火影忍者"),
(null,"5-1","sort/sort05-F104.jpg","环太平洋2"),
(null,"5-1","sort/sort05-F105.jpg","复仇者联盟"),
(null,"5-1","sort/sort05-F106.jpg","进击的巨人"),
(null,"5-1","sort/sort05-F107.jpg","龙珠"),
(null,"5-1","sort/sort05-F108.jpg","全职高手"),
(null,"5-1","sort/sort05-F109.jpg","fate"),
(null,"5-1","sort/sort05-F110.jpg","秦时明月"),
(null,"5-1","sort/sort05-F111.jpg","天行九歌"),
(null,"5-1","sort/sort05-F112.jpg","伊藤润二"),
(null,"5-1","sort/sort05-F113.jpg","银魂"),
(null,"5-1","sort/sort05-F114.jpg","黑子的篮球"),
(null,"5-1","sort/sort05-F115.jpg","妖狐小红娘"),
(null,"5-1","sort/sort05-F116.jpg","初音未来"),
(null,"5-1","sort/sort05-F117.jpg","英雄学院"),
(null,"5-1","sort/sort05-F118.jpg","电竞服装"),

(null,"5-2","sort/sort05-F201.jpg","周边服饰"),
(null,"5-2","sort/sort05-F202.jpg","手办模型"),
(null,"5-2","sort/sort05-F203.jpg","饰品配件"),
(null,"5-2","sort/sort05-F204.jpg","家居宅品"),
(null,"5-2","sort/sort05-F205.jpg","文化用品"),
(null,"5-2","sort/sort05-F206.jpg","遥控玩具"),
-- s6 f1-3
(null,"6-1","sort/sort06-F101.jpg","熊出没"),
(null,"6-1","sort/sort06-F102.jpg","旺旺立大功"),
(null,"6-1","sort/sort06-F103.jpg","小猪佩奇"),
(null,"6-1","sort/sort06-F104.jpg","叶罗丽"),
(null,"6-1","sort/sort06-F105.jpg","海绵宝宝"),
(null,"6-1","sort/sort06-F106.jpg","汤姆猫"),
(null,"6-1","sort/sort06-F107.jpg","猪猪侠"),
(null,"6-1","sort/sort06-F108.jpg","巴啦啦魔仙"),
(null,"6-1","sort/sort06-F109.jpg","小马宝莉"),

(null,"6-2","sort/sort06-F201.jpg","熊本熊"),
(null,"6-2","sort/sort06-F202.jpg","乖乖蛇"),
(null,"6-2","sort/sort06-F203.jpg","Kitty"),

(null,"6-3","sort/sort06-F301.jpg","毛绒玩具"),
(null,"6-3","sort/sort06-F302.jpg","益智玩具"),
(null,"6-3","sort/sort06-F303.jpg","积木拼插"),
(null,"6-3","sort/sort06-F304.jpg","DIV创意"),
(null,"6-3","sort/sort06-F305.jpg","文具用品"),
(null,"6-3","sort/sort06-F306.jpg","童装"),
-- s7 f1-4
(null,"7-1","sort/sort07-F101.jpg","黄金瞳"),
(null,"7-1","sort/sort07-F102.jpg","电影原著"),
(null,"7-1","sort/sort07-F103.jpg","奇葩大会"),
(null,"7-1","sort/sort07-F104.jpg","最强大脑"),
(null,"7-1","sort/sort07-F105.jpg","琅琊榜"),
(null,"7-1","sort/sort07-F106.jpg","谈判官"),
(null,"7-1","sort/sort07-F107.jpg","一路繁花"),
(null,"7-1","sort/sort07-F108.jpg","凤囚凰"),

(null,"7-2","sort/sort07-F201.jpg","畅销书"),
(null,"7-2","sort/sort07-F202.jpg","文学"),
(null,"7-2","sort/sort07-F203.jpg","小说"),
(null,"7-2","sort/sort07-F204.jpg","影视改编"),
(null,"7-2","sort/sort07-F205.jpg","传记"),
(null,"7-2","sort/sort07-F206.jpg","摄影"),
(null,"7-2","sort/sort07-F207.jpg","书法"),
(null,"7-2","sort/sort07-F208.jpg","绘画"),
(null,"7-2","sort/sort07-F209.jpg","历史"),

(null,"7-3","sort/sort07-F301.jpg","1元购"),
(null,"7-3","sort/sort07-F302.jpg","儿童文学"),
(null,"7-3","sort/sort07-F303.jpg","趣味绘本"),
(null,"7-3","sort/sort07-F304.jpg","科普"),
(null,"7-3","sort/sort07-F305.jpg","幼儿启蒙"),
(null,"7-3","sort/sort07-F306.jpg","动漫卡通"),
(null,"7-3","sort/sort07-F307.jpg","益智游戏"),
(null,"7-3","sort/sort07-F308.jpg","育儿百科"),
(null,"7-3","sort/sort07-F309.jpg","亲子读物"),

(null,"7-4","sort/sort07-F401.jpg","心理学"),
(null,"7-4","sort/sort07-F402.jpg","国学"),
(null,"7-4","sort/sort07-F403.jpg","哲学"),
(null,"7-4","sort/sort07-F404.jpg","经济"),
(null,"7-4","sort/sort07-F405.jpg","管理"),
(null,"7-4","sort/sort07-F406.jpg","股票"),
(null,"7-4","sort/sort07-F407.jpg","投资理财"),
(null,"7-4","sort/sort07-F408.jpg","励志情感"),
(null,"7-4","sort/sort07-F409.jpg","情商口才"),
-- s8 f1-4
(null,"8-1","sort/sort08-F101.jpg","果粉专区"),
(null,"8-1","sort/sort08-F102.jpg","VR眼镜"),
(null,"8-1","sort/sort08-F103.jpg","穿戴设备"),

(null,"8-2","sort/sort08-F201.jpg","线控耳机"),
(null,"8-2","sort/sort08-F202.jpg","无线耳机"),
(null,"8-2","sort/sort08-F203.jpg","音箱"),

(null,"8-3","sort/sort08-F301.jpg","键鼠套装"),
(null,"8-3","sort/sort08-F302.jpg","耳麦声麦"),
(null,"8-3","sort/sort08-F303.jpg","网络设备"),

(null,"8-4","sort/sort08-F401.jpg","保护类"),
(null,"8-4","sort/sort08-F402.jpg","移动电源"),
(null,"8-4","sort/sort08-F403.jpg","电视果"),
-- s9 f1-4
(null,"9-1","sort/sort09-F101.jpg","生活电器"),
(null,"9-1","sort/sort09-F102.jpg","厨房电器"),
(null,"9-1","sort/sort09-F103.jpg","个护电器"),

(null,"9-2","sort/sort09-F201.jpg","夏季凉席"),
(null,"9-2","sort/sort09-F202.jpg","床品套件"),
(null,"9-2","sort/sort09-F203.jpg","枕头枕芯"),
(null,"9-2","sort/sort09-F204.jpg","被子"),
(null,"9-2","sort/sort09-F205.jpg","毛巾浴巾"),

(null,"9-3","sort/sort09-F301.jpg","水杯"),
(null,"9-3","sort/sort09-F302.jpg","收纳"),
(null,"9-3","sort/sort09-F303.jpg","纸巾"),

(null,"9-4","sort/sort09-F401.jpg","帐篷"),
(null,"9-4","sort/sort09-F402.jpg","健身"),
-- s10 f1-4
(null,"10-1","sort/sort10-F101.jpg","水果"),
(null,"10-1","sort/sort10-F102.jpg","大闸蟹"),
(null,"10-1","sort/sort10-F103.jpg","中秋月饼"),

(null,"10-2","sort/sort10-F201.jpg","坚果"),
(null,"10-2","sort/sort10-F202.jpg","膨化"),
(null,"10-2","sort/sort10-F203.jpg","巧克力"),
(null,"10-2","sort/sort10-F204.jpg","糕点"),
(null,"10-2","sort/sort10-F205.jpg","肉铺"),
(null,"10-2","sort/sort10-F206.jpg","饼干"),

(null,"10-3","sort/sort10-F301.jpg","红酒"),
(null,"10-3","sort/sort10-F302.jpg","白酒"),
(null,"10-3","sort/sort10-F303.jpg","饮料"),
(null,"10-3","sort/sort10-F304.jpg","果汁"),
(null,"10-3","sort/sort10-F305.jpg","咖啡"),
(null,"10-3","sort/sort10-F306.jpg","茶叶"),

(null,"10-4","sort/sort10-F401.jpg","韩国"),
(null,"10-4","sort/sort10-F402.jpg","东南亚"),
(null,"10-4","sort/sort10-F403.jpg","欧洲")















