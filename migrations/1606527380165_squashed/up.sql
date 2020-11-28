
CREATE TABLE "public"."image"("id" uuid NOT NULL, "user_id" integer NULL, "url" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"));
CREATE TABLE "public"."post"("id" serial NOT NULL, "user_id" integer NULL, "title" text NOT NULL, "content" text NOT NULL, "image_id" uuid NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("image_id") REFERENCES "public"."image"("id") ON UPDATE cascade ON DELETE set null, UNIQUE ("id"));
ALTER TABLE "public"."post" ALTER COLUMN "image_id" DROP NOT NULL;
ALTER TABLE ONLY "public"."image" ALTER COLUMN "id" SET DEFAULT gen_random_uuid();
