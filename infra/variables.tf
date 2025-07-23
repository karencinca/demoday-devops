variable "region" {
  default     = "us-east-1"
  description = "Região da AWS"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Tipo da instância EC2"
}

variable "docker_image" {
  default     = "maisabbispo/mundo-global:1.0"
  description = "Nome da imagem Docker a ser usada"
}

