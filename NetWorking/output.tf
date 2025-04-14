# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}
 
# SUBNET IDs
output "pub_sub_ids" {
  description = "The IDs of public subnets"
  value       = aws_subnet.public_subnet[*].id
}

output "pvt_sub_ids" {
  description = "The IDs of private subnets"
  value       = aws_subnet.private_subnet[*].id
}

# IGW ID
output "aws_internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = aws_internet_gateway.igw.id
}
 
# EIP ID
output "eip_allocation_id" {
  description = "The allocation ID of the Elastic IP."
  value       = aws_eip.Eip.id
}

output "public_ip" {
  description = "The public IP address of the Elastic IP."
  value       = aws_eip.Eip.public_ip
}

# NGW ID
output "natgateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.ngw.id
}

# PUBLIC ROUTE TABLE IDs
output "pubrt_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public_route_table.id
}

#PRIVATE ROUTE TABLE IDs
output "pvtrt_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private_route_table.id
}