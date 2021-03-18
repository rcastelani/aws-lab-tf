# variables.tf

variable "aws_lab_region" {
  description = "def region in main.tf"
  default= "sa-east-1"
}

variable "aws_lab_vpc" {
  description = "def region in main.tf"
  default= "lab-tf-vpc"
}

variable "aws_lab_sg" {
  description = "def region in main.tf"
  default= "lab-tf-sg"
}

variable "aws_lab_tag_sg" {
  description = "def region in main.tf"
  default = "ec2-private-sg"
}

variable "aws_lab_subnet1" {
  description = "def region in main.tf"
  default = "lab-tf-sn1"
}

variable "aws_lab_ami" {
  description = "def region in main.tf"
  default = "ami-01eb71e14cef400e2"
}


variable "aws_lab_num_instances" {
  description = "number of instances to make"
  default = 2
}

variable "aws_lab_instance_type" {
  description = "number of instances to make"
  default = "t2.micro"
}

variable "aws_lab_key_pair" {
  description = "number of instances to make"
  default = "lab-tf-key" 
}

variable "aws_lab_tag_instance" {
    Name    = "lab-tf-ec2-jenkins"
    Environment = "development"
    Project = "lab-tf-infra"
}




# variable "aws_lab_tag_instance" {
#  type = map
#  default = {
#    "Name"  = "lab-tf-ec2-jenkins"
#    "Environment" = "development"
#    "Project" = "lab-tf-infra"
#  }
#}





#variable "aws_lab_tag_instance" {
#  default = {
#      Name              = "lab-tf-ec2-jenkins"
#      Environment       = "development"
#      Project           = "lab-tf-infra"
# }
#}
