# Iac

* terrafornでawsリソースを管理する
* 初めにtfstate管理用のS3バケットを`create_tfstate_s3_bucket.sh`を用いて作成する
  * tfstate管理用のS3はterraformで管理しない方がよいため

```bash=
$ bash ./create_tfstate_s3_bucket.sh ${buckat_name}
```

