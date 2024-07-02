import { createApp } from "vue";
import ElementPlus from "element-plus";
import "element-plus/dist/index.css";
import App from "./App.vue";
import "./assets/main.scss";
import { createPinia } from "pinia";
import router from "@/router";
import DataVVue3 from "@kjgl77/datav-vue3";
import { createPersistedState } from "pinia-persistedstate-plugin";

const app = createApp(App);
const pinia = createPinia();
const persist=createPersistedState();
pinia.use(persist);
app.use(pinia);
app.use(DataVVue3);
app.use(router);
app.use(ElementPlus);
app.mount("#app");
