# main.tf

provider "aws" {
#    access_key = "" ### access_key_id
#    secret_key = "" ### access_pwd_id
    region = var.aws_lab_region
}

## Create VPC ##
resource "aws_vpc" "terraform-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = var.aws_lab_vpc
  }
}

#output "aws_vpc_id" {
#  value = aws_vpc.terraform-vpc.id
#}

## Security Group##
resource "aws_security_group" "terraform_private_sg" {
  description = "Allow limited inbound external traffic"
  vpc_id      = aws_vpc.terraform-vpc.id
  name        = var.aws_lab_sg

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8080
    to_port     = 8080
  }

  egress {
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
  }

  tags = {
    Name = var.aws_lab_tag_sg
  }
}

#output "aws_security_gr_id" {
#  value = aws_security_group.terraform_private_sg.id
#}

## Create Subnets ##
resource "aws_subnet" "terraform-subnet_1" {
  vpc_id     = aws_vpc.terraform-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = var.aws_lab_subnet1
  }
}

#output "aws_subnet_subnet_1" {
#  value = aws_subnet.terraform-subnet_1.id
#}

resource "aws_instance" "ec2_instance" {
    ami = var.aws_lab_ami
	count = var.aws_lab_num_instances
    instance_type = var.aws_lab_instance_type
    vpc_security_group_ids =  [ aws_security_group.terraform_private_sg.id ]
    subnet_id = aws_subnet.terraform-subnet_1.id
	key_name               = var.aws_lab_key_pair 
#   associate_public_ip_address = true
    tags = {
    Name = var.aws_lab_tag_instance["Name",count.index]
    Environment = var.aws_lab_tag_instance["development"]
    Project = var.aws_lab_tag_instance["lab-tf-infra"]
    }
}

# output "instance_id_list"     { value = [aws_instance.ec2_instance.*.id] }
