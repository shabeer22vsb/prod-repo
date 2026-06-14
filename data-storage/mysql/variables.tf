
variable "db_instance_class"{
    description = "DB instance type"
    type = string
    default = "db.t3.micro"
}
variable "allocated_storage" {
    description = "DB storage size"
    type = number
    default = 10
}
variable "skip_final_snapshot" {
    description = "need to skip final snapshor or not"
    type = bool
    default = true
}