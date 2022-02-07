#!/bin/bash
if [ ! -x /var/lib/docker ]; 
then
  echo "INSTALLING docker"
	sudo yum install -y yum-utils
	sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
	sudo yum install docker-ce docker-ce-cli containerd.io
	sudo systemctl start docker && sudo systemctl enable docker
	sudo usermod -aG docker $(whoami)
	sudo systemctl restart docker
  echo "docker successfully installed"
else
  echo "DOCKER ALREADY INSTALLED"
fi