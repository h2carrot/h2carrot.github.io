FROM ruby:4.0.1

WORKDIR /app

VOLUME /app

RUN apt-get update

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 4000
