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

RUN /usr/local/bin/fix-permissions /var/lib/jenkins

VOLUME ["/var/lib/jenkins"]

USER 1001
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/libexec/s2i/run"]

