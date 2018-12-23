<template>
  <div>
    <header>
      <h1 class="content-subhead">2014</h1>
    </header>
    <section class="conferences-grid pure-g-r">
      <article class="conference pure-u-1-3" v-for="conference in conferences" :key="conference.slug">
        <div class="logo normal">
          <router-link :to="{ name: 'Conference', params: { slug: conference.slug } }">
            <img
              :alt="conference.title"
              src="http://confy-assets.wecode.io/conferences/rubyconfuy-2014.png"
              :title="conference.title"
            >
          </router-link>
        </div>
        <header>
          <h2 class="title mini">
            <router-link :to="{ name: 'Conference', params: { slug: conference.slug } }">
              {{ conference.title }}
            </router-link>
          </h2>
          <p class="data">X talks</p>
        </header>
      </article>
    </section>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Conferences",
  data() {
    return {
      conferences: []
    }
  },
  created() {
    axios.get("/api/v1/conferences").then(response => {
      this.conferences = response.data;
    });
  }
};
</script>

<style>

</style>