/* ==========================================================================
   FASE 4: ECOSISTEMA FINAL Y DATOS HISTÓRICOS (POSTGRESQL - FINAL V3)
   
   Correcciones CRÍTICAS:
   - SOLUCIÓN DEFINITIVA: Modificar estructura de PRESTAMO para clave primaria compuesta
   - La tabla PRESTAMO solo permite 1 préstamo por día (PK solo FECHA_PRESTAMO)
   ========================================================================== */

DO $$ BEGIN RAISE NOTICE '>>> INICIANDO FASE 4 (POSTGRESQL - FINAL V3)...'; END $$;

/* ==========================================================================
   SECCIÓN 0: LIMPIEZA PREVIA Y MODIFICACIÓN DE ESTRUCTURA
   ========================================================================== */
DO $$ BEGIN 
    RAISE NOTICE '0. Modificando estructura de PRESTAMO y limpiando datos...';
    
    -- 0.1 Eliminar la restricción de clave primaria actual
    ALTER TABLE PRESTAMO DROP CONSTRAINT IF EXISTS PK_PRESTAMO;
    
    -- 0.2 Agregar un campo ID único para préstamos
    ALTER TABLE PRESTAMO ADD COLUMN IF NOT EXISTS ID_PRESTAMO SERIAL;
    
    -- 0.3 Establecer nueva clave primaria compuesta
    ALTER TABLE PRESTAMO ADD CONSTRAINT PK_PRESTAMO 
    PRIMARY KEY (ID_PRESTAMO);
    
    -- 0.4 Limpiar datos previos
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
    
    RAISE NOTICE '   > Estructura de PRESTAMO corregida y limpieza completada.';
END $$;

/* ==========================================================================
   SECCIÓN 20: BIBLIOTECA (CON ESTRUCTURA CORREGIDA)
   ========================================================================== */
DO $$ 
DECLARE 
    b INT; 
    p INT; 
    fecha_prestamo DATE;
    hora_prestamo TIME;
BEGIN 
    RAISE NOTICE '20. Insertando Biblioteca (300 Libros y Préstamos)...';
    
    -- 20.1 Libros
    FOR b IN 1..300 LOOP
        INSERT INTO LIBRO (ID_LIBRO, ISBN, TITULO_LIBRO, AUTOR, EDITORIAL, STOCK_DISPONIBLE)
        VALUES (
            b,
            '978-' || (1000 + b)::text,
            CASE 
                WHEN b % 5 = 0 THEN 'Clean Code Vol ' || b
                WHEN b % 5 = 1 THEN 'Calculus Early Transcendentals ' || b
                WHEN b % 5 = 2 THEN 'Physics for Scientists ' || b
                WHEN b % 5 = 3 THEN 'Management Principles ' || b
                ELSE 'Data Science Handbook ' || b
            END,
            'Autor ' || b,
            CASE WHEN b % 2 = 0 THEN 'Pearson' ELSE 'McGraw Hill' END,
            (floor(random() * 10) + 1)::INT
        );
    END LOOP;

    -- 20.2 Préstamos (100 registros) - AHORA CON ESTRUCTURA CORREGIDA
    -- Usamos fecha + hora para simular préstamos reales
    FOR p IN 1..100 LOOP
        -- Cada préstamo en una fecha diferente para evitar problemas
        fecha_prestamo := '2024-05-01'::DATE + (p - 1) * INTERVAL '1 day';
        -- Hora aleatoria entre 8:00 y 18:00
        hora_prestamo := '08:00'::TIME + (floor(random() * 600) || ' minutes')::INTERVAL;
        
        -- NOTA: Ahora la tabla tiene ID_PRESTAMO automático (SERIAL)
        INSERT INTO PRESTAMO (FECHA_PRESTAMO, ID_ESTUDIANTE, ID_LIBRO, FECHA_DEVOLUCION_PREVISTA, FECHA_DEVOLUCION_REAL)
        VALUES (
            fecha_prestamo,
            (floor(random() * 370) + 1)::INT, 
            (floor(random() * 299) + 1)::INT, 
            fecha_prestamo + INTERVAL '15 days',
            CASE WHEN p % 3 = 0 THEN NULL ELSE fecha_prestamo + INTERVAL '10 days' END
        );
    END LOOP;
END $$;

/* ==========================================================================
   SECCIÓN 21: INVESTIGACIÓN
   ========================================================================== */
DO $$ 
DECLARE 
    proy INT; 
    pub INT;
BEGIN 
    RAISE NOTICE '21. Insertando Investigación (Proyectos y Publicaciones)...';
    
    -- 21.1 Proyectos
    FOR proy IN 1..20 LOOP
        INSERT INTO PROYECTO_INVESTIGACION (ID_PROYECTO, ID_DOCENTE, ID_DEPARTAMENTO, CODIGO_PROYECTO, TITULO_PROYECTO, LINEA_INVESTIGACION, PRESUPUESTO_ASIGNADO, FECHA_INICIO, ESTADO_PROYECTO)
        VALUES (
            proy,
            (proy % 20) + 1, 
            (proy % 15) + 1, 
            'PINV-' || proy::text,
            'Proyecto de Investigación ' || proy,
            CASE WHEN proy % 2 = 0 THEN 'Inteligencia Artificial' ELSE 'Sostenibilidad' END,
            5000.00 + (proy * 1000),
            '2023-01-01'::DATE,
            'EN_EJECUCION'
        );
        
        INSERT INTO COLABORAN_EN (ID_PROYECTO, ID_DOCENTE)
        VALUES (proy, (proy % 20) + 21);
    END LOOP;

    -- 21.2 Publicaciones
    FOR pub IN 1..100 LOOP
        INSERT INTO PUBLICACION (ID_PUBLICACION, ID_PROYECTO, TITULO_PUBLICACION, DOI, REVISTA)
        VALUES (
            pub,
            (pub % 20) + 1,
            'Articulo Cientifico ' || pub,
            '10.1000/journal.pone.' || pub,
            CASE WHEN pub % 2 = 0 THEN 'IEEE Access' ELSE 'Springer Nature' END
        );
        
        INSERT INTO AUTORIA (ID_PUBLICACION, ID_DOCENTE, ORDEN_AUTOR)
        VALUES (pub, ((pub % 20) + 1), 1);
    END LOOP;
END $$;

/* ==========================================================================
   SECCIÓN 22: BECAS
   ========================================================================== */
DO $$ 
DECLARE 
    beca_count INT; 
    fecha_beca TIMESTAMP;
BEGIN 
    RAISE NOTICE '22. Asignando Becas...';
    
    INSERT INTO TIPO_BECA (ID_BECA, NOMBRE_BECA) VALUES (1, 'Merito Academico');
    INSERT INTO TIPO_BECA (ID_BECA, NOMBRE_BECA) VALUES (2, 'Socioeconomica');
    INSERT INTO TIPO_BECA (ID_BECA, NOMBRE_BECA) VALUES (3, 'Deportiva');

    FOR beca_count IN 1..50 LOOP
        -- Fecha única usando días secuenciales
        fecha_beca := '2024-01-15'::DATE + (beca_count || ' days')::INTERVAL;
        
        INSERT INTO ASIGNACION_BECA (FECHA_ASIGNACION, ID_ESTUDIANTE, ID_BECA, PORCENTAJE_COBERTURA, MONTO_ALIMENTACION)
        VALUES (
            fecha_beca,
            beca_count * 2,
            (beca_count % 3) + 1,
            CASE WHEN (beca_count % 3) + 1 = 1 THEN 90.00 ELSE 50.00 END,
            50.00
        );
    END LOOP;
END $$;

/* ==========================================================================
   SECCIÓN 23: TITULACIÓN
   ========================================================================== */
DO $$ 
DECLARE 
    tit INT;
BEGIN 
    RAISE NOTICE '23. Creando Procesos de Titulación...';
    
    FOR tit IN 1..30 LOOP
        INSERT INTO PROCESO_TITULACION (ID_PROCESO, ID_ESTUDIANTE, ID_DOCENTE, MODALIDAD_PROCESO, TEMA_PROPUESTO, FECHA_DEFENSA, NOTA_FINAL_GRADO, ESTADO_PROCESO)
        VALUES (
            tit,
            tit, -- Estudiante
            (tit % 50) + 1, -- Docente Tutor
            CASE WHEN tit % 3 = 0 THEN 'EXAMEN_COMPLEXIVO' ELSE 'TESIS' END,
            'Tema de Tesis Innovador ' || tit,
            CASE WHEN tit <= 10 THEN '2024-02-01'::DATE ELSE NULL END,
            CASE WHEN tit <= 10 THEN 9.5 ELSE NULL END,
            CASE WHEN tit <= 10 THEN 'APROBADO' ELSE 'DESARROLLO' END
        );
        
        INSERT INTO TRIBUNAL_GRADO (ID_PROCESO, ID_DOCENTE) VALUES (tit, (tit % 50) + 50);
    END LOOP;
END $$;

/* ==========================================================================
   SECCIÓN 24: HISTORIAL ACADÉMICO (3000 REGISTROS)
   ========================================================================== */
DO $$ 
DECLARE 
    h INT;
    h_est INT; h_asig INT; h_nota NUMERIC(4,2); h_estado VARCHAR(20);
BEGIN 
    RAISE NOTICE '24. Generando Historial Académico Masivo...';
    
    FOR h IN 1..3000 LOOP
        h_est := (h % 300) + 1;
        h_asig := (h % 50) + 1;
        h_nota := (6 + random() * 4)::NUMERIC(4,2);
        h_estado := CASE WHEN h_nota >= 7 THEN 'APROBADO' ELSE 'REPROBADO' END;

        INSERT INTO HISTORIAL_ACADEMICO (ID_HISTORIAL, ID_ESTUDIANTE, ID_PERIODO, NOTA_DEFINITIVA, ESTADO_MATERIA, ID_ASIGNATURA)
        VALUES (
            h,
            h_est,
            1, -- Periodo anterior
            h_nota,
            h_estado,
            h_asig
        );
    END LOOP;
END $$;

/* ==========================================================================
   SECCIÓN 25: ESTUDIANTES LOTE 4
   ========================================================================== */
DO $$ 
DECLARE k4 INT;
BEGIN 
    RAISE NOTICE '25. Insertando últimos Estudiantes (Lote 4)...';
    
    FOR k4 IN 376..500 LOOP
        INSERT INTO ESTUDIANTE (ID_ESTUDIANTE, NUMERO_UNICO, CEDULA, NOMBRES_ESTUDIANTE, APELLIDOS_ESTUDIANTE, EMAIL_INSTITUCIONAL, FECHA_INGRESO, ESTADO_ESTUDIANTE, IRA)
        VALUES (
            k4,
            'EST' || k4,
            '172200' || LPAD(k4::text, 4, '0'),
            'Estudiante' || k4,
            'Apellido' || k4,
            'estudiante.' || k4 || '@epn.edu.ec',
            '2024-04-01'::DATE,
            'ACTIVO',
            0.0
        );
    END LOOP;
    
    RAISE NOTICE '>>> FASE 4 COMPLETADA CON ÉXITO.';
END $$;

/* ==========================================================================
   CORRECCIÓN FINAL: SINCRONIZACIÓN DE SECUENCIAS (VERSIÓN BUCLE)
   Objetivo: Alinear los contadores (Sequences) con los datos insertados.
   Corrección: Se eliminó el PROCEDURE anidado (no soportado en DO blocks)
   y se reemplazó por una iteración sobre valores.
   ========================================================================== */

DO $$
DECLARE
    -- Variable para iterar sobre la lista de tablas/secuencias
    rec RECORD;
    secuencia_nombre TEXT;
BEGIN
    RAISE NOTICE 'Ajustando secuencias con nombres heredados de Oracle...';

    -- Iteramos sobre una lista virtual de (Secuencia, Tabla, Columna_PK)
    FOR rec IN SELECT * FROM (VALUES 
        ('SEQ_LIBRO', 'libro', 'id_libro'),
        ('SEQ_PROYECTO', 'proyecto_investigacion', 'id_proyecto'),
        ('SEQ_PUBLICACION', 'publicacion', 'id_publicacion'),
        ('SEQ_TIPO_BECA', 'tipo_beca', 'id_beca'),
        ('SEQ_PROCESO_TIT', 'proceso_titulacion', 'id_proceso'),
        ('SEQ_HISTORIAL', 'historial_academico', 'id_historial'),
        ('SEQ_ESTUDIANTE', 'estudiante', 'id_estudiante'),
        ('SEQ_DOCENTE', 'docente', 'id_docente'),
        ('SEQ_MATRICULA', 'matricula', 'id_matricula'),
        ('SEQ_OFERTA', 'oferta_asignatura', 'id_oferta'),
        ('SEQ_AULA', 'aula', 'id_aula')
    ) AS t(nombre_seq, nombre_tabla, nombre_columna)
    LOOP
        secuencia_nombre := lower(rec.nombre_seq);

        -- 1. Si la secuencia no existe, la creamos
        IF NOT EXISTS (SELECT FROM pg_class WHERE relname = secuencia_nombre) THEN
            EXECUTE format('CREATE SEQUENCE %I START WITH 1 INCREMENT BY 1', secuencia_nombre);
            RAISE NOTICE 'Secuencia creada: %', secuencia_nombre;
        END IF;

        -- 2. Ajustamos el valor actual al MAX ID de la tabla
        -- Usamos COALESCE(..., 1) para que si la tabla está vacía, la secuencia empiece en 1
        EXECUTE format('SELECT setval(''%I'', COALESCE((SELECT MAX(%I) FROM %I), 1))', 
                        secuencia_nombre, rec.nombre_columna, rec.nombre_tabla);
        
        -- 3. Vinculamos la columna a la secuencia (DEFAULT nextval)
        -- Capturamos error por si ya tiene un default asignado
        BEGIN
            EXECUTE format('ALTER TABLE %I ALTER COLUMN %I SET DEFAULT nextval(''%I'')', 
                            rec.nombre_tabla, rec.nombre_columna, secuencia_nombre);
        EXCEPTION WHEN OTHERS THEN
            NULL; -- Ignorar si ya tiene default
        END;
    END LOOP;

    -- Caso especial: PRESTAMO (Ya usa una secuencia SERIAL estándar de Postgres)
    -- Solo necesitamos ajustarla, no crearla
    IF EXISTS (SELECT FROM pg_class WHERE relname = 'prestamo_id_prestamo_seq') THEN
        PERFORM setval('prestamo_id_prestamo_seq', COALESCE((SELECT MAX(id_prestamo) FROM prestamo), 1));
        RAISE NOTICE 'Secuencia de PRESTAMO ajustada.';
    END IF;

    RAISE NOTICE '>>> TODAS LAS SECUENCIAS HAN SIDO SINCRONIZADAS CORRECTAMENTE.';
END $$;