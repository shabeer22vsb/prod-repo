provider "aws" {
    region = "eu-west-1"
}
data "aws_secretsmanager_secret_version" "db-creds" {
  secret_id = "db-creds"
}
locals {
  db_creds=jsondecode(
    data.aws_secretsmanager_secret_version.db-creds.secret_string
  )
}
module "data-storage"{
  source = "github.com/shabeer22vsb/modules//services/data-storage"
  db_password = local.db_creds.password
  db_username = local.db_creds.username
  db_instance_class = var.db_instance_class
  allocated_storage = var.allocated_storage
  skip_final_snapshot = var.skip_final_snapshot
}
terraform {
  backend "s3" {
    bucket       = "my-tf-practical-bucket-166373406634-eu-west-1-an"
    key          = "prod/data-stores/mysql/terraform.tfstate"
    use_lockfile = true
    region       = "eu-west-1"
  }
}