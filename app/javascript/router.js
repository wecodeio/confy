import Vue from 'vue'
import Router from 'vue-router'
import Conferences from './components/Conferences'
import Conference from './components/Conference'
import Speakers from './components/Speakers'

Vue.use(Router)

export default new Router({
  mode: 'history',
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
      path: '/conferences/:conference_year/:conference_slug',
      name: 'Conference',
      component: Conference
    },
    {
      path: '/speakers',
      name: 'Speakers',
      component: Speakers
    }
  ]
})