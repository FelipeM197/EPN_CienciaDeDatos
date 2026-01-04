/* ==========================================================================
   FASE 4: ECOSISTEMA FINAL Y DATOS HISTÓRICOS (VERSION BLINDADA V2)
   
   Correcciones Aplicadas:
   1. PORCENTAJES SEGUROS: Se redujo el valor de cobertura de beca de 100.00 
      a 90.00 para evitar desbordamiento (Arithmetic Overflow) en columnas
      definidas con precisión limitada (ej: NUMERIC(4,2) máx 99.99).
   ========================================================================== */

USE fmerino_GestionUniversitaria;
GO

SET NOCOUNT ON;
PRINT '>>> INICIANDO FASE 4: ECOSISTEMA FINAL...';

/* ==========================================================================
   SECCIÓN -1: CORRECCIÓN DE ESTRUCTURA (AUTO-FIX)
   Objetivo: Agregar la relación faltante entre HISTORIAL y ASIGNATURA
   ========================================================================== */
PRINT '-1. Verificando estructura de HISTORIAL_ACADEMICO...';

IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'HISTORIAL_ACADEMICO' AND COLUMN_NAME = 'ID_ASIGNATURA'
)
BEGIN
    PRINT '   > ALERTA: Falta columna ID_ASIGNATURA. Agregándola ahora...';
    ALTER TABLE HISTORIAL_ACADEMICO ADD ID_ASIGNATURA INT NULL;
    
    BEGIN TRY
        ALTER TABLE HISTORIAL_ACADEMICO 
        ADD CONSTRAINT FK_HIST_ASIG 
        FOREIGN KEY (ID_ASIGNATURA) REFERENCES ASIGNATURA(ID_ASIGNATURA);
    END TRY
    BEGIN CATCH
        -- Ignorar si la FK ya existe
    END CATCH
END
GO 

/* ==========================================================================
   SECCIÓN 0: LIMPIEZA PREVIA DE FASE 4
   ========================================================================== */
SET NOCOUNT ON;
PRINT '0. Limpiando datos previos de Fase 4...';

DELETE FROM PRESTAMO;
DELETE FROM LIBRO;
DELETE FROM AUTORIA;
DELETE FROM PUBLICACION;
DELETE FROM COLABORAN_EN;
DELETE FROM PROYECTO_INVESTIGACION;
DELETE FROM ASIGNACION_BECA;
DELETE FROM TIPO_BECA;
DELETE FROM TRIBUNAL_GRADO;
DELETE FROM PROCESO_TITULACION;
DELETE FROM HISTORIAL_ACADEMICO;
DELETE FROM ESTUDIANTE WHERE ID_ESTUDIANTE > 375;

PRINT '   > Limpieza completada. Insertando Ecosistema Final...';

/* ==========================================================================
   SECCIÓN 20: BIBLIOTECA
   ========================================================================== */
PRINT '20. Insertando Biblioteca (300 Libros y Préstamos)...';

-- 20.1 Libros
DECLARE @b INT = 1;
WHILE @b <= 300
BEGIN
    INSERT INTO LIBRO (ID_LIBRO, ISBN, TITULO_LIBRO, AUTOR, EDITORIAL, STOCK_DISPONIBLE)
    VALUES (
        @b,
        '978-' + CAST(1000 + @b AS VARCHAR),
        CASE 
            WHEN @b % 5 = 0 THEN 'Clean Code Vol ' + CAST(@b AS VARCHAR)
            WHEN @b % 5 = 1 THEN 'Calculus Early Transcendentals ' + CAST(@b AS VARCHAR)
            WHEN @b % 5 = 2 THEN 'Physics for Scientists ' + CAST(@b AS VARCHAR)
            WHEN @b % 5 = 3 THEN 'Management Principles ' + CAST(@b AS VARCHAR)
            ELSE 'Data Science Handbook ' + CAST(@b AS VARCHAR)
        END,
        'Autor ' + CAST(@b AS VARCHAR),
        CASE WHEN @b % 2 = 0 THEN 'Pearson' ELSE 'McGraw Hill' END,
        CAST((RAND() * 10) + 1 AS INT)
    );
    SET @b = @b + 1;
END

-- 20.2 Préstamos (100 registros)
DECLARE @p INT = 1;
WHILE @p <= 100
BEGIN
    -- Generamos una fecha base aleatoria y le sumamos 'p' segundos para hacerla única
    DECLARE @fecha_base DATETIME = DATEADD(day, -CAST(RAND()*30 AS INT), '2024-05-01');
    DECLARE @fecha_unica DATETIME = DATEADD(second, @p, @fecha_base);

    INSERT INTO PRESTAMO (FECHA_PRESTAMO, ID_ESTUDIANTE, ID_LIBRO, FECHA_DEVOLUCION_PREVISTA, FECHA_DEVOLUCION_REAL)
    VALUES (
        @fecha_unica,
        CAST((RAND() * 370) + 1 AS INT), 
        CAST((RAND() * 299) + 1 AS INT), 
        DATEADD(day, 15, @fecha_unica),
        CASE WHEN @p % 3 = 0 THEN NULL ELSE DATEADD(day, 10, @fecha_unica) END
    );
    SET @p = @p + 1;
END

/* ==========================================================================
   SECCIÓN 21: INVESTIGACIÓN
   ========================================================================== */
PRINT '21. Insertando Investigación (Proyectos y Publicaciones)...';

DECLARE @proy INT = 1;
WHILE @proy <= 20
BEGIN
    INSERT INTO PROYECTO_INVESTIGACION (ID_PROYECTO, ID_DOCENTE, ID_DEPARTAMENTO, CODIGO_PROYECTO, TITULO_PROYECTO, LINEA_INVESTIGACION, PRESUPUESTO_ASIGNADO, FECHA_INICIO, ESTADO_PROYECTO)
    VALUES (
        @proy,
        (@proy % 20) + 1, 
        (@proy % 15) + 1, 
        'PINV-' + CAST(@proy AS VARCHAR),
        'Proyecto de Investigación ' + CAST(@proy AS VARCHAR),
        CASE WHEN @proy % 2 = 0 THEN 'Inteligencia Artificial' ELSE 'Sostenibilidad' END,
        5000.00 + (@proy * 1000),
        '2023-01-01',
        'EN_EJECUCION'
    );
    
    INSERT INTO COLABORAN_EN (ID_PROYECTO, ID_DOCENTE)
    VALUES (@proy, (@proy % 20) + 21);
    
    SET @proy = @proy + 1;
END

DECLARE @pub INT = 1;
WHILE @pub <= 100
BEGIN
    INSERT INTO PUBLICACION (ID_PUBLICACION, ID_PROYECTO, TITULO_PUBLICACION, DOI, REVISTA)
    VALUES (
        @pub,
        (@pub % 20) + 1,
        'Articulo Cientifico ' + CAST(@pub AS VARCHAR),
        '10.1000/journal.pone.' + CAST(@pub AS VARCHAR),
        CASE WHEN @pub % 2 = 0 THEN 'IEEE Access' ELSE 'Springer Nature' END
    );
    
    INSERT INTO AUTORIA (ID_PUBLICACION, ID_DOCENTE, ORDEN_AUTOR)
    VALUES (@pub, ((@pub % 20) + 1), 1);
    
    SET @pub = @pub + 1;
END

/* ==========================================================================
   SECCIÓN 22: BECAS
   ========================================================================== */
PRINT '22. Asignando Becas...';

INSERT INTO TIPO_BECA (ID_BECA, NOMBRE_BECA) VALUES (1, 'Merito Academico');
INSERT INTO TIPO_BECA (ID_BECA, NOMBRE_BECA) VALUES (2, 'Socioeconomica');
INSERT INTO TIPO_BECA (ID_BECA, NOMBRE_BECA) VALUES (3, 'Deportiva');

DECLARE @beca_count INT = 1;
WHILE @beca_count <= 50
BEGIN
    -- CORRECCIÓN: 
    -- 1. Fecha única sumando segundos.
    -- 2. Porcentaje ajustado a 90.00 para evitar overflow si la columna no soporta 100 (ej: NUMERIC(4,2)).
    DECLARE @fecha_beca DATETIME = DATEADD(second, @beca_count, '2024-01-15 08:00:00');

    INSERT INTO ASIGNACION_BECA (FECHA_ASIGNACION, ID_ESTUDIANTE, ID_BECA, PORCENTAJE_COBERTURA, MONTO_ALIMENTACION)
    VALUES (
        @fecha_beca,
        @beca_count * 2,
        (@beca_count % 3) + 1,
        CASE WHEN (@beca_count % 3) + 1 = 1 THEN 90.00 ELSE 50.00 END, 
        50.00 
    );
    SET @beca_count = @beca_count + 1;
END

/* ==========================================================================
   SECCIÓN 23: TITULACIÓN
   ========================================================================== */
PRINT '23. Creando Procesos de Titulación...';

DECLARE @tit INT = 1;
WHILE @tit <= 30
BEGIN
    INSERT INTO PROCESO_TITULACION (ID_PROCESO, ID_ESTUDIANTE, ID_DOCENTE, MODALIDAD_PROCESO, TEMA_PROPUESTO, FECHA_DEFENSA, NOTA_FINAL_GRADO, ESTADO_PROCESO)
    VALUES (
        @tit,
        @tit,
        (@tit % 50) + 1,
        CASE WHEN @tit % 3 = 0 THEN 'EXAMEN_COMPLEXIVO' ELSE 'TESIS' END,
        'Tema de Tesis Innovador ' + CAST(@tit AS VARCHAR),
        CASE WHEN @tit <= 10 THEN '2024-02-01' ELSE NULL END,
        CASE WHEN @tit <= 10 THEN 9.5 ELSE NULL END,
        CASE WHEN @tit <= 10 THEN 'APROBADO' ELSE 'DESARROLLO' END
    );
    
    INSERT INTO TRIBUNAL_GRADO (ID_PROCESO, ID_DOCENTE) VALUES (@tit, (@tit % 50) + 50);
    
    SET @tit = @tit + 1;
END

/* ==========================================================================
   SECCIÓN 24: HISTORIAL ACADÉMICO (3000 REGISTROS)
   Carga masiva usando SQL Dinámico para evitar errores de compilación
   si la columna ID_ASIGNATURA acababa de ser creada.
   ========================================================================== */
PRINT '24. Generando Historial Académico Masivo (3000 registros)...';

DECLARE @h INT = 1;
DECLARE @h_est INT, @h_per INT, @h_asig INT;
DECLARE @h_nota DECIMAL(4,2);
DECLARE @h_estado VARCHAR(20);
DECLARE @sql_hist NVARCHAR(MAX);

-- Preparamos la sentencia dinámica
SET @sql_hist = N'INSERT INTO HISTORIAL_ACADEMICO (ID_HISTORIAL, ID_ESTUDIANTE, ID_PERIODO, NOTA_DEFINITIVA, ESTADO_MATERIA, ID_ASIGNATURA) VALUES (@p1, @p2, @p3, @p4, @p5, @p6)';

WHILE @h <= 3000
BEGIN
    -- Calcular valores
    SET @h_est = (@h % 300) + 1;
    SET @h_per = 1;
    SET @h_asig = (@h % 50) + 1;
    SET @h_nota = CAST(6 + (RAND() * 4) AS DECIMAL(4,2));
    SET @h_estado = CASE WHEN @h_nota >= 7 THEN 'APROBADO' ELSE 'REPROBADO' END;

    -- Ejecutar inserción dinámica
    EXEC sp_executesql @sql_hist, 
         N'@p1 INT, @p2 INT, @p3 INT, @p4 DECIMAL(4,2), @p5 VARCHAR(20), @p6 INT',
         @h, @h_est, @h_per, @h_nota, @h_estado, @h_asig;

    SET @h = @h + 1;
END

/* ==========================================================================
   SECCIÓN 25: ESTUDIANTES LOTE 4
   ========================================================================== */
PRINT '25. Insertando últimos Estudiantes (Lote 4)...';

DECLARE @k4 INT = 376;
WHILE @k4 <= 500
BEGIN
    INSERT INTO ESTUDIANTE (ID_ESTUDIANTE, NUMERO_UNICO, CEDULA, NOMBRES_ESTUDIANTE, APELLIDOS_ESTUDIANTE, EMAIL_INSTITUCIONAL, FECHA_INGRESO, ESTADO_ESTUDIANTE, IRA)
    VALUES (
        @k4,
        'EST' + CAST(@k4 AS VARCHAR),
        '172200' + RIGHT('0000' + CAST(@k4 AS VARCHAR), 4),
        'Estudiante' + CAST(@k4 AS VARCHAR),
        'Apellido' + CAST(@k4 AS VARCHAR),
        'estudiante.' + CAST(@k4 AS VARCHAR) + '@epn.edu.ec',
        '2024-04-01',
        'ACTIVO',
        0.0
    );
    SET @k4 = @k4 + 1;
END

PRINT '>>> PROYECTO COMPLETADO: 100% DE DATOS INSERTADOS.';
GO