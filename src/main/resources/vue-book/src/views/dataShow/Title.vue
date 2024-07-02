<script setup></script>

<template>
  <div class="header-box">
    <dv-decoration8 style="width: 300px; height: 100px" />
    <div>
      <div class="text">
        <span class="text1">数</span><span class="text2">据</span
        ><span class="text3">监</span><span class="text4">控</span>
      </div>
      <dv-decoration5 :dur="2" style="width: 300px; height: 80px" />
    </div>
    <dv-decoration8 :reverse="true" style="width: 300px; height: 100px" />
  </div>
  <!-- <div small-bg>
      <dv-decoration3 style="width: 100%; height: 30px" />
    </div> -->
</template>

<style scoped>
.header-box {
  width: 100%;
  height: 140px;
  display: flex;
  justify-content: space-between;
  text-align: center;
  margin-bottom: 10px;
}
.text {
  margin-top: 3px;
  letter-spacing: 30px;
  color: white;
  font-size: 50px;
}
.text1 {
  color: blue;
}
.text2 {
  color: red;
}
.text3 {
  color: green;
}
.text4 {
  color: blue;
}
</style>
