-- Create "users" table
CREATE TABLE "public"."users" (
  "id" bigint NOT NULL,
  "name" character varying NOT NULL,
  PRIMARY KEY ("id")
);
-- Create "repos" table
CREATE TABLE "public"."repos" (
  "id" bigint NOT NULL,
  "name" character varying NOT NULL,
  "owner_id" bigint NOT NULL,
  PRIMARY KEY ("id"),
  CONSTRAINT "owner_id" FOREIGN KEY ("owner_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION
);
