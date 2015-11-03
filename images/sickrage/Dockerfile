FROM timhaak/sickrage:latest

VOLUME ["/config","/downloads","/var/lib/transmission-daemon/downloads"]
EXPOSE 8081

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

ADD ./config.ini /sickrage/config.ini

CMD ["/start.sh"]
