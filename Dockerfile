FROM redis:5

ADD sentinel.conf /etc/redis/sentinel.conf.template
RUN chown redis:redis /etc/redis/sentinel.conf.template
ENV REDIS_MASTER redis-master
ENV SENTINEL_QUORUM 2
ENV SENTINEL_DOWN_AFTER 30000
ENV SENTINEL_FAILOVER 180000
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
