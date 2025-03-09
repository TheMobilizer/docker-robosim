FROM osrf/ros:jazzy-desktop-full

#RUN apt-get update

ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=$USER_UID

#RUN groupadd -o --gid $USER_GID $USERNAME \
#    && useradd -s -o /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
#    && mkdir /home/$USERNAME/.config && chown $USER_UID:$USER_GID /home/$USERNAME/.config
RUN usermod -l ros ubuntu
RUN groupmod --new-name ${USERNAME} ubuntu
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /${USERNAME}/.bashrc
USER $USERNAME
WORKDIR "/mysrc"

# docker run -it --network=host --ipc=host --rm -v $PWD/src:/mysrc -v /tmp/.X11-unix:/tmp/.X11-unix:rw --env=DISPLAY --env="QT_X11_NO_MITSHM=1" --env="ROS_DOMAIN_ID=42" --device=/dev/dri:/dev/dri robosim
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]