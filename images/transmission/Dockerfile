FROM dperson/transmission:latest

RUN mkdir /downloads && chmod 777 /downloads

EXPOSE 9091 51413/tcp 51413/udp

ENTRYPOINT ["transmission.sh"]
