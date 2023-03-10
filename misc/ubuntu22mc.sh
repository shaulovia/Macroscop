#!/bin/bash
#TEST ONLY
sudo apt-get install curl
curl -s http://packages.macroscop.com/deb/macroscop.gpg.key | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/macroscop.gpg --import &&
sudo chown _apt /etc/apt/trusted.gpg.d/macroscop.gpg
sudo wget -P /etc/apt/sources.list.d/ http://packages.macroscop.com/deb/macroscop.list
sudo apt-get update
mkdir install
wget -P install/ https://ishaulov.ru/macroscop/ubuntu22/libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb
wget -P install/ https://ishaulov.ru/macroscop/ubuntu22/openssl_1.1.1f-1ubuntu2.17_amd64.deb
sudo dpkg -i -P install/libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb
sudo dpkg -i -P install/openssl_1.1.1f-1ubuntu2.17_amd64.deb
rm -rf install/
sudo apt-get install macroscop