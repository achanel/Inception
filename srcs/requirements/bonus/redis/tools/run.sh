#!bin/sh

cp /etc/redis/redis.conf /etc/redis/redis.conf.bak

# change some settings in conf file
sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf
sed -i "s|maxmemory <bytes>|maxmemory 256mb|g" /etc/redis/redis.conf
sed -i "s|maxmemory-policy noeviction|maxmemory-policy allkeys-lfu|g" /etc/redis/redis.conf
sed -i "s|protected-mode yes|protected-mode no|g" /etc/redis/redis.conf

# make the server run in the foreground
/usr/bin/redis-server --protected-mode no