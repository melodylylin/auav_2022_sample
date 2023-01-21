#!/bin/bash
ZSDK_VERSION="0.15.2"
VNCPASSWD=$1

# setup vnc
mkdir ~/.vnc && echo "$VNCPASSWD" | /opt/TurboVNC/bin/vncpasswd -f > ~/.vnc/passwd && \
  chmod 600 ~/.vnc/passwd && \
  openssl req -x509 -nodes -newkey rsa:3702 -keyout ~/.vnc/x509_private.pem -out ~/.vnc/x509_cert.pem -days 3650 -subj '/CN=www.mydom.com/O=My Company Name LTD./C=US'

# setup .profile, note bashrc doesn't get sourced by docker by defualt, .profile does
echo "source /opt/ros/noetic/setup.bash" >> ~/.profile

#SOURCE_OPENVINO="source /opt/intel/openvino_2022/setupvars.sh"
#grep -qxF "$SOURCE_OPENVINO" ~/.bashrc || echo "$SOURCE_OPENVINO" >> ~/.bashrc
echo "PATH=$HOME/.local/bin:$PATH" >> ~/.bashrc
