FROM openjdk:8

LABEL maintainer="ricardosouzamorais"
LABEL github="https://github.com/ricardo-aspira"

ADD migrationtoolkit-rhamt-web-distribution-4.2.1-with-authentication.zip /tmp/migrationtoolkit-rhamt-web-distribution-4.2.1-with-authentication.zip
RUN unzip -o /tmp/migrationtoolkit-rhamt-web-distribution-4.2.1-with-authentication.zip -d /opt

RUN useradd jboss
RUN chown jboss:jboss /opt/rhamt-web-distribution-4.2.1.Final -R

EXPOSE 8080

USER jboss

ENTRYPOINT ["/opt/rhamt-web-distribution-4.2.1.Final/run_rhamt.sh", "-b 0.0.0.0"]