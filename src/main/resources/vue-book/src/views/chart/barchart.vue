<script setup>
import { ref, onMounted, watch } from "vue";
import * as echarts from "echarts";
import axios from "axios";

const setdata = ref({
  table: "SaleCount",
});
let showData;
let categoryData = ref([]);
let stockData = ref([]);
let chart;

onMounted(() => {
  chart = echarts.init(document.getElementById("chart-container"));

  // 初始化图表
  fetchDataAndDrawChart();

  // 设置定时器，每3秒更新一次数据和图表
  setInterval(fetchDataAndDrawChart, 3000);
});



import { barChartService } from "@/api/chart.js";
const fetchDataAndDrawChart = async()=> {
  let result=await barChartService(setdata.value);
  showData = result.data;
  categoryData.value = showData[0];
  stockData.value = showData[1];
  drawChart();
/*   axios
    .get("http://localhost:8081/GetData", {
      params: { ...setdata.value },
      headers: { "Authorization": tokenStore.token },
    })
    .then((result) => {
      showData = result.data.data;
      categoryData.value = showData[0];
      stockData.value = showData[1];
      drawChart();
    })
    .catch((err) => {
      console.log(err);
    }); */
}

function drawChart() {
  var option = {
    title: {
      text: "ECharts 入门示例",
      textStyle: {
        color: "#fff",
        fontSize: 20,
      },
    },
    tooltip: {},
    legend: {
      data: ["销量"],
    },
    yAxis: { type: "value" },
    xAxis: {
      type: "category",
      data: categoryData.value,
    },
    series: [
      {
        name: "销量",
        type: "bar",
        data: stockData.value,
        barWidth: 30,
        itemStyle: {
          color: function (params) {
            var colorList = [
              "#ffdb5c",
              "#ff9f7f",
              "#fb7293",
              "#e7bcf3",
              "#96bfff",
              "#37a2da",
            ];
            return colorList[params.dataIndex];
          },
        },
      },
    ],
    toolbox: {
      show: true,
      feature: {
        saveAsImage: {},
        dataView: {},
        restore: {},
        magicType: {
          type: ["line", "bar"],
        },
      },
    },
    grid: {
      left: "10%",
      right: "2%",
      top: "10%",
      bottom: "2%",
      containLabel: true,
    },
  };

  chart.setOption(option);
}
</script>

<template>
  <div id="chart-container" style="width: 100%; height: 100%"></div>
</template>

<style scoped></style>
