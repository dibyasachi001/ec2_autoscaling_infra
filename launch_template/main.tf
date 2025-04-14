# Provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.93.0"
    }
  }
}  
   
resource "aws_launch_template" "app" {
  name_prefix   = var.launch_template_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.ec2_key_name
  user_data     = base64encode(file(var.temp_user_data))

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.template_sg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.instance_name
    }
  }
} 

# SECURITY GROUP 
resource "aws_security_group" "template_sg" {
  vpc_id = var.vpc_id
  name   = var.template_SG
 
  dynamic "ingress" {
    for_each = var.Template_ingress_port
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



