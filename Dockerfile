FROM ruby:3.2.10

WORKDIR /app

VOLUME /app

RUN apt-get update

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 4000
