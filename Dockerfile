FROM osrf/ros:dashing-desktop

ENV DEBIAN_FRONTEND noninteractive
#ENV ROS_SECURITY_ROOT_DIRECTORY /security_keys
#ENV ROS_SECURITY_ENABLE true
#ENV ROS_SECURITY_STRATEGY Enforce

COPY launch root/launch
RUN true
COPY sros /
RUN true
COPY vnc /
RUN true

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      apt-utils \
      bzip2 \
      cmake \
      build-essential \
      ca-certificates \
      curl \
      gcc \
      g++ \
      less \
      mercurial \
      python-pip \
      software-properties-common \
      tmux \
      vim \
      wget

# install vncserver
RUN apt-get update \
 && apt-get install -y \
      supervisor \
      vnc4server \
      xfce4 \
      xfce4-goodies \
      xfce4-terminal \
      xserver-xorg-core \
      xterm \
      xvfb \
      x11vnc \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir ~/.vnc \
 && /bin/bash -c "echo -e 'password\npassword\nn' | vncpasswd"
ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
RUN chmod +x /bin/tini