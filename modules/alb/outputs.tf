output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "frontend_tg_name" {
  value = aws_lb_target_group.frontend.name
}
