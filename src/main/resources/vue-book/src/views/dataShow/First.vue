<script setup>
import { ref, reactive } from "vue";
import barchartVue from "@/views/chart/barchart.vue";
import scollboardVue from "@/views/chart/scollboard.vue";
</script>

<template>
  <div class="bgStyle">
    <barchartVue />
  </div>
</template>

<style scoped>
.bgStyle {
  width: 100%;
  height: 75%;
  background-color: #0d2049;
  border-top: 2px solid #0b3e68;
}
</style>
