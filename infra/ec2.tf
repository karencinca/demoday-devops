resource "aws_launch_template" "app_lt" {
  name_prefix   = "mundo-global-lt-"
  image_id      = "ami-0c02fb55956c7d316"
  instance_type = var.instance_type

  network_interfaces {
    security_groups = [aws_security_group.app_sg.id]
    associate_public_ip_address = true
  }

  user_data = base64encode(file("${path.module}/user_data.sh"))

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "MundoGlobalApp"
    }
  }
}


resource "aws_security_group" "app_sg" {
  name        = "mundo-global-sg"
  description = "Permite acesso a aplicacao e SSH"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-sg"
  }
}
