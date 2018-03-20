FROM centos:7

MAINTAINER simontim <simone.mastrodonato@telecomitalia.it>

EXPOSE 4444 5555

ENV NAME=selenium-server-standalone \
    SELENIUM_VERSION=3.11 \
    SELENIUM_SHORT_VER=311 \
    VERSION=0

ENV APP_HOME=/opt/selenium
ENV HOME=${APP_HOME}
ENV PATH=$PATH:${APP_HOME}/bin

ENV GECKO_DRIVER_URL=https://github.com/mozilla/geckodriver/releases/download/v0.20.0/geckodriver-v0.20.0-linux64.tar.gz
ENV SELENIUM_URL=https://selenium-release.storage.googleapis.com/3.11/selenium-server-standalone-3.11.0.jar

ENV DISPLAY=:99

RUN yum install -y epel-release

RUN yum install -y --setopt=tsflags=nodocs gettext nss_wrapper wget java-1.8.0-openjdk which tar Xvfb chromedriver scl-utils dbus && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    dbus-uuidgen > /var/lib/dbus/machine-id

RUN mkdir -p ${APP_HOME} && \
    mkdir -p ${APP_HOME}/bin && \
    mkdir -p ${APP_HOME}/geckodriver

COPY bin/ ${APP_HOME}/bin

RUN wget --no-verbose ${SELENIUM_URL} -O ${APP_HOME}/standalone.jar && \
    wget --no-verbose -L -O geckodriver-v0.20.0-linux64.tar.gz ${GECKO_DRIVER_URL} && \
    tar -xzf geckodriver-v0.20.0-linux64.tar.gz -C ${APP_HOME}/geckodriver && \
    chmod -R a+rwx ${APP_HOME} && \
    chown -R 1001:0 ${APP_HOME} && \
    chmod -R g=u /etc/passwd && \
    ln -sf ${APP_HOME}/geckodriver/geckodriver /usr/bin/geckodriver && \
    rm -f geckodriver-v0.20.0-linux64.tar.gz

USER 1001

WORKDIR ${APP_HOME}

ENTRYPOINT [ "uid_entrypoint" ]

CMD run
