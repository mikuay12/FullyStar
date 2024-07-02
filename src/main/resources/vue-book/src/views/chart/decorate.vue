<script setup>
import { ref, reactive, onMounted } from "vue";
import * as echarts from "echarts";
import axios from "axios";
const setdata = ref({
  table: "TotalSale",
});
const showData = ref();
/* let categoryData = ref([]);
let stockData = ref([]); */
import { barChartService } from "@/api/chart.js";
const fetchDataAndDrawChart = async()=> {
  let result=await barChartService(setdata.value);
  showData.value = result.data;
 }

onMounted(() => {
  fetchDataAndDrawChart();
  setInterval(fetchDataAndDrawChart, 3000);
  /* axios
    .get("http://localhost:8081/GetData", {
      params: { ...setdata.value },
      headers: { "Authorization": tokenStore.token },
    })
    .then((result) => {
      showData.value = result.data.data;
    })
    .catch((err) => {
      console.log(err);
    }); */
});
</script>

<template>
  <!-- <div class="decorate"> -->
  <div class="text">总销售额为：</div>
  <div
    color-green
    font-600
    class="content"
    bg="~ dark/6"
    style="color: rgb(255, 68, 0); margin-bottom: 30px"
  >
    ￥<span style="font-size: 50px">{{ showData }}</span>
  </div>
  <dv-decoration-9 style="width: 60%; height: 30%; margin-bottom: 20px">
  </dv-decoration-9>
  <!--   </div> -->
</template>
<style scoped>
.content {
  font-size: 28px;
  text-shadow: 0 0 3px #7acaec;
  margin-top: 20px;
}
.text {
  color: white;
  font-size: 25px;
  margin-right: 300px;
}
</style>
