 variable "vpc_id" {
   description = "IDs of VPC"
   type = string
 }
  
variable "launch_template_name" {
  description = "Template name"
  type = string
}
  
variable "ami_id" {
  description = "ID of amazon machine Image"
  type = string
} 

variable "instance_type" {
  description = "Type of Instance"
  type = string
}

variable "ec2_key_name" {
  description = "Public key name"
  type = string
} 

variable "instance_name" {
  description = "EC2 instance name"
  type = string
}

variable "temp_user_data" {
  description = "Predefined user data"
  type = string
}

# SECURITY GROUP
variable "template_SG" {
  description = "Security group tags"
  type = string
} 
 
variable "Template_ingress_port" {
  description = "Ingress port values"
  type = list(number)
}  