begin;

DO
$do$
BEGIN
  IF NOT EXISTS (
    SELECT                       -- SELECT list can stay empty for this
    FROM   pg_catalog.pg_roles
    WHERE  rolname = 'me') THEN

      CREATE ROLE me LOGIN PASSWORD 'password';
      ALTER ROLE me CREATEDB;
      
  END IF;
END
$do$;

commit;

\du
\q