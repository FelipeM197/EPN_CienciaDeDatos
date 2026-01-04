/* =============================================================================
   SCRIPT MAESTRO: CREACIÓN DE ENTORNO EN SQL SERVER
   Objetivo: Crear Base de Datos, Usuario fmerino y asignar permisos.
   
   INSTRUCCIONES:
   1. Ejecutar conectado como Administrador (Autenticación de Windows).
   2. Si la base de datos ya existe, el script la detecta y no la borra.
   3. Si el usuario ya existe, se asegura de que tenga la contraseña '123'.
   ============================================================================= */

USE master;
GO

-- 1. CREAR LA BASE DE DATOS (Si no existe)
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'GestionUniversitaria')
BEGIN
    CREATE DATABASE [GestionUniversitaria];
    PRINT '>>> Base de datos GestionUniversitaria creada exitosamente.';
END
ELSE
BEGIN
    PRINT '>>> La base de datos GestionUniversitaria ya existe. Se usará la existente.';
END
GO

-- 2. CREAR EL LOGIN DEL SERVIDOR (Nivel Instancia)
-- Esto permite que fmerino se autentique en SQL Server
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'fmerino')
BEGIN
    -- Se crea con contraseña '123', sin expiración y sin políticas estrictas
    CREATE LOGIN [fmerino] WITH PASSWORD = N'123', 
    DEFAULT_DATABASE = [GestionUniversitaria], 
    CHECK_EXPIRATION = OFF, 
    CHECK_POLICY = OFF;
    PRINT '>>> Login fmerino creado en el servidor.';
END
ELSE
BEGIN
    -- Si ya existe, nos aseguramos que la contraseña sea '123'
    ALTER LOGIN [fmerino] WITH PASSWORD = N'123';
    PRINT '>>> Login fmerino ya existía. Contraseña restablecida a 123.';
END
GO

-- 3. CREAR EL USUARIO DE BASE DE DATOS (Nivel DB)
-- Conectamos el Login del servidor con la Base de Datos específica
USE [GestionUniversitaria];
GO

IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'fmerino')
BEGIN
    CREATE USER [fmerino] FOR LOGIN [fmerino];
    PRINT '>>> Usuario de base de datos fmerino creado.';
END
GO

-- 4. ASIGNAR PERMISOS TOTALES (Rol db_owner)
-- En SQL Server, db_owner equivale a tener todos los permisos sobre esa DB
-- (CREATE TABLE, VIEW, PROCEDURE, DROP, SELECT, INSERT, etc.)
ALTER ROLE [db_owner] ADD MEMBER [fmerino];
PRINT '>>> Rol db_owner asignado a fmerino (Permisos Totales).';
GO

-- 5. ASIGNAR PERMISOS EXPLÍCITOS (Para cumplir requisitos académicos estrictos)
-- Aunque db_owner ya los tiene, a veces se pide ver el GRANT explícito.
GRANT CREATE TABLE TO [fmerino];
GRANT CREATE VIEW TO [fmerino];
GRANT CREATE PROCEDURE TO [fmerino];
GRANT CREATE FUNCTION TO [fmerino];
GRANT CREATE SYNONYM TO [fmerino];
GRANT CREATE TYPE TO [fmerino];
-- GRANT CREATE SEQUENCE no es necesario, viene con el esquema, pero db_owner lo cubre.

PRINT '=============================================================';
PRINT ' ENTORNO LISTO EN SQL SERVER ';
PRINT ' Base de Datos: GestionUniversitaria';
PRINT ' Usuario: fmerino / Password: 123';
PRINT ' Permisos: Dueño (db_owner) + Permisos explícitos de creación';
PRINT '=============================================================';
GO