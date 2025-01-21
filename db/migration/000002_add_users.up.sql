CREATE TABLE "users" (
  "username" varchar PRIMARY KEY,
  "hashed_password" varchar NOT NULL,
  "full_name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password_changed_at" timestamptz NOT NULL DEFAULT '1970-01-01 00:00:00+00', -- Use a valid default value
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE UNIQUE INDEX ON "accounts" ("owner", "currency");


ALTER TABLE "accounts" ADD FOREIGN KEY ("owner") REFERENCES "users" ("username");