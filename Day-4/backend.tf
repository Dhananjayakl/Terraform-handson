terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "dhananjaya/terraform.tfstate"
    region = "us-east-1"
  }
}
