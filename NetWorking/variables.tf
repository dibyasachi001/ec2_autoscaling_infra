# VPC 
variable "vpc_name" {
  description = "tags of vpc"
  type = string
}

variable "vpc_cidr" {
  description = "cidr of vpc"
  type = string
}

# SUBNETs
variable "vpc_id" {
  description = "The ID of VPC"
  type = string
}

variable "pub_sub_cidr" {
  description = "List of cidr for public subnet "
  type = list(string)
}

variable "pvt_sub_cidr" {
  description = "List of private subnet cidr"
  type = list(string)
}
 
variable "availability_zones" {
  description = "List of availability_zones"
  type = list(string)
}

# IGW
variable "igw_name" {
  description = "VPC name"
  type = string
}

# EIP
variable  "eip_name" {
  description = "Tag name of EIP"
  type = string
}

# NGW
variable "ngw_name" {
  description = "Tag name of NAT gateway"
  type = string
}

variable "index" {
  description = "Index of the public subnet to use for the NAT Gateway"
  type = number
}

# ROUTE TABLEs
variable "pubrt_name" {
  description = "public route table name"
  type = string
}

variable "pvtrt_name" {
  description = "private route table name"
  type = string
}

variable "subnetids" {
  description = "List of subnet id"
  type = list(string)
}

# variable "public_subnet" {
#   description = "List of public subnet"
#   type = list(string)
# }

# variable "private_subnet" {
#   description = "List of private subnet"
#   type = list(string)
# }
