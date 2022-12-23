FROM ruby:2.7.1

ARG BUNDLER_VERSION=2.3.19
ENV RAILS_ROOT /kirin

ENV BUNDLER_VERSION=${BUNDLER_VERSION}
ENV BUNDLER_PATH=/bundle BUNDLE_BIN=/bundle/bin GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock ./
COPY . ./ 

RUN apt-get update && \
    apt-get install build-essential -y --no-install-recommends \
    vim \
    git \
    gnupg2 \
    curl \
    wget \
    nodejs \
    patch \
    ruby-dev \
    zlib1g-dev \
    liblzma-dev \
    libmariadb-dev

RUN gem install bundler -v ${BUNDLER_VERSION}
RUN mkdir -p tmp/sockets
RUN gem install spring

ENTRYPOINT ["docker/entrypoint.sh"]

# Note: run export DISABLE_SPRING=true on Terminal before run rails console