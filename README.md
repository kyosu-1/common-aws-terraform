# common-aws-terraform

全プロダクトで共通利用するようなawsリソースをterraformで管理する

## usage

別のtfstateで管理しているterraformで利用する際には以下のようにしてdataリソースを使う

```
data "terraform_remote_state" "common_resource" {
  backend = "s3"

  config = {
    bucket = "kyosu-common-tfstate"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}
```

するとouputsで定義された値を参照できる

```
data.terraform_remote_state.common_resource.outputs.github_actions_oidc_arn
```
