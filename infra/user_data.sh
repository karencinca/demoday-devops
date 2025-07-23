#!/bin/bash

set -ex

yum update -y

amazon-linux-extras enable docker
yum install -y docker

systemctl start docker
systemctl enable docker

usermod -aG docker ec2-user

docker pull maisabbispo/mundo-global:1.0
docker run -d -p 8080:80 --name mundo-global maisabbispo/mundo-global:1.0
