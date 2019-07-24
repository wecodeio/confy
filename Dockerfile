FROM ruby:2.5.3
RUN useradd -u 1000 --create-home --home-dir /xyz --shell /bin/bash confy
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get install -y nodejs
RUN apt-get update && apt-get install -y yarn

RUN mkdir /confy
WORKDIR /confy
COPY Gemfile /confy/Gemfile
COPY Gemfile.lock /confy/Gemfile.lock

RUN bundle install
COPY . /confy
