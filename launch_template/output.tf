output "launch_template_name" {
  description = "The name of the launch template"
  value       = aws_launch_template.app.name
}

output "launch_template_id" {
  description = "The ID of the launch template"
  value       = aws_launch_template.app.id
}
 
output "launch_template_arn" {
  description = "The ARN of the launch template"
  value       = aws_launch_template.app.arn
}
  
output "launch_template_latest_version" {
  description = "The latest version of the launch template"
  value       = aws_launch_template.app.latest_version
}

output "launch_template_default_version" {
  description = "The default version of the launch template"
  value       = aws_launch_template.app.default_version
} 

# Security Group
output "templatesg_id" {
  description = "The ID of security group"
  value = aws_security_group.template_sg[*].id
} 
 