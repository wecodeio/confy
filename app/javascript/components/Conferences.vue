<template>
  <div>
    <vue-headful title="Conferences"/>
    <div v-for="conferencesForYear in conferencesByYear" :key="conferencesForYear.year">
      <header>
        <h1 class="content-subhead">{{ conferencesForYear.year }}</h1>
      </header>
      <section class="conferences-grid pure-g-r">
        <article class="conference pure-u-1-3" v-for="conference in conferencesForYear.conferences" :key="conference.slug">
          <div class="logo normal">
            <router-link :to="{ name: 'Conference', params: { slug: conference.slug } }">
              <img
                :alt="conference.title"
                src="images/conference.png"              
                :title="conference.title"
                style="width: 100%"
              >
            </router-link>
          </div>
          <header>
            <h2 class="title mini">
              <router-link :to="{ name: 'Conference', params: { slug: conference.slug } }">
                {{ conference.title }}
              </router-link>
            </h2>
            <p class="data">{{ conference.talks }} {{ conference.talks | pluralize("talk") }}</p>
          </header>
        </article>
      </section>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Conferences",
  data() {
    return {
      conferencesByYear: []
    }
  },
  created() {
    axios.get("/api/v1/conferences").then(response => {
      this.conferencesByYear = response.data;
    });
  }
};
</script>

<style>

</style>