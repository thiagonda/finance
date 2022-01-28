FROM ruby:3.0.3

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash

RUN  apt-get update && apt-get install -qq -y --no-install-recommends \
     nodejs build-essential libpq-dev imagemagick git-all nano vim

RUN npm install --global yarn

ENV INSTALL_PATH /finance

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

ADD Gemfile /finance/Gemfile

ADD Gemfile.lock /finance/Gemfile.lock

RUN bundle install

ADD . /finance