FROM registry.access.redhat.com/openshift3/jenkins-2-rhel7


#-----------------------#
# Strumenti di sistema  #
#-----------------------#

USER root

RUN yum install -y epel-release
RUN yum install -y wget && \
    yum install -y bzip2 && \
    yum clean all

RUN curl https://bootstrap.pypa.io/get-pip.py -o /var/lib/jenkins/get-pip.py && \
    python /var/lib/jenkins/get-pip.py --no-cache-dir

RUN pip install --no-cache-dir virtualenv

RUN pip install --no-cache-dir --ignore-installed virtualenvwrapper

RUN /usr/local/bin/fix-permissions /var/lib/jenkins

# &&  \
#    yum install -y wget && \
#    yum install -y bzip2

VOLUME ["/var/lib/jenkins"]

USER 1001
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/libexec/s2i/run"]

