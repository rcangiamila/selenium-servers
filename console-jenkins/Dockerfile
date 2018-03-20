FROM registry.access.redhat.com/openshift3/jenkins-2-rhel7
#USER root

USER 1001
#-----------------------#
# Strumenti di sistema  #
#-----------------------#

RUN curl https://bootstrap.pypa.io/get-pip.py -o /var/lib/jenkins/get-pip.py && \
    python /var/lib/jenkins/get-pip.py && \
    pip install virtualenv && \
    pip install virtualenvwrapper &&  \
    yum install -y wget && \
    yum install -y bzip2


CMD ["/usr/libexec/s2i/run"]
