FROM registry.access.redhat.com/openshift3/jenkins-2-rhel7


#-----------------------#
# Strumenti di sistema  #
#-----------------------#

USER root

RUN yum install -y epel-release

RUN yum install -y wget && \
    yum install -y bzip2

RUN curl https://bootstrap.pypa.io/get-pip.py -o /var/lib/jenkins/get-pip.py && \
    python /var/lib/jenkins/get-pip.py && \
    pip install virtualenv && \
    pip install virtualenvwrapper

RUN /usr/local/bin/fix-permissions /var/lib/jenkins

# &&  \
#    yum install -y wget && \
#    yum install -y bzip2

USER 1001

CMD ["/usr/libexec/s2i/run"]
