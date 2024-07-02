import request from "@/utils/request.js";
import { useTokenStore } from "@/stores/token";
export const barChartService = (setData) => {
  const params = new URLSearchParams();
  for (let key in setData) {
    params.append(key, setData[key]);
  }
  return request.post("/GetData", params);
};