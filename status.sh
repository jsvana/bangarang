#!/bin/sh

host=$1

if ping -q -c 1 $host > /dev/null; then
	ping_result="up"
else
	ping_result="down"
fi

ports=$(nmap $host | grep open | sed 's/^\([0-9]\+\)\/.*$/\1/')
ports_open=$(echo $ports | tr " " ",")
port_count=$(echo $ports | sed 's/[^ ]//g' | wc -m)

echo "Ping: $ping_result, number of ports: $port_count, ports: $ports_open"
