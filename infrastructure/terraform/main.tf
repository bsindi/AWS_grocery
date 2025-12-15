########################################
# Provider
########################################

provider "aws" {
  region = var.region
}

########################################
# Bestehende EC2-Instanz + VPC/Subnets
########################################

# Bestehende EC2-Instanz anhand der ID
data "aws_instance" "existing" {
  instance_id = var.existing_instance_id
}

# Subnet der bestehenden Instanz
data "aws_subnet" "of_instance" {
  id = data.aws_instance.existing.subnet_id
}

# VPC der bestehenden Instanz
data "aws_vpc" "of_instance" {
  id = data.aws_subnet.of_instance.vpc_id
}

# Alle Subnetze dieser VPC (für RDS Subnet Group)
data "aws_subnets" "vpc" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.of_instance.id]
  }
}

########################################
# Security Groups
########################################

# Security Group für deine Flask-App (Port 5000)
resource "aws_security_group" "app_sg" {
  name        = "app-5000-sg"
  description = "Erlaubt HTTP auf Port 5000 zur bestehenden EC2-Instanz"
  vpc_id      = data.aws_vpc.of_instance.id

  # HTTP für Flask-App (Port 5000)
  ingress {
    description = "Flask-App Port 5000"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = [var.allowed_http_cidr]
  }

  # Ausgehender Traffic erlaubt
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group für RDS: erlaubt NUR Traffic von der App-SG (least privilege)
resource "aws_security_group" "rds_sg" {
  name        = "rds-from-app-sg"
  description = "Postgres nur von EC2-App-SG"
  vpc_id      = data.aws_vpc.of_instance.id

  ingress {
    description     = "Postgres von App-SG"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

########################################
# RDS Subnet Group
########################################

resource "aws_db_subnet_group" "default" {
  name       = "rds-subnets-existing-vpc"
  subnet_ids = data.aws_subnets.vpc.ids

  tags = {
    Name = "rds-subnets-existing-vpc"
  }
}

########################################
# RDS PostgreSQL Instanz
########################################

resource "aws_db_instance" "postgres" {
  identifier                 = "app-postgres"
  engine                     = "postgres"
  engine_version             = "15"
  instance_class             = var.db_instance_class
  allocated_storage          = var.db_allocated_storage

  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  username = var.db_username
  password = var.db_password

  publicly_accessible     = false
  skip_final_snapshot     = true
  deletion_protection     = false
  backup_retention_period = 1
  multi_az                = false
}
########################################
# SG an bestehende EC2-Instanz anhängen
########################################

# Hängt die neue app_sg an das primäre Network Interface der bestehenden Instanz
resource "aws_network_interface_sg_attachment" "app_sg_attach" {
  security_group_id    = aws_security_group.app_sg.id
  network_interface_id = data.aws_instance.existing.network_interface_id
}
