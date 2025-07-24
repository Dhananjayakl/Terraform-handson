provider "aws" {
    region = "us-east-1"
}

# variable "ami" {
#     description = "this is ami forthe instance"
# }

# variable "instance_type" {
#     description = " instance_type "
# }


resource "aws_instance" "examlple"{
    ami = var.ami
    instance_type = var.instance_type
    tags = {
        Name = var.instance_name
    }
}