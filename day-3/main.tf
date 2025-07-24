provider "aws" {
    region = "us-east-1"
}

module "test1234" {
    source = "./modules/ec2"
    ami_value = "ami-05ffe3c48a9991133"
    instance_type_value = "t2.micro"

}