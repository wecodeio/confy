import Vue from 'vue'
import Router from 'vue-router'
import Conferences from './components/Conferences'
import Conference from './components/Conference'
import Speakers from './components/Speakers'
import Speaker from './components/Speaker'
import Talk from './components/Talk'
import Disclaimer from './components/Disclaimer'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/disclaimer',
      name: 'Disclaimer',
      component: Disclaimer
    },
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
      path: '/speakers/:slug',
      name: 'Speaker',
      component: Speaker
    },
    {
      path: '/talks/:slug',
      name: 'Talk',
      component: Talk
    }
  ]
})