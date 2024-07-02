<script setup>
import axios from "axios";
import { ref } from "vue";
import { ElMessage } from "element-plus";
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
import { useRouter } from "vue-router";
const router = useRouter();

import { useLogoutService } from "@/api/user.js";
const Logout = async()=>{
  let result=await useLogoutService();
  if (result.code == 0) {
    /* alert(result.message ? result.message : "登录成功"); */
    console.log("这里是是登出的result:", result);
    ElMessage.success(result.message ? result.message : "登出成功");
    router.push("/Login");
  } else {
    alert("登出失败");
  }
}


import { useCancelService } from "@/api/user.js";
const Cancel=async()=>{
  let result=await useCancelService();
  if (result.code == 0) {
    /* alert(result.message ? result.message : "登录成功"); */
    // console.log("这里是是登出的result:", result);
    ElMessage.success(result.message ? result.message : "注销成功");
    router.push("/Login");
  } else {
    ElMessage.error("注销失败");
  }
}

/* import { useUserInfoService } from "@/api/user.js";
const UserInfo=async()=>{
  let result=await useUserInfoService();
  if (result.code == 0) {
    console.log(6666666)
    console.log(result.data)
   
  } else {
    alert("查询失败");
  }
} */
/* axios
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
}; */
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
/* const dialogVisible = ref(false) */

//添加分类数据模型
/* const bookModel = ref({
    book_ID: '',
    book_name: '',
    book_author: '',
    book_type: '',
    book_state: '',
    book_describe: '',
    book_ImagePath: '',
}) */
//添加分类表单校验
/* const rules = {
    categoryName: [
        { required: true, message: '请输入分类名称', trigger: 'blur' },
    ],
    categoryAlias: [
        { required: true, message: '请输入分类别名', trigger: 'blur' },
    ]
} */
/* const addBook=()=>{

} */
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
import { Plus } from "@element-plus/icons-vue";
const dialogVisible = ref(false);
//控制抽屉是否显示

//添加表单数据模型
const articleModel = ref({
  book_ID: "",
  book_name: "",
  book_author: "",
  book_type: "",
  book_ImagePath: "",
  book_state: "上架中",
  book_describe: "",
});
const book_ImagePath111 = ref("");
import { useTokenStore } from "@/stores/token";
const tokenStore = useTokenStore();
const uploadSuccess = (result) => {
  articleModel.value.book_ImagePath = "../img/" + result.message;
  book_ImagePath111.value = result.message;
  console.log(result.message);
};
import { addBookService } from "@/api/book";
const AddBook = async () => {
  articleModel.value.book_ImagePath = book_ImagePath111.value;
  let result = await addBookService(articleModel.value);
  if (result.code == 0) {
  } else {
  }
};



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
          <span>所有商品</span>
        </el-menu-item>
        <el-sub-menu>
          <template #title>
            <el-icon>
              <Promotion />
            </el-icon>
            <span>商品管理</span>
          </template>
          <el-menu-item index="/book/Managebook">
            <el-icon>
              <User />
            </el-icon>
            <span>管理商品</span>
          </el-menu-item>
          <el-menu-item @click="dialogVisible=true">
            <el-icon>
              <Crop />
            </el-icon>
            <span>添加商品</span>
          </el-menu-item>
    
        </el-sub-menu>
        
        <el-menu-item index="/datashow/index">
          <el-icon>
            <Management />
          </el-icon>
          <span>数据展示</span>
        </el-menu-item>
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
          
    
   
            <el-dropdown-menu >
              <router-link :to="{ path: '/user/PersonalData', query: book }">
              <el-dropdown-item command="profile" :icon="User" 
                >基本资料</el-dropdown-item
              >
            </router-link>
            <!-- <el-dropdown-item command="profile" :icon="User" @click="UserInfo"
                >基本资料</el-dropdown-item
              > -->
              <el-dropdown-item command="avatar" :icon="Crop"
                >更换头像</el-dropdown-item
              >
              <el-dropdown-item command="password" :icon="EditPen"
                >修改密码</el-dropdown-item
              >
              <el-dropdown-item command="logout" :icon="SwitchButton" @click="Logout"
                >退出登录</el-dropdown-item
              >
              <el-dropdown-item command="logout" :icon="SwitchButton" @click="Cancel"
                >注销账号</el-dropdown-item
              >
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </el-header>
      <!-- 中间区域 -->
      <el-main>
        <div style="width: 100%; height: 100%">
          <!-- border: 1px solid wheat -->

          <router-view></router-view>
          <el-dialog v-model="dialogVisible" title="添加商品" width="60%">
    <el-form :model="articleModel" label-width="100px">
      <el-form-item label="商品ID">
        <el-input
          v-model="articleModel.book_ID"
          placeholder="请输入商品ID"
        ></el-input>
      </el-form-item>
      <el-form-item label="商品名">
        <el-input
          v-model="articleModel.book_name"
          placeholder="请输入商品名"
        ></el-input>
      </el-form-item>
      <el-form-item label="商品价格">
        <el-input
          v-model="articleModel.book_author"
          placeholder="请输入商品价格"
        ></el-input>
      </el-form-item>
      <el-form-item label="商品类型">
        <el-input
          v-model="articleModel.book_type"
          placeholder="请输入商品类型"
        ></el-input>
      </el-form-item>
      <el-form-item label="商品封面">
        <el-upload
          class="avatar-uploader"
          :auto-upload="true"
          :show-file-list="false"
          action="/api/Upload"
          name="file"
          :headers="{ Authorization: useTokenStore.token }"
          :on-success="uploadSuccess"
        >
          <img
            v-if="articleModel.book_ImagePath"
            :src="articleModel.book_ImagePath"
            class="avatar"
          />
          <el-icon v-else class="avatar-uploader-icon">
            <Plus />
          </el-icon>
        </el-upload>
      </el-form-item>

      <el-form-item label="文章内容">
        <div class="editor">
          <quill-editor
            theme="snow"
            v-model:content="articleModel.book_describe"
            contentType="html"
          >
          </quill-editor>
        </div>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button @click="AddBook" type="primary"> 确认 </el-button>
      </span>
    </template>
  </el-dialog>














  <!-- <el-dialog v-model="dialogVisible" title="添加商品" width="30%">
    <el-form
      :model="bookModel"
      :rules="rules"
      label-width="100px"
      style="padding-right: 30px"
    >
      <el-form-item label="商品ID" prop="book_ID">
        <el-input
          v-model="bookModel.book_ID"
          minlength="1"
          maxlength="10"
        ></el-input>
      </el-form-item>
      <el-form-item label="商品名字" prop="book_name">
        <el-input
          v-model="bookModel.book_name"
          minlength="1"
          maxlength="15"
        ></el-input>
      </el-form-item>
      <el-form-item label="商品价格" prop=" book_author">
        <el-input
          v-model="bookModel.book_author"
          minlength="1"
          maxlength="15"
        ></el-input>
      </el-form-item>
      <el-form-item label="商品类型" prop="book_type">
        <el-input
          v-model="bookModel.book_type"
          minlength="1"
          maxlength="15"
        ></el-input>
      </el-form-item>
      <el-form-item label="商品状态" prop=" book_state">
        <el-input
          v-model="bookModel.book_state"
          minlength="1"
          maxlength="15"
        ></el-input>
      </el-form-item>
      <el-form-item label="商品图片" prop="book_describe">
        <el-input
          v-model="bookModel.book_describe"
          minlength="1"
          maxlength="15"
        ></el-input>
      </el-form-item>
      <el-form-item label="商品简介" prop="book_ImagePath">
        <el-input
          v-model="bookModel.book_ImagePath"
          minlength="1"
          maxlength="15"
        ></el-input>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="addBook"> 确认 </el-button>
      </span>
    </template>
  </el-dialog>
 -->




         
        </div>
      </el-main>
      <!-- 底部区域 -->
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

  .el-main {
    padding-left: 20px;
    padding-top: 0;
    .avatar-uploader {
  :deep() {
    .avatar {
      width: 178px;
      height: 178px;
      display: block;
    }

    .el-upload {
      border: 1px dashed var(--el-border-color);
      border-radius: 6px;
      cursor: pointer;
      position: relative;
      overflow: hidden;
      transition: var(--el-transition-duration-fast);
    }

    .el-upload:hover {
      border-color: var(--el-color-primary);
    }

    .el-icon.avatar-uploader-icon {
      font-size: 28px;
      color: #8c939d;
      width: 178px;
      height: 178px;
      text-align: center;
    }
  }
}
.editor {
  width: 100%;
  :deep(.ql-editor) {
    min-height: 200px;
  }
}
    
  }
}

</style>
