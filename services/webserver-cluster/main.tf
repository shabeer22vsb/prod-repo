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
}     
resource "aws_autoscaling_schedule" "scaleout" {
  scheduled_action_name = "scale out during business hours"
  min_size = 2
  max_size = 5
  desired_capacity = 2
  recurrence = "0 9 * * *"
  autoscaling_group_name = module.webserver-cluster.asg_name
}