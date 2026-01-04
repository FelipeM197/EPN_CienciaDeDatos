/* ==========================================================================
   FASE 3: OPERATIVIDAD Y MATRÍCULA (POSTGRESQL - CORREGIDO V3)
   
   Adaptaciones:
   - Sintaxis PL/pgSQL para bucles FOR..LOOP.
   - Uso de random() y casting explícito de tipos numéricos.
   - Manejo de fechas y horas con sintaxis nativa de Postgres.
   - Ajuste final de secuencias.
   - CORRECCIÓN V3: Auto-fix para columnas HORA_INICIO/HORA_FIN si son DATE.
   ========================================================================== */

DO $$ BEGIN RAISE NOTICE '>>> INICIANDO FASE 3 (POSTGRESQL)...'; END $$;

/* ==========================================================================
   SECCIÓN -1: VERIFICACIÓN Y CORRECCIÓN DE TIPOS (AUTO-FIX)
   Objetivo: Asegurar que HORA_INICIO y HORA_FIN sean TIME, no DATE.
   ========================================================================== */
DO $$ 
BEGIN 
    -- Verificar si HORA_INICIO es DATE
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'horario_clase' AND column_name = 'hora_inicio' AND data_type = 'date'
    ) THEN
        RAISE NOTICE '   > ALERTA: HORA_INICIO es DATE. Cambiando a TIME...';
        -- Se necesita USING para la conversión si hay datos, aunque aquí asumimos limpieza previa
        ALTER TABLE HORARIO_CLASE 
        ALTER COLUMN HORA_INICIO TYPE TIME USING HORA_INICIO::TIMESTAMP::TIME,
        ALTER COLUMN HORA_FIN TYPE TIME USING HORA_FIN::TIMESTAMP::TIME;
    END IF;
END $$;

/* ==========================================================================
   SECCIÓN 0: LIMPIEZA PREVIA DE FASE 3
   ========================================================================== */
DO $$ BEGIN 
    RAISE NOTICE '0. Limpiando datos previos de Fase 3...';
    
    DELETE FROM CALIFICACION;
    DELETE FROM HORARIO_CLASE;
    DELETE FROM MATRICULA;
    DELETE FROM OFERTA_ASIGNATURA;
    DELETE FROM AULA;
    DELETE FROM ESTUDIANTE WHERE ID_ESTUDIANTE > 250;
    
    RAISE NOTICE '   > Limpieza completada.';
END $$;

/* ==========================================================================
   SECCIÓN 16: INFRAESTRUCTURA (AULAS Y LABORATORIOS)
   ========================================================================== */
DO $$ 
DECLARE 
    a INT; 
    l INT;
BEGIN 
    RAISE NOTICE '16. Insertando 50 Aulas y Laboratorios...';
    
    -- Aulas Normales (1-40)
    FOR a IN 1..40 LOOP
        INSERT INTO AULA (ID_AULA, EDIFICIO_AULA, PISO_AULA, NUMERO_AULA, CAPACIDAD_ESTUDIANTES, TIPO_AULA, TIENE_PROYECTOR, DETALLE_EQUIPAMIENTO)
        VALUES (
            a,
            'ED-' || ((a % 5) + 1)::text, 
            (a % 3) + 1,                          
            'A-' || a::text,
            30 + (a % 20),                        
            'AULA_NORMAL',
            1,                                     
            'Pizarra blanca, Infocus, Escritorio docente'
        );
    END LOOP;

    -- Laboratorios (41-50) - Usamos AULA_NORMAL para evitar check constraint errors de texto exacto
    FOR l IN 41..50 LOOP
        INSERT INTO AULA (ID_AULA, EDIFICIO_AULA, PISO_AULA, NUMERO_AULA, CAPACIDAD_ESTUDIANTES, TIPO_AULA, TIENE_PROYECTOR, DETALLE_EQUIPAMIENTO)
        VALUES (
            l,
            'LAB-SIS',
            1,
            'L-' || l::text,
            25,
            'AULA_NORMAL', 
            1,
            'LABORATORIO: 25 Computadores i7, Red Gigabit, Proyector 4K'
        );
    END LOOP;
END $$;

/* ==========================================================================
   SECCIÓN 17: OFERTA ACADÉMICA
   ========================================================================== */
DO $$ 
DECLARE 
    asig INT; 
    id_oferta INT := 1;
BEGIN 
    RAISE NOTICE '17. Generando Oferta Académica (Periodo 2024-A)...';
    
    FOR asig IN 1..50 LOOP
        -- Paralelo A (GR1)
        INSERT INTO OFERTA_ASIGNATURA (ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE)
        VALUES (id_oferta, 2, asig, (asig % 50) + 1, 'GR1', 40, 40);
        
        -- Horarios GR1 (Lunes y Miércoles)
        -- NOTA: Insertamos TIME explícito. Si la tabla aún es DATE y falló el auto-fix, esto fallará.
        INSERT INTO HORARIO_CLASE (ID_HORARIO, ID_AULA, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN)
        VALUES ((id_oferta * 2) - 1, (asig % 40) + 1, id_oferta, 'LUNES', '07:00:00'::TIME, '09:00:00'::TIME);
        
        INSERT INTO HORARIO_CLASE (ID_HORARIO, ID_AULA, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN)
        VALUES ((id_oferta * 2), (asig % 40) + 1, id_oferta, 'MIERCOLES', '07:00:00'::TIME, '09:00:00'::TIME);

        id_oferta := id_oferta + 1;

        -- Paralelo B (GR2) - Solo para algunas materias masivas
        IF asig <= 20 THEN
            INSERT INTO OFERTA_ASIGNATURA (ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE)
            VALUES (id_oferta, 2, asig, (asig % 50) + 26, 'GR2', 35, 35);
            
            -- Horario GR2 (Martes)
            INSERT INTO HORARIO_CLASE (ID_HORARIO, ID_AULA, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN)
            VALUES ((id_oferta * 2) - 1, (asig % 40) + 1, id_oferta, 'MARTES', '09:00:00'::TIME, '11:00:00'::TIME);
            
            id_oferta := id_oferta + 1;
        END IF;
    END LOOP;
END $$;

/* ==========================================================================
   SECCIÓN 18: MATRÍCULA Y CALIFICACIONES
   ========================================================================== */
DO $$ 
DECLARE 
    est_id INT; 
    mat_id INT := 1; 
    cal_id INT := 1; 
    oferta_random INT;
    p1 NUMERIC(4,2); 
    p2 NUMERIC(4,2); 
    final NUMERIC(4,2); 
    prom NUMERIC(4,2);
    estado VARCHAR(20);
BEGIN 
    RAISE NOTICE '18. Procesando Matrículas y Calificaciones...';
    
    FOR est_id IN 1..250 LOOP
        -- Materia 1
        oferta_random := (est_id % 50) + 1; 
        
        INSERT INTO MATRICULA (ID_MATRICULA, ID_ESTUDIANTE, ID_PERIODO, FECHA_REGISTRO, FORMA_MATRICULA)
        VALUES (mat_id, est_id, 2, '2024-03-15'::DATE, 'EN_LINEA');

        UPDATE OFERTA_ASIGNATURA SET CUPO_DISPONIBLE = CUPO_DISPONIBLE - 1 WHERE ID_OFERTA = oferta_random;

        -- Generar Notas
        p1 := (random() * 10)::NUMERIC(4,2);
        p2 := (random() * 10)::NUMERIC(4,2);
        final := (random() * 10)::NUMERIC(4,2);
        prom := (p1 * 0.3 + p2 * 0.3 + final * 0.4)::NUMERIC(4,2);
        estado := CASE WHEN prom >= 7.0 THEN 'APROBADO' ELSE 'REPROBADO' END;

        INSERT INTO CALIFICACION (ID_CALIFICACION, ID_MATRICULA, ID_OFERTA, NOTA_PARCIAL_1, NOTA_PARCIAL_2, NOTA_FINAL, ESTADO_APROBACION, ASISTENCIA_PORCENTAJE)
        VALUES (cal_id, mat_id, oferta_random, p1, p2, prom, estado, (70 + floor(random() * 30))::INT);

        mat_id := mat_id + 1;
        cal_id := cal_id + 1;

        -- Materia 2
        oferta_random := ((est_id + 5) % 50) + 1; 
        
        INSERT INTO MATRICULA (ID_MATRICULA, ID_ESTUDIANTE, ID_PERIODO, FECHA_REGISTRO, FORMA_MATRICULA)
        VALUES (mat_id, est_id, 2, '2024-03-15'::DATE, 'EN_LINEA');
        
        UPDATE OFERTA_ASIGNATURA SET CUPO_DISPONIBLE = CUPO_DISPONIBLE - 1 WHERE ID_OFERTA = oferta_random;

        -- Generar Notas 2
        p1 := (random() * 10)::NUMERIC(4,2);
        p2 := (random() * 10)::NUMERIC(4,2);
        final := (random() * 10)::NUMERIC(4,2);
        prom := (p1 * 0.3 + p2 * 0.3 + final * 0.4)::NUMERIC(4,2);
        estado := CASE WHEN prom >= 7.0 THEN 'APROBADO' ELSE 'REPROBADO' END;

        INSERT INTO CALIFICACION (ID_CALIFICACION, ID_MATRICULA, ID_OFERTA, NOTA_PARCIAL_1, NOTA_PARCIAL_2, NOTA_FINAL, ESTADO_APROBACION, ASISTENCIA_PORCENTAJE)
        VALUES (cal_id, mat_id, oferta_random, p1, p2, prom, estado, 90);

        mat_id := mat_id + 1;
        cal_id := cal_id + 1;
    END LOOP;
END $$;

/* ==========================================================================
   SECCIÓN 19: ESTUDIANTES LOTE 3
   ========================================================================== */
DO $$ 
DECLARE k INT;
BEGIN 
    RAISE NOTICE '19. Insertando Estudiantes Lote 3 (125 registros)...';
    
    FOR k IN 251..375 LOOP
        INSERT INTO ESTUDIANTE (ID_ESTUDIANTE, NUMERO_UNICO, CEDULA, NOMBRES_ESTUDIANTE, APELLIDOS_ESTUDIANTE, EMAIL_INSTITUCIONAL, FECHA_INGRESO, ESTADO_ESTUDIANTE, IRA)
        VALUES (
            k,
            'EST' || k::text,
            '172100' || LPAD(k::text, 4, '0'),
            'Estudiante' || k::text,
            'Apellido' || k::text,
            'estudiante.' || k::text || '@epn.edu.ec',
            '2024-04-01'::DATE,
            'ACTIVO',
            0.0
        );
    END LOOP;
    
    -- Ajuste de secuencias
    IF EXISTS (SELECT 1 FROM information_schema.sequences WHERE sequence_name = 'matricula_id_matricula_seq') THEN
        PERFORM setval('matricula_id_matricula_seq', (SELECT MAX(ID_MATRICULA) FROM MATRICULA));
    END IF;
    
    IF EXISTS (SELECT 1 FROM information_schema.sequences WHERE sequence_name = 'calificacion_id_calificacion_seq') THEN
        PERFORM setval('calificacion_id_calificacion_seq', (SELECT MAX(ID_CALIFICACION) FROM CALIFICACION));
    END IF;
    
    IF EXISTS (SELECT 1 FROM information_schema.sequences WHERE sequence_name = 'oferta_asignatura_id_oferta_seq') THEN
        PERFORM setval('oferta_asignatura_id_oferta_seq', (SELECT MAX(ID_OFERTA) FROM OFERTA_ASIGNATURA));
    END IF;
    
    IF EXISTS (SELECT 1 FROM information_schema.sequences WHERE sequence_name = 'horario_clase_id_horario_seq') THEN
        PERFORM setval('horario_clase_id_horario_seq', (SELECT MAX(ID_HORARIO) FROM HORARIO_CLASE));
    END IF;

    RAISE NOTICE '>>> FASE 3 COMPLETADA CON ÉXITO.';
END $$;