FROM ubuntu:18.04 
ENV TZ 'Europe/Berlin'
RUN echo $TZ > /etc/timezone \
    && apt-get update && apt-get upgrade -y && apt-get install -y tzdata \
    && rm /etc/localtime \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:team-xbmc/ppa \
	&& apt-get update \
	&& apt-cache policy kodi \
	&& apt-get install -y kodi=2:18.8+git20200728.1313-final-0focal \
		vdpau-va-driver \
	&& apt-get -y --purge autoremove \
	&& apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/cache/samba && chmod 777 /var/cache/samba

WORKDIR /root
VOLUME ["/root", "/tmp/.X11-unix"]
ENTRYPOINT [ "kodi" ]
