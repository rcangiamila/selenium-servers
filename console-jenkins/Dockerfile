FROM registry.access.redhat.com/openshift3/jenkins-2-rhel7


#-----------------------#
# Strumenti di sistema  #
#-----------------------#

USER root

RUN yum install -y wget && \
    yum install -y bzip2

RUN wget --no-verbose https://bootstrap.pypa.io/get-pip.py -O /var/lib/jenkins/get-pip.py && \

RUN python /var/lib/jenkins/get-pip.py && \
    pip install virtualenv && \
    pip install virtualenvwrapper

RUN /usr/local/bin/fix-permissions /var/lib/jenkins

# &&  \
#    yum install -y wget && \
#    yum install -y bzip2

USER 1001

CMD ["/usr/libexec/s2i/run"]
