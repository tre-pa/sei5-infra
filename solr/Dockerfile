################################################################################
# Dockerfile de construcao do container Solr utilizado pelo SEI e pelo SIP 
#
# Container preparado e configurado para uso em desenvolvimento e testes
################################################################################

FROM ubuntu:focal

ADD ./assets /assets

RUN sh /assets/install.sh

WORKDIR /

EXPOSE 8983
ENTRYPOINT ["/entrypoint.sh"]
