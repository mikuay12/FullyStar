import request from "@/utils/request.js";
import { useTokenStore } from "@/stores/token";
export const findAllBookService = () => {
  const tokenStore = useTokenStore();
  return request.get("/FindAllBook");
};
export const banBookService = (updateData) => {
  
  const params = new URLSearchParams();
  for (let key in updateData) {
    params.append(key, updateData[key]);
  }
  return request.post("/BanBook", params);
};
export const addBookService = (updateData) => {
  const params = new URLSearchParams();
  for (let key in updateData) {
    params.append(key, updateData[key]);
  }
  return request.post("/AddBook", params);
};
export const searchBookService = (updateData) => {
  const params = new URLSearchParams();
  for (let key in updateData) {
    params.append(key, updateData[key]);
  }
  return request.post("/BookSearch", params);
};

/* export const addBookService=(addData)=>{
  const params = new URLSearchParams();
  for (let key in addData) {
    params.append(key, addData[key]);
  }
  return request.post("/BanBook", params);
} */