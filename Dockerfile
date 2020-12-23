FROM ubuntu:20.04 
ARG DEBIAN_FRONTEND=noninteractive
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
	&& apt-get install -y \
		kodi=2:18.9+*
#		kodi=2:18.8+git20200728.1313-final-0focal

RUN apt-get install -y \
	mesa-utils \
	libgl1-mesa-dri \
	libgl1-mesa-glx

#RUN apt-get install -y \
#		libdrm-nouveau2 \
#		nouveau-firmware \
#		xserver-xorg-video-nouveau

#	&& apt-get -y --purge autoremove \
#	&& apt-get clean \
#	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/cache/samba && chmod 777 /var/cache/samba

WORKDIR /root
VOLUME ["/root", "/tmp/.X11-unix"]
ENTRYPOINT [ "kodi" ]

#		kodi=2:18.8+git20200728.1313-final-0bionic \
