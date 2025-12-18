output "lb_target_group_id" {
    value = aws_lb_target_group.project-1-lb_target_group.id
}

output "aws_lb_arn" {
    value = aws_lb.project-1-load-balancer.arn
}

output "aws_lb_id" {
    value = aws_lb.project-1-load-balancer.id
}