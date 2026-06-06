variable "db_username" {
    description = "Username to login DB"
    type = string
    sensitive = true
}
variable "db_password" {
    description = "password to login DB"
    type = string
    sensitive = true
}