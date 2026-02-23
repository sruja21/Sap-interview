
output "endpoint" {
  value = aws_db_instance.this.endpoint
}

output "password" {
  value     = random_password.db.result
  sensitive = true
}
