-- Modify "users" table
ALTER TABLE "public"."users" ALTER COLUMN "name" TYPE character varying(200), ADD COLUMN "phn_no" integer NULL;
