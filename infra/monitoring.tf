resource "aws_cloudwatch_log_group" "ec2_logs" {
  name              = "/aws/ec2/mundo-global"
  retention_in_days = 7

  tags = {
    Name = "EC2LogGroup"
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "HighCPUUsage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Dispara quando o uso da CPU ultrapassa 80%"
  dimensions = {
    InstanceId = aws_instance.app_instance.id
  }

  tags = {
    Name = "CPUAlarm"
  }
}
