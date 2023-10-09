FROM ruby:3.2.2-alpine3.18

ARG RAILS_ENV="production" # ECSで使用するための設定。ローカルではcomposeファイルで再設定する

ENV LANG=C.UTF-8 \
    RAILS_ENV=${RAILS_ENV} \
    APP_ROOT=/app

USER root

WORKDIR $APP_ROOT

EXPOSE 3000

RUN apk add --update alpine-sdk && \
    apk add \
        curl \
        postgresql-dev \
        tzdata

COPY . $APP_ROOT/

RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
