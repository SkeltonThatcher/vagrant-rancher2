#! /bin/bash
yum update -y
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum makecache fast
sudo yum install -y docker-ce-17.06.0.ce-1.el7.centos
sudo systemctl enable docker.service
sudo systemctl start docker
sudo docker run -e CATTLE_HOST_LABELS='Name=vbx-hst' \
	--rm --privileged -v /var/run/docker.sock:/var/run/docker.sock \
	-v /var/lib/rancher:/var/lib/rancher \
	rancher/agent:v2.0-alpha4 http://192.168.50.50:8080/v1/scripts/08E7A124D98AB02233F1:1483142400000:rBrLKo9bzo1qSZfeu1I3UrsXc8
