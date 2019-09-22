CREATE DATABASE api;
\c api

CREATE TABLE IF NOT EXISTS users (
  ID SERIAL PRIMARY KEY,
  name VARCHAR(30),
  email VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS secrets (
  name VARCHAR(30) PRIMARY KEY,
  token VARCHAR(32)
);

INSERT INTO users (name, email)
  VALUES ('Jerry', 'jerry@example.com'), ('George', 'george@example.com');

INSERT INTO secrets (name, token)
  VALUES ('Jerry', 'jerry-token'), ('George', 'george-token');

commit;

\q