provider "aws" {
	access_key = "AKIAUTNLJPZAYH2KENFY"
	secret_key = "fOI0YGUlyL4P7OJcZL6QhlH/gL4F/HEGzf7DxEsB"
	region = "ap-northeast-2"
}
#resource "aws_instance" "example" {
#	ami = "ami-067c32f3d5b9ace91"
#	instance_type = "t2.micro"
#	tags = {
#		Name = "HelloWorld3"
#	}
#}
resource "aws_instance" "example" {
	ami = "ami-067c32f3d5b9ace91"
	instance_type = "t2.micro"
	vpc_security_group_ids = ["${aws_security_group.instance.id}"]

	user_data = <<-EOF
			#!/bin/bash
			echo "Hello, World" > index.html
			nohup busybox httpd -f -p 8080 &
			EOF
	tags {
		Name = "terraform-example"
	}
	key_name = "abcd"
}

resource "aws_security_group" "instance" {
	name = "terraform-example-instance"
	ingress {
		from_port = 8080
		to_port = 8080
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
}
