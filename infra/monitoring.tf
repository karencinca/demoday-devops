resource "aws_cloudwatch_log_group" "ec2_logs" {
  name              = "/aws/ec2/mundo-global"
  retention_in_days = 7

  tags = {
    Name = "EC2LogGroup"
  }
}
