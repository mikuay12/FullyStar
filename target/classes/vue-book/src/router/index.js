import { createRouter, createWebHistory } from "vue-router";
import LoginVue from "@/views/Login.vue";
import LayoutVue from "@/views/Layout.vue";
import AllbookVue from "@/views/book/Allbook.vue";
import DetailbookVue from "@/views/book/Detailbook.vue";
import ManagebookVue from "@/views/book/Managebook.vue";
import AddbookVue from "@/views/book/Addbook.vue";
import IndexVue from "@/views/dataShow/index.vue";
import PersonalDataVue from "@/views/user/PersonalData.vue";
const routes = [
  { path: "/login", component: LoginVue },
  {
    path: "/",
    component: LayoutVue,
    redirect: "/book/Allbook",
    children: [
      { path: "/book/Allbook", component: AllbookVue },
      {
        path: "/book/Detailbook",
        component: DetailbookVue,
      },
      {
        path: "/book/Managebook",
        component: ManagebookVue,
      },
      {
        path: "/book/Addbook",
        component: AddbookVue,
      },
      {
        path: "/datashow/index",
        component: IndexVue,
      },
      {
        path: "/user/PersonalData",
        component: PersonalDataVue,
      },
    ],
  },
];
const router = createRouter({
  history: createWebHistory(),
  routes: routes,
});
export default router;
