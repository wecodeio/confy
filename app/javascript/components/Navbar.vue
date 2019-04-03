<template>
    <div class='sidebar pure-u'>
        <header class='header'>
          <hgroup>
            <h1 class='brand-title'>
              <router-link :to="{ name: 'Conferences' }">
                confy
              </router-link>
            </h1>
            <h2 class='brand-tagline'>the conferences' talks directory</h2>
          </hgroup>
          <nav class='nav'>
            <ul class='nav-list'>
              <li class='nav-item'>
                <router-link :to="{ name: 'Conferences' }" class="pure-button">
                  Conferences
                </router-link>
              </li>
              <li class="nav-item">
                <router-link :to="{ name: 'Speakers' }" class="pure-button">
                  Speakers
                </router-link>
              </li>
              <!-- <li class='nav-item'>
                <a href="#" class="pure-button">
                  Curated lists
                </a>
              </li> -->
            </ul>
          </nav>
          <div class='call-to-action'>
            your conference isn't in the list?
            <a alt="Tweet us" href="https://twitter.com/intent/tweet?text=%40ConfyTalks+Add+this+great+talk+to+https%3a%2f%2fconfy.wecode.io">
              Tweet us!
            </a>
          </div>
        </header>
        <div class='contact'>
          <div class='socials'>
            <ul>
              <li>
                <a href="http://www.twitter.com/confytalks">
                  <i class='fab fa-twitter fa-2x'></i>
                </a>
              </li>
              <li>
                <a href="http://www.github.com/wecodeio/confy">
                  <i class='fab fa-github fa-2x'></i>
                </a>
              </li>
            </ul>
          </div>
          <div class='love'>
            Made with
            <i class="fas fa-heart"></i>
            by
            <a href='//twitter.com/wecodeio'>wecode.io</a>
          </div>
          <div class='disclaimer'>
            <router-link :to="{ name: 'Disclaimer' }">
              disclaimer
            </router-link>
          </div>
        </div>
      </div>
</template>

<script>
export default {
    name: 'Navbar',
    data() { 
        return {

        }
    }
}
</script>

<style>

</style>
