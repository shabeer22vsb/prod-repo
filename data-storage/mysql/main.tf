provider "aws" {
    region = "eu-west-1"
}
resource "aws_db_instance" "example" {
  identifier_prefix = "terraform-up-and-running"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t3.micro"
  skip_final_snapshot = true
  db_name = "example_database"

  username = var.db_username
  password = var.db_password
}
terraform {
  backend "s3" {
    bucket       = "my-tf-practical-bucket-166373406634-eu-west-1-an"
    key          = "stage/data-stores/prod/mysql/terraform.tfstate"
    use_lockfile = true
    region       = "eu-west-1"
  }
}