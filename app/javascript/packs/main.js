import Vue from 'vue'
import VueRouter from 'vue-router';
Vue.use(VueRouter);

import App from '../components/App.vue'
import router from '../router'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('hello'))
  const app = new Vue({
    el,
    router,
    render: h => h(App)
  })

  console.log(app)
});