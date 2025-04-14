# Provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.93.0"
    }
  }
} 

resource "aws_lb" "app_LB" {
  name                       = var.lb_name
  internal                   = var.LB_internal
  load_balancer_type         = var.LB_type
  security_groups            = [aws_security_group.lb_sg.id]
  subnets                    = var.LB_internal ? var.private_subnet_ids : var.public_subnet_ids
  enable_deletion_protection = var.LB_deletion_protction
}
 
resource "aws_lb_target_group" "app_LB_TG" {
  name        = var.target_group_config.name
  port        = var.target_group_config.port
  protocol    = var.target_group_config.protocol
  vpc_id      = var.vpc_id
  target_type = var.Target_type  # Since you're using EC2 instances

  health_check {
    enabled             = var.health_check.enabled
    healthy_threshold   = var.health_check.healthy_threshold
    interval            = var.health_check.interval
    matcher            = var.health_check.matcher
    path               = var.health_check.path
    port               = var.health_check.port
    protocol           = var.health_check.protocol
    timeout            = var.health_check.timeout
    unhealthy_threshold = var.health_check.unhealthy_threshold
  }
}
 
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_LB.arn
  port              = var.listener_config.port
  protocol          = var.listener_config.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_LB_TG.arn
  }
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = var.ASG_name
  lb_target_group_arn   = aws_lb_target_group.app_LB_TG.arn
}

# SECURITY GROUP
resource "aws_security_group" "lb_sg" {
  vpc_id = var.vpc_id
  name   = var.lbSG

  dynamic "ingress" {
    for_each = var.ingress_port
    content {
      description = "description of ingress"
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }
  }
  
  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"                  # "-1" means all protocols
    cidr_blocks = [ "0.0.0.0/0" ]    # Allow all outbound traffic
  }

}

