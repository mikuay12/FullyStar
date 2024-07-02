<script setup>
import { ref, reactive } from "vue";
import scollboardVue from "@/views/chart/scollboard.vue";
import waterpondVue from "@/views/chart/waterpond.vue";
</script>

<template>
  <div class="third">
    <scollboardVue></scollboardVue>
  </div>
</template>

<style scoped>
.third {
  width: 100%;
  height: 75%;
  background-color: #0d2049;
  border-top: 2px solid #0b3e68;
}
</style>
