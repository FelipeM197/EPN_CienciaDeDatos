/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     22/11/2025 17:53:32                          */
/*==============================================================*/


ALTER TABLE ASIGNACION_BECA
   DROP CONSTRAINT FK_ASIGNACI_ES_TIPO_B_TIPO_BEC;

ALTER TABLE ASIGNACION_BECA
   DROP CONSTRAINT FK_ASIGNACI_RECIBE_BE_ESTUDIAN;

ALTER TABLE AUTORIA
   DROP CONSTRAINT FK_AUTORIA_ESCRIBE_A_DOCENTE;

ALTER TABLE AUTORIA
   DROP CONSTRAINT FK_AUTORIA_TIENE_AUT_PUBLICAC;

ALTER TABLE CALIFICACION
   DROP CONSTRAINT FK_CALIFICA_GENERA_CA_OFERTA_A;

ALTER TABLE CALIFICACION
   DROP CONSTRAINT FK_CALIFICA_TIENE_DET_MATRICUL;

ALTER TABLE CARRERA
   DROP CONSTRAINT FK_CARRERA_ADMINISTR_FACULTAD;

ALTER TABLE CARRERA
   DROP CONSTRAINT FK_CARRERA_TIENE_COO_DOCENTE;

ALTER TABLE COLABORAN_EN
   DROP CONSTRAINT FK_COLABORA_COLABORAN_PROYECTO;

ALTER TABLE COLABORAN_EN
   DROP CONSTRAINT FK_COLABORA_COLABORAN_DOCENTE;

ALTER TABLE CORREQUISITO
   DROP CONSTRAINT FK_CORREQ_ASIG_A;

ALTER TABLE CORREQUISITO
   DROP CONSTRAINT FK_CORREQ_ASIG_B;

ALTER TABLE DEPARTAMENTO
   DROP CONSTRAINT FK_DEPARTAM_TIENE_DEP_FACULTAD;

ALTER TABLE DETALLE_MALLA
   DROP CONSTRAINT FK_DETALLE__ES_PARTE__MALLA_CU;

ALTER TABLE DETALLE_MALLA
   DROP CONSTRAINT FK_DETALLE__SE_PRESEN_ASIGNATU;

ALTER TABLE DOCENTE
   DROP CONSTRAINT FK_DOCENTE_ENSENIAN__FACULTAD;

ALTER TABLE DOCENTE
   DROP CONSTRAINT FK_DOCENTE_TIENE_COO_CARRERA;

ALTER TABLE DOCENTE
   DROP CONSTRAINT FK_DOCENTE_TIENE_DEC_FACULTAD;

ALTER TABLE FACULTAD
   DROP CONSTRAINT FK_FACULTAD_TIENE_DEC_DOCENTE;

ALTER TABLE HISTORIAL_ACADEMICO
   DROP CONSTRAINT FK_HISTORIA_OBTUVO_RE_PERIODO_;

ALTER TABLE HISTORIAL_ACADEMICO
   DROP CONSTRAINT FK_HISTORIA_TIENE_HIS_ESTUDIAN;

ALTER TABLE HORARIO_CLASE
   DROP CONSTRAINT FK_HORARIO__SE_DICTA__OFERTA_A;

ALTER TABLE HORARIO_CLASE
   DROP CONSTRAINT FK_HORARIO__TIENE_HOR_AULA;

ALTER TABLE MALLA_CURRICULAR
   DROP CONSTRAINT FK_MALLA_CU_TIENE_CAR_CARRERA;

ALTER TABLE MATRICULA
   DROP CONSTRAINT FK_MATRICUL_HA_REALIZ_ESTUDIAN;

ALTER TABLE MATRICULA
   DROP CONSTRAINT FK_MATRICUL_SE_REALIZ_PERIODO_;

ALTER TABLE OFERTA_ASIGNATURA
   DROP CONSTRAINT FK_OFERTA_A_DESIGNADO_DOCENTE;

ALTER TABLE OFERTA_ASIGNATURA
   DROP CONSTRAINT FK_OFERTA_A_TIENE_ASI_ASIGNATU;

ALTER TABLE OFERTA_ASIGNATURA
   DROP CONSTRAINT FK_OFERTA_A_TIENE_PER_PERIODO_;

ALTER TABLE PRESTAMO
   DROP CONSTRAINT FK_PRESTAMO_ES_PRESTA_LIBRO;

ALTER TABLE PRESTAMO
   DROP CONSTRAINT FK_PRESTAMO_SOLICITA__ESTUDIAN;

ALTER TABLE PROCESO_TITULACION
   DROP CONSTRAINT FK_PROCESO__SOLICITA__ESTUDIAN;

ALTER TABLE PROCESO_TITULACION
   DROP CONSTRAINT FK_PROCESO__TUTORA_PR_DOCENTE;

ALTER TABLE PROYECTO_INVESTIGACION
   DROP CONSTRAINT FK_PROYECTO_DIRIGE_PR_DOCENTE;

ALTER TABLE PROYECTO_INVESTIGACION
   DROP CONSTRAINT FK_PROYECTO_GESTIONA__DEPARTAM;

ALTER TABLE PUBLICACION
   DROP CONSTRAINT FK_PUBLICAC_PRODUCE_P_PROYECTO;

ALTER TABLE TIENE_PRERREQUISITO
   DROP CONSTRAINT FK_PRERREQ_ASIG_HIJA;

ALTER TABLE TIENE_PRERREQUISITO
   DROP CONSTRAINT FK_PRERREQ_ASIG_PADRE;

ALTER TABLE TITULO_ACADEMICO
   DROP CONSTRAINT FK_TITULO_A_POSEE_TIT_DOCENTE;

ALTER TABLE TRIBUNAL_GRADO
   DROP CONSTRAINT FK_TRIBUNAL_TRIBUNAL__PROCESO_;

ALTER TABLE TRIBUNAL_GRADO
   DROP CONSTRAINT FK_TRIBUNAL_TRIBUNAL__DOCENTE;

DROP INDEX ES_TIPO_BECA_FK;

DROP INDEX RECIBE_BECA_FK;

DROP TABLE ASIGNACION_BECA CASCADE CONSTRAINTS;

DROP TABLE ASIGNATURA CASCADE CONSTRAINTS;

DROP TABLE AULA CASCADE CONSTRAINTS;

DROP INDEX TIENE_AUTORES_FK;

DROP INDEX ESCRIBE_ARTICULO_FK;

DROP TABLE AUTORIA CASCADE CONSTRAINTS;

DROP INDEX GENERA_CALIFICACIONES_FK;

DROP INDEX TIENE_DETALLE_NOTAS_FK;

DROP TABLE CALIFICACION CASCADE CONSTRAINTS;

DROP INDEX TIENE_COORDINADOR2_FK;

DROP INDEX ADMINISTRA_CARRERA_FK;

DROP TABLE CARRERA CASCADE CONSTRAINTS;

DROP INDEX COLABORAN_EN_FK;

DROP INDEX COLABORAN_EN2_FK;

DROP TABLE COLABORAN_EN CASCADE CONSTRAINTS;

DROP INDEX CORREQUISITO_FK;

DROP INDEX CORREQUISITO2_FK;

DROP TABLE CORREQUISITO CASCADE CONSTRAINTS;

DROP INDEX TIENE_DEPARTAMENTOS_FK;

DROP TABLE DEPARTAMENTO CASCADE CONSTRAINTS;

DROP INDEX SE_PRESENTA_EN_FK;

DROP INDEX ES_PARTE_DE_MALLA_FK;

DROP TABLE DETALLE_MALLA CASCADE CONSTRAINTS;

DROP INDEX TIENE_COORDINADOR_FK;

DROP INDEX ENSENIAN_EN_FK;

DROP INDEX TIENE_DECANO_FK;

DROP TABLE DOCENTE CASCADE CONSTRAINTS;

DROP TABLE ESTUDIANTE CASCADE CONSTRAINTS;

DROP INDEX TIENE_DECANO2_FK;

DROP TABLE FACULTAD CASCADE CONSTRAINTS;

DROP INDEX OBTUVO_RESULTADOS_EN_FK;

DROP INDEX TIENE_HISTORIALES_FK;

DROP TABLE HISTORIAL_ACADEMICO CASCADE CONSTRAINTS;

DROP INDEX SE_DICTA_EN_FK;

DROP INDEX TIENE_HORARIO_FK;

DROP TABLE HORARIO_CLASE CASCADE CONSTRAINTS;

DROP TABLE LIBRO CASCADE CONSTRAINTS;

DROP INDEX TIENE_CARRERA_FK;

DROP TABLE MALLA_CURRICULAR CASCADE CONSTRAINTS;

DROP INDEX SE_REALIZAN_PERIODO_FK;

DROP INDEX HA_REALIZADO_MATRICULA_FK;

DROP TABLE MATRICULA CASCADE CONSTRAINTS;

DROP INDEX DESIGNADO_OFERTA_FK;

DROP INDEX TIENE_ASIGNATURA_FK;

DROP INDEX TIENE_PERIODO_FK;

DROP TABLE OFERTA_ASIGNATURA CASCADE CONSTRAINTS;

DROP TABLE PERIODO_ACADEMICO CASCADE CONSTRAINTS;

DROP INDEX ES_PRESTADO_FK;

DROP INDEX SOLICITA_LIBRO_FK;

DROP TABLE PRESTAMO CASCADE CONSTRAINTS;

DROP INDEX TUTORA_PROCESO_FK;

DROP INDEX SOLICITA_TITULACION_FK;

DROP TABLE PROCESO_TITULACION CASCADE CONSTRAINTS;

DROP INDEX GESTIONA_INVESTIGACION_FK;

DROP INDEX DIRIGE_PROYECTO_FK;

DROP TABLE PROYECTO_INVESTIGACION CASCADE CONSTRAINTS;

DROP INDEX PRODUCE_PUBLICACION_FK;

DROP TABLE PUBLICACION CASCADE CONSTRAINTS;

DROP INDEX TIENE_PRERREQUISITO_FK;

DROP INDEX TIENE_PRERREQUISITO2_FK;

DROP TABLE TIENE_PRERREQUISITO CASCADE CONSTRAINTS;

DROP TABLE TIPO_BECA CASCADE CONSTRAINTS;

DROP INDEX POSEE_TITULO_FK;

DROP TABLE TITULO_ACADEMICO CASCADE CONSTRAINTS;

DROP INDEX TRIBUNAL_GRADO_FK;

DROP INDEX TRIBUNAL_GRADO2_FK;

DROP TABLE TRIBUNAL_GRADO CASCADE CONSTRAINTS;

/*==============================================================*/
/* Table: ASIGNACION_BECA                                       */
/*==============================================================*/
CREATE TABLE ASIGNACION_BECA 
(
   FECHA_ASIGNACION     DATE                 NOT NULL,
   ID_ESTUDIANTE        INTEGER,
   ID_BECA              INTEGER,
   PORCENTAJE_COBERTURA NUMBER(4,2)          NOT NULL,
   MONTO_ALIMENTACION   NUMBER(6,2),
   CONSTRAINT PK_ASIGNACION_BECA PRIMARY KEY (FECHA_ASIGNACION)
);

/*==============================================================*/
/* Index: RECIBE_BECA_FK                                        */
/*==============================================================*/
CREATE INDEX RECIBE_BECA_FK ON ASIGNACION_BECA (
   ID_ESTUDIANTE ASC
);

/*==============================================================*/
/* Index: ES_TIPO_BECA_FK                                       */
/*==============================================================*/
CREATE INDEX ES_TIPO_BECA_FK ON ASIGNACION_BECA (
   ID_BECA ASC
);

/*==============================================================*/
/* Table: ASIGNATURA                                            */
/*==============================================================*/
CREATE TABLE ASIGNATURA 
(
   ID_ASIGNATURA        INTEGER              NOT NULL,
   CODIGO_ASIGNATURA    VARCHAR2(15)         NOT NULL,
   NOMBRE_ASIGNATURA    VARCHAR2(100)        NOT NULL,
   NUMERO_CREDITOS      INTEGER              NOT NULL,
   TIPO_ASIGNATURA      VARCHAR2(50)         NOT NULL,
   AREA_CONOCIMIENTO    VARCHAR2(50)         NOT NULL,
   CONSTRAINT PK_ASIGNATURA PRIMARY KEY (ID_ASIGNATURA)
);

/*==============================================================*/
/* Table: AULA                                                  */
/*==============================================================*/
CREATE TABLE AULA 
(
   ID_AULA              INTEGER              NOT NULL,
   EDIFICIO_AULA        VARCHAR2(10)         NOT NULL,
   PISO_AULA            INTEGER              NOT NULL,
   NUMERO_AULA          VARCHAR2(10)         NOT NULL,
   CAPACIDAD_ESTUDIANTES INTEGER              NOT NULL,
   TIPO_AULA            VARCHAR2(30)         NOT NULL,
   TIENE_PROYECTOR      SMALLINT             NOT NULL,
   DETALLE_EQUIPAMIENTO VARCHAR2(500),
   CONSTRAINT PK_AULA PRIMARY KEY (ID_AULA)
);

/*==============================================================*/
/* Table: AUTORIA                                               */
/*==============================================================*/
CREATE TABLE AUTORIA 
(
   ID_PUBLICACION       INTEGER              NOT NULL,
   ID_DOCENTE           INTEGER              NOT NULL,
   ORDEN_AUTOR          INTEGER              NOT NULL,
   CONSTRAINT PK_AUTORIA PRIMARY KEY (ID_PUBLICACION, ID_DOCENTE)
);

/*==============================================================*/
/* Index: ESCRIBE_ARTICULO_FK                                   */
/*==============================================================*/
CREATE INDEX ESCRIBE_ARTICULO_FK ON AUTORIA (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Index: TIENE_AUTORES_FK                                      */
/*==============================================================*/
CREATE INDEX TIENE_AUTORES_FK ON AUTORIA (
   ID_PUBLICACION ASC
);

/*==============================================================*/
/* Table: CALIFICACION                                          */
/*==============================================================*/
CREATE TABLE CALIFICACION 
(
   ID_CALIFICACION      INTEGER              NOT NULL,
   ID_MATRICULA         INTEGER,
   ID_OFERTA            INTEGER,
   NOTA_PARCIAL_1       NUMBER(4,2)          NOT NULL,
   NOTA_PARCIAL_2       NUMBER(4,2),
   NOTA_FINAL           NUMBER(4,2),
   NOTA_SUPLETORIO      NUMBER(4,2),
   NOTA_MEJORAMIENTO    NUMBER(4,2),
   ESTADO_APROBACION    VARCHAR2(20),
   ASISTENCIA_PORCENTAJE NUMBER(5,2)          NOT NULL,
   CONSTRAINT PK_CALIFICACION PRIMARY KEY (ID_CALIFICACION)
);

/*==============================================================*/
/* Index: TIENE_DETALLE_NOTAS_FK                                */
/*==============================================================*/
CREATE INDEX TIENE_DETALLE_NOTAS_FK ON CALIFICACION (
   ID_MATRICULA ASC
);

/*==============================================================*/
/* Index: GENERA_CALIFICACIONES_FK                              */
/*==============================================================*/
CREATE INDEX GENERA_CALIFICACIONES_FK ON CALIFICACION (
   ID_OFERTA ASC
);

/*==============================================================*/
/* Table: CARRERA                                               */
/*==============================================================*/
CREATE TABLE CARRERA 
(
   ID_CARRERA           INTEGER              NOT NULL,
   ID_FACULTAD          INTEGER,
   ID_DOCENTE           INTEGER,
   NOMBRE_CARRERA       VARCHAR2(100)        NOT NULL,
   NIVEL_CARRERA        VARCHAR2(20)         NOT NULL,
   MODALIDAD_CARRERA    VARCHAR2(20)         NOT NULL,
   DURACION_SEMESTRES   INTEGER              NOT NULL,
   CONSTRAINT PK_CARRERA PRIMARY KEY (ID_CARRERA)
);

/*==============================================================*/
/* Index: ADMINISTRA_CARRERA_FK                                 */
/*==============================================================*/
CREATE INDEX ADMINISTRA_CARRERA_FK ON CARRERA (
   ID_FACULTAD ASC
);

/*==============================================================*/
/* Index: TIENE_COORDINADOR2_FK                                 */
/*==============================================================*/
CREATE INDEX TIENE_COORDINADOR2_FK ON CARRERA (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Table: COLABORAN_EN                                          */
/*==============================================================*/
CREATE TABLE COLABORAN_EN 
(
   ID_PROYECTO          INTEGER              NOT NULL,
   ID_DOCENTE           INTEGER              NOT NULL,
   CONSTRAINT PK_COLABORAN_EN PRIMARY KEY (ID_PROYECTO, ID_DOCENTE)
);

/*==============================================================*/
/* Index: COLABORAN_EN2_FK                                      */
/*==============================================================*/
CREATE INDEX COLABORAN_EN2_FK ON COLABORAN_EN (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Index: COLABORAN_EN_FK                                       */
/*==============================================================*/
CREATE INDEX COLABORAN_EN_FK ON COLABORAN_EN (
   ID_PROYECTO ASC
);

/*==============================================================*/
/* Table: CORREQUISITO                                          */
/*==============================================================*/
CREATE TABLE CORREQUISITO 
(
   ASI_ID_ASIGNATURA    INTEGER              NOT NULL,
   ID_ASIGNATURA        INTEGER              NOT NULL,
   CONSTRAINT PK_CORREQUISITO PRIMARY KEY (ASI_ID_ASIGNATURA, ID_ASIGNATURA)
);

/*==============================================================*/
/* Index: CORREQUISITO2_FK                                      */
/*==============================================================*/
CREATE INDEX CORREQUISITO2_FK ON CORREQUISITO (
   ID_ASIGNATURA ASC
);

/*==============================================================*/
/* Index: CORREQUISITO_FK                                       */
/*==============================================================*/
CREATE INDEX CORREQUISITO_FK ON CORREQUISITO (
   ASI_ID_ASIGNATURA ASC
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
CREATE TABLE DEPARTAMENTO 
(
   ID_DEPARTAMENTO      INTEGER              NOT NULL,
   ID_FACULTAD          INTEGER,
   NOMBRE_DEPARTAMENTO  VARCHAR2(100)        NOT NULL,
   CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (ID_DEPARTAMENTO)
);

/*==============================================================*/
/* Index: TIENE_DEPARTAMENTOS_FK                                */
/*==============================================================*/
CREATE INDEX TIENE_DEPARTAMENTOS_FK ON DEPARTAMENTO (
   ID_FACULTAD ASC
);

/* INDICE NUEVO PARA LA ASIGNATURA EN EL HISTORIAL */
CREATE INDEX TIENE_HISTORIAL_ASIG_FK ON HISTORIAL_ACADEMICO (
   ID_ASIGNATURA ASC
);

/*==============================================================*/
/* Table: DETALLE_MALLA                                         */
/*==============================================================*/
CREATE TABLE DETALLE_MALLA 
(
   ID_ASIGNATURA        INTEGER              NOT NULL,
   ID_MALLA             INTEGER              NOT NULL,
   SEMESTRE_SUGERIDO    INTEGER              NOT NULL,
   HORAS_TEORICAS       INTEGER              NOT NULL,
   HORAS_PRACTICAS      INTEGER              NOT NULL,
   CONSTRAINT PK_DETALLE_MALLA PRIMARY KEY (ID_ASIGNATURA, ID_MALLA)
);

/*==============================================================*/
/* Index: ES_PARTE_DE_MALLA_FK                                  */
/*==============================================================*/
CREATE INDEX ES_PARTE_DE_MALLA_FK ON DETALLE_MALLA (
   ID_MALLA ASC
);

/*==============================================================*/
/* Index: SE_PRESENTA_EN_FK                                     */
/*==============================================================*/
CREATE INDEX SE_PRESENTA_EN_FK ON DETALLE_MALLA (
   ID_ASIGNATURA ASC
);

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
CREATE TABLE DOCENTE 
(
   ID_DOCENTE           INTEGER              NOT NULL,
   ID_FACULTAD          INTEGER,
   FAC_ID_FACULTAD      INTEGER,
   ID_CARRERA           INTEGER,
   NUMERO_UNICO         VARCHAR2(9)          NOT NULL,
   CEDULA               VARCHAR2(10)         NOT NULL,
   NOMBRES_DOCENTE      VARCHAR2(100)        NOT NULL,
   APELLIDOS_DOCENTE    VARCHAR2(100)        NOT NULL,
   EMAIL_INSTITUCIONAL  VARCHAR2(100)        NOT NULL,
   TIPO_PROFESOR        VARCHAR2(50)         NOT NULL,
   CATEGORIA_DOCENTE    VARCHAR2(50)         NOT NULL,
   FECHA_INGRESO        DATE                 NOT NULL,
   CONSTRAINT PK_DOCENTE PRIMARY KEY (ID_DOCENTE)
);

/*==============================================================*/
/* Index: TIENE_DECANO_FK                                       */
/*==============================================================*/
CREATE INDEX TIENE_DECANO_FK ON DOCENTE (
   ID_FACULTAD ASC
);

/*==============================================================*/
/* Index: ENSENIAN_EN_FK                                        */
/*==============================================================*/
CREATE INDEX ENSENIAN_EN_FK ON DOCENTE (
   FAC_ID_FACULTAD ASC
);

/*==============================================================*/
/* Index: TIENE_COORDINADOR_FK                                  */
/*==============================================================*/
CREATE INDEX TIENE_COORDINADOR_FK ON DOCENTE (
   ID_CARRERA ASC
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
CREATE TABLE ESTUDIANTE 
(
   ID_ESTUDIANTE        INTEGER              NOT NULL,
   NUMERO_UNICO         VARCHAR2(9)          NOT NULL,
   CEDULA               VARCHAR2(10)         NOT NULL,
   NOMBRES_ESTUDIANTE   VARCHAR2(100)        NOT NULL,
   APELLIDOS_ESTUDIANTE VARCHAR2(100)        NOT NULL,
   EMAIL_INSTITUCIONAL  VARCHAR2(100)        NOT NULL,
   FECHA_INGRESO        DATE                 NOT NULL,
   ESTADO_ESTUDIANTE    VARCHAR2(20)         NOT NULL,
   IRA                  NUMBER(4,2),
   CONSTRAINT PK_ESTUDIANTE PRIMARY KEY (ID_ESTUDIANTE)
);

/*==============================================================*/
/* Table: FACULTAD                                              */
/*==============================================================*/
CREATE TABLE FACULTAD 
(
   ID_FACULTAD          INTEGER              NOT NULL,
   ID_DOCENTE           INTEGER,
   NOMBRE_FACULTAD      VARCHAR2(100)        NOT NULL,
   NUMERO_EDIFICIO      INTEGER              NOT NULL,
   CONSTRAINT PK_FACULTAD PRIMARY KEY (ID_FACULTAD)
);

/*==============================================================*/
/* Index: TIENE_DECANO2_FK                                      */
/*==============================================================*/
CREATE INDEX TIENE_DECANO2_FK ON FACULTAD (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Table: HISTORIAL_ACADEMICO                                   */
/*==============================================================*/
/* TABLA CORREGIDA CON ID_ASIGNATURA */
CREATE TABLE HISTORIAL_ACADEMICO 
(
   ID_HISTORIAL         INTEGER              NOT NULL,
   ID_ESTUDIANTE        INTEGER,
   ID_PERIODO           INTEGER,
   ID_ASIGNATURA        INTEGER,             /* <--- COLUMNA NUEVA */
   NOTA_DEFINITIVA      NUMBER(4,2)          NOT NULL,
   ESTADO_MATERIA       VARCHAR2(20)         NOT NULL,
   CONSTRAINT PK_HISTORIAL_ACADEMICO PRIMARY KEY (ID_HISTORIAL)
);

/*==============================================================*/
/* Index: TIENE_HISTORIALES_FK                                  */
/*==============================================================*/
CREATE INDEX TIENE_HISTORIALES_FK ON HISTORIAL_ACADEMICO (
   ID_ESTUDIANTE ASC
);

/*==============================================================*/
/* Index: OBTUVO_RESULTADOS_EN_FK                               */
/*==============================================================*/
CREATE INDEX OBTUVO_RESULTADOS_EN_FK ON HISTORIAL_ACADEMICO (
   ID_PERIODO ASC
);

/*==============================================================*/
/* Table: HORARIO_CLASE                                         */
/*==============================================================*/
CREATE TABLE HORARIO_CLASE 
(
   ID_HORARIO           INTEGER              NOT NULL,
   ID_AULA              INTEGER,
   ID_OFERTA            INTEGER,
   DIA_SEMANA           VARCHAR2(15)         NOT NULL,
   HORA_INICIO          DATE                 NOT NULL,
   HORA_FIN             DATE                 NOT NULL,
   CONSTRAINT PK_HORARIO_CLASE PRIMARY KEY (ID_HORARIO)
);

/*==============================================================*/
/* Index: TIENE_HORARIO_FK                                      */
/*==============================================================*/
CREATE INDEX TIENE_HORARIO_FK ON HORARIO_CLASE (
   ID_AULA ASC
);

/*==============================================================*/
/* Index: SE_DICTA_EN_FK                                        */
/*==============================================================*/
CREATE INDEX SE_DICTA_EN_FK ON HORARIO_CLASE (
   ID_OFERTA ASC
);

/*==============================================================*/
/* Table: LIBRO                                                 */
/*==============================================================*/
CREATE TABLE LIBRO 
(
   ID_LIBRO             INTEGER              NOT NULL,
   ISBN                 VARCHAR2(20)         NOT NULL,
   TITULO_LIBRO         VARCHAR2(200)        NOT NULL,
   AUTOR                VARCHAR2(100)        NOT NULL,
   EDITORIAL            VARCHAR2(100)        NOT NULL,
   STOCK_DISPONIBLE     INTEGER              NOT NULL,
   CONSTRAINT PK_LIBRO PRIMARY KEY (ID_LIBRO)
);

/*==============================================================*/
/* Table: MALLA_CURRICULAR                                      */
/*==============================================================*/
CREATE TABLE MALLA_CURRICULAR 
(
   ID_MALLA             INTEGER              NOT NULL,
   ID_CARRERA           INTEGER,
   CODIGO_COHORTE       VARCHAR2(10)         NOT NULL,
   FECHA_APROBACION     DATE                 NOT NULL,
   TOTAL_CREDITOS       INTEGER              NOT NULL,
   ESTADO_MALLA         VARCHAR2(20)         NOT NULL,
   CONSTRAINT PK_MALLA_CURRICULAR PRIMARY KEY (ID_MALLA)
);

/*==============================================================*/
/* Index: TIENE_CARRERA_FK                                      */
/*==============================================================*/
CREATE INDEX TIENE_CARRERA_FK ON MALLA_CURRICULAR (
   ID_CARRERA ASC
);

/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
CREATE TABLE MATRICULA 
(
   ID_MATRICULA         INTEGER              NOT NULL,
   ID_ESTUDIANTE        INTEGER,
   ID_PERIODO           INTEGER,
   FECHA_REGISTRO       DATE                 NOT NULL,
   FORMA_MATRICULA      VARCHAR2(20)         NOT NULL,
   CONSTRAINT PK_MATRICULA PRIMARY KEY (ID_MATRICULA)
);

/*==============================================================*/
/* Index: HA_REALIZADO_MATRICULA_FK                             */
/*==============================================================*/
CREATE INDEX HA_REALIZADO_MATRICULA_FK ON MATRICULA (
   ID_ESTUDIANTE ASC
);

/*==============================================================*/
/* Index: SE_REALIZAN_PERIODO_FK                                */
/*==============================================================*/
CREATE INDEX SE_REALIZAN_PERIODO_FK ON MATRICULA (
   ID_PERIODO ASC
);

/*==============================================================*/
/* Table: OFERTA_ASIGNATURA                                     */
/*==============================================================*/
CREATE TABLE OFERTA_ASIGNATURA 
(
   ID_OFERTA            INTEGER              NOT NULL,
   ID_PERIODO           INTEGER,
   ID_ASIGNATURA        INTEGER,
   ID_DOCENTE           INTEGER,
   CODIGO_PARALELO      VARCHAR2(10)         NOT NULL,
   CUPO_MAXIMO          INTEGER              NOT NULL,
   CUPO_DISPONIBLE      INTEGER              NOT NULL,
   CONSTRAINT PK_OFERTA_ASIGNATURA PRIMARY KEY (ID_OFERTA)
);

/*==============================================================*/
/* Index: TIENE_PERIODO_FK                                      */
/*==============================================================*/
CREATE INDEX TIENE_PERIODO_FK ON OFERTA_ASIGNATURA (
   ID_PERIODO ASC
);

/*==============================================================*/
/* Index: TIENE_ASIGNATURA_FK                                   */
/*==============================================================*/
CREATE INDEX TIENE_ASIGNATURA_FK ON OFERTA_ASIGNATURA (
   ID_ASIGNATURA ASC
);

/*==============================================================*/
/* Index: DESIGNADO_OFERTA_FK                                   */
/*==============================================================*/
CREATE INDEX DESIGNADO_OFERTA_FK ON OFERTA_ASIGNATURA (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Table: PERIODO_ACADEMICO                                     */
/*==============================================================*/
CREATE TABLE PERIODO_ACADEMICO 
(
   ID_PERIODO           INTEGER              NOT NULL,
   CODIGO_PERIODO       VARCHAR2(10)         NOT NULL,
   NOMBRE_PERIODO       VARCHAR2(10)         NOT NULL,
   FECHA_INICIO         DATE                 NOT NULL,
   FECHA_FIN            DATE                 NOT NULL,
   ESTADO_PERIODO       VARCHAR2(20)         NOT NULL,
   CONSTRAINT PK_PERIODO_ACADEMICO PRIMARY KEY (ID_PERIODO)
);

/*==============================================================*/
/* Table: PRESTAMO                                              */
/*==============================================================*/
CREATE TABLE PRESTAMO 
(
   FECHA_PRESTAMO       DATE                 NOT NULL,
   ID_ESTUDIANTE        INTEGER,
   ID_LIBRO             INTEGER,
   FECHA_DEVOLUCION_PREVISTA DATE                 NOT NULL,
   FECHA_DEVOLUCION_REAL DATE,
   CONSTRAINT PK_PRESTAMO PRIMARY KEY (FECHA_PRESTAMO)
);

/*==============================================================*/
/* Index: SOLICITA_LIBRO_FK                                     */
/*==============================================================*/
CREATE INDEX SOLICITA_LIBRO_FK ON PRESTAMO (
   ID_ESTUDIANTE ASC
);

/*==============================================================*/
/* Index: ES_PRESTADO_FK                                        */
/*==============================================================*/
CREATE INDEX ES_PRESTADO_FK ON PRESTAMO (
   ID_LIBRO ASC
);

/*==============================================================*/
/* Table: PROCESO_TITULACION                                    */
/*==============================================================*/
CREATE TABLE PROCESO_TITULACION 
(
   ID_PROCESO           INTEGER              NOT NULL,
   ID_ESTUDIANTE        INTEGER,
   ID_DOCENTE           INTEGER,
   MODALIDAD_PROCESO    VARCHAR2(30)         NOT NULL,
   TEMA_PROPUESTO       VARCHAR2(300)        NOT NULL,
   FECHA_DEFENSA        DATE,
   NOTA_FINAL_GRADO     NUMBER(4,2),
   ESTADO_PROCESO       VARCHAR2(20)         NOT NULL,
   CONSTRAINT PK_PROCESO_TITULACION PRIMARY KEY (ID_PROCESO)
);

/*==============================================================*/
/* Index: SOLICITA_TITULACION_FK                                */
/*==============================================================*/
CREATE INDEX SOLICITA_TITULACION_FK ON PROCESO_TITULACION (
   ID_ESTUDIANTE ASC
);

/*==============================================================*/
/* Index: TUTORA_PROCESO_FK                                     */
/*==============================================================*/
CREATE INDEX TUTORA_PROCESO_FK ON PROCESO_TITULACION (
   ID_DOCENTE ASC
);

/* ============================================================
   BLOQUE FALTANTE: UNIQUES Y SECUENCIAS
   Pegar esto antes de las Foreign Keys
   ============================================================ */

PROMPT === APLICANDO RESTRICCIONES UNIQUE ===

-- 1. ESTUDIANTES (Identificación y Correo)
ALTER TABLE ESTUDIANTE ADD CONSTRAINT UQ_EST_CEDULA UNIQUE (CEDULA);
ALTER TABLE ESTUDIANTE ADD CONSTRAINT UQ_EST_MATRICULA UNIQUE (NUMERO_UNICO);
ALTER TABLE ESTUDIANTE ADD CONSTRAINT UQ_EST_EMAIL UNIQUE (EMAIL_INSTITUCIONAL);

-- 2. DOCENTES (Identificación y Correo)
ALTER TABLE DOCENTE ADD CONSTRAINT UQ_DOC_CEDULA UNIQUE (CEDULA);
ALTER TABLE DOCENTE ADD CONSTRAINT UQ_DOC_CODIGO UNIQUE (NUMERO_UNICO);
ALTER TABLE DOCENTE ADD CONSTRAINT UQ_DOC_EMAIL UNIQUE (EMAIL_INSTITUCIONAL);

-- 3. ASIGNATURAS (Código Académico)
ALTER TABLE ASIGNATURA ADD CONSTRAINT UQ_ASIG_CODIGO UNIQUE (CODIGO_ASIGNATURA);

-- 4. PERIODOS ACADÉMICOS (Código de Semestre)
ALTER TABLE PERIODO_ACADEMICO ADD CONSTRAINT UQ_PERIODO_CODIGO UNIQUE (CODIGO_PERIODO);

-- 5. LIBROS (ISBN)
ALTER TABLE LIBRO ADD CONSTRAINT UQ_LIBRO_ISBN UNIQUE (ISBN);

-- 6. PROYECTOS DE INVESTIGACIÓN (Código)
ALTER TABLE PROYECTO_INVESTIGACION ADD CONSTRAINT UQ_PROY_CODIGO UNIQUE (CODIGO_PROYECTO);

PROMPT === CREACION DE SECUENCIAS ===

CREATE SEQUENCE SEQ_FACULTAD START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_CARRERA START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_DEPARTAMENTO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_DOCENTE START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ESTUDIANTE START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ASIGNATURA START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_MALLA START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_PERIODO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_OFERTA START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_MATRICULA START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_CALIFICACION START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_HISTORIAL START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_PROYECTO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_PUBLICACION START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_TITULO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_LIBRO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_PROCESO_TIT START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_AULA START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_HORARIO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_TIPO_BECA START WITH 1 INCREMENT BY 1;

/* ==========================================================================
   CORRECCIONES DE INTEGRIDAD (RESTRICCIONES CHECK)
   Requeridas para cumplir con las Reglas de Negocio del PDF sin crear tablas
   ========================================================================== */

-- Regla 12: Niveles de carrera (Técnico, Tecnológico, Grado, Posgrado)
ALTER TABLE CARRERA ADD CONSTRAINT CHK_NIVEL_CARRERA 
   CHECK (NIVEL_CARRERA IN ('TECNICO', 'TECNOLOGICO', 'GRADO', 'POSGRADO'));

-- Regla 14: Modalidad (Presencial, Semipresencial, Online)
ALTER TABLE CARRERA ADD CONSTRAINT CHK_MODALIDAD 
   CHECK (MODALIDAD_CARRERA IN ('PRESENCIAL', 'SEMIPRESENCIAL', 'ONLINE'));

-- Regla 18: Tipos de Asignatura
ALTER TABLE ASIGNATURA ADD CONSTRAINT CHK_TIPO_ASIGNATURA 
   CHECK (TIPO_ASIGNATURA IN ('OBLIGATORIA', 'OPTATIVA', 'LIBRE_ELECCION'));

-- Regla 25: Estados del estudiante
ALTER TABLE ESTUDIANTE ADD CONSTRAINT CHK_ESTADO_ESTUDIANTE 
   CHECK (ESTADO_ESTUDIANTE IN ('ACTIVO', 'INACTIVO', 'GRADUADO', 'RETIRADO', 'SUSPENDIDO'));

-- Regla 51 y 67: Notas (0-10) y Asistencia (0-100)
ALTER TABLE CALIFICACION ADD CONSTRAINT CHK_NOTAS_RANGO 
   CHECK (
      (NOTA_PARCIAL_1 BETWEEN 0 AND 10) AND
      (NOTA_PARCIAL_2 BETWEEN 0 AND 10 OR NOTA_PARCIAL_2 IS NULL) AND
      (NOTA_FINAL BETWEEN 0 AND 10 OR NOTA_FINAL IS NULL)
   );

ALTER TABLE CALIFICACION ADD CONSTRAINT CHK_ASISTENCIA 
   CHECK (ASISTENCIA_PORCENTAJE BETWEEN 0 AND 100);

/* RELACIÓN NUEVA: HISTORIAL -> ASIGNATURA */
ALTER TABLE HISTORIAL_ACADEMICO
   ADD CONSTRAINT FK_HISTORIA_TIENE_ASI_ASIGNATU FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA);

-- Regla 69: Estado de Proyecto
ALTER TABLE PROYECTO_INVESTIGACION ADD CONSTRAINT CHK_ESTADO_PROYECTO 
   CHECK (ESTADO_PROYECTO IN ('PROPUESTO', 'APROBADO', 'EN_EJECUCION', 'FINALIZADO', 'CANCELADO'));

-- Regla 78: Tipos de Aula
ALTER TABLE AULA ADD CONSTRAINT CHK_TIPO_AULA 
   CHECK (TIPO_AULA IN ('AULA_NORMAL', 'LAB_COMPUTACION', 'LAB_FISICA', 'AUDITORIO'));

-- Regla 79: Tiene proyector (Simulación de Booleano 0 o 1)
ALTER TABLE AULA ADD CONSTRAINT CHK_TIENE_PROYECTOR 
   CHECK (TIENE_PROYECTOR IN (0, 1));

-- Regla 87: Estado de la Reserva (Aunque no tengas tabla Reserva, valida procesos similares si usas campos de estado)
-- Si tienes un campo de estado en matricula o titulación:
ALTER TABLE PROCESO_TITULACION ADD CONSTRAINT CHK_ESTADO_TITULACION
   CHECK (ESTADO_PROCESO IN ('ANTEPROYECTO', 'DESARROLLO', 'REVISION', 'CORRECCIONES', 'DEFENSA', 'APROBADO', 'RECHAZADO'));

/*==============================================================*/
/* Table: PROYECTO_INVESTIGACION                                */
/*==============================================================*/

CREATE TABLE PROYECTO_INVESTIGACION 
(
   ID_PROYECTO          INTEGER              NOT NULL,
   ID_DOCENTE           INTEGER,
   ID_DEPARTAMENTO      INTEGER,
   CODIGO_PROYECTO      VARCHAR2(20)         NOT NULL,
   TITULO_PROYECTO      VARCHAR2(200)        NOT NULL,
   LINEA_INVESTIGACION  VARCHAR2(100)        NOT NULL,
   PRESUPUESTO_ASIGNADO NUMBER(10,2)         NOT NULL,
   FECHA_INICIO         DATE                 NOT NULL,
   ESTADO_PROYECTO      VARCHAR2(20)         NOT NULL,
   CONSTRAINT PK_PROYECTO_INVESTIGACION PRIMARY KEY (ID_PROYECTO)
);

/*==============================================================*/
/* Index: DIRIGE_PROYECTO_FK                                    */
/*==============================================================*/
CREATE INDEX DIRIGE_PROYECTO_FK ON PROYECTO_INVESTIGACION (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Index: GESTIONA_INVESTIGACION_FK                             */
/*==============================================================*/
CREATE INDEX GESTIONA_INVESTIGACION_FK ON PROYECTO_INVESTIGACION (
   ID_DEPARTAMENTO ASC
);

/*==============================================================*/
/* Table: PUBLICACION                                           */
/*==============================================================*/
CREATE TABLE PUBLICACION 
(
   ID_PUBLICACION       INTEGER              NOT NULL,
   ID_PROYECTO          INTEGER,
   TITULO_PUBLICACION   VARCHAR2(100)        NOT NULL,
   DOI                  VARCHAR2(100)        NOT NULL,
   REVISTA              VARCHAR2(100)        NOT NULL,
   CONSTRAINT PK_PUBLICACION PRIMARY KEY (ID_PUBLICACION)
);

/*==============================================================*/
/* Index: PRODUCE_PUBLICACION_FK                                */
/*==============================================================*/
CREATE INDEX PRODUCE_PUBLICACION_FK ON PUBLICACION (
   ID_PROYECTO ASC
);

/*==============================================================*/
/* Table: TIENE_PRERREQUISITO                                   */
/*==============================================================*/
CREATE TABLE TIENE_PRERREQUISITO 
(
   ASI_ID_ASIGNATURA    INTEGER              NOT NULL,
   ID_ASIGNATURA        INTEGER              NOT NULL,
   CONSTRAINT PK_TIENE_PRERREQUISITO PRIMARY KEY (ASI_ID_ASIGNATURA, ID_ASIGNATURA)
);

/*==============================================================*/
/* Index: TIENE_PRERREQUISITO2_FK                               */
/*==============================================================*/
CREATE INDEX TIENE_PRERREQUISITO2_FK ON TIENE_PRERREQUISITO (
   ID_ASIGNATURA ASC
);

/*==============================================================*/
/* Index: TIENE_PRERREQUISITO_FK                                */
/*==============================================================*/
CREATE INDEX TIENE_PRERREQUISITO_FK ON TIENE_PRERREQUISITO (
   ASI_ID_ASIGNATURA ASC
);

/*==============================================================*/
/* Table: TIPO_BECA                                             */
/*==============================================================*/
CREATE TABLE TIPO_BECA 
(
   ID_BECA              INTEGER              NOT NULL,
   NOMBRE_BECA          VARCHAR2(100)        NOT NULL,
   CONSTRAINT PK_TIPO_BECA PRIMARY KEY (ID_BECA)
);

/*==============================================================*/
/* Table: TITULO_ACADEMICO                                      */
/*==============================================================*/
CREATE TABLE TITULO_ACADEMICO 
(
   ID_TITULO            INTEGER              NOT NULL,
   ID_DOCENTE           INTEGER,
   NOMBRE_TITULO        VARCHAR2(100)        NOT NULL,
   NIVEL_TITULO         VARCHAR2(50)         NOT NULL,
   UNIVERSIDAD          VARCHAR2(100)        NOT NULL,
   CONSTRAINT PK_TITULO_ACADEMICO PRIMARY KEY (ID_TITULO)
);

/*==============================================================*/
/* Index: POSEE_TITULO_FK                                       */
/*==============================================================*/
CREATE INDEX POSEE_TITULO_FK ON TITULO_ACADEMICO (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Table: TRIBUNAL_GRADO                                        */
/*==============================================================*/
CREATE TABLE TRIBUNAL_GRADO 
(
   ID_PROCESO           INTEGER              NOT NULL,
   ID_DOCENTE           INTEGER              NOT NULL,
   CONSTRAINT PK_TRIBUNAL_GRADO PRIMARY KEY (ID_PROCESO, ID_DOCENTE)
);

/*==============================================================*/
/* Index: TRIBUNAL_GRADO2_FK                                    */
/*==============================================================*/
CREATE INDEX TRIBUNAL_GRADO2_FK ON TRIBUNAL_GRADO (
   ID_DOCENTE ASC
);

/*==============================================================*/
/* Index: TRIBUNAL_GRADO_FK                                     */
/*==============================================================*/
CREATE INDEX TRIBUNAL_GRADO_FK ON TRIBUNAL_GRADO (
   ID_PROCESO ASC
);

ALTER TABLE ASIGNACION_BECA
   ADD CONSTRAINT FK_ASIGNACI_ES_TIPO_B_TIPO_BEC FOREIGN KEY (ID_BECA)
      REFERENCES TIPO_BECA (ID_BECA);

ALTER TABLE ASIGNACION_BECA
   ADD CONSTRAINT FK_ASIGNACI_RECIBE_BE_ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE);

ALTER TABLE AUTORIA
   ADD CONSTRAINT FK_AUTORIA_ESCRIBE_A_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE AUTORIA
   ADD CONSTRAINT FK_AUTORIA_TIENE_AUT_PUBLICAC FOREIGN KEY (ID_PUBLICACION)
      REFERENCES PUBLICACION (ID_PUBLICACION);

ALTER TABLE CALIFICACION
   ADD CONSTRAINT FK_CALIFICA_GENERA_CA_OFERTA_A FOREIGN KEY (ID_OFERTA)
      REFERENCES OFERTA_ASIGNATURA (ID_OFERTA);

ALTER TABLE CALIFICACION
   ADD CONSTRAINT FK_CALIFICA_TIENE_DET_MATRICUL FOREIGN KEY (ID_MATRICULA)
      REFERENCES MATRICULA (ID_MATRICULA);

ALTER TABLE CARRERA
   ADD CONSTRAINT FK_CARRERA_ADMINISTR_FACULTAD FOREIGN KEY (ID_FACULTAD)
      REFERENCES FACULTAD (ID_FACULTAD);

ALTER TABLE CARRERA
   ADD CONSTRAINT FK_CARRERA_TIENE_COO_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE COLABORAN_EN
   ADD CONSTRAINT FK_COLABORA_COLABORAN_PROYECTO FOREIGN KEY (ID_PROYECTO)
      REFERENCES PROYECTO_INVESTIGACION (ID_PROYECTO);

ALTER TABLE COLABORAN_EN
   ADD CONSTRAINT FK_COLABORA_COLABORAN_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE CORREQUISITO
   ADD CONSTRAINT FK_CORREQ_ASIG_A FOREIGN KEY (ASI_ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA);

ALTER TABLE CORREQUISITO
   ADD CONSTRAINT FK_CORREQ_ASIG_B FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA);

ALTER TABLE DEPARTAMENTO
   ADD CONSTRAINT FK_DEPARTAM_TIENE_DEP_FACULTAD FOREIGN KEY (ID_FACULTAD)
      REFERENCES FACULTAD (ID_FACULTAD);

ALTER TABLE DETALLE_MALLA
   ADD CONSTRAINT FK_DETALLE__ES_PARTE__MALLA_CU FOREIGN KEY (ID_MALLA)
      REFERENCES MALLA_CURRICULAR (ID_MALLA);

ALTER TABLE DETALLE_MALLA
   ADD CONSTRAINT FK_DETALLE__SE_PRESEN_ASIGNATU FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA);

ALTER TABLE DOCENTE
   ADD CONSTRAINT FK_DOCENTE_ENSENIAN__FACULTAD FOREIGN KEY (FAC_ID_FACULTAD)
      REFERENCES FACULTAD (ID_FACULTAD);

ALTER TABLE DOCENTE
   ADD CONSTRAINT FK_DOCENTE_TIENE_COO_CARRERA FOREIGN KEY (ID_CARRERA)
      REFERENCES CARRERA (ID_CARRERA);

ALTER TABLE DOCENTE
   ADD CONSTRAINT FK_DOCENTE_TIENE_DEC_FACULTAD FOREIGN KEY (ID_FACULTAD)
      REFERENCES FACULTAD (ID_FACULTAD);

ALTER TABLE FACULTAD
   ADD CONSTRAINT FK_FACULTAD_TIENE_DEC_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE HISTORIAL_ACADEMICO
   ADD CONSTRAINT FK_HISTORIA_OBTUVO_RE_PERIODO_ FOREIGN KEY (ID_PERIODO)
      REFERENCES PERIODO_ACADEMICO (ID_PERIODO);

ALTER TABLE HISTORIAL_ACADEMICO
   ADD CONSTRAINT FK_HISTORIA_TIENE_HIS_ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE);

ALTER TABLE HORARIO_CLASE
   ADD CONSTRAINT FK_HORARIO__SE_DICTA__OFERTA_A FOREIGN KEY (ID_OFERTA)
      REFERENCES OFERTA_ASIGNATURA (ID_OFERTA);

ALTER TABLE HORARIO_CLASE
   ADD CONSTRAINT FK_HORARIO__TIENE_HOR_AULA FOREIGN KEY (ID_AULA)
      REFERENCES AULA (ID_AULA);

ALTER TABLE MALLA_CURRICULAR
   ADD CONSTRAINT FK_MALLA_CU_TIENE_CAR_CARRERA FOREIGN KEY (ID_CARRERA)
      REFERENCES CARRERA (ID_CARRERA);

ALTER TABLE MATRICULA
   ADD CONSTRAINT FK_MATRICUL_HA_REALIZ_ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE);

ALTER TABLE MATRICULA
   ADD CONSTRAINT FK_MATRICUL_SE_REALIZ_PERIODO_ FOREIGN KEY (ID_PERIODO)
      REFERENCES PERIODO_ACADEMICO (ID_PERIODO);

ALTER TABLE OFERTA_ASIGNATURA
   ADD CONSTRAINT FK_OFERTA_A_DESIGNADO_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE OFERTA_ASIGNATURA
   ADD CONSTRAINT FK_OFERTA_A_TIENE_ASI_ASIGNATU FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA);

ALTER TABLE OFERTA_ASIGNATURA
   ADD CONSTRAINT FK_OFERTA_A_TIENE_PER_PERIODO_ FOREIGN KEY (ID_PERIODO)
      REFERENCES PERIODO_ACADEMICO (ID_PERIODO);

ALTER TABLE PRESTAMO
   ADD CONSTRAINT FK_PRESTAMO_ES_PRESTA_LIBRO FOREIGN KEY (ID_LIBRO)
      REFERENCES LIBRO (ID_LIBRO);

ALTER TABLE PRESTAMO
   ADD CONSTRAINT FK_PRESTAMO_SOLICITA__ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE);

ALTER TABLE PROCESO_TITULACION
   ADD CONSTRAINT FK_PROCESO__SOLICITA__ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE);

ALTER TABLE PROCESO_TITULACION
   ADD CONSTRAINT FK_PROCESO__TUTORA_PR_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE PROYECTO_INVESTIGACION
   ADD CONSTRAINT FK_PROYECTO_DIRIGE_PR_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE PROYECTO_INVESTIGACION
   ADD CONSTRAINT FK_PROYECTO_GESTIONA__DEPARTAM FOREIGN KEY (ID_DEPARTAMENTO)
      REFERENCES DEPARTAMENTO (ID_DEPARTAMENTO);

ALTER TABLE PUBLICACION
   ADD CONSTRAINT FK_PUBLICAC_PRODUCE_P_PROYECTO FOREIGN KEY (ID_PROYECTO)
      REFERENCES PROYECTO_INVESTIGACION (ID_PROYECTO);

ALTER TABLE TIENE_PRERREQUISITO
   ADD CONSTRAINT FK_PRERREQ_ASIG_HIJA FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA);

ALTER TABLE TIENE_PRERREQUISITO
   ADD CONSTRAINT FK_PRERREQ_ASIG_PADRE FOREIGN KEY (ASI_ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA);

ALTER TABLE TITULO_ACADEMICO
   ADD CONSTRAINT FK_TITULO_A_POSEE_TIT_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

ALTER TABLE TRIBUNAL_GRADO
   ADD CONSTRAINT FK_TRIBUNAL_TRIBUNAL__PROCESO_ FOREIGN KEY (ID_PROCESO)
      REFERENCES PROCESO_TITULACION (ID_PROCESO);

ALTER TABLE TRIBUNAL_GRADO
   ADD CONSTRAINT FK_TRIBUNAL_TRIBUNAL__DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE);

