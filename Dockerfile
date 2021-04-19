FROM ruby:2.7

RUN mkdir /sample
ENV APP_ROOT /sample
WORKDIR $APP_ROOT

COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN apt-get update -qq && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    npm install --global yarn && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential imagemagick libpq-dev && \
    gem install bundler && \
    bundle install

COPY . $APP_ROOT
