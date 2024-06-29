<script setup>
import { ref, reactive } from "vue";
import barchartVue from "./chart/barchart.vue";
import scollboardVue from "./chart/scollboard.vue";
</script>

<template>
  <div class="bgStyle">
    <barchartVue />
    <scollboardVue />
  </div>
</template>

<style scoped></style>
