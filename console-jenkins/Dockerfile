FROM openshift/jenkins-2-centos7

USER root

EXPOSE 8080 50000

RUN yum install -y wget && \
    yum install -y bzip2 && \
    yum clean all

RUN curl https://bootstrap.pypa.io/get-pip.py -o /var/lib/jenkins/get-pip.py && \
    python /var/lib/jenkins/get-pip.py --no-cache-dir

RUN pip install --no-cache-dir virtualenv

RUN pip install --no-cache-dir --ignore-installed virtualenvwrapper

COPY ./contrib/openshift /opt/openshift
COPY ./contrib/jenkins /usr/local/bin
ADD ./contrib/s2i /usr/libexec/s2i
ADD release.version /tmp/release.version

RUN /usr/local/bin/fix-permissions /var/lib/jenkins && \
    chown -R 1001:0 /opt/openshift && \
    /usr/local/bin/fix-permissions /opt/openshift/configuration/init.groovy.d && \
    /usr/local/bin/fix-permissions /var/lib/jenkins && \
    /usr/local/bin/fix-permissions /var/log

VOLUME ["/var/lib/jenkins"]

USER 1001

CMD ["/usr/libexec/s2i/run"]

