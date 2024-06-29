<script setup>
import { ref, reactive, onMounted } from "vue";
import * as echarts from "echarts";
const categoryData = reactive([
  "衬衫",
  "羊毛衫",
  "雪纺衫",
  "裤子",
  "高跟鞋",
  "袜子",
]);
console.log(categoryData);
let chart = ref();
onMounted(() => {
  chartInit();
});
function chartInit() {
  // 基于准备好的dom，初始化echarts实例
  var myChart = echarts.init(chart.value);

  // 指定图表的配置项和数据
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
    xAxis: { type: "value" },
    yAxis: {
      type: "category",
      data: categoryData,
    },
    series: [
      {
        name: "销量",
        type: "bar",
        data: [5, 20, 36, 10, 10, 20],
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

  // 使用刚指定的配置项和数据显示图表。
  myChart.setOption(option);
}
</script>

<template>
  <!-- 为 ECharts 准备一个定义了宽高的 DOM -->
  <div
    ref="chart"
    style="width: 100%; height: 100%; background-color: black"
  ></div>
</template>

<style scoped></style>
