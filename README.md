DEPRECATED moved to: https://gitlab.com/ytdocker/collection

# kodi18.x

do not run anymore

```
xhost +local:docker; docker run -it --env="DISPLAY" \
	--volume="/home/$USER/home4kodi:/root"          \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"     \
	--volume="/dev:/dev:rw"                         \
	rwd1/kodi18.x
```
```
xhost +local:docker; docker run -it --env="DISPLAY" \
	--volume="/home/$USER/home4kodi:/root"          \
	--volume="/etc/group:/etc/group:ro"             \
	--volume="/etc/passwd:/etc/passwd:ro"           \
	--volume="/etc/shadow:/etc/shadow:ro"           \
	--volume="/etc/sudoers.d:/etc/sudoers.d:ro"     \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"     \
	rwd1/kodi18.x
```
or simple
```
x11docker -p --gpu --homedir $HOME/home4kodi rwd1/kodi18.x
```

