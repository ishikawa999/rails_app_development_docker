FROM ruby:2.6-slim-stretch
ENV LANG C.UTF-8
ENV APP_HOME /var/lib/app

ENV DEBIAN_FRONTEND noninteractive
RUN set -eux; \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
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
    ; \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*;
ENV DEBIAN_FRONTEND dialog

WORKDIR $APP_HOME
ADD ./app/. $APP_HOME

COPY ./start.sh ./entrypoint.sh ./setup.sh ./custom_shell.sh /

RUN chmod +x /start.sh && \
  chmod +x /entrypoint.sh && \
  chmod +x /setup.sh && \
  chmod +x /custom_shell.sh && \
  bundle update && \
  /setup.sh

EXPOSE 3000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/start.sh"]
