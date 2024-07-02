<script setup>
import { ref, reactive, onMounted } from "vue";
import axios from "axios";
import * as echarts from "echarts";

const setdata = ref({
  table: "PaymentMethod",
});
const showData = ref([]);
/* let categoryData = ref([]);
let stockData = ref([]); */
let chart1;

onMounted(() => {
  chart1 = echarts.init(document.getElementById("chart-container1"));

  // 初始化图表
  fetchDataAndDrawChart();

  // 设置定时器，每3秒更新一次数据和图表
  setInterval(fetchDataAndDrawChart, 3000);
});

/* import { barChartService } from "@/api/chart.js";
const fetchDataAndDrawChart = async()=> {
  let result=await barChartService(setdata.value);
  showData = result.data;
  categoryData.value = showData[0];
  stockData.value = showData[1];
  drawChart();} */

import { barChartService } from "@/api/chart.js";
const fetchDataAndDrawChart=async()=>{
  let result=await barChartService(setdata.value);
  showData.value = result.data;

  drawChart();
}

/* function fetchDataAndDrawChart() {
  axios
    .get("http://localhost:8081/GetData", {
      params: { ...setdata.value },
      headers: { "Authorization": tokenStore.token },
    })
    .then((result) => {
      showData.value = result.data.data;

      drawChart();
    })
    .catch((err) => {
      console.log(err);
    });
} */

function drawChart() {
  // 基于准备好的dom，初始化echarts实例

  // 指定图表的配置项和数据
  var option = {
    tooltip: {},
    toolbox: {},
    series: [
      {
        type: "pie",
        roseType: "area",
        radius: [20, 80],
        data: showData.value/* [
          {
            value: 100,
            name: "A",
          },
          {
            value: 200,
            name: "B",
          },
          {
            value: 300,
            name: "C",
          },
          {
            value: 400,
            name: "D",
          },
          {
            value: 500,
            name: "E",
          },
        ], */,
        label: {
          formatter: "{b} {c}%",
          textStyle: {
            color: "#fff",
          },
        },
      },
    ],
  };
  // 使用刚指定的配置项和数据显示图表。
  chart1.setOption(option);
}
</script>

<template>
  <!-- 为 ECharts 准备一个定义了宽高的 DOM -->
  <div class="rosechart-title">支付方式比例</div>
  <div id="chart-container1" style="width: 100%; height:100%"></div>
</template>
<style scoped>
.rosechart-title {
  color: rgb(232, 140, 20);
}
</style>
