#!/bin/bash
rm /etc/apt/sources.list.d/pve-enterprise.list
> /etc/apt/sources.list
echo "#Macroscop, QA
deb http://ftp.debian.org/debian bullseye main contrib
deb http://ftp.debian.org/debian bullseye-updates main contrib
deb http://security.debian.org/debian-security bullseye-security main contrib
deb http://download.proxmox.com/debian/ceph-pacific bullseye main
deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription" >> /etc/apt/sources.list
apt update && apt upgrade -y
touch /etc/modprobe.d/zfs.conf
echo "options zfs zfs_arc_min=256000000
options zfs zfs_arc_max=512000000" >> /etc/modprobe.d/zfs.conf
update-initramfs -u
pve-efiboot-tool refresh
sed -Ezi.bak "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
echo "language: ru" >> /etc/pve/datacenter.cfg && systemctl restart pveproxy.service