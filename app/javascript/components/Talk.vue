<template>
  <div>
    <template v-if="talk">
      <vue-headful :title="talk.title"/>
      <div class="talk jumbo">
        <div class="goto-conference">
          <router-link
            :to="{ name: 'Conference', params: { slug: talk.conference.slug } }"
          >← {{ talk.conference.title }}</router-link>
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
          <div class="carousel">
            <ul>
              <li style="display: block;" v-for="speaker in talk.speakers" :key="speaker.slug">
                <div class="avathar small">
                  <router-link :to="{ name: 'Speaker', params: { slug: speaker.slug } }">
                    <img
                      :alt="speaker.name"
                      :src="speaker.avatar_url"
                      :title="speaker.name"
                    >
                  </router-link>
                </div>
              </li>
            </ul>
          </div>
          <div class="info">
            <p class="name" v-for="speaker in talk.speakers" :key="speaker.slug">
              <router-link
                :to="{ name: 'Speaker', params: { slug: speaker.slug } }"
              >{{ speaker.name }}</router-link>
            </p>
            <h1 class="title">{{ talk.title }}</h1>
          </div>
        </header>
      </div>
    </template>
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
      this.talk = response.data;


      setTimeout(function(){
        new Carousel({
          carousel: '.carousel',
          delay: 2.5,
          autoplay: true
        })
      }, 500);


    });
  }
};
</script>

<style>

</style>
