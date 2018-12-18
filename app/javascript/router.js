import Vue from 'vue'
import Router from 'vue-router'
import Conferences from './components/Conferences'
import Speakers from './components/Speakers'

Vue.use(Router)

export default new Router({
  routes: [
    {
        path: '/',
        name: 'Conferences',
        component: Conferences
      },
      {
        path: '/conferences',
        name: 'Conferences',
        component: Conferences
      },
      {
        path: '/speakers',
        name: 'Speakers',
        component: Speakers
      }
  ]
})