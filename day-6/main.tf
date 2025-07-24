# provider "aws" {
#     region = "us-east-1"
# }

# module "test4321" {
#     source = "./modules/ec2"
#     ami_value = "ami-05ffe3c48a9991133"
#     instance_type_value = "t2.micro"
# }

provider "aws" {
    region = "us-east-1"
}

variable "ami_value" {
    description = "value"
}

variable "instance_type" {
    description = "this the value for ami"
    type = map(string)


default = {
    "dev" = "t2.micro"
    "prod" = "t2222.micro"
}
}

variable "instance_name" {
    description = "this is instance name"
    type = map(string)

default = {
    "dev" = "dev_instance"
    "prod" = "prod_instance"
}
}

module "ec2" {
    source = "./modules/ec2"
    ami = var.ami_value
    instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
    instance_name = lookup(var.instance_name, terraform.workspace, "why")
}