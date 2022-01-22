provider "aws" {
  profile = "default"
  region = "us-east-1"
}

terraform {
  backend "s3" {}
}