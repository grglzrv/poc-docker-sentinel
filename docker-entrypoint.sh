#!/bin/sh

if [ -z "${SENTINEL_PORT}" ]; then
    SENTINEL_PORT=26379
fi

if [ -z "${REDIS_PORT}" ]; then
    REDIS_PORT=6379
fi

if [ \! -f "/data/sentinel.conf" ]; then
    sed "s/\$REDIS_PORT/$REDIS_PORT/g;s/\$SENTINEL_PORT/$SENTINEL_PORT/g;s/\$SENTINEL_QUORUM/$SENTINEL_QUORUM/g;s/\$SENTINEL_DOWN_AFTER/$SENTINEL_DOWN_AFTER/g;s/\$SENTINEL_FAILOVER/$SENTINEL_FAILOVER/g;s/\$REDIS_MASTER/$REDIS_MASTER/g" /etc/redis/sentinel.conf.template > /data/sentinel.conf
    chown redis /data/sentinel.conf
fi

redis-server /data/sentinel.conf --sentinel
