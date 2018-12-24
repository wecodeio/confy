<template>
  <div>
    <vue-headful title="Confy"/>
    <div class="pure-g-r" id="layout">
      <Navbar/>

      <div class="pure-u-1">
        <div class="content">
          <router-view/>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Navbar from "./Navbar";

export default {
  name: "App",
  components: {
    Navbar: Navbar
  }
};
</script>

<style>
</style>
