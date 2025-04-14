output "autoscaling_group_name" {
  description = "The name of the Auto Scaling Group"
  value       = aws_autoscaling_group.app_asg.name
}  

output "autoscaling_group_id" {
  description = "The ID of the Auto Scaling Group"
  value       = aws_autoscaling_group.app_asg.id
}

output "autoscaling_group_arn" {
  description = "The ARN of the Auto Scaling Group"
  value       = aws_autoscaling_group.app_asg.arn
}
