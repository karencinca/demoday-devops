resource "aws_instance" "app_instance" {
  ami                         = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = true
  user_data                   = file("${path.module}/user_data.sh")
  
  tags = {
    Name = "MundoGlobalApp"
  }
}