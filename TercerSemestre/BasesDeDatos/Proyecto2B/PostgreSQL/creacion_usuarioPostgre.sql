
-- BLOQUE 1: CREACIÓN DEL USUARIO (ROL)
DO $$
BEGIN
  IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'fmerino') THEN
    CREATE ROLE fmerino WITH LOGIN PASSWORD '123' CREATEDB;
    RAISE NOTICE 'Usuario fmerino creado exitosamente.';
  ELSE
    RAISE NOTICE 'El usuario fmerino ya existía.';
  END IF;
END
$$;

-- BLOQUE 2: CREACIÓN DE LA BASE DE DATOS
-- (Ejecutar SOLO esta línea seleccionada)
CREATE DATABASE "fmerino_GestionUniversitaria"
    WITH OWNER = fmerino
    ENCODING = 'UTF8';

-- BLOQUE 3: ASIGNACIÓN DE PRIVILEGIOS TOTALES
GRANT CONNECT ON DATABASE "fmerino_GestionUniversitaria" TO fmerino;
ALTER DATABASE "fmerino_GestionUniversitaria" OWNER TO fmerino;
GRANT ALL PRIVILEGES ON SCHEMA public TO fmerino;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO fmerino;