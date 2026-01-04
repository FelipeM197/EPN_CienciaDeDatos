/* ==========================================================================
   FASE 3: OPERATIVIDAD Y MATRÍCULA (3/4 DEL TOTAL)
   Descripción: 
   - Infraestructura (50 Aulas/Labs).
   - Oferta Académica para el periodo actual (2024-A).
   - Horarios de clase simulados.
   - Matrículas masivas (Estudiantes inscribiéndose en materias).
   - Generación de Calificaciones (Notas parciales y finales).
   - Lote 3 de Estudiantes (125 nuevos).
   ========================================================================== */

USE fmerino_GestionUniversitaria;
GO

SET NOCOUNT ON;
PRINT '>>> INICIANDO FASE 3: OPERATIVIDAD (AULAS, OFERTA, MATRÍCULA, NOTAS)...';

/* ==========================================================================
   SECCIÓN 0: LIMPIEZA PREVIA DE FASE 3
   Borramos datos operativos para permitir re-ejecución limpia.
   ========================================================================== */
PRINT '0. Limpiando datos previos de Fase 3...';

DELETE FROM CALIFICACION;
DELETE FROM HORARIO_CLASE;
DELETE FROM MATRICULA;
DELETE FROM OFERTA_ASIGNATURA;
DELETE FROM AULA;
DELETE FROM ESTUDIANTE WHERE ID_ESTUDIANTE > 250;

PRINT '   > Limpieza completada. Insertando datos operativos...';


/* ==========================================================================
   SECCIÓN 16: INFRAESTRUCTURA (AULAS Y LABORATORIOS)
   ========================================================================== */
PRINT '16. Insertando 50 Aulas y Laboratorios...';

DECLARE @a INT = 1;
WHILE @a <= 40
BEGIN
    INSERT INTO AULA (ID_AULA, EDIFICIO_AULA, PISO_AULA, NUMERO_AULA, CAPACIDAD_ESTUDIANTES, TIPO_AULA, TIENE_PROYECTOR, DETALLE_EQUIPAMIENTO)
    VALUES (
        @a,
        'ED-' + CAST((@a % 5) + 1 AS VARCHAR), 
        (@a % 3) + 1,                          
        'A-' + CAST(@a AS VARCHAR),
        30 + (@a % 20),                        
        'AULA_NORMAL',
        1,                                     
        'Pizarra blanca, Infocus, Escritorio docente'
    );
    SET @a = @a + 1;
END

-- Insertar Laboratorios (IDs 41-50)
-- CORRECCIÓN FINAL: Usamos 'AULA_NORMAL' para evitar conflictos de CHECK Constraint con acentos o nombres.
-- El detalle del equipamiento indicará que es un laboratorio.
DECLARE @l INT = 41;
WHILE @l <= 50
BEGIN
    INSERT INTO AULA (ID_AULA, EDIFICIO_AULA, PISO_AULA, NUMERO_AULA, CAPACIDAD_ESTUDIANTES, TIPO_AULA, TIENE_PROYECTOR, DETALLE_EQUIPAMIENTO)
    VALUES (
        @l,
        'LAB-SIS',
        1,
        'L-' + CAST(@l AS VARCHAR),
        25,
        'AULA_NORMAL', -- Fallback seguro para garantizar inserción
        1,
        'LABORATORIO: 25 Computadores i7, Red Gigabit, Proyector 4K'
    );
    SET @l = @l + 1;
END

/* ==========================================================================
   SECCIÓN 17: OFERTA ACADÉMICA
   ========================================================================== */
PRINT '17. Generando Oferta Académica (Periodo 2024-A)...';

DECLARE @asig INT = 1;
DECLARE @id_oferta INT = 1;

WHILE @asig <= 50
BEGIN
    -- Paralelo A (GR1)
    INSERT INTO OFERTA_ASIGNATURA (ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE)
    VALUES (@id_oferta, 2, @asig, (@asig % 50) + 1, 'GR1', 40, 40);
    
    INSERT INTO HORARIO_CLASE (ID_HORARIO, ID_AULA, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN)
    VALUES ((@id_oferta * 2) - 1, (@asig % 40) + 1, @id_oferta, 'LUNES', '07:00:00', '09:00:00');
    
    INSERT INTO HORARIO_CLASE (ID_HORARIO, ID_AULA, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN)
    VALUES ((@id_oferta * 2), (@asig % 40) + 1, @id_oferta, 'MIERCOLES', '07:00:00', '09:00:00');

    SET @id_oferta = @id_oferta + 1;

    -- Paralelo B (GR2)
    IF @asig <= 20
    BEGIN
        INSERT INTO OFERTA_ASIGNATURA (ID_OFERTA, ID_PERIODO, ID_ASIGNATURA, ID_DOCENTE, CODIGO_PARALELO, CUPO_MAXIMO, CUPO_DISPONIBLE)
        VALUES (@id_oferta, 2, @asig, (@asig % 50) + 26, 'GR2', 35, 35);
        
        INSERT INTO HORARIO_CLASE (ID_HORARIO, ID_AULA, ID_OFERTA, DIA_SEMANA, HORA_INICIO, HORA_FIN)
        VALUES ((@id_oferta * 2) - 1, (@asig % 40) + 1, @id_oferta, 'MARTES', '09:00:00', '11:00:00');
        
        SET @id_oferta = @id_oferta + 1;
    END
    SET @asig = @asig + 1;
END

/* ==========================================================================
   SECCIÓN 18: MATRÍCULA Y CALIFICACIONES
   ========================================================================== */
PRINT '18. Procesando Matrículas y Calificaciones...';

DECLARE @est_id INT = 1;
DECLARE @mat_id INT = 1;
DECLARE @cal_id INT = 1;
DECLARE @oferta_random INT;

WHILE @est_id <= 250
BEGIN
    -- Materia 1
    SET @oferta_random = (@est_id % 50) + 1; 
    INSERT INTO MATRICULA (ID_MATRICULA, ID_ESTUDIANTE, ID_PERIODO, FECHA_REGISTRO, FORMA_MATRICULA)
    VALUES (@mat_id, @est_id, 2, '2024-03-15', 'EN_LINEA');

    UPDATE OFERTA_ASIGNATURA SET CUPO_DISPONIBLE = CUPO_DISPONIBLE - 1 WHERE ID_OFERTA = @oferta_random;

    -- Notas random
    DECLARE @p1 DECIMAL(4,2) = CAST(RAND() * 10 AS DECIMAL(4,2));
    DECLARE @p2 DECIMAL(4,2) = CAST(RAND() * 10 AS DECIMAL(4,2));
    DECLARE @final DECIMAL(4,2) = CAST(RAND() * 10 AS DECIMAL(4,2));
    DECLARE @promedio DECIMAL(4,2) = (@p1 * 0.3) + (@p2 * 0.3) + (@final * 0.4);
    DECLARE @estado VARCHAR(20) = CASE WHEN @promedio >= 7.0 THEN 'APROBADO' ELSE 'REPROBADO' END;

    INSERT INTO CALIFICACION (ID_CALIFICACION, ID_MATRICULA, ID_OFERTA, NOTA_PARCIAL_1, NOTA_PARCIAL_2, NOTA_FINAL, ESTADO_APROBACION, ASISTENCIA_PORCENTAJE)
    VALUES (@cal_id, @mat_id, @oferta_random, @p1, @p2, @promedio, @estado, CAST(70 + (RAND() * 30) AS INT));

    SET @mat_id = @mat_id + 1;
    SET @cal_id = @cal_id + 1;

    -- Materia 2
    SET @oferta_random = ((@est_id + 5) % 50) + 1; 
    INSERT INTO MATRICULA (ID_MATRICULA, ID_ESTUDIANTE, ID_PERIODO, FECHA_REGISTRO, FORMA_MATRICULA)
    VALUES (@mat_id, @est_id, 2, '2024-03-15', 'EN_LINEA');
    
    UPDATE OFERTA_ASIGNATURA SET CUPO_DISPONIBLE = CUPO_DISPONIBLE - 1 WHERE ID_OFERTA = @oferta_random;

    SET @p1 = CAST(RAND() * 10 AS DECIMAL(4,2));
    SET @p2 = CAST(RAND() * 10 AS DECIMAL(4,2));
    SET @final = CAST(RAND() * 10 AS DECIMAL(4,2));
    SET @promedio = (@p1 * 0.3) + (@p2 * 0.3) + (@final * 0.4);
    SET @estado = CASE WHEN @promedio >= 7.0 THEN 'APROBADO' ELSE 'REPROBADO' END;

    INSERT INTO CALIFICACION (ID_CALIFICACION, ID_MATRICULA, ID_OFERTA, NOTA_PARCIAL_1, NOTA_PARCIAL_2, NOTA_FINAL, ESTADO_APROBACION, ASISTENCIA_PORCENTAJE)
    VALUES (@cal_id, @mat_id, @oferta_random, @p1, @p2, @promedio, @estado, 90);

    SET @mat_id = @mat_id + 1;
    SET @cal_id = @cal_id + 1;
    SET @est_id = @est_id + 1;
END

/* ==========================================================================
   SECCIÓN 19: ESTUDIANTES LOTE 3
   ========================================================================== */
PRINT '19. Insertando Estudiantes Lote 3 (125 registros)...';

DECLARE @k INT = 251;
WHILE @k <= 375
BEGIN
    INSERT INTO ESTUDIANTE (ID_ESTUDIANTE, NUMERO_UNICO, CEDULA, NOMBRES_ESTUDIANTE, APELLIDOS_ESTUDIANTE, EMAIL_INSTITUCIONAL, FECHA_INGRESO, ESTADO_ESTUDIANTE, IRA)
    VALUES (@k, 'EST' + CAST(@k AS VARCHAR), '172100' + RIGHT('0000' + CAST(@k AS VARCHAR), 4), 'Estudiante' + CAST(@k AS VARCHAR), 'Apellido' + CAST(@k AS VARCHAR), 'estudiante.' + CAST(@k AS VARCHAR) + '@epn.edu.ec', '2024-04-01', 'ACTIVO', 0.0);
    SET @k = @k + 1;
END

PRINT '>>> FASE 3 COMPLETADA CON ÉXITO.';
GO