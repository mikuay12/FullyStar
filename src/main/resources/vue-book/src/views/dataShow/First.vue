<script setup>
import { number } from "echarts";
import { ref, reactive } from "vue";
const modulefirstList = ref([
  { title: "桥梁", number: 108, unit: "个" },
  { title: "桥梁", number: 108, unit: "个" },
  { title: "桥梁", number: 108, unit: "个" },
  { title: "桥梁", number: 108, unit: "个" },
  { title: "桥梁", number: 108, unit: "个" },
  { title: "桥梁", number: 108, unit: "个" },
  { title: "桥梁", number: 108, unit: "个" },
  { title: "桥梁", number: 108, unit: "个" },
  { title: "桥梁", number: 108, unit: "个" },
]);
</script>

<template>
  <div class="modulefirst">
    <ul>
      <li v-for="list in modulefirstList">
        <div class="modulefirst-title">{{ list.title }}</div>
        <div class="modulefirst-item">
          <span class="modulefirst-num">{{ list.number }}</span>
          <span class="modulefirst-unit">{{ list.unit }}</span>
        </div>
      </li>
    </ul>
  </div>
</template>

<style scoped></style>
