FROM ruby:3.4.12

WORKDIR /app

VOLUME /app

RUN apt-get update

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 4000
