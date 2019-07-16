<template>
    <div class="paypage">

	<div id="app">
		<input type="button" value="动画" @click = 'flag = !flag'>
		<transition v-on:before-enter = 'beforeEnter'
					v-on:enter = 'enter'
					v-on:after-enter = 'afterEnter'>
			<div class="ball" v-show = 'flag'></div>
		</transition>
	</div>








    </div>
</template>

<script>
export default {
    data(){
        return{
            flag:false
        }
    },
  
    methods:{
        beforeEnter(el){
            el.style.transform = 'translate(500px, 0px)'
        },
        enter(el,done){
            el.offsetWidth;
            el.style.transform = 'translate(-700px, 1800px)';
            el.style.transition = 'all 2s linear';
            done()
        },
        afterEnter(el){
            this.flag = !this.flag
        },

    },
}
</script>


<style scoped>

.ball{
    width: 30px;
    height: 30px;
    position: absolute;
    border-radius: 50%;
    background: #ee394b;
}







</style>
