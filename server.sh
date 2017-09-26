#! /bin/bash
yum update -y
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum makecache fast
sudo yum install -y docker-ce-17.06.0.ce-1.el7.centos
sudo systemctl enable docker.service
sudo systemctl start docker
sudo docker run -d --restart=unless-stopped -p 8080:8080 rancher/server:preview
