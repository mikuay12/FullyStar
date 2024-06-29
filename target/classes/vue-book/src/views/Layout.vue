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

import avatar from "@/assets/default.png";
const option = ref(0);
const value1 = ref(true);

const searchdata = ref({
  keyword: "",
});
const bookList = ref([]);

axios
  .post("http://localhost:8080/FindAllBook")
  .then((result) => {
    bookList.value = result.data.data;
    console.log(result.data.data);
  })
  .catch((err) => {
    console.log(err);
  });

const search = function () {
  axios
    .get("http://localhost:8080/BookSearch", {
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
/* const searchall = function () {
  axios
    .post("http://localhost:8080/FindAllBook")
    .then((result) => {
      bookList.value = result.data.data;
      console.log(result.data.data);
    })
    .catch((err) => {
      console.log(err);
    });
}; */
</script>

<template>
  <el-container class="layout-container">
    <!-- 左侧菜单 -->
    <el-aside width="200px">
      <div class="el-aside__logo"></div>
      <el-menu
        active-text-color="#ffd04b"
        background-color="#232323"
        text-color="#fff"
        router
      >
        <el-menu-item index="/book/Allbook">
          <el-icon>
            <Management />
          </el-icon>
          <span>所有书籍</span>
        </el-menu-item>
        <el-sub-menu>
          <template #title>
            <el-icon>
              <Promotion />
            </el-icon>
            <span>书籍管理</span>
          </template>
          <el-menu-item index="/book/Managebook">
            <el-icon>
              <User />
            </el-icon>
            <span>管理书籍</span>
          </el-menu-item>
          <el-menu-item index="/book/Addbook">
            <el-icon>
              <Crop />
            </el-icon>
            <span>添加书籍</span>
          </el-menu-item>
          <el-menu-item>
            <el-icon>
              <EditPen />
            </el-icon>
            <span>重置密码</span>
          </el-menu-item>
        </el-sub-menu>
        <el-sub-menu>
          <template #title>
            <el-icon>
              <UserFilled />
            </el-icon>
            <span>个人中心</span>
          </template>
          <el-menu-item>
            <el-icon>
              <User />
            </el-icon>
            <span>基本资料</span>
          </el-menu-item>
          <el-menu-item>
            <el-icon>
              <Crop />
            </el-icon>
            <span>更换头像</span>
          </el-menu-item>
          <el-menu-item>
            <el-icon>
              <EditPen />
            </el-icon>
            <span>重置密码</span>
          </el-menu-item>
        </el-sub-menu>
        <el-sub-menu>
          <template #title>
            <el-icon>
              <Promotion />
            </el-icon>
            <span>数据展示</span>
          </template>
          <el-menu-item index="/chart/Barchart">
            <el-icon>
              <User />
            </el-icon>
            <span>管理书籍</span>
          </el-menu-item>
          <el-menu-item index="/book/Addbook">
            <el-icon>
              <Crop />
            </el-icon>
            <span>添加书籍</span>
          </el-menu-item>
          <el-menu-item>
            <el-icon>
              <EditPen />
            </el-icon>
            <span>重置密码</span>
          </el-menu-item>
        </el-sub-menu>
      </el-menu>
    </el-aside>
    <!-- 右侧主区域 -->
    <el-container>
      <!-- 头部区域 -->
      <el-header>
        <div style="width: 400px">用户：<strong>1001001</strong></div>
        <!-- <div style="width: 600px">
          <el-input
            v-model="searchdata.keyword"
            style="width: 240px"
            placeholder="请输入"
          />
          <el-button
            @click="search"
            :icon="Search"
            style="margin-left: 10px"
            circle
          />
        </div> -->
        <el-dropdown placement="bottom-end">
          <span class="el-dropdown__box">
            <el-avatar :src="avatar" />
            <el-icon>
              <CaretBottom />
            </el-icon>
          </span>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item command="profile" :icon="User"
                >基本资料</el-dropdown-item
              >
              <el-dropdown-item command="avatar" :icon="Crop"
                >更换头像</el-dropdown-item
              >
              <el-dropdown-item command="password" :icon="EditPen"
                >重置密码</el-dropdown-item
              >
              <el-dropdown-item command="logout" :icon="SwitchButton"
                >退出登录</el-dropdown-item
              >
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </el-header>
      <!-- 中间区域 -->
      <el-main>
        <div style="width: 1220px; height: 100%">
          <!-- border: 1px solid wheat -->
          <router-view></router-view>
          <!-- <el-card
            v-for="(book, index) in bookList"
            style="width: 19.8%; height: 50%; float: left"
          >
            <img
              :src="'./img/' + book.book_ImagePath"
              style="width: 100%; height: 200px"
            />
            <template #footer>
              <span>{{ book.book_name }}</span
              ><span style="float: right">{{ book.book_author }}</span>
            </template>
          </el-card> -->

          <!-- <el-table :data="bookList" stripe height="100%" style="width: 100%">
            <el-table-column fixed prop="book_ID" label="book_ID" width="120" />
            <el-table-column prop="book_name" label="book_name" width="120" />
            <el-table-column
              prop="book_author"
              label="book_author"
              width="120"
            />
            <el-table-column
              prop="book_PublishDate"
              label="book_PublishDate"
              width="120"
            />
            <el-table-column prop="book_type" label="book_type" width="120" />
            <el-table-column prop="book_state" label="book_state" width="120" />
            <el-table-column
              prop="book_publisher"
              label="book_publisher"
              width="120"
            />
            <el-table-column
              prop="book_ImagePath"
              label="book_ImagePath"
              width="120"
            />
            <el-table-column
              prop="book_describe"
              label="book_describe"
              width="500px"
            />
            <el-table-column fixed="right" label="Operations" width="120">
              <template #default>
                <el-button
                  style="margin-left: 40%"
                  type="primary"
                  :icon="Edit"
                  circle
                />
              </template>
            </el-table-column>
          </el-table> -->
        </div>
      </el-main>
      <!-- 底部区域 -->

      <el-footer></el-footer>
    </el-container>
  </el-container>
</template>

<style lang="scss" scoped>
.layout-container {
  height: 100vh;

  .el-aside {
    background-color: #485349ea;

    &__logo {
      height: 120px;
      background: url("@/assets/book5.jpg") no-repeat center / 180px auto;
    }

    .el-menu {
      border-right: none;
    }
  }

  .el-header {
    background-color: #fff;
    display: flex;
    align-items: center;
    justify-content: space-between;

    .el-dropdown__box {
      display: flex;
      align-items: center;

      .el-icon {
        color: #999;
        margin-left: 10px;
      }

      &:active,
      &:focus {
        outline: none;
      }
    }
  }

  .el-footer {
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 14px;
    color: #666;
  }
}
</style>
