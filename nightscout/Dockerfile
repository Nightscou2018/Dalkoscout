#
# CGM Remote Monitor Dockerfile
#
# https://github.com/dhermanns/rpi-nightscout
#

# Pull base image.
FROM hypriot/rpi-node

# install git and npm
RUN apt-get update && apt-get install -y python-software-properties python g++ make git

# Upgrade
RUN apt-get upgrade -y

# create node user
RUN useradd --system -ms /bin/bash node && \
    cd && cp -R .bashrc .profile /home/node && \
    mkdir /home/node/app && \
    chown -R node:node /home/node

USER node
ENV HOME /home/node
ENV CUSTOM_TITLE Dalkoscout
WORKDIR /home/node/app

# install the application
RUN git clone --branch 0.9.2 --single-branch https://github.com/nightscout/cgm-remote-monitor.git . && \
    npm install

EXPOSE 1337
CMD ["node", "server.js"]
