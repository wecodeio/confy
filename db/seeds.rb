require 'date'

rubyconfar2013 = Conference.create(:title => 'RubyConf Argentina 2013',
  :description => 'RubyConf Argentina is a regional conference about Ruby and related technologies.',
  :start_date => Date.new(2013,11,27), :end_date => Date.new(2013,11,28),
  :place => 'Ciudad Cultural Konex, AR',
  :url => 'http://www.rubyconfargentina.org/',
  :slug => '2013-rubyconfar')

jano = Speaker.create(:name => 'Jano González',
  :slug => 'janogonzalez')

ruby_me_programo = Talk.create(:title => 'Cómo Ruby me programó a mí',
  :video_url => 'http://www.youtube.com/watch?v=LNtmg-btc5E',
  :conference => rubyconfar2013,
  :slug => 'como-ruby-me-programo-a-mi')

jano.talks << ruby_me_programo

startechconf2013 = Conference.create(:title => 'StarTechConf 2013',
  :description => 'The conference that brings together world renowned stars in software development and local tech experts to talk about HTML5, CSS3, JavaScript, Ruby, Java, Python, Mobile and more.',
  :start_date => Date.new(2013,10,25), :end_date => Date.new(2013,10,26),
  :place => ' USM Campus San Joaquin, CL',
  :url => 'http://www.startechconf.com/',
  :slug => '2013-startechconf')

rubyconfar2012 = Conference.create(:title => 'RubyConf Argentina 2012',
  :description => '¡El mayor evento Ruby de habla hispana, donde nos reunimos a compartir y aprender sobre las últimas tecnologías!',
  :start_date => Date.new(2012,10,19), :end_date => Date.new(2012,10,20),
  :place => 'Paseo La Plaza, AR',
  :url => 'http://2012.rubyconfargentina.org/',
  :slug => '2012-rubyconfar')

soveran = Speaker.create(:name => 'Michel Martens',
  :slug => 'soveran')

smallTools = Talk.create(:title => 'The Power of Small Tools',
  :video_url => 'https://vimeo.com/63628137',
  :conference => rubyconfar2012,
  :slug => 'the-power-of-small-tools')

soveran.talks << smallTools
jano.talks << smallTools

interfaces = Talk.create(:title => '¿Dónde están mis interfaces?',
  :video_url => 'https://vimeo.com/62132088',
  :conference => rubyconfar2012,
  :slug => 'donde-estan-mis-interfaces')

jano.talks << interfaces

User.create(email: 'amy@admin.com', password: 'please', password_confirmation: 'please')