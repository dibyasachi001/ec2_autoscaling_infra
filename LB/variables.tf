variable "lb_name" {
  description = "Load Balancer name"
  type = string
}

variable "LB_internal" {
  description = "Whether the load balancer serves either internet-facing traffic or internal traffic"
  type = bool
}

variable "LB_type" {
  description = "May be application, network, or gateway"
  type = string
}

# variable "subnet_ids" {
#   description = "IDs of subnets"
#   type = list(string)
# }

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs"
}

variable "LB_deletion_protction" {
  description = "Prevents accidental or unauthorized deletion of a load balancer"
  type = bool
}

variable "vpc_id" {
  description = "ID of VPC"
  type = string
}
 
variable "target_group_config" {
  description = "Configuration for the target group"
  type = object({
    name     = string
    port     = number
    protocol = string
  })
    
  validation {
    condition     = contains(["HTTP", "HTTPS"], var.target_group_config.protocol)
    error_message = "Protocol must be either HTTP or HTTPS."
  }

  validation {
    condition     = var.target_group_config.port >= 1 && var.target_group_config.port <= 65535
    error_message = "Port must be between 1 and 65535."
  }
}

variable "Target_type" {
  description = "Type of target to register with the target group"
  type = string
}

variable "health_check" {
  description = "Health check configuration for the target group"
  type = object({
    enabled             = bool
    healthy_threshold   = number
    interval           = number
    matcher            = string
    path               = string
    port               = string
    protocol           = string
    timeout            = number
    unhealthy_threshold = number
  })
}

variable "listener_config" {
  description = "Configuration for the listener"
  type = object({
    port     = number
    protocol = string
  })
}

variable "ASG_name" {
  description = "ASG name"
  type = string
}

# SECURITY GROUP
variable "lbSG" {
  description = "Security group tags"
  type = string
} 

variable "ingress_port" {
  description = "Ingress port values"
  type = list(number)
} 