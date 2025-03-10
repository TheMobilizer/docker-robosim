FROM osrf/ros:jazzy-desktop-full

#RUN apt-get update
ENV DEBIAN_FRONTEND=noninteractive
ARG UNAME=ros
ARG UID=1001
ARG GID=1001

RUN usermod -l ${UNAME} ubuntu

USER $USER
WORKDIR "/mysrc"

# docker run -it --network=host --ipc=host --rm -v $PWD/src:/mysrc -v /tmp/.X11-unix:/tmp/.X11-unix:rw --env=DISPLAY --env="QT_X11_NO_MITSHM=1" --env="ROS_DOMAIN_ID=42" --device=/dev/dri:/dev/dri robosim
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]