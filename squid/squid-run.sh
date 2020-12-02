#!/bin/sh

echo "Starting SSH Socks5 Proxy"

/etc/init.d/ssh start
ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa
cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
ssh  -o StrictHostKeyChecking=no -fN -D 0.0.0.0:1080 localhost

# Start Squid
echo "Starting Squid"
#svwaitup 10 /service/openvpn || exit 1
exec squid -sN
