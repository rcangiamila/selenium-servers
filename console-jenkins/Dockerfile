FROM registry.access.redhat.com/openshift3/jenkins-2-rhel7


#-----------------------#
# Strumenti di sistema  #
#-----------------------#

USER root

#RUN yum -y update
RUN yum install -y epel-release
RUN yum install -y python
RUN yum install -y python-requests
RUN yum install -y python-pip

RUN yum install -y wget && \
    yum install -y bzip2 && \
    yum clean all

#RUN rm -rf /usr/lib/python2.7/site-packages/pip/_vendor/cachecontrol/caches/*

RUN pip install --upgrade pip

RUN pip install virtualenv

RUN pip install virtualenvwrapper

RUN /usr/local/bin/fix-permissions /var/lib/jenkins

# &&  \
#    yum install -y wget && \
#    yum install -y bzip2

USER 1001

CMD ["/usr/libexec/s2i/run"]
