<template>
  <div>
    <template v-if="speaker">
      <vue-headful :title="speaker.name"/>
      <div class="speaker-hero">
        <div class="avathar small">
          <img
            :alt="speaker.name"
            :src="speaker.avatar_url"
            :title="speaker.name"
          >
        </div>
        <div class="info">
          <header>
            <h2 class="name title">{{ speaker.name }}</h2>
          </header>
        </div>
      </div>
      <section class="talks-grid">
        <article class="talk" v-for="talk in speaker.talks" :key="talk.slug">
          <div class="video">
            <router-link :to="{ name: 'Talk', params: { conference_slug: talk.conference.slug, talk_slug: talk.slug } }">
              <img :alt="talk.title" :src="talk.video_thumbnail" :title="talk.title">
            </router-link>
          </div>
          <aside class="meta">
            <header class="conference-mini">
              <div class="avathar small">
                <router-link :to="{ name: 'Conference', params: { slug: talk.conference.slug } }">
                  <img
                    :alt="talk.conference.title"
                    :src="talk.conference.image_url"
                    :title="talk.conference.title"
                  >
                </router-link>
              </div>
              <div class="info">
                <p class="name">
                  <router-link
                    :to="{ name: 'Conference', params: { slug: talk.conference.slug } }"
                  >{{ talk.conference.title }}</router-link>
                </p>
                <h1 class="title">
                  <router-link :to="{ name: 'Talk', params: { conference_slug: talk.conference.slug, talk_slug: talk.slug } }">{{ talk.title }}</router-link>
                </h1>
              </div>
            </header>
          </aside>
        </article>
      </section>
    </template>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Speaker",
  data() {
    return {
      speaker: null
    };
  },
  created() {
    var slug = this.$route.params.slug;
    axios.get("/api/v1/speakers/" + slug).then(response => {
      this.speaker = response.data;
    });
  }
};
</script>

<style>
</style>
