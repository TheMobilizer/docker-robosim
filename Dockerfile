FROM osrf/ros:jazzy-desktop-full

#RUN apt-get update
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]
ARG UNAME=ros

RUN usermod -l ${UNAME} ubuntu

USER $UNAME
WORKDIR "/mysrc"
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc
# docker run -it --network=host --ipc=host --rm -v $PWD/src:/mysrc -v /tmp/.X11-unix:/tmp/.X11-unix:rw --env=DISPLAY --env="QT_X11_NO_MITSHM=1" --env="ROS_DOMAIN_ID=42" --device=/dev/dri:/dev/dri robosim
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]