output "rds_endpoint" {
  description = "RDS PostgreSQL Endpoint (Hostname)"
  value       = aws_db_instance.postgres.address
}

output "app_sg_id" {
  description = "ID der Security Group für die Flask-App (Port 5000)"
  value       = aws_security_group.app_sg.id
}
