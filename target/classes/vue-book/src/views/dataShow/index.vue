<script setup>
import TitleVue from "./Title.vue";
import FirstVue from "./First.vue";
import SecondVue from "./Second.vue";
import ThirdVue from "./Third.vue";
</script>

<template>
  <div class="bg">
    <TitleVue />
    <div class="main">
      <FirstVue />
      <SecondVue />
      <ThirdVue />
    </div>
  </div>
</template>

<style scoped>
.bg {
  background-color: black;
  height: 100%;
  width: 100%;
}
.main {
  margin-top: 20px;
  width: 100%;
  height: 100%;
  display: grid;
  grid-template-columns: 3fr 4fr 3fr;
  gap: 10px;
}
</style>
