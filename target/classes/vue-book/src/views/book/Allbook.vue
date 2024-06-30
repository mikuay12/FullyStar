<script setup>
import axios from "axios";
import { ref } from "vue";

import {
  Management,
  Promotion,
  UserFilled,
  User,
  Crop,
  EditPen,
  SwitchButton,
  CaretBottom,
  Search,
  Edit,
} from "@element-plus/icons-vue";
const searchdata = ref({
  keyword: "",
});
const bookList = ref([]);
axios
  .post("http://localhost:8081/FindAllBook")
  .then((result) => {
    bookList.value = result.data.data;
    console.log(result.data.data);
  })
  .catch((err) => {
    console.log(err);
  });
const search = function () {
  axios
    .get("http://localhost:8081/BookSearch", {
      params: { ...searchdata.value },
    })
    .then((result) => {
      bookList.value = result.data.data;
      console.log(result.data.data);
    })
    .catch((err) => {
      console.log(err);
    });
};
const reset = function () {
  axios
    .post("http://localhost:8081/FindAllBook")
    .then((result) => {
      bookList.value = result.data.data;
      console.log(result.data.data);
    })
    .catch((err) => {
      console.log(err);
    });
};
const bookDetail = function () {
  console.log(searchdata.value);
  axios
    .get("http://localhost:8081/BookSearch", {
      params: { ...searchdata.value },
    })
    .then((result) => {
      bookList.value = result.data.data;
      console.log(result.data.data);
    })
    .catch((err) => {
      console.log(err);
    });
};
</script>

<template>
  <div style="width: 1216px; background-color: antiquewhite; position: fixed">
    <el-input
      v-model="searchdata.keyword"
      style="width: 400px; margin-left: 30%"
      placeholder="请输入"
    />
    <el-button
      @click="search"
      :icon="Search"
      style="margin-left: 10px"
      circle
    />
    <el-button
      type="primary"
      style="margin-left: 10px"
      @click="
        searchdata.keyword = '';
        reset();
      "
      >重置</el-button
    >
  </div>
  <el-card
    v-for="(book, index) in bookList"
    style="width: 19.8%; height: 48.5%; float: left; margin-top: 20px"
    ><!-- @click="
      searchdata.keyword = book.book_name;  
      bookDetail();
    " -->
    <router-link :to="{ path: '/book/Detailbook', query: book }">
      <!-- <router-link
      :to="{ name: 'Detail', params: { book_name: book.book_name } }"
    > -->
      <img
        :src="'../img/' + book.book_ImagePath"
        style="width: 100%; height: 200px"
      />
    </router-link>
    <template #footer>
      <span style="float: left">{{ book.book_name }}</span
      ><span style="float: right; color: red; font-size: 22px">{{
        book.book_author
      }}</span
      ><span style="float: right; color: red">￥</span>
    </template>
  </el-card>
</template>
