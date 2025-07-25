provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://184.72.95.191:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = "b6895f2a-0bf7-d7f0-395c-0a7ff68dcebc"
      secret_id = "db3fad33-f1fd-29f0-b6cd-3dbf0535fbac"
  }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}

resource "aws_instance" "test" {
  ami = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
    tags = {
       secret = data.vault_kv_secret_v2.example.data["username"]
    }
}