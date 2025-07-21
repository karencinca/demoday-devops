#!/bin/bash
echo "Iniciando o script de configuração do EC2..." > /home/ec2-user/user_data.txt

set -ex

# Atualiza pacotes
yum update -y

# Instala Docker
amazon-linux-extras enable docker
yum install -y docker

# Inicia o Docker e ativa na inicialização
systemctl start docker
systemctl enable docker

# Adiciona ec2-user ao grupo docker (vai surtir efeito só no próximo login)
usermod -aG docker ec2-user


# Faz pull da imagem e roda o container (sem sudo, pois root já está executando)
docker pull maisabbispo/mundo-global:1.0
docker run -d -p 8080:80 --name mundo-global maisabbispo/mundo-global:1.0

# Confirma execução no arquivo de log
echo "Docker instalado e container iniciado!" >> /home/ec2-user/user_data.txt