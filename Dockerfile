FROM ruby:2.5.1

ENV BUNDLE_PATH /tmp/bundle

RUN bundle config --global frozen 1
WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD bundle exec rails test
