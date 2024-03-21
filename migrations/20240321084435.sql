-- Create "users" table
CREATE TABLE "public"."users" ("id" serial NOT NULL, "name" character varying(255) NULL, PRIMARY KEY ("id"));
-- Create "vessels" table
CREATE TABLE "public"."vessels" ("vsl_id" serial NOT NULL, "vsl_name" character varying(255) NULL, "user_id" serial NOT NULL, PRIMARY KEY ("vsl_id"), CONSTRAINT "vessels_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION);
