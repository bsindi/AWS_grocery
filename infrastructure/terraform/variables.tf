# Allgemeine Variablen
variable "region" {
  description = "AWS Region, in der deine bestehende EC2-Instanz läuft"
  type        = string
  # Beispiel: "eu-central-1" oder "eu-north-1"
  default     = "eu-central-1"
}

# WICHTIG: ID deiner bestehenden EC2-Instanz
variable "existing_instance_id" {
  description = "ID der bereits existierenden EC2-Instanz (z.B. i-0abc123...)"
  type        = string
}

# Wer darf auf deine Flask-App (Port 5000) zugreifen?
variable "allowed_http_cidr" {
  description = "CIDR, die auf die App (Port 5000) zugreifen darf"
  type        = string
  # Für Tests: alles offen, später enger machen z.B. nur deine IP/32
  default     = "0.0.0.0/0"
}

# DB-User und Passwort für RDS
variable "db_username" {
  description = "Master-Benutzername für die RDS-Datenbank"
  type        = string
}

variable "db_password" {
  description = "Master-Passwort für die RDS-Datenbank"
  type        = string
  sensitive   = true
}

# Größe der RDS-Instanz
variable "db_instance_class" {
  description = "Instanz-Typ für RDS"
  type        = string
  default     = "db.t3.micro"
}

# Speicherplatz für RDS
variable "db_allocated_storage" {
  description = "Zugewiesener Speicher (GiB) für RDS"
  type        = number
  default     = 20
}
