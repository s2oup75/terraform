provider "aws" {
	access_key = "AKIAUTNLJPZAYH2KENFY"
	secret_key = "fOI0YGUlyL4P7OJcZL6QhlH/gL4F/HEGzf7DxEsB"
	region = "ap-northeast-2"
}
resource "aws_instance" "example" {
	ami = "ami-067c32f3d5b9ace91"
	instance_type = "t2.micro"
	tags = {
		Name = "HelloWorld"
	}
}
