ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-slim-buster

ARG APP_HOME
ARG APP_PORT
ENV LANG C.UTF-8

ENV DEBIAN_FRONTEND noninteractive
RUN set -eux; \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    wget curl \
    \
    bzr \
    git \
    mercurial \
    openssh-client \
    subversion \
    gsfonts \
    imagemagick libmagick++-dev \
    build-essential \
    libpq-dev \
    vim \
    less \
    default-libmysqlclient-dev \
    locales \
    locales-all \
    libsqlite3-dev \
    postgresql postgresql-contrib \
    apt-transport-https \
    gnupg \
    ; \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*;
ENV DEBIAN_FRONTEND dialog

WORKDIR $APP_HOME
ADD ./app/. $APP_HOME

COPY ./scripts/. /
COPY ./.vscode/. $APP_HOME/.vscode
RUN for file_name in "/start.sh /entrypoint.sh /setup.sh /custom_shell.sh"; do \
      chmod +x $file_name; \
    done

RUN bundle update
RUN bundle install
RUN /setup.sh

EXPOSE $APP_PORT

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/start.sh"]
