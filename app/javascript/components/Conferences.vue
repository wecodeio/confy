<template>
  <div>
    <header>
      <h1 class="content-subhead">2014</h1>
    </header>
    <section class="conferences-grid pure-g-r" v-for="conference in conferences" v-bind:key="conference.id">
      <article class="conference pure-u-1-3">
        <div class="logo normal">
          <a href="/conferences/2014/rubyconfuy">
            <img
              v-bind:alt="conference.year"
              v-bind:src="conference.image"
              v-bind:title="conference.name"
            >
          </a>
        </div>
        <header>
          <h2 class="title mini">
            <a href="/conferences/2014/rubyconfuy">{{ conference.name }}</a>
          </h2>
          <p class="data">X talks</p>
        </header>
      </article>
    </section>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      conferences: [
        {
          id: 1,
          name: "RubyConf Uruguay 2014",
          image: "http://confy-assets.wecode.io/conferences/rubyconfuy-2014.png",
          slug: "rubyconfuy",
          year: 2014
        }
      ]
    };
  }
};
</script>

<style>
.index {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-gap: 30px;
  margin-top: 60px;
}
.index h2 {
  font-size: 1.8em;
  text-align: center;
  margin-top: 0;
}
.index .ingredients {
  margin: 30px auto;
}
.index .ingredients li {
  display: inline-block;
}
</style>