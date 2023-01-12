FROM ruby:3.1.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

RUN mkdir /text-to-image_sharing
WORKDIR /text-to-image_sharing
ADD Gemfile /text-to-image_sharing/Gemfile
ADD Gemfile.lock /text-to-image_sharing/Gemfile.lock
RUN bundle install
ADD . /text-to-image_sharing