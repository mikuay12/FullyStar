<script setup>
import axios from "axios";
import { ref } from "vue";
import { useRoute } from "vue-router";
const route = useRoute();
const purchase = function () {
  alert("购买成功");
};
</script>

<template>
  <!--   export default {
  data() {
    return {
      book_name: this.$route.query.book_name,
      bookList: [],
    };
  },
  mounted() {
    axios
      .get("http://localhost:8080/BookSearch", {
        params: { ...searchdata.value },
      })
      .then((result) => {
        bookList.value = result.data.data;
        console.log(bookList.value);
      })
      .catch((err) => {
        console.log(err);
      });
  },
}; -->

  <div style="width: 400px; height: 400px; float: left; padding: 25px">
    <img
      :src="'../img/' + $route.query.book_ImagePath"
      style="width: 100%; height: 100%"
    />
  </div>
  <div
    style="
      width: 670px;
      height: 400px;
      float: left;
      margin: 25px 25px 25px 75px;
    "
  >
    <div style="height: 15%">
      商品名:&nbsp &nbsp &nbsp &nbsp{{ route.query.book_name }}
    </div>
    <div style="height: 15%">
      价格:&nbsp &nbsp &nbsp &nbsp<span style="color: red">￥</span
      ><span style="color: red; font-size: 22px">{{
        route.query.book_author
      }}</span>
    </div>
    <div style="height: 15%">
      类型:&nbsp &nbsp &nbsp &nbsp{{ route.query.book_type }}
    </div>
    <div style="height: 55%; background-color: lightyellow">
      商品简介:&nbsp &nbsp{{ route.query.book_describe }}
    </div>
  </div>
  <hr style="width: 1200px" />
  <div style="margin-top: 50px">
    
    <div
      style="
        height: 80px;
        width: 300px;
        float: right;
        border-radius: 40px;
        background-color: red;
        color: white;
        text-align: center;
        padding-top: 5px;
      "
      @click="purchase"
    >
      <span style="font-size: 30px">点击购买</span>
      <br />
      <span style="font-size: 18px">到手价：{{ route.query.book_author }}</span>
    </div>
    <br />
    <br />
  </div>
</template>
