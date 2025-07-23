output "load_balancer_dns" {
  description = "DNS público do ALB"
  value       = aws_lb.app_alb.dns_name
}
