<script setup>
import { ref, reactive } from "vue";
const config = reactive({
  header: ["用户", "购买商品种类", "商品金额"],
  data: [
    ["id150*****0", "Books", "84.00"],
    ["id111*****1", "Books", "34.50"],
    ["id542*****0", "Clothes", "172.50"],
    ["id120*****8", "Books", "24.00"],
    ["id410*****0", "Home", "51.50"],
    ["id210*****8", "Books", "34.50"],
    ["id150*****0", "Electronics", "34.50"],
    ["id120*****6", "Electronics", "34.00"],
    ["id140*****0", "Books", "57.50"],
    ["id190*****7", "Electronics", "34.00"],
    ["id210*****0", "Books", "34.50"],
    ["id130*****5", "Home", "34.50"],
    ["id140*****0", "Books", "41.00"],
    ["id177*****6", "Home", "188.00"],
    ["id187*****0", "Books", "14.00"],
  ],
  index: true,
  columnWidth: [50],
  align: ["center"],
  waitTime: 100,
});
</script>

<template>
  <dv-scroll-board :config="config" style="width: 100%; height: 100%" />
</template>

<style scoped></style>
