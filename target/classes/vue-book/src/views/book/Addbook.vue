<script lang="ts" setup>
import { reactive } from "vue";
import axios from "axios";
import { ref } from "vue";
import { genFileId } from "element-plus";
import type { UploadInstance, UploadProps, UploadRawFile } from "element-plus";

const upload = ref<UploadInstance>();

const handleExceed: UploadProps["onExceed"] = (files) => {
  upload.value!.clearFiles();
  const file = files[0] as UploadRawFile;
  file.uid = genFileId();
  upload.value!.handleStart(file);
};

const submitUpload = () => {
  upload.value!.submit();
};
const book = reactive({
  book_ID: "",
  book_name: "",
  book_author: "",
  book_PublishDate: "",
  book_type: "",
  book_state: "",
  book_describe: "",
  book_publisher: "",
  book_ImagePath: "",
});

const onSubmit = () => {
  axios
    .get("http://localhost:8080/BookSearch", {
      params: { ...book },
    })
    .then((result) => {
      console.log(result.data.data);
    })
    .catch((err) => {
      console.log(err);
    });
};
</script>

<template>
  <div
    style="
      height: 100%;
      margin-left: 27%;
      margin-right: 27%;
      border-radius: 10px;
      box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.4);
    "
  >
    <div
      style="
        margin-left: 5%;
        margin-right: 5%;
        padding-top: 5%;
        padding-bottom: 5%;
      "
    >
      <span style="font-size: x-large">书籍添加</span>
      <el-form :model="book" class="demo-form-inline" style="margin-top: 5%">
        <el-form-item>
          <el-input
            v-model="book.book_name"
            placeholder="请输入book_name"
            clearable
          />
        </el-form-item>
        <el-form-item>
          <el-input
            v-model="book.book_author"
            placeholder="请输入book_author"
            clearable
          />
        </el-form-item>
        <el-form-item>
          <el-input
            v-model="book.book_publisher"
            placeholder="请输入book_publisher"
            clearable
          />
        </el-form-item>
        <el-form-item>
          <el-input
            v-model="book.book_type"
            placeholder="请输入book_type"
            clearable
          />
        </el-form-item>
        <el-form-item>
          <el-input
            v-model="book.book_describe"
            placeholder="请输入book_describe"
            clearable
          />
        </el-form-item>
        <el-form-item>
          <el-select
            v-model="book.book_state"
            placeholder="请选择book_state"
            clearable
            style="width: 500px"
          >
            <el-option label="上架" value="上架" />
            <el-option label="下架" value="下架" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-date-picker
            v-model="book.book_PublishDate"
            type="date"
            placeholder="请选择book_PublishDate"
            clearable
            style="width: 500px"
          />
        </el-form-item>
        <el-upload
          ref="upload"
          class="upload-demo"
          action="https://run.mocky.io/v3/9d059bf9-4660-45f2-925d-ce80ad6c4d15"
          :limit="1"
          :on-exceed="handleExceed"
          :auto-upload="false"
        >
          <template #trigger>
            <el-button type="primary">select file</el-button>
          </template>
          <el-button class="ml-3" type="success" @click="submitUpload">
            upload to server
          </el-button>
          <template #tip>
            <div class="el-upload__tip text-red">
              limit 1 file, new file will cover the old file
            </div>
          </template>
        </el-upload>
        <el-form-item>
          <el-button type="primary" @click="onSubmit" style="width: 500px"
            >添加</el-button
          >
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<style>
.demo-form-inline .el-input {
  --el-input-width: 500px;
}

.demo-form-inline .el-select {
  --el-select-width: 500px;
}
</style>
