<script setup>
import { ref, reactive, onMounted } from "vue";
import * as echarts from "echarts";
import axios from "axios";


const setdata = ref({
  table: "test",
});
// const showData = ref();
// const categoryData = ref();
// const stockData = ref();

// const showData =ref([]);

axios
  .get("http://localhost:8081/GetData1",{
      params: { ...setdata.value },
    })
  .then((result) => {
    showData = result.data.data;
    console.log(
      "test",showData[0],showData[1]
    );

  })
  .catch((err) => {
    console.log(err);
  });

  



/* const showData = reactive({
  aaa: "1",
  bbb: "1",
  adsfad: "0.5",
  adsfadsf: "0.5",
  camera: "13",
}); */
/* const categoryData = reactive(showData[0]);
const stockData = reactive(showData[1]); */
/* for (let key in showData) {
  //for循环let key是对象里面的键，再通过,[]的形式this.objNum[item]去获取对象的value值
  console.log("key", key);
  categoryData.push(key);
  console.log("value", showData[key]);
  stockData.push(showData[key]);
} */
/* console.log(categoryData, stockData); */
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

  // 使用刚指定的配置项和数据显示图表。
  myChart.setOption(option);
</script>

<template>
  <!-- 为 ECharts 准备一个定义了宽高的 DOM -->
  <div
    ref="chart"
    style="width: 100%; height: 100%; background-color: black"
  ></div>
</template>

<style scoped></style>
