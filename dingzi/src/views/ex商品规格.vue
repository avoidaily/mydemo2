<template>
    <div class="ex">

    <!-- 基础用法 --> 
      <div class="sku-container">
        <van-sku
            v-model="showBase"
            :sku="sku"
            :goods="goods"
            :goods-id="sku.goods_id"
            :hide-stock="sku.hide_stock"
            :quota="sku.quota"
            :quota-used="sku.quota_used"

            
            :custom-stepper-config="customStepperConfig"
            :initial-sku="initialSku"        

            :close-on-click-overlay="closeOnClickOverlay" 
            @buy-clicked="onBuyClicked"
            @add-cart="onAddCartClicked"
        />

        <a 
            href="javascript:;"
            
            type="primary"
            @click="showBase = true">xxxx
        </a>
      </div> 


    </div>
</template>

<script>
import { Sku,Toast,Button   } from 'vant';

export default {
    components:{
        [Sku.name]:Sku,
        [Toast.name]:Toast,
        [Button.name]:Button,


    },
    data(){
        return{
            // sku:sku,
            showBase: false,
            // showCustom: false,
            // showStepper: false,
            // showSoldout: false,
            closeOnClickOverlay: true,
            initialSku: {
                s1: '30349',
                s2: '1193',
                selectedNum: 3
            },
            // customSkuValidator: () => '请选择xxx!', 

            // 1:
           sku: {
    // 所有sku规格类目与其值的从属关系，比如商品有颜色和尺码两大类规格，颜色下面又有红色和蓝色两个规格值。
  // 可以理解为一个商品可以有多个规格类目，一个规格类目下可以有多个规格值。
    tree: [
      {
        k: '颜色分类',
        k_id: '1',
        v: [
          {
            id: '30349',
            name: '天蓝色',
            imgUrl:
              'https://img.yzcdn.cn/upload_files/2017/02/21/FjKTOxjVgnUuPmHJRdunvYky9OHP.jpg!100x100.jpg'
          },
          {
            id: '1215',
            name: '白色'
          }
        ],
        k_s: 's1',
        count: 2
      },
    //   {
    //     k: '尺寸',
    //     k_id: '2',
    //     v: [
    //       {
    //         id: '1193',
    //         name: '1'
    //       },
    //       {
    //         id: '1194',
    //         name: '2'
    //       }
    //     ],
    //     k_s: 's2',
    //     count: 2
    //   }
    ],
    // 所有 sku 的组合列表，如下是：白色1、白色2、天蓝色1、天蓝色2
    list: [
      {
        id: 2259,
        price: 120, //价格
        discount: 122, 
        s1: '1215',
        s2: '1193',
        s3: '0',
        s4: '0',
        s5: '0',  
        stock_num: 20, //库存 
        goods_id: 946755
      },
    //   {
    //     id: 2260,
    //     price: 110,
    //     discount: 112, 
    //     s1: '1215',
    //     s2: '1194',
    //     s3: '0',
    //     s4: '0',
    //     s5: '0',  
    //     stock_num: 2, //库存 
    //     goods_id: 946755
    //   },
      {
        id: 2257,
        price: 2990,
        discount: 132, 
        s1: '30349',
        s2: '1193',
        s3: '0',
        s4: '0',
        s5: '0',  
        stock_num: 40, //库存 
        goods_id: 946755
      },
    //   {
    //     id: 2258,
    //     price: 100,
    //     discount: 100, 
    //     s1: '30349',
    //     s2: '1194',
    //     s3: '0',
    //     s4: '0',
    //     s5: '0',  
    //     stock_num: 50, //库存 
    //     goods_id: 946755
    //   }
    ],
    price: '29.9',
    stock_num: 3324, // 商品总库存
    collection_id: 2261, // 无规格商品 skuId 取 collection_id，否则取所选 sku 组合对应的 id 
    none_sku: false, // 是否无规格商品
    hide_stock: false  // 是否隐藏剩余库存
  },
  goods_id: '946755', 
  quota: 10, //限购数量 
  quota_used: 0,  //已经购买过的数量

  goods: {
    title: '自带充电仓+双耳迷你无线蓝牙耳机手机通用入耳塞',
    picture:
      'https://img.yzcdn.cn/upload_files/2017/03/16/Fs_OMbSFPa183sBwvG_94llUYiLa.jpeg?imageView2/2/w/100/h/100/q/75/format/jpg' 
  },
  initialSku:{
        // 键：skuKeyStr（sku 组合列表中当前类目对应的 key 值）
        // 值：skuValueId（规格值 id）
          s1: "0001",
          s2: "1001",
        // 初始选中数量
          selectedNum: 1
      },

    //   
    customStepperConfig: {
        // 自定义限购文案
        quotaText: '每次限购10件',
        // 自定义步进器超过限制时的回调
        handleOverLimit: (data) => {
            const { action, limitType, quota, quotaUsed } = data;

            if (action === 'minus') {
            Toast('至少选择一件商品');
            } else if (action === 'plus') {
            // const { LIMIT_TYPE } = Sku.skuConstants;
            if (limitType === LIMIT_TYPE.QUOTA_LIMIT) {
                let msg = `单次限购${quota}件`;
                if (quotaUsed > 0) msg += `，你已购买${quotaUsed}`;
                Toast(msg);
            } else {
                Toast('库存不够了');
            }
            }
        },
    },


    }
},
    methods:{
        onBuyClicked(data) {
            // this.$toast('buy:' + JSON.stringify(data));
            this.$toast('请选择商品规格');
            console.log(JSON.stringify(data))
        },

        onAddCartClicked(data) {
            // this.$toast('add cart:' + JSON.stringify(data));
            this.$toast('请选择商品规格');
        }, 


    },
}
</script>


<style scoped>



/* 按钮 */
.sku-container {
padding: 50px 15px;
}

/* .ex>>>.van-sku-body{
    text-align: left;
    
} */
/* 价格 */
.ex>>>.van-sku__goods-price{
    text-align: left;
}
/* 颜色分类 */
.ex>>>.van-sku-group-container{
    text-align: left;
    
}
/* 数量按钮 */
.ex>>>.van-sku__stepper{
    display: flex;

}
.ex>>>.van-stepper__input{
    color: #333;
    background-color: #f2f3f5;
    width: 16px;
    height: 15px;
    padding: 6px 6px;
    margin: 0 5px;
    line-height: 30px;
}

/* 微调 */
.ex>>>.van-sku-stepper-stock{
    padding: 15px 0 50px 0;
}
.ex>>>.van-sku-stepper-container{
    margin:0 225px 10px 0;
}
.ex>>>.van-sku-stepper-stock{
    text-align: left;
}

</style>
