<template>
  <div class="speakers">
    <h1 class="content-subhead">All speakers</h1>
    <section class="pure-g-r">
      <article class="speaker pure-u-1-4" v-for="speaker in speakers" :key="speaker.slug">
        <router-link :to="{ name: 'Speaker', params: { slug: speaker.slug } }">
          <div class="avathar small">
            <img
              :alt="speaker.name"
              src="http://confy-assets.wecode.io/speakers/generic-speaker.png"
              :title="speaker.name"
            >
          </div>
        </router-link>
        <header>
          <router-link :to="{ name: 'Speaker', params: { slug: speaker.slug } }">
            <h2 class="name">{{ speaker.name }}</h2>
          </router-link>
        </header>
      </article>
    </section>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Speakers",
  data() {
    return {
      speakers: []
    };
  },
  created() {
    axios.get("/api/v1/speakers").then(response => {
      this.speakers = response.data;
    });
  }
};
</script>

<style>
</style>
