<script setup>
import { ref, reactive } from "vue";
const config = reactive({
  data: [55],
  shape: "round",
});
const conf = reactive({
  lineWidth: 24,
  digitalFlopStyle: {
    fill: "pink",
  },
  data: [
    {
      name: "杭州",
      value: 98,
    },
    {
      name: "金华",
      value: 150,
    },
    {
      name: "宁波",
      value: 62,
    },
    {
      name: "太原",
      value: 54,
    },
  ],
});
</script>

<template>
  <div class="waterpond-title">计划资金累计完成情况</div>
  <div class="waterpond-detail">累计完成<span>690431</span>元</div>
  <div class="waterpond">
    <dv-water-level-pond :config="config" style="width: 200px; height: 100px" />
  </div>
</template>

<style scoped></style>
