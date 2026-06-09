provider "aws" {
  region = "eu-west-1"
}
module "webserver-cluster" {
  source  = "../../../modules/services/webserver-cluster"
  cluster_name = "PRODUCTION"
  db_remote_state_bucket = "my-tf-practical-bucket-166373406634-eu-west-1-an"
  db_remote_state_key = "stage/data-stores/prod/mysql/terraform.tfstate"
  instance_type = "t3.large"
  max_size = 2
  min_size = 1
  enable_scaling_policy = true
}     
