<script setup>
import { ref, reactive, onMounted } from "vue";
import * as echarts from "echarts";

let chart = ref();
onMounted(() => {
  chartInit();
});
function chartInit() {
  // 基于准备好的dom，初始化echarts实例
  var myChart = echarts.init(chart.value);

  // 指定图表的配置项和数据
  var option = {
    tooltip: {},
    toolbox: {},
    series: [
      {
        type: "pie",
        roseType: "area",
        radius: [20, 80],
        data: [
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
        ],
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
  myChart.setOption(option);
}
</script>

<template>
  <!-- 为 ECharts 准备一个定义了宽高的 DOM -->
  <div class="rosechart-title">各资金分布情况</div>
  <div ref="chart" style="width: 100%; height: 300px"></div>
</template>
<style scoped></style>
