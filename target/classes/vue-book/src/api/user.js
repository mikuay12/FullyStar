import request from "@/utils/request.js";
import { useTokenStore } from "@/stores/token";
export const useRegisterService = (registerData) => {
  const params = new URLSearchParams();
  for (let key in registerData) {
    params.append(key, registerData[key]);
  }
  return request.post("/Register", params);
};

export const useLoginService = (loginData) => {
  const params = new URLSearchParams();
  for (let key in loginData) {
    params.append(key, loginData[key]);
  }
  return request.post("/Login", params);
};
export const useLogoutService = () => {
  return request.get("/Logout");
};
export const useUserInfoService = () => {
  return request.get("/PersonalInfo");
};
export const useUpdateInfoService = (updateData) => {
  const params = new URLSearchParams();
  for (let key in updateData) {
    params.append(key, updateData[key]);
  }
  return request.post("/EditUserInfo", params);
  
};
export const useCancelService = () => {
  
  return request.get("/DeleteUser");
  
};
export const useUpdatePasswordService = (updateData) => {
  const params = new URLSearchParams();
  for (let key in updateData) {
    params.append(key, updateData[key]);
  }
  return request.post("/ResetPassword", params);
  
};

