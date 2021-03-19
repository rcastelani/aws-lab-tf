# variables.tf

variable "aws_lab_region" {
  description = "def region in main.tf"
  default= "sa-east-1"
}

variable "aws_lab_vpc" {
  description = "def vpc name in main.tf"
  default= "lab-tf-vpc"
}

variable "aws_lab_sg" {
  description = "def sec group name in main.tf"
  default= "lab-tf-sg"
}

variable "aws_lab_tag_sg" {
  description = "def sec group tag name in main.tf"
  default = "ec2-private-sg"
}

variable "aws_lab_subnet1" {
  description = "def subnet name in main.tf"
  default = "lab-tf-sn1"
}

variable "aws_lab_ami" {
  description = "def image ami in main.tf"
  default = "ami-01eb71e14cef400e2"
}


variable "aws_lab_num_instances" {
  description = "number of instances to make"
  default = 2
}

variable "aws_lab_instance_type" {
  description = "def instance type name in main.tf"
  default = "t2.micro"
}

variable "aws_lab_key_pair" {
  description = "def keypair name in main.tf"
  default = "lab-tf-key" 
}

variable "aws_lab_tag_instance" {
    description = "def tag of instance name in main.tf"
    type        = string
    default    = "lab-tf-ec2-jenkins"
}
