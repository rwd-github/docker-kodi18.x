FROM ubuntu:18.04 
MAINTAINER RWd <rwd-github@gmx.net>
RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:team-xbmc/ppa                         && \
	apt-get update && apt-get install -y kodi			 			&& \
	apt-get -y --purge autoremove									&& \
	apt-get clean                                                   && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/cache/samba && chmod 777 /var/cache/samba

ENV TZ 'Europe/Berlin'
RUN echo $TZ > /etc/timezone \
    && apt-get update && apt-get install -y tzdata \
    && rm /etc/localtime \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
	&& apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ENTRYPOINT [ "kodi" ]
