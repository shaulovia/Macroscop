#!/bin/bash
#ONLY FOR TEST
#Install Macroscop 4.0 in Astra Linux CE 2.12
sudo apt update
sudo apt install libllvm6.0 postgresql-client-common postgresql-common
mkdir psql
wget -P psql/ https://ishaulov.ru/macroscop/astra/postgresql-12_12.14-2_amd64.deb  
wget -P psql/ https://ishaulov.ru/macroscop/astra/postgresql-client-12_12.14-2_amd64.deb 
wget -P psql/ https://ishaulov.ru/macroscop/astra/libpq5_12.14-2_amd64.deb
sudo dpkg -i psql/libpq5_12.14-2_amd64.deb
sudo dpkg -i psql/postgresql-client-12_12.14-2_amd64.deb 
sudo dpkg -i psql/postgresql-12_12.14-2_amd64.deb
sudo rm -rf psql/
sudo wget -O - http://packages.macroscop.com/deb/macroscop.gpg.key | sudo apt-key add - 
sudo wget -P /etc/apt/sources.list.d/ http://packages.macroscop.com/deb/macroscop.list 
sudo apt-get update
sudo apt-get install macroscop -y