# Provider 
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.93.0"
    }
  }
}   
  
resource "aws_autoscaling_group" "app_asg" {
  name                 = var.ASG_name
  desired_capacity     = var.desired_capacity
  min_size             = var.min_size
  max_size             = var.max_size
  vpc_zone_identifier  = var.subnet_ids
  target_group_arns   = var.tg_arns
  health_check_type    = "EC2"

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }
} 


