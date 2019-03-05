# POC - Redis Sentinel using haproxy

This POC configures an haproxy server in front of a Redis cluster, if one node goes down, the sentinel nodes will select a new master node and the haproxy will forward all the traffic to that node.

## Requirements

· Vagrant

## How to run the setup

1. Clone this repository
2. Run `vagrant up`
3. Open the web browser using [http://192.168.33.10:8080](http://192.168.33.10:8080)

This will show the stats from the current haproxy connections to redis and sentinel.
