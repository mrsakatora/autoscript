#!/bin/bash
#Script for server initial setup

clear
echo "Check for new update:"
sleep 2
apt update
apt list --upgradable
sleep 2
apt upgrade -y

clear
echo "Change local timezone:"
sleep 2
ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime
systemctl start systemd-timesyncd
timedatectl
sleep 2

clear
echo "Install speedtest.net:"
sleep 2
curl -s https://install.speedtest.net/app/cli/install.deb.sh | bash
apt install speedtest -y

clear
echo "Install BBRplus+FQ:"
sleep 2
wget https://raw.githubusercontent.com/ylx2016/Linux-NetSpeed/master/tcp.sh && chmod +x tcp.sh && ./tcp.sh
./tcp.sh
reboot