import Vue from 'vue'

import VueRouter from 'vue-router';
Vue.use(VueRouter);

import vueHeadful from 'vue-headful';
Vue.component('vue-headful', vueHeadful);

import Vue2Filters from 'vue2-filters';
Vue.use(Vue2Filters);

import VueAnalytics from 'vue-analytics';
Vue.use(VueAnalytics, {
  id: 'UA-131375892-1'
})

import App from '../components/App.vue'
import router from '../router'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('hello'))
  const app = new Vue({
    el,
    router,
    render: h => h(App)
  })
});
