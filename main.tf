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

data "tls_certificate" "github_actions_oidc_provider" {
  url = "https://token.actions.githubusercontent.com/.well-known/openid-configuration"
}

# oidc for github actions
resource "aws_iam_openid_connect_provider" "github_actions_oidc" {
  url = "https://token.actions.githubusercontent.com"
  thumbprint_list = [
    data.tls_certificate.github_actions_oidc_provider.certificates[0].sha1_fingerprint
  ]
  client_id_list = [
    "sts.amazonaws.com"
  ]
}
