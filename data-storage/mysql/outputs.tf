output "address" {
    description = "connect to DB using this endpoint"
    value = aws_db_instance.example.address
}
output "port" {
    description = "connect  port using this endpoint"
    value = aws_db_instance.example.port
}