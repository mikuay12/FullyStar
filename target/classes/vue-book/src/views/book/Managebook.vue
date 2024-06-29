<template>
  <!-- <el-table :data="bookList" stripe height="100%" style="width: 100%">
    <el-table-column fixed prop="book_ID" label="book_ID" width="120" />
    <el-table-column prop="book_name" label="book_name" width="120" />
    <el-table-column prop="book_author" label="book_author" width="120" />
    <el-table-column
      prop="book_PublishDate"
      label="book_PublishDate"
      width="120"
    />
    <el-table-column prop="book_type" label="book_type" width="120" />
    <el-table-column prop="book_state" label="book_state" width="120" />
    <el-table-column prop="book_publisher" label="book_publisher" width="120" />
    <el-table-column prop="book_ImagePath" label="book_ImagePath" width="120" />
    <el-table-column prop="book_describe" label="book_describe" width="500px" />
    <el-table-column fixed="right" label="Operations" width="200">
      <el-button
        type="primary"
        style="margin-left: 10px; float: left"
        @click="
          operationdata.book_ID = { $book_ID };
          reset();
        "
        >上架</el-button
      >
      <el-button
        type="primary"
        style="margin-left: 10px; float: left"
        @click="
          operationdata.book_ID = { $book_ID };
          reset();
        "
        >审核</el-button
      >
    </el-table-column>
  </el-table> -->

  <el-table :data="bookList" stripe height="100%" style="width: 100%">
    <el-table-column fixed prop="book_ID" label="book_ID" width="120" />
    <el-table-column prop="book_name" label="book_name" width="120" />
    <el-table-column prop="book_author" label="book_author" width="120" />
    <el-table-column
      prop="book_PublishDate"
      label="book_PublishDate"
      width="120"
    />
    <el-table-column prop="book_type" label="book_type" width="120" />
    <el-table-column prop="book_state" label="book_state" width="120" />
    <el-table-column prop="book_publisher" label="book_publisher" width="120" />
    <el-table-column prop="book_ImagePath" label="book_ImagePath" width="120" />
    <el-table-column prop="book_describe" label="book_describe" width="500px" />
    <el-table-column
      fixed="right"
      label="Operations"
      width="200"
      v-slot="scope"
    >
      <el-button
        type="primary"
        style="margin-left: 10px; float: left"
        @click="reset(scope.row.book_ID)"
        >上架</el-button
      >
      <el-button
        type="primary"
        style="margin-left: 10px; float: left"
        @click="reset(scope.row.book_ID)"
        >审核</el-button
      >
    </el-table-column>
  </el-table>
  <p ref="divDom">5555555</p>
</template>

<script setup>
import axios from "axios";
import { ref } from "vue";
import { reactive } from "vue";
import { getCurrentInstance } from "vue";
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
const value = ref(true);
const bookList = ref([]);
const divDom = ref(null);

axios
  .post("http://localhost:8080/FindAllBook")
  .then((result) => {
    bookList.value = result.data.data;
    console.log(result.data.data);
  })
  .catch((err) => {
    console.log(err);
  });
console.log("222", divDom.value);
const reset = function (book_ID) {
  console.log(book_ID);
  axios
    .get("http://localhost:8080/BanBook", {
      params: { book_ID: book_ID },
    })
    .then((result) => {
      console.log(result.data.message);
      console.log(divDom.value);
      if (result.data.code == 0) {
      }
    })
    .catch((err) => {
      console.log(err);
    });
};
</script>
