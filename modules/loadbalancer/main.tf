resource "aws_lb_target_group" "project-1-lb_target_group" {
  name     =  var.target_group_name
  port     =  var.target_group_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold = 2
    interval = 30
    path = "/login"         ##Jenkins had a by fault health check endpoint /health
    matcher = "200"
    port = var.health_check_port
    protocol = var.health_check_protocol
    unhealthy_threshold = 2
  }
    tags = var.custom_tags
}


resource "aws_lb_target_group_attachment" "project-1-lb_target_group_attachment" {
  target_group_arn = aws_lb_target_group.project-1-lb_target_group.arn
  target_id        = var.instance_id
  port             = var.target_group_port
}

resource "aws_lb" "project-1-load-balancer" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.lb_sg_id
  subnets            = var.lb_subnet_id

  enable_deletion_protection = false
/*
  access_logs {
    bucket  = var.lb_accesslog_bucket
    prefix  = "Jenkins-access-logs"
    enabled = true
  }
 */ 

  tags = var.custom_tags
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.project-1-load-balancer.arn
  port              = var.lb_listener_port
  protocol          = var.lb_listener_protocol
 # ssl_policy        = "ELBSecurityPolicy-2016-08"
#  certificate_arn   = var.lb_certificate_arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.project-1-lb_target_group.arn
  }
  tags = var.custom_tags
}