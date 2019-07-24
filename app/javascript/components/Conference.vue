<template>
  <div>
    <template v-if="conference">
      <vue-headful :title="conference.title"/>
      <section class="conference pure-u-1">
        <aside class="logo big pure-u-1-5">
          <img
            :alt="conference.title"
            :src="conference.image_url"
            :title="conference.title"
            style="width: 100%"
          >
        </aside>
        <div class="conference-description pure-u-4-5">
          <header>
            <h2 class="title">{{ conference.title }}</h2>
            <!-- <p class="conference-meta">
              <span class="tag">ruby</span>
              <span class="tag">rails</span>
              <span class="tag">sinatra</span>
              <span class="tag">testing</span>
              <span class="tag">scrum</span>
              <span class="tag">javascript</span>
              <span class="tag">nosql</span>
            </p>-->
          </header>
          <p>{{ conference.description }}</p>
          <div class="data">
            <span class="when">
              <i class="icon-calendar"></i>
              {{ conference.dates }}
              |
            </span>
            <span class="where">
              <i class="icon-map-marker"></i>
              {{ conference.place }}
              |
            </span>
            <span class="info">
              <i class="icon-external-link"></i>
              <a
                :href="conference.url"
                target="blank"
                :title="conference.title"
              >{{ conference.url }}</a>
            </span>
          </div>
        </div>
      </section>
      <section class="talks-grid">
        <article class="talk" v-for="talk in conference.talks" :key="talk.id">
          <div class="video">
            <router-link :to="{ name: 'Talk', params: { slug: talk.slug } }">
              <img :alt="talk.title" :src="talk.video_thumbnail" :title="talk.title">
            </router-link>
          </div>
          <aside class="meta">
            <header class="speaker-mini" id="carousel-1">
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
                <h1 class="title">
                  <router-link :to="{ name: 'Talk', params: { slug: talk.slug } }">{{ talk.title }}</router-link>
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
  name: "Conference",
  data() {
    return {
      conference: null
    };
  },
  created() {
    var slug = this.$route.params.slug;
    axios.get("/api/v1/conferences/" + slug).then(response => {
      this.conference = response.data;
      setTimeout(function(){
        document.querySelectorAll(".carousel").forEach(element => {
          new Carousel({
            element: element,
            delay: 2.5,
            autoplay: true
          })
        });
      }, 500);
    });
  }
};
</script>

<style>
</style>