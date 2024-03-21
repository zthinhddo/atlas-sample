CREATE TABLE "users" (
  id SERIAL,
  name VARCHAR (255),
  PRIMARY KEY (id)
);

CREATE TABLE "vessels" (
  vsl_id SERIAL,
  vsl_name VARCHAR (255),
  user_id serial,
  PRIMARY KEY (vsl_id),
  FOREIGN KEY (user_id) REFERENCES "users" (id)
)