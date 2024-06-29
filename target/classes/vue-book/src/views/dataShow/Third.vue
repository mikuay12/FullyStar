<script setup>
import { ref, reactive } from "vue";
import waterepondVue from "./chart/waterpond.vue";
import rosechartVue from "./chart/rosechart.vue";
</script>

<template>
  <div class="third">
    <div class="third-left">1</div>
    <div class="third-right">
      <div class="bgStyle">
        <rosechartVue />
      </div>
    </div>
  </div>
</template>

<style scoped></style>
