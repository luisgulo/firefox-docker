FROM debian:buster-slim
MAINTAINER Luis GL <luisgulo@gmail.com>
# Todo actualizado
RUN apt -y update; apt -y upgrade
RUN apt -y install apt-transport-https wget gpg locales libgtk-3-0 libx11-xcb1 libdbus-glib-1-2 libxt6 
# Locales para es_ES
RUN sed -i '/es_ES.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG es_ES.UTF-8  
ENV LANGUAGE es_ES:es  
ENV LC_ALL es_ES.UTF-8  
# Repositorio SoloConLinux
RUN wget https://repositorio.soloconlinux.org.es/soloconlinux.list -O /etc/apt/sources.list.d/soloconlinux.list
# Clave GPG SoloConLinux
RUN wget -qO - https://repositorio.soloconlinux.org.es/repo-gpg.key | apt-key add -
RUN apt -y update; apt -y install firefox; apt-get clean
RUN GID=1000; UID=1000; UNAME=anonimo; mkdir -p /home/$UNAME; echo "$UNAME:x:${UID}:${GID}:Developer,,,:/home/$UNAME:/bin/bash" >> /etc/passwd; echo "$UNAME:x:${UID}:" >> /etc/group; chown ${UID}:${GID} -R /home/$UNAME
USER anonimo
ENV HOME=/home/anonimo
WORKDIR /home/anonimo
ADD config/punto_anonimo.tar /home/anonimo/.
# Lanzar Firefox
CMD ["/opt/firefox/firefox"]
