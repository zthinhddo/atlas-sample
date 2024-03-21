variable "pg_user" {
  type = string
  default = "db-user"
}

variable "pg_pass" {
  type = string
  default = "0TFm5fN%23m%3E-r%28%5EH%2A"
}

variable "pg_host" {
  type = string
  default = "34.143.128.35"
}

variable "pg_port" {
  type = string
  default = "5432"
}

variable "pg_db" {
  type = string
  default = "atlas-demo"
}

variable "exclude_list" {
  type = list(string)
  default = ["atlas_schema_revisions"]
}

variable "destructive" {
  type = bool
  default = false
}

env "dev" {
  url = "postgres://${var.pg_user}:${var.pg_pass}@${var.pg_host}:${var.pg_port}/${var.pg_db}"
  migration {
    dir = "file://migrations"
  }
  dev = "docker://postgres/15/atlas-demo"
  exclude = var.exclude_list
  diff {
    skip {
      drop_schema = var.destructive
      drop_table  = var.destructive
    }
  }
  # Detect destructive change in schema
  # Change this if developers want to drop columns/table/schemas locally
  lint {
    destructive {
      error = true
    }
  }
  to = "file://schema.sql"
}