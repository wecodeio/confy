import Vue from 'vue'
import Router from 'vue-router'
import Conferences from './components/Conferences'
import Conference from './components/Conference'
import Speakers from './components/Speakers'
import Talk from './components/Talk'

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
      path: '/conferences/:slug',
      name: 'Conference',
      component: Conference
    },
    {
      path: '/speakers',
      name: 'Speakers',
      component: Speakers
    },
    {
      path: '/talks/:slug',
      name: 'Talk',
      component: Talk
    }
  ]
})