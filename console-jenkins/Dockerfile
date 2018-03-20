FROM registry.access.redhat.com/openshift3/jenkins-2-rhel7


#-----------------------#
# Strumenti di sistema  #
#-----------------------#

USER root

#RUN yum -y update
RUN yum install -y epel-release
#RUN yum install -y python
#RUN yum install -y python-requests
#RUN yum install -y python-pip && \
RUN yum install -y wget && \
    yum install -y bzip2 && \
    yum clean all

RUN curl https://bootstrap.pypa.io/get-pip.py -o /var/lib/jenkins/get-pip.py && \
    python /var/lib/jenkins/get-pip.py --no-cache-dir

#RUN pip install --upgrade --no-cache-dir pip

RUN pip install --no-cache-dir virtualenv

RUN pip install --no-cache-dir virtualenvwrapper

RUN /usr/local/bin/fix-permissions /var/lib/jenkins

# &&  \
#    yum install -y wget && \
#    yum install -y bzip2

USER 1001

CMD ["/usr/libexec/s2i/run"]
