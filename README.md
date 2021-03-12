# firefox-docker

**LAUNCH FIREFOX**

To launch Firefox from the container run the command:
~~~
docker run -ti --rm  -e DISPLAY=$DISPLAY.0 -v /tmp/.X11-unix:/tmp/.X11-unix luisgutierrez/firefox:86.0.1
~~~

It is not necessary to invoke Firefox, it is launched automatically when executing the container

