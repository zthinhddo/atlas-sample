variable "pg_pass" {
  type = string
  default = "123"
}

env "local" {
  url = "postgres://postgres:var.pg_pass@host.docker.internal:5432/workflow_db?sslmode=disable"
}