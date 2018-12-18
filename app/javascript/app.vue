<template>
    <div class='pure-g-r' id='layout'>

      <Navbar/>

      <div class='pure-u-1'>
        <div class='content'>

          <Conferences/>

        </div>
      </div>
    </div>
</template>

<script>

import Navbar from './components/Navbar'
import Conferences from './components/Conferences'

export default {
  name: 'App',
  components: {
    Navbar: Navbar,
    Conferences: Conferences
  },
  data: function () {
    return {
      message: "Hello, Confy!"
    }
  }
}
</script>

<style>
p {
  font-size: 2em;
  text-align: center;
}
</style>
