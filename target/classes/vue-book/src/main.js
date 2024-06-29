import { createApp } from "vue";
import ElementPlus from "element-plus";
import "element-plus/dist/index.css";
import App from "./App.vue";
import "./assets/main.scss";

import router from "@/router";
import DataVVue3 from "@kjgl77/datav-vue3";

const app = createApp(App);
app.use(DataVVue3);
app.use(router);
app.use(ElementPlus);
app.mount("#app");