FROM ruby:2.7.2-alpine

RUN mkdir -p /home/app
WORKDIR  /home/app
COPY ./Gemfile Gemfile
COPY ./Gemfile.lock Gemfile.lock

RUN apk add --no-cache build-base nodejs tzdata sqlite-dev
RUN bundle install
ONBUILD RUN rails db:setup
ONBUILD RUN rails db:migrate

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
