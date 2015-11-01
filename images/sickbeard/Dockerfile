FROM nfnty/arch-mini:latest

RUN pacman -Syu --noconfirm && \
    pacman -Sy --noconfirm community/python2-cheetah && \
    find /var/cache/pacman/pkg -mindepth 1 -delete

RUN curl -L https://github.com/sutat/Sick-Beard/tarball/development -o sickbeard.tgz && \
    tar -xvf sickbeard.tgz -C / && \
    mv /*-Sick-Beard-* /sickbeard/ && \
    rm /sickbeard.tgz && \
    rm -rf /tmp/*

VOLUME ["/config","/downloads","/var/lib/transmission-daemon/downloads"]
EXPOSE 8081

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

ADD ./config.ini /sickbeard/config.ini

CMD ["/start.sh"]
