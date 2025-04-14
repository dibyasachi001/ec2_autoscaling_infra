 variable "vpc_id" {
   description = "IDs of VPC"
   type = string
 }

variable "launch_template_id" {
  description = "ID of the launch template"
  type        = string
}

 variable "ASG_name" {
   description = "Autoscaling group name"
   type = string
 }

 variable "desired_capacity" {
  description = "The desired number of EC2 instances in the Auto Scaling Group"
  type        = number
}

variable "min_size" {
  description = "The minimum number of EC2 instances in the Auto Scaling Group"
  type        = number
}
 
variable "max_size" {
  description = "The maximum number of EC2 instances in the Auto Scaling Group"
  type        = number
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Auto Scaling Group"
  type        = list(string)
}
 
variable "tg_arns" {
  description = "List of target group ARNs"
  type        = list(string)
  default     = []  # Providing a default empty list
}
