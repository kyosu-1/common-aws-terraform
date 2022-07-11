terraform {
  backend "s3" {
    bucket = "kyosu-common-tfstate"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
  required_providers {
    aws = "~>4.0"
  }
}
