# outputs.tf

output "aws_vpc_id" {
  value = "${aws_vpc.terraform-vpc.id}"
}

output "aws_security_gr_id" {
  value = "${aws_security_group.terraform_private_sg.id}"
}

output "aws_subnet_subnet_1" {
  value = "${aws_subnet.terraform-subnet_1.id}"
}

output "instance_id_list"     { value = ["${aws_instance.ec2_instance.*.id}"] }