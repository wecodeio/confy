<template>
  <div>
    <div class="content">
      <div class="talk jumbo">
        <div class="goto-conference">
          <router-link :to="{ name: 'Conference', params: { slug: talk.conference.slug } }">
            ← {{ talk.conference.title }}
          </router-link>
        </div>
        <div class="video">
          <iframe
            allowfullscreen
            frameborder="0"
            height="480"
            mozallowfullscreen
            :src="talk.video_id"
            webkitallowfullscreen
            width="100%"
          ></iframe>
        </div>
        <header class="speaker-mini">
          <ul>
            <li style="display: block;">
              <div class="avathar small">
                <router-link :to="{ name: 'Speaker', params: { slug: talk.speaker.slug } }">
                  <img
                    :alt="talk.speaker.name"
                    src="http://confy-assets.wecode.io/speakers/generic-speaker.png"
                    :title="talk.speaker.name"
                  >
                </router-link>
              </div>
            </li>
          </ul>
          <div class="info">
            <p class="name">
              <router-link :to="{ name: 'Speaker', params: { slug: talk.speaker.slug } }">
                {{ talk.speaker.name }}
              </router-link>
            </p>
            <h1 class="title">{{ talk.title }}</h1>
          </div>
        </header>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Talk",
  data() {
    return {
      talk: null
    };
  },
  created() {
    var slug = this.$route.params.slug;
    axios.get("/api/v1/talks/" + slug).then(response => {
      console.log(response.data)
      this.talk = response.data;
    });
  }
};
</script>

<style>
</style>