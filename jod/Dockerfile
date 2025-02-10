################################################################################
# Dockerfile de construção do container JOD utilizado pelo SEI e SIP
#
# Container preparado e configurado para uso em desenvolvimento e testes
################################################################################

FROM ubuntu:focal

############################# INÍCIO DA INSTALAÇÃO #############################

RUN mkdir -p /assets

COPY ./assets /assets

RUN sh /assets/install.sh

WORKDIR /

############################## FIM DA INSTALACAO ###############################
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]

