FROM centos:centos7

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
ENV CHROME_URL=https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
ENV SELENIUM_URL=https://selenium-release.storage.googleapis.com/3.11/selenium-server-standalone-3.11.0.jar
ENV FIREFOX_URL=https://download-installer.cdn.mozilla.net/pub/firefox/releases/59.0/linux-x86_64/en-US/firefox-59.0.tar.bz2

ENV DISPLAY=:99

RUN yum install -y epel-release

RUN yum install -y --setopt=tsflags=nodocs ${CHROME_URL} gettext nss_wrapper wget bzip2 java-1.8.0-openjdk which unzip tar Xvfb chromedriver scl-utils dbus strace && \
    yum clean all && \
    dbus-uuidgen > /etc/machine-id

RUN mkdir -p ${APP_HOME} && \
    mkdir -p ${APP_HOME}/bin && \
    mkdir -p ${APP_HOME}/geckodriver

COPY bin/ ${APP_HOME}/bin

RUN wget --no-verbose ${SELENIUM_URL} -O ${APP_HOME}/standalone.jar && \
    wget --no-verbose -L -O firefox.tar.bz2 ${FIREFOX_URL} &&  \
    tar -xvf firefox.tar.bz2 -C ${APP_HOME} && \
    wget --no-verbose -L -O geckodriver-v0.20.0-linux64.tar.gz ${GECKO_DRIVER_URL} && \
    tar -xzf geckodriver-v0.20.0-linux64.tar.gz -C ${APP_HOME}/geckodriver && \
    chmod -R a+rwx ${APP_HOME} && \
    chown -R 1001:0 ${APP_HOME} && \
    chmod -R g=u /etc/passwd && \
    mv /opt/google/chrome/google-chrome /opt/google/chrome/google-chrome.old && \
    cp ${APP_HOME}/bin/google-chrome /opt/google/chrome/google-chrome && \
    chmod -R a+rwx /opt/google/chrome/google-chrome && \
    ln -sf ${APP_HOME}/geckodriver/geckodriver /usr/bin/geckodriver && \
    ln -sf ${APP_HOME}/firefox/firefox /usr/bin/firefox && \
    rm -f geckodriver-v0.20.0-linux64.tar.gz && \
    rm -f firefox.tar.bz2

USER 1001

WORKDIR ${APP_HOME}

ENTRYPOINT [ "uid_entrypoint" ]

CMD run
