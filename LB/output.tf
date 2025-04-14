# Load Balancer outputs
output "load_balancer_id" {
  description = "The ID of the Load Balancer"
  value       = aws_lb.app_LB.id
}

output "load_balancer_arn" {
  description = "The ARN of the Load Balancer"
  value       = aws_lb.app_LB.arn
}
  
output "load_balancer_dns_name" {
  description = "The DNS name of the Load Balancer"
  value       = aws_lb.app_LB.dns_name
}

output "load_balancer_zone_id" {
  description = "The canonical hosted zone ID of the Load Balancer"
  value       = aws_lb.app_LB.zone_id
}

# Target Group outputs
output "target_group_arn" {
  description = "The ARN of the Target Group"
  value       = aws_lb_target_group.app_LB_TG.arn
}

output "target_group_name" {
  description = "The name of the Target Group"
  value       = aws_lb_target_group.app_LB_TG.name
}

# # Instance Attachments Output
# output "target_group_attachments" {
#   description = "Details of instances attached to the target group"
#   value = {
#     for attachment in aws_autoscaling_attachment.asg_attachment : attachment.target_id => {
#       port              = attachment.port
#       target_group_arn  = attachment.target_group_arn
#     }
#   }
# }

# ASG Attachment output
output "asg_attachment" {
  description = "Auto Scaling Group attachment details"
  value = {
    autoscaling_group_name = aws_autoscaling_attachment.asg_attachment.autoscaling_group_name
    lb_target_group_arn    = aws_autoscaling_attachment.asg_attachment.lb_target_group_arn
  }
}

# Listener outputs
output "listener_arn" {
  description = "The ARN of the Listener"
  value       = aws_lb_listener.http.arn
}

output "listener_id" {
  description = "The ID of the Listener"
  value       = aws_lb_listener.http.id
}

# Security Group
output "lbsg_id" {
  description = "The ID of security group"
  value = aws_security_group.lb_sg[*].id
} 

