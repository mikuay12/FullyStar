<script setup>
import { ref, reactive } from "vue";
import rosechartVue from "@/views/chart/rosechart.vue";
import decorateVue from "@/views/chart/decorate.vue";
</script>

<template>
  <div class="second">
    <div class="second-top"><decorateVue /></div>
    <div class="second-bottom"><rosechartVue /></div>
  </div>
</template>

<style scoped>
.second {
  display: grid;
  grid-template-rows: 6fr 4fr;
  gap: 10px;
  width: 100%;
  height: 75%;
}
.second-top {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-color: #0d2049;
  border-top: 2px solid #0b3e68;
}
.second-bottom {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-color: #0d2049;
  border-top: 2px solid #0b3e68;
}
</style>
