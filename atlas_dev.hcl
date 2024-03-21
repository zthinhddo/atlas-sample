variable "pg_user" {
  type = string
  default = "postgres"
}

variable "pg_pass" {
  type = string
  default = "123"
}

variable "pg_host" {
  type = string
  default = "localhost"
}

variable "pg_port" {
  type = string
  default = "5432"
}

variable "pg_db" {
  type = string
  default = "workflow_db"
}

env "local" {
  url = "postgres://${var.pg_user}:${var.pg_pass}@${var.pg_host}:${var.pg_port}/${var.pg_db}?sslmode=disable"
}