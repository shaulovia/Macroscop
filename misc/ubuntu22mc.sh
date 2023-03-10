#!/bin/bash
sudo apt-get install curl &&
curl -s http://packages.macroscop.com/deb/macroscop.gpg.key | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/macroscop.gpg --import &&
sudo chown _apt /etc/apt/trusted.gpg.d/macroscop.gpg
sudo wget -P /etc/apt/sources.list.d/ http://packages.macroscop.com/deb/macroscop.list
sudo apt-get update
mkdir install
wget -P install/ http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb
wget -P install/ http://security.ubuntu.com/ubuntu/pool/main/o/openssl/openssl_1.1.1f-1ubuntu2.17_amd64.deb
rm -rf install/
sudo dpkg -i -P install/libssl1.1_1.1.0g-2ubuntu4_amd64.deb
sudo dpkg -i -P openssl_1.1.1f-1ubuntu2.17_amd64.deb