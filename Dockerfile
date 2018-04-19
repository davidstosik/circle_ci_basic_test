FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev
# for a JS runtime
RUN apt-get install -y nodejs

ENV BUNDLE_PATH /tmp/bundle

RUN bundle config --global frozen 1
WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD bundle exec rails test
