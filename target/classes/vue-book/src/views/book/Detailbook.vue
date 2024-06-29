<script setup>
import axios from "axios";
import { ref } from "vue";
import { useRoute } from "vue-router";
const route = useRoute();
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
      width: 400px;
      height: 400px;
      float: left;
      margin: 25px 25px 25px 275px;
    "
  >
    <div style="height: 20%">
      书名:&nbsp &nbsp &nbsp &nbsp{{ route.query.book_name }}
    </div>
    <div style="height: 20%">
      作者:&nbsp &nbsp &nbsp &nbsp{{ route.query.book_author }}
    </div>
    <div style="height: 20%">
      类型:&nbsp &nbsp &nbsp &nbsp{{ route.query.book_type }}
    </div>
    <div style="height: 20%">
      出版社:&nbsp &nbsp &nbsp &nbsp{{ route.query.book_publisher }}
    </div>
    <div style="height: 20%">
      出版日期:&nbsp &nbsp &nbsp &nbsp{{ route.query.book_PublishDate }}
    </div>
  </div>
  <div style="float: left; background-color: lightyellow">
    &nbsp &nbsp &nbsp &nbsp书籍简介:&nbsp &nbsp{{ route.query.book_describe }}
  </div>
</template>
