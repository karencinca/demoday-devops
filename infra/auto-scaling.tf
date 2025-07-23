resource "aws_autoscaling_group" "app_asg" {
  name                      = "mundo-global-asg"
  max_size                  = 1
  min_size                  = 1
  desired_capacity          = 1

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  vpc_zone_identifier = [
  aws_subnet.public_subnet.id,
  aws_subnet.public_subnet_2.id
  ]
  health_check_type         = "EC2"
  health_check_grace_period = 300

  target_group_arns = [aws_lb_target_group.app_tg.arn]


  # ✅ Bloco de tag correto
  tag {
    key                 = "Name"
    value               = "MundoGlobalApp-ASG"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                    = "scale-up-policy"
  scaling_adjustment      = 1
  adjustment_type         = "ChangeInCapacity"
  cooldown                = 300
  autoscaling_group_name  = aws_autoscaling_group.app_asg.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                    = "scale-down-policy"
  scaling_adjustment      = -1
  adjustment_type         = "ChangeInCapacity"
  cooldown                = 300
  autoscaling_group_name  = aws_autoscaling_group.app_asg.name
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "LowCPUUsageASG"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 20

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app_asg.name
  }

  alarm_description = "Dispara quando o uso da CPU do ASG fica abaixo de 20%"

  # ✅ tags no formato correto (plural, com `=`)
  tags = {
    Name = "CPUAlarmLowASG"
  }

  alarm_actions = [aws_autoscaling_policy.scale_down.arn]
}

resource "aws_cloudwatch_metric_alarm" "cpu_high_alarm_action" {
  alarm_name          = "HighCPUUsageAlarmASG"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app_asg.name
  }

  alarm_description = "Dispara quando o uso da CPU do ASG ultrapassa 70%"

  tags = {
    Name = "CPUAlarmHighASG"
  }

  alarm_actions = [aws_autoscaling_policy.scale_up.arn]
}
