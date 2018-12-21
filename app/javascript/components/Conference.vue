<template>
  <div>
    <div class="content">
      <section class="conference pure-u-1">
        <aside class="logo big pure-u-1-5">
          <img
            alt="RubyConf Uruguay 2014"
            src="http://confy-assets.wecode.io/conferences/rubyconfuy-2014.png"
            title="RubyConf Uruguay 2014"
          >
        </aside>
        <div class="conference-description pure-u-4-5">
          <header>
            <h2 class="title">RubyConf Uruguay 2014</h2>
            <p class="conference-meta">
              <span class="tag">ruby</span>
              <span class="tag">rails</span>
              <span class="tag">sinatra</span>
              <span class="tag">testing</span>
              <span class="tag">scrum</span>
              <span class="tag">javascript</span>
              <span class="tag">nosql</span>
            </p>
          </header>
          <p>RubyConf Uruguay is a single-track conference aimed at developers who want to learn about or get up-to-date on topics such as Ruby, Ruby on Rails, Sinatra, Testing, SCRUM, JavaScript, SQL vs NoSQL, and more.</p>
          <div class="data">
            <span class="when">
              <i class="icon-calendar"></i>
              23-24 Mar 2014
              |
            </span>
            <span class="where">
              <i class="icon-map-marker"></i>
              <a
                href="http://goo.gl/maps/ujINm"
                target="blank"
                title="Torre de las Telecomunicaciones"
              >Torre de las Telecomunicaciones</a>
              |
            </span>
            <span class="who">
              <i class="icon-twitter"></i>
              <a
                href="http://twitter.com/rubyconfuruguay"
                target="blank"
                title="rubyconfuruguay"
              >rubyconfuruguay</a>
              |
            </span>
            <span class="info">
              <i class="icon-external-link"></i>
              <a
                href="http://http://www.rubyconfuruguay.org/en"
                target="blank"
                title="RubyConf Uruguay 2014"
              >http://www.rubyconfuruguay.org/en</a>
            </span>
          </div>
        </div>
      </section>
      <section class="talks-grid">
        <article class="talk">
          <div class="video">
            <a href="/talks/2014/rubyconfuy/se-responsable">
              <img
                alt="Sé responsable"
                src="//img.youtube.com/vi/ppuNhkN1wUg/maxresdefault.jpg"
                title="Sé responsable"
              >
            </a>
          </div>
          <aside class="meta">
            <header class="speaker-mini" id="carousel-1">
              <ul>
                <li style="display: block;">
                  <div class="avathar small">
                    <a href="/speakers/godfoca">
                      <img
                        alt="Nicolás Sanguinetti"
                        onerror="this.src=&quot;http://confy-assets.wecode.io/speakers/generic-speaker.png&quot;"
                        src="http://confy-assets.wecode.io/speakers/godfoca.jpeg"
                        title="Nicolás Sanguinetti"
                      >
                    </a>
                  </div>
                </li>
              </ul>
              <div class="info">
                <p class="name">
                  <a href="/speakers/godfoca">Nicolás Sanguinetti</a>
                </p>
                <h1 class="title">
                  <a href="/talks/2014/rubyconfuy/se-responsable">Sé responsable</a>
                </h1>
              </div>
            </header>
          </aside>
        </article>
      </section>
    </div>
  </div>
</template>

<script>

//this.$route.params.smoothie_slug

export default {
  name: "Conference",
  data() {
    return {
      conference: {
        name: 'RubyConf Uruguay 2014'
      },
      talks: [
        {

        }
      ]
    };
  },
  created() {
    console.log(this.$route.params.conference_year, this.$route.params.conference_slug);
  }
};
</script>

<style>

</style>