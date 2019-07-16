<template>
    <div>
        <img class="imgStyle" :src="focused?selectedImage:normalImage" alt="">
    </div>
</template>


<script>
export default {
    // 接收父组件传过来的图片
    props:{
        focused:false,
        selectedImage:{default:""},
        normalImage:{default:""}
    },
    data(){
        return{

        }
    },
}
</script>


<style scoped>
.imgStyle{
    width: 25px;height: 25px;
    margin-bottom:3px;
}
</style>