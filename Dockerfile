FROM jlesage/baseimage-gui:debian-10

ENV TZ Asia/Shanghai
ENV APP_NAME="qq"
ENV DISPLAY_WIDTH="1000"
ENV DISPLAY_HEIGHT="700"


RUN apt-get update &&  apt-get install -y wget libnss3 libxss1 desktop-file-utils libasound2 ttf-wqy-zenhei libgtk-3-0 libgbm1 libnotify4 xdg-utils libsecret-common libsecret-1-0 libindicator3-7 libdbusmenu-glib4 libdbusmenu-gtk3-4 libappindicator3-1 libgtk2.0-0 && rm -rf /var/lib/apt/lists/*

RUN wget https://down.qq.com/qqweb/LinuxQQ/linuxqq_2.0.0-b2-1089_amd64.deb \
&& dpkg -i  linuxqq_2.0.0-b2-1089_amd64.deb  \
&&  rm  linuxqq_2.0.0-b2-1089_amd64.deb   \
&&  sed -i 's@usr\/bin\/x11vnc  \\@usr\/bin\/x11vnc  \\\n                    -noxdamage \\@'   /etc/services.d/x11vnc/run

RUN echo '#!/bin/sh\nexport HOME=/config\nexec /usr/local/bin/qq' > /startapp.sh && chmod +x /startapp.sh