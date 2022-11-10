FROM ruby:3.1.2

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN set -ex \
    && apt-get update \
    && apt-get install -y \
                 default-mysql-client \
                 unzip \
                 locales \
                 locales-all \
                 vim \
                 libidn11-dev \
                 --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \

ENV LANG ja_JP.UTF-8
ENV HISTFILE=/usr/src/app/.bash_history

EXPOSE 3000
# rails sでbindするIPのデフォルトを0.0.0.0に
ENV BINDING=0.0.0.0

