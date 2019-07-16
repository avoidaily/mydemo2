<template>
    <div class="paypage">
    <button @click="openShow">打开</button>
       
    <van-popup 
    v-model="show"
    position="bottom" 
    :overlay="true">
        <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem illo officia voluptatibus molestiae. Odio facilis dolorem odit explicabo consectetur praesentium vero ullam molestiae, mollitia, temporibus nihil at, deleniti hic unde.</div>
    </van-popup>







    </div>
</template>

<script>
import {  Lazyload,Popup   } from 'vant';

export default {
    components:{
        [Lazyload .name]:Lazyload ,
        [Popup .name]:Popup ,
    },
    data(){
        return{
            show: false
        }
    },
   
    methods:{
       openShow(){
           this.show=true;
       }


    },
}
</script>



<style scoped>










</style>
