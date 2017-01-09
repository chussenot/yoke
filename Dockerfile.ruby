FROM ruby:2.2

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

ENV APP_ROOT /code
ENV BUNDLE_APP_CONFIG ${APP_ROOT}/.bundle
ENV APP_PORT 3000

RUN mkdir -p ${BUNDLE_APP_CONFIG}

ARG USER=nobody
RUN useradd --comment "Docker image user" --create-home ${USER}
USER ${USER}

WORKDIR ${APP_ROOT}

EXPOSE 3000

ENV GEM_HOME=/home/${USER}/gems/2.2
ENV GEM_PATH=/home/${USER}/gems/2.2

RUN gem install bundler

VOLUME ["${APP_ROOT}"]
