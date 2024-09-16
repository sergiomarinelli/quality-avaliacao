import { createRouter, createWebHistory } from "vue-router";
import ClientForm from "../components/ClientForm.vue";

const routes = [
  {
    path: "/clients",
    name: "ClientForm",
    component: ClientForm,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
