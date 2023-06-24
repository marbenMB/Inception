#!/bin/bash

echo "maxmemory 256mb" >> /etc/redis/redis.conf

echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

sed -i -r "s|bind 127.0.0.1 ::1|bind wordpress ::1|g" /etc/redis/redis.conf

exec "$@"