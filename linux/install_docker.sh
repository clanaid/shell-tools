#!/bin/sh
## remove old version
sudo apt remove docker docker-engine docker.io containerd runc

# remove all docker data 
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/docker-ce

sudo apt update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
    
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get -y update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# 配置当前用户对docker的执行权限
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo systemctl restart docker