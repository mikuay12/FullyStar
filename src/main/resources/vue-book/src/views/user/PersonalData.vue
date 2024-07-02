<script setup>
import axios from "axios";
import { ref } from "vue";
import { ElMessage } from "element-plus";

const isupdate = ref(true);

const isupdatepassword=ref(false);

const userModel=ref({
  username:"",
  password:"",
  newpassword:"",
  repassword:"",
})
const userData = ref({});
import { useUserInfoService } from "@/api/user.js";
const UserInfo = async () => {
  let result = await useUserInfoService();
  if (result.code == 0) {
    console.log(6666666);
    console.log(result.data);
    userData.value = result.data;
    console.log(6666666);
    console.log(userData.value);
  } else {
    alert("查询失败");
  }
};
UserInfo();


import { useUpdateInfoService } from "@/api/user";
const submit = async () => {

  let result = await useUpdateInfoService(userData.value);
  if (result.code == 0) {
    /* alert(result.message ? result.message : "登录成功"); */
    ElMessage.success(result.message ? result.message : "修改成功");

  } else {
    ElMessage.error("修改失败");
  }
};

import { useUpdatePasswordService } from "@/api/user.js";
const UpdatePassword=async()=>{
  if(userModel.value.newpassword==userModel.value.repassword){
    userModel.value.username=userData.value.username;
    let result=await useUpdatePasswordService(userModel.value);
  if (result.code == 0) {
    /* alert(result.message ? result.message : "登录成功"); */
    ElMessage.success(result.message ? result.message : "修改成功");

  } else {
    ElMessage.error("修改失败");
  }
  }else{
    ElMessage.error("两次输入不一致");
  }
  
}
</script>

<template>

    <div class="profile" v-if="isupdate">
      <h1>{{ userData.username }} 的个人主页</h1>
      <p>用户名: {{ userData.username }}</p>
      <p>用户id:{{ userData.user_id }}</p>
      <p>年龄: {{ userData.user_age }}</p>
      <p>性别: {{ userData.user_sex }}</p>
      <p>生日:{{ userData.user_birth }}</p>
      <p>电话:{{ userData.user_phone }}</p>
      <button @click="isupdate = false">修改资料</button>
      <button @click="isupdatepassword = true">修改密码</button>
    </div>
    <div class="profile" v-else>
      <h1>{{ userData.username }} 的个人主页</h1>
      <p>用户名: {{ userData.username }}</p>
      <p>用户id:{{ userData.user_id }}</p>
      年龄:<input type="text" v-model="userData.user_age" />
      <br />
      性别:<input type="text" v-model="userData.user_sex" class="user" />
      <br />
      生日:<input type="text" v-model="userData.user_birth" class="user" />
      <br />
      电话:<input type="text" v-model="userData.user_phone" class="user" />
      <br />
      <button
        class="user"
        @click="
          isupdate = true;
          submit();
        "
      >
        点击提交
      </button>
      
    </div>


    <el-dialog v-model="isupdatepassword" title="添加商品" width="30%">
    <el-form
      :model="userModel"
      :rules="rules"
      label-width="100px"
      style="padding-right: 30px"
    >
      <el-form-item label="旧密码" prop="password">
        <el-input
          v-model="userModel.password"
          minlength="1"
          maxlength="10"
        ></el-input>
      </el-form-item>
      <el-form-item label="新密码" prop="newpassword">
        <el-input
          type="password"
          v-model="userModel.newpassword"
          minlength="1"
          maxlength="15"
        ></el-input>
      </el-form-item>
      <el-form-item label="确认密码" prop=" repassword">
        <el-input
          type="password"
          v-model="userModel.repassword"
          minlength="1"
          maxlength="15"
        ></el-input>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="isupdatepassword = false">取消</el-button>
        <el-button type="primary" @click="UpdatePassword"> 确认 </el-button>
      </span>
    </template>
  </el-dialog>
  
</template>

<style scoped>
.profile {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background-color: wheat;
}
.user {
  margin-top: 15px;
}
</style>
