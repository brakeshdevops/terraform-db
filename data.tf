data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "base-with-ansible"
  owners           = ["self"]
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform-rakesh"
    key    = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}
data "aws_secretsmanager_secret" "common" {
  name = "common/ssh"
}

data "aws_secretsmanager_secret_version" "secrets" {
  secret_id = data.aws_secretsmanager_secret.common.id
}