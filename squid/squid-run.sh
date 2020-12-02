#!/bin/sh

echo "Starting SSH Socks5 Proxy"
exec ssh -fN -D 8080 localhost

# Start Squid
echo "Starting Squid"
#svwaitup 10 /service/openvpn || exit 1
exec squid -sN
