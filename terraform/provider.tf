terraform {
  backend "s3" {
    bucket = "rboris-us-east-1-backend"
    key    = "jenkins-class/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      owner = "anar"
      type = "classtime"
    }
  }
}
