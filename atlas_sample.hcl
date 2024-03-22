variable "pg_user" {
  type = string
  default = "db-user"
}

variable "pg_pass" {
  type = string
  # POSTGRES PASSWORD goes here
  default = ""
}

variable "pg_host" {
  type = string
  # POSTGRES HOST goes here
  default = ""
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
  # option: --url: (URL)
  url = "postgres://${var.pg_user}:${var.pg_pass}@${var.pg_host}:${var.pg_port}/${var.pg_db}"
  # option: --dev-url (Placeholder docker container for comparing database schema)
  dev = "docker://postgres/15/atlas-demo"
  # option: -to (migrations directory)
  migration {
    dir = "file://migrations"
  }
  # option: --exclude (list of exclusive tables)
  exclude = var.exclude_list
  # option: diff policy
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
}