#!/usr/bin/env sh

echo "allow *.*.*.*" > /etc/rinetd.conf
echo "logfile /dev/stdout" >> /etc/rinetd.conf
echo "$FORWARDING_RULES" | sed "s/; */\n/g" >> /etc/rinetd.conf

rinetd -f -c /etc/rinetd.conf
