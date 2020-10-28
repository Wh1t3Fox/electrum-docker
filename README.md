# electrum-docker
Dockerized Electrum Wallet



### BUILD

```
docker build . -t electrum --build-arg 'VER=4.0.4'
```


### LAUNCH

```
docker run --rm -d --dns=8.8.8.8 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix electrum gui
```
