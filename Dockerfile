#note never use ENTRYPOINT FOR starting httpd or nginx , is CMD
FROM centos:7

MAINTAINER NFSpro

LABEL Remarks="This is a dockerfile example for Centos system"

RUN yum -y update && \

yum -y install httpd && \

yum clean all

ADD https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_amd64.zip /usr/local/bin

COPY index.html /var/www/html/

EXPOSE 80

ENV HOME /root

WORKDIR /root

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
