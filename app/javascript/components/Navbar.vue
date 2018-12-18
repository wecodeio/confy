<template>
    <div class='sidebar pure-u'>
        <header class='header'>
          <hgroup>
            <h1 class='brand-title'>
              confy
            </h1>
            <h2 class='brand-tagline'>the conferences' talks directory</h2>
          </hgroup>
          <nav class='nav'>
            <ul class='nav-list'>
              <li class='nav-item'>
                <a href="#" class="pure-button">
                  Conferences
                </a>
              </li>
              <li class='nav-item'>
                <a href="#" class="pure-button">
                  Speakers
                </a>
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
            <a>Tweet us!</a>
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
            <a href="#">disclaimer</a>
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
