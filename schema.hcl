table "users" {
  schema = schema.public
  column "id" {
    null = false
    type = serial
  }
  column "name" {
    null = true
    type = character_varying(255)
  }
  primary_key {
    columns = [column.id]
  }
}
table "vessels" {
  schema = schema.public
  column "vsl_id" {
    null = false
    type = serial
  }
  column "user_id" {
    null = false
    type = serial
  }
  primary_key {
    columns = [column.vsl_id]
  }
  foreign_key "vessels_user_id_fkey" {
    columns     = [column.user_id]
    ref_columns = [table.users.column.id]
    on_update   = NO_ACTION
    on_delete   = NO_ACTION
  }
}
schema "public" {
  comment = "standard public schema"
}
