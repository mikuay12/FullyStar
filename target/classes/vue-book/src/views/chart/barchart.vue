<script setup>
import { ref, reactive, onMounted } from "vue";
import * as echarts from "echarts";
import axios from "axios";
const setdata = ref({
  table: "test",
});
let showData = reactive([]);
axios
  .get("http://localhost:8081/GetData1",{
      params: { ...setdata.value },
    })
  .then((result) => {
    showData = result.data.data;
    console.log(
      "result.data.data:",
      result.data.data,
      "showData:",
      showData
    );
  })
  .catch((err) => {
    console.log(err);
  });
console.log(123456789)
/* const showData = reactive({
  aaa: "1",
  bbb: "1",
  adsfad: "0.5",
  adsfadsf: "0.5",
  camera: "13",
}); */
const categoryData = reactive([]);
const stockData = reactive([]);
/* for (let key in showData) {
  //for循环let key是对象里面的键，再通过,[]的形式this.objNum[item]去获取对象的value值
  console.log("key", key);
  categoryData.push(key);
  console.log("value", showData[key]);
  stockData.push(showData[key]);
} */
console.log(categoryData, stockData);
/* const categoryData = reactive([
  "衬衫",
  "羊毛衫",
  "雪纺衫",
  "裤子",
  "高跟鞋",
  "袜子",
]);
console.log(categoryData); */
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
        data: stockData,
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
