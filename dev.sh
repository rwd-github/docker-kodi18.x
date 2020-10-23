#!/bin/bash

image=rwd1/kodi18.x

#docker build --cache-from ${image} --tag ${image} .

export myUID=$(id -u)
export myGID=$(id -g)

XAUTH=/tmp/.docker.xauth
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -


	

#xhost +local:docker
docker run -it --rm						\
	--user $myUID:$myGID									\
	--env="DISPLAY"							\
	--volume="$XAUTH:$XAUTH" \
	--volume="/home/$USER/alternativHome/kodi/:/home/$USER"	\
	--volume="/etc/group:/etc/group:ro"             	\
	--volume="/etc/passwd:/etc/passwd:ro"           	\
	--volume="/etc/shadow:/etc/shadow:ro"           	\
	--volume="/etc/sudoers.d:/etc/sudoers.d:ro"     	\
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"     	\
    -v /dev/shm:/dev/shm \
    -v /etc/machine-id:/etc/machine-id \
    -v /run/user/$myUID/pulse:/run/user/$myUID/pulse \
    -v /var/lib/dbus:/var/lib/dbus \
    -v ~/.pulse:/home/$USER/.pulse \
	--name kodi \
	--privileged \
	--entrypoint bash \
	${image}

exit 0
	--volume="/dev:/dev" \
