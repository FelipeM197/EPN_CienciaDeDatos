/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     2/1/2026 22:57:48                            */
/*==============================================================*/


DROP INDEX ES_TIPO_BECA_FK;

DROP INDEX RECIBE_BECA_FK;

DROP TABLE ASIGNACION_BECA;

DROP TABLE ASIGNATURA;

DROP TABLE AULA;

DROP INDEX TIENE_AUTORES_FK;

DROP INDEX ESCRIBE_ARTICULO_FK;

DROP TABLE AUTORIA;

DROP INDEX GENERA_CALIFICACIONES_FK;

DROP INDEX TIENE_DETALLE_NOTAS_FK;

DROP TABLE CALIFICACION;

DROP INDEX TIENE_COORDINADOR2_FK;

DROP INDEX ADMINISTRA_CARRERA_FK;

DROP TABLE CARRERA;

DROP INDEX COLABORAN_EN_FK;

DROP INDEX COLABORAN_EN2_FK;

DROP TABLE COLABORAN_EN;

DROP INDEX CORREQUISITO_FK;

DROP INDEX CORREQUISITO2_FK;

DROP TABLE CORREQUISITO;

DROP INDEX TIENE_DEPARTAMENTOS_FK;

DROP TABLE DEPARTAMENTO;

DROP INDEX SE_PRESENTA_EN_FK;

DROP INDEX ES_PARTE_DE_MALLA_FK;

DROP TABLE DETALLE_MALLA;

DROP INDEX TIENE_COORDINADOR_FK;

DROP INDEX ENSENIAN_EN_FK;

DROP INDEX TIENE_DECANO_FK;

DROP TABLE DOCENTE;

DROP TABLE ESTUDIANTE;

DROP INDEX TIENE_DECANO2_FK;

DROP TABLE FACULTAD;

DROP INDEX OBTUVO_RESULTADOS_EN_FK;

DROP INDEX TIENE_HISTORIALES_FK;

DROP TABLE HISTORIAL_ACADEMICO;

DROP INDEX SE_DICTA_EN_FK;

DROP INDEX TIENE_HORARIO_FK;

DROP TABLE HORARIO_CLASE;

DROP TABLE LIBRO;

DROP INDEX TIENE_CARRERA_FK;

DROP TABLE MALLA_CURRICULAR;

DROP INDEX SE_REALIZAN_PERIODO_FK;

DROP INDEX HA_REALIZADO_MATRICULA_FK;

DROP TABLE MATRICULA;

DROP INDEX DESIGNADO_OFERTA_FK;

DROP INDEX TIENE_ASIGNATURA_FK;

DROP INDEX TIENE_PERIODO_FK;

DROP TABLE OFERTA_ASIGNATURA;

DROP TABLE PERIODO_ACADEMICO;

DROP INDEX ES_PRESTADO_FK;

DROP INDEX SOLICITA_LIBRO_FK;

DROP TABLE PRESTAMO;

DROP INDEX TUTORA_PROCESO_FK;

DROP INDEX SOLICITA_TITULACION_FK;

DROP TABLE PROCESO_TITULACION;

DROP INDEX GESTIONA_INVESTIGACION_FK;

DROP INDEX DIRIGE_PROYECTO_FK;

DROP TABLE PROYECTO_INVESTIGACION;

DROP INDEX PRODUCE_PUBLICACION_FK;

DROP TABLE PUBLICACION;

DROP INDEX TIENE_PRERREQUISITO_FK;

DROP INDEX TIENE_PRERREQUISITO2_FK;

DROP TABLE TIENE_PRERREQUISITO;

DROP TABLE TIPO_BECA;

DROP INDEX POSEE_TITULO_FK;

DROP TABLE TITULO_ACADEMICO;

DROP INDEX TRIBUNAL_GRADO_FK;

DROP INDEX TRIBUNAL_GRADO2_FK;

DROP TABLE TRIBUNAL_GRADO;

DROP SEQUENCE SEQ_ASIGNATURA;

DROP SEQUENCE SEQ_AULA;

DROP SEQUENCE SEQ_CALIFICACION;

DROP SEQUENCE SEQ_CARRERA;

DROP SEQUENCE SEQ_DEPARTAMENTO;

DROP SEQUENCE SEQ_DOCENTE;

DROP SEQUENCE SEQ_ESTUDIANTE;

DROP SEQUENCE SEQ_FACULTAD;

DROP SEQUENCE SEQ_HISTORIAL;

DROP SEQUENCE SEQ_HORARIO;

DROP SEQUENCE SEQ_LIBRO;

DROP SEQUENCE SEQ_MALLA;

DROP SEQUENCE SEQ_MATRICULA;

DROP SEQUENCE SEQ_OFERTA;

DROP SEQUENCE SEQ_PERIODO;

DROP SEQUENCE SEQ_PROCESO_TIT;

DROP SEQUENCE SEQ_PROYECTO;

DROP SEQUENCE SEQ_PUBLICACION;

DROP SEQUENCE SEQ_TIPO_BECA;

DROP SEQUENCE SEQ_TITULO;

CREATE SEQUENCE SEQ_ASIGNATURA;

CREATE SEQUENCE SEQ_AULA;

CREATE SEQUENCE SEQ_CALIFICACION;

CREATE SEQUENCE SEQ_CARRERA;

CREATE SEQUENCE SEQ_DEPARTAMENTO;

CREATE SEQUENCE SEQ_DOCENTE;

CREATE SEQUENCE SEQ_ESTUDIANTE;

CREATE SEQUENCE SEQ_FACULTAD;

CREATE SEQUENCE SEQ_HISTORIAL;

CREATE SEQUENCE SEQ_HORARIO;

CREATE SEQUENCE SEQ_LIBRO;

CREATE SEQUENCE SEQ_MALLA;

CREATE SEQUENCE SEQ_MATRICULA;

CREATE SEQUENCE SEQ_OFERTA;

CREATE SEQUENCE SEQ_PERIODO;

CREATE SEQUENCE SEQ_PROCESO_TIT;

CREATE SEQUENCE SEQ_PROYECTO;

CREATE SEQUENCE SEQ_PUBLICACION;

CREATE SEQUENCE SEQ_TIPO_BECA;

CREATE SEQUENCE SEQ_TITULO;

/*==============================================================*/
/* Table: ASIGNACION_BECA                                       */
/*==============================================================*/
CREATE TABLE ASIGNACION_BECA (
   FECHA_ASIGNACION     DATE                 NOT NULL,
   ID_ESTUDIANTE        INT4                 NULL,
   ID_BECA              INT4                 NULL,
   PORCENTAJE_COBERTURA NUMERIC(4,2)         NOT NULL,
   MONTO_ALIMENTACION   NUMERIC(6,2)         NULL,
   CONSTRAINT PK_ASIGNACION_BECA PRIMARY KEY (FECHA_ASIGNACION)
);

/*==============================================================*/
/* Index: RECIBE_BECA_FK                                        */
/*==============================================================*/
CREATE  INDEX RECIBE_BECA_FK ON ASIGNACION_BECA (
ID_ESTUDIANTE
);

/*==============================================================*/
/* Index: ES_TIPO_BECA_FK                                       */
/*==============================================================*/
CREATE  INDEX ES_TIPO_BECA_FK ON ASIGNACION_BECA (
ID_BECA
);

/*==============================================================*/
/* Table: ASIGNATURA                                            */
/*==============================================================*/
CREATE TABLE ASIGNATURA (
   ID_ASIGNATURA        INT4                 NOT NULL,
   CODIGO_ASIGNATURA    VARCHAR(15)          NOT NULL,
   NOMBRE_ASIGNATURA    VARCHAR(100)         NOT NULL,
   NUMERO_CREDITOS      INT4                 NOT NULL,
   TIPO_ASIGNATURA      VARCHAR(50)          NOT NULL,
   AREA_CONOCIMIENTO    VARCHAR(50)          NOT NULL,
   CONSTRAINT PK_ASIGNATURA PRIMARY KEY (ID_ASIGNATURA),
   CONSTRAINT UQ_ASIG_CODIGO UNIQUE (CODIGO_ASIGNATURA),
   CONSTRAINT CHK_TIPO_ASIGNATURA CHECK (TIPO_ASIGNATURA IN ('OBLIGATORIA', 'OPTATIVA', 'LIBRE_ELECCION'))
);

/*==============================================================*/
/* Table: AULA                                                  */
/*==============================================================*/
CREATE TABLE AULA (
   ID_AULA              INT4                 NOT NULL,
   EDIFICIO_AULA        VARCHAR(10)          NOT NULL,
   PISO_AULA            INT4                 NOT NULL,
   NUMERO_AULA          VARCHAR(10)          NOT NULL,
   CAPACIDAD_ESTUDIANTES INT4                 NOT NULL,
   TIPO_AULA            VARCHAR(30)          NOT NULL,
   TIENE_PROYECTOR      INT2                 NOT NULL,
   DETALLE_EQUIPAMIENTO VARCHAR(500)         NULL,
   CONSTRAINT PK_AULA PRIMARY KEY (ID_AULA),
   CONSTRAINT CHK_TIPO_AULA CHECK (TIPO_AULA IN ('AULA_NORMAL', 'LAB_COMPUTACION', 'LAB_FISICA', 'AUDITORIO')),
   CONSTRAINT CHK_TIENE_PROYECTOR CHECK (TIENE_PROYECTOR IN (0, 1))
);

/*==============================================================*/
/* Table: AUTORIA                                               */
/*==============================================================*/
CREATE TABLE AUTORIA (
   ID_PUBLICACION       INT4                 NOT NULL,
   ID_DOCENTE           INT4                 NOT NULL,
   ORDEN_AUTOR          INT4                 NOT NULL,
   CONSTRAINT PK_AUTORIA PRIMARY KEY (ID_PUBLICACION, ID_DOCENTE)
);

/*==============================================================*/
/* Index: ESCRIBE_ARTICULO_FK                                   */
/*==============================================================*/
CREATE  INDEX ESCRIBE_ARTICULO_FK ON AUTORIA (
ID_DOCENTE
);

/*==============================================================*/
/* Index: TIENE_AUTORES_FK                                      */
/*==============================================================*/
CREATE  INDEX TIENE_AUTORES_FK ON AUTORIA (
ID_PUBLICACION
);

/*==============================================================*/
/* Table: CALIFICACION                                          */
/*==============================================================*/
CREATE TABLE CALIFICACION (
   ID_CALIFICACION      INT4                 NOT NULL,
   ID_MATRICULA         INT4                 NULL,
   ID_OFERTA            INT4                 NULL,
   NOTA_PARCIAL_1       NUMERIC(4,2)         NOT NULL,
   NOTA_PARCIAL_2       NUMERIC(4,2)         NULL,
   NOTA_FINAL           NUMERIC(4,2)         NULL,
   NOTA_SUPLETORIO      NUMERIC(4,2)         NULL,
   NOTA_MEJORAMIENTO    NUMERIC(4,2)         NULL,
   ESTADO_APROBACION    VARCHAR(20)          NULL,
   ASISTENCIA_PORCENTAJE NUMERIC(5,2)         NOT NULL,
   CONSTRAINT PK_CALIFICACION PRIMARY KEY (ID_CALIFICACION),
   CONSTRAINT CHK_NOTAS_RANGO CHECK ((NOTA_PARCIAL_1 BETWEEN 0 AND 10) AND
      (NOTA_PARCIAL_2 BETWEEN 0 AND 10 OR NOTA_PARCIAL_2 IS NULL) AND
      (NOTA_FINAL BETWEEN 0 AND 10 OR NOTA_FINAL IS NULL)),
   CONSTRAINT CHK_ASISTENCIA CHECK (ASISTENCIA_PORCENTAJE BETWEEN 0 AND 100)
);

/*==============================================================*/
/* Index: TIENE_DETALLE_NOTAS_FK                                */
/*==============================================================*/
CREATE  INDEX TIENE_DETALLE_NOTAS_FK ON CALIFICACION (
ID_MATRICULA
);

/*==============================================================*/
/* Index: GENERA_CALIFICACIONES_FK                              */
/*==============================================================*/
CREATE  INDEX GENERA_CALIFICACIONES_FK ON CALIFICACION (
ID_OFERTA
);

/*==============================================================*/
/* Table: CARRERA                                               */
/*==============================================================*/
CREATE TABLE CARRERA (
   ID_CARRERA           INT4                 NOT NULL,
   ID_FACULTAD          INT4                 NULL,
   ID_DOCENTE           INT4                 NULL,
   NOMBRE_CARRERA       VARCHAR(100)         NOT NULL,
   NIVEL_CARRERA        VARCHAR(20)          NOT NULL,
   MODALIDAD_CARRERA    VARCHAR(20)          NOT NULL,
   DURACION_SEMESTRES   INT4                 NOT NULL,
   CONSTRAINT PK_CARRERA PRIMARY KEY (ID_CARRERA),
   CONSTRAINT CHK_NIVEL_CARRERA CHECK (NIVEL_CARRERA IN ('TECNICO', 'TECNOLOGICO', 'GRADO', 'POSGRADO')),
   CONSTRAINT CHK_MODALIDAD CHECK (MODALIDAD_CARRERA IN ('PRESENCIAL', 'SEMIPRESENCIAL', 'ONLINE'))
);

/*==============================================================*/
/* Index: ADMINISTRA_CARRERA_FK                                 */
/*==============================================================*/
CREATE  INDEX ADMINISTRA_CARRERA_FK ON CARRERA (
ID_FACULTAD
);

/*==============================================================*/
/* Index: TIENE_COORDINADOR2_FK                                 */
/*==============================================================*/
CREATE  INDEX TIENE_COORDINADOR2_FK ON CARRERA (
ID_DOCENTE
);

/*==============================================================*/
/* Table: COLABORAN_EN                                          */
/*==============================================================*/
CREATE TABLE COLABORAN_EN (
   ID_PROYECTO          INT4                 NOT NULL,
   ID_DOCENTE           INT4                 NOT NULL,
   CONSTRAINT PK_COLABORAN_EN PRIMARY KEY (ID_PROYECTO, ID_DOCENTE)
);

/*==============================================================*/
/* Index: COLABORAN_EN2_FK                                      */
/*==============================================================*/
CREATE  INDEX COLABORAN_EN2_FK ON COLABORAN_EN (
ID_DOCENTE
);

/*==============================================================*/
/* Index: COLABORAN_EN_FK                                       */
/*==============================================================*/
CREATE  INDEX COLABORAN_EN_FK ON COLABORAN_EN (
ID_PROYECTO
);

/*==============================================================*/
/* Table: CORREQUISITO                                          */
/*==============================================================*/
CREATE TABLE CORREQUISITO (
   ASI_ID_ASIGNATURA    INT4                 NOT NULL,
   ID_ASIGNATURA        INT4                 NOT NULL,
   CONSTRAINT PK_CORREQUISITO PRIMARY KEY (ASI_ID_ASIGNATURA, ID_ASIGNATURA)
);

/*==============================================================*/
/* Index: CORREQUISITO2_FK                                      */
/*==============================================================*/
CREATE  INDEX CORREQUISITO2_FK ON CORREQUISITO (
ID_ASIGNATURA
);

/*==============================================================*/
/* Index: CORREQUISITO_FK                                       */
/*==============================================================*/
CREATE  INDEX CORREQUISITO_FK ON CORREQUISITO (
ASI_ID_ASIGNATURA
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
CREATE TABLE DEPARTAMENTO (
   ID_DEPARTAMENTO      INT4                 NOT NULL,
   ID_FACULTAD          INT4                 NULL,
   NOMBRE_DEPARTAMENTO  VARCHAR(100)         NOT NULL,
   CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (ID_DEPARTAMENTO)
);

/*==============================================================*/
/* Index: TIENE_DEPARTAMENTOS_FK                                */
/*==============================================================*/
CREATE  INDEX TIENE_DEPARTAMENTOS_FK ON DEPARTAMENTO (
ID_FACULTAD
);

/*==============================================================*/
/* Table: DETALLE_MALLA                                         */
/*==============================================================*/
CREATE TABLE DETALLE_MALLA (
   ID_ASIGNATURA        INT4                 NOT NULL,
   ID_MALLA             INT4                 NOT NULL,
   SEMESTRE_SUGERIDO    INT4                 NOT NULL,
   HORAS_TEORICAS       INT4                 NOT NULL,
   HORAS_PRACTICAS      INT4                 NOT NULL,
   CONSTRAINT PK_DETALLE_MALLA PRIMARY KEY (ID_ASIGNATURA, ID_MALLA)
);

/*==============================================================*/
/* Index: ES_PARTE_DE_MALLA_FK                                  */
/*==============================================================*/
CREATE  INDEX ES_PARTE_DE_MALLA_FK ON DETALLE_MALLA (
ID_MALLA
);

/*==============================================================*/
/* Index: SE_PRESENTA_EN_FK                                     */
/*==============================================================*/
CREATE  INDEX SE_PRESENTA_EN_FK ON DETALLE_MALLA (
ID_ASIGNATURA
);

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
CREATE TABLE DOCENTE (
   ID_DOCENTE           INT4                 NOT NULL,
   ID_FACULTAD          INT4                 NULL,
   FAC_ID_FACULTAD      INT4                 NULL,
   ID_CARRERA           INT4                 NULL,
   NUMERO_UNICO         VARCHAR(9)           NOT NULL,
   CEDULA               VARCHAR(10)          NOT NULL,
   NOMBRES_DOCENTE      VARCHAR(100)         NOT NULL,
   APELLIDOS_DOCENTE    VARCHAR(100)         NOT NULL,
   EMAIL_INSTITUCIONAL  VARCHAR(100)         NOT NULL,
   TIPO_PROFESOR        VARCHAR(50)          NOT NULL,
   CATEGORIA_DOCENTE    VARCHAR(50)          NOT NULL,
   FECHA_INGRESO        DATE                 NOT NULL,
   CONSTRAINT PK_DOCENTE PRIMARY KEY (ID_DOCENTE),
   CONSTRAINT UQ_DOC_CEDULA UNIQUE (CEDULA),
   CONSTRAINT UQ_DOC_CODIGO UNIQUE (NUMERO_UNICO),
   CONSTRAINT UQ_DOC_EMAIL UNIQUE (EMAIL_INSTITUCIONAL)
);

/*==============================================================*/
/* Index: TIENE_DECANO_FK                                       */
/*==============================================================*/
CREATE  INDEX TIENE_DECANO_FK ON DOCENTE (
ID_FACULTAD
);

/*==============================================================*/
/* Index: ENSENIAN_EN_FK                                        */
/*==============================================================*/
CREATE  INDEX ENSENIAN_EN_FK ON DOCENTE (
FAC_ID_FACULTAD
);

/*==============================================================*/
/* Index: TIENE_COORDINADOR_FK                                  */
/*==============================================================*/
CREATE  INDEX TIENE_COORDINADOR_FK ON DOCENTE (
ID_CARRERA
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
CREATE TABLE ESTUDIANTE (
   ID_ESTUDIANTE        INT4                 NOT NULL,
   NUMERO_UNICO         VARCHAR(9)           NOT NULL,
   CEDULA               VARCHAR(10)          NOT NULL,
   NOMBRES_ESTUDIANTE   VARCHAR(100)         NOT NULL,
   APELLIDOS_ESTUDIANTE VARCHAR(100)         NOT NULL,
   EMAIL_INSTITUCIONAL  VARCHAR(100)         NOT NULL,
   FECHA_INGRESO        DATE                 NOT NULL,
   ESTADO_ESTUDIANTE    VARCHAR(20)          NOT NULL,
   IRA                  NUMERIC(4,2)         NULL,
   CONSTRAINT PK_ESTUDIANTE PRIMARY KEY (ID_ESTUDIANTE),
   CONSTRAINT UQ_EST_CEDULA UNIQUE (CEDULA),
   CONSTRAINT UQ_EST_MATRICULA UNIQUE (NUMERO_UNICO),
   CONSTRAINT UQ_EST_EMAIL UNIQUE (EMAIL_INSTITUCIONAL),
   CONSTRAINT CHK_ESTADO_ESTUDIANTE CHECK (ESTADO_ESTUDIANTE IN ('ACTIVO', 'INACTIVO', 'GRADUADO', 'RETIRADO', 'SUSPENDIDO'))
);

/*==============================================================*/
/* Table: FACULTAD                                              */
/*==============================================================*/
CREATE TABLE FACULTAD (
   ID_FACULTAD          INT4                 NOT NULL,
   ID_DOCENTE           INT4                 NULL,
   NOMBRE_FACULTAD      VARCHAR(100)         NOT NULL,
   NUMERO_EDIFICIO      INT4                 NOT NULL,
   CONSTRAINT PK_FACULTAD PRIMARY KEY (ID_FACULTAD)
);

/*==============================================================*/
/* Index: TIENE_DECANO2_FK                                      */
/*==============================================================*/
CREATE  INDEX TIENE_DECANO2_FK ON FACULTAD (
ID_DOCENTE
);

/*==============================================================*/
/* Table: HISTORIAL_ACADEMICO                                   */
/*==============================================================*/
CREATE TABLE HISTORIAL_ACADEMICO (
   ID_HISTORIAL         INT4                 NOT NULL,
   ID_ESTUDIANTE        INT4                 NULL,
   ID_PERIODO           INT4                 NULL,
   ID_ASIGNATURA        INT4                 NULL,
   NOTA_DEFINITIVA      NUMERIC(4,2)         NOT NULL,
   ESTADO_MATERIA       VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_HISTORIAL_ACADEMICO PRIMARY KEY (ID_HISTORIAL)
);

/*==============================================================*/
/* Index: TIENE_HISTORIALES_FK                                  */
/*==============================================================*/
CREATE  INDEX TIENE_HISTORIALES_FK ON HISTORIAL_ACADEMICO (
ID_ESTUDIANTE
);

/*==============================================================*/
/* Index: OBTUVO_RESULTADOS_EN_FK                               */
/*==============================================================*/
CREATE  INDEX OBTUVO_RESULTADOS_EN_FK ON HISTORIAL_ACADEMICO (
ID_PERIODO
);

/*==============================================================*/
/* Table: HORARIO_CLASE                                         */
/*==============================================================*/
CREATE TABLE HORARIO_CLASE (
   ID_HORARIO           INT4                 NOT NULL,
   ID_AULA              INT4                 NULL,
   ID_OFERTA            INT4                 NULL,
   DIA_SEMANA           VARCHAR(15)          NOT NULL,
   HORA_INICIO          DATE                 NOT NULL,
   HORA_FIN             DATE                 NOT NULL,
   CONSTRAINT PK_HORARIO_CLASE PRIMARY KEY (ID_HORARIO)
);

/*==============================================================*/
/* Index: TIENE_HORARIO_FK                                      */
/*==============================================================*/
CREATE  INDEX TIENE_HORARIO_FK ON HORARIO_CLASE (
ID_AULA
);

/*==============================================================*/
/* Index: SE_DICTA_EN_FK                                        */
/*==============================================================*/
CREATE  INDEX SE_DICTA_EN_FK ON HORARIO_CLASE (
ID_OFERTA
);

/*==============================================================*/
/* Table: LIBRO                                                 */
/*==============================================================*/
CREATE TABLE LIBRO (
   ID_LIBRO             INT4                 NOT NULL,
   ISBN                 VARCHAR(20)          NOT NULL,
   TITULO_LIBRO         VARCHAR(200)         NOT NULL,
   AUTOR                VARCHAR(100)         NOT NULL,
   EDITORIAL            VARCHAR(100)         NOT NULL,
   STOCK_DISPONIBLE     INT4                 NOT NULL,
   CONSTRAINT PK_LIBRO PRIMARY KEY (ID_LIBRO),
   CONSTRAINT UQ_LIBRO_ISBN UNIQUE (ISBN)
);

/*==============================================================*/
/* Table: MALLA_CURRICULAR                                      */
/*==============================================================*/
CREATE TABLE MALLA_CURRICULAR (
   ID_MALLA             INT4                 NOT NULL,
   ID_CARRERA           INT4                 NULL,
   CODIGO_COHORTE       VARCHAR(10)          NOT NULL,
   FECHA_APROBACION     DATE                 NOT NULL,
   TOTAL_CREDITOS       INT4                 NOT NULL,
   ESTADO_MALLA         VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_MALLA_CURRICULAR PRIMARY KEY (ID_MALLA)
);

/*==============================================================*/
/* Index: TIENE_CARRERA_FK                                      */
/*==============================================================*/
CREATE  INDEX TIENE_CARRERA_FK ON MALLA_CURRICULAR (
ID_CARRERA
);

/*==============================================================*/
/* Table: MATRICULA                                             */
/*==============================================================*/
CREATE TABLE MATRICULA (
   ID_MATRICULA         INT4                 NOT NULL,
   ID_ESTUDIANTE        INT4                 NULL,
   ID_PERIODO           INT4                 NULL,
   FECHA_REGISTRO       DATE                 NOT NULL,
   FORMA_MATRICULA      VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_MATRICULA PRIMARY KEY (ID_MATRICULA)
);

/*==============================================================*/
/* Index: HA_REALIZADO_MATRICULA_FK                             */
/*==============================================================*/
CREATE  INDEX HA_REALIZADO_MATRICULA_FK ON MATRICULA (
ID_ESTUDIANTE
);

/*==============================================================*/
/* Index: SE_REALIZAN_PERIODO_FK                                */
/*==============================================================*/
CREATE  INDEX SE_REALIZAN_PERIODO_FK ON MATRICULA (
ID_PERIODO
);

/*==============================================================*/
/* Table: OFERTA_ASIGNATURA                                     */
/*==============================================================*/
CREATE TABLE OFERTA_ASIGNATURA (
   ID_OFERTA            INT4                 NOT NULL,
   ID_PERIODO           INT4                 NULL,
   ID_ASIGNATURA        INT4                 NULL,
   ID_DOCENTE           INT4                 NULL,
   CODIGO_PARALELO      VARCHAR(10)          NOT NULL,
   CUPO_MAXIMO          INT4                 NOT NULL,
   CUPO_DISPONIBLE      INT4                 NOT NULL,
   CONSTRAINT PK_OFERTA_ASIGNATURA PRIMARY KEY (ID_OFERTA)
);

/*==============================================================*/
/* Index: TIENE_PERIODO_FK                                      */
/*==============================================================*/
CREATE  INDEX TIENE_PERIODO_FK ON OFERTA_ASIGNATURA (
ID_PERIODO
);

/*==============================================================*/
/* Index: TIENE_ASIGNATURA_FK                                   */
/*==============================================================*/
CREATE  INDEX TIENE_ASIGNATURA_FK ON OFERTA_ASIGNATURA (
ID_ASIGNATURA
);

/*==============================================================*/
/* Index: DESIGNADO_OFERTA_FK                                   */
/*==============================================================*/
CREATE  INDEX DESIGNADO_OFERTA_FK ON OFERTA_ASIGNATURA (
ID_DOCENTE
);

/*==============================================================*/
/* Table: PERIODO_ACADEMICO                                     */
/*==============================================================*/
CREATE TABLE PERIODO_ACADEMICO (
   ID_PERIODO           INT4                 NOT NULL,
   CODIGO_PERIODO       VARCHAR(10)          NOT NULL,
   NOMBRE_PERIODO       VARCHAR(10)          NOT NULL,
   FECHA_INICIO         DATE                 NOT NULL,
   FECHA_FIN            DATE                 NOT NULL,
   ESTADO_PERIODO       VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_PERIODO_ACADEMICO PRIMARY KEY (ID_PERIODO),
   CONSTRAINT UQ_PERIODO_CODIGO UNIQUE (CODIGO_PERIODO)
);

/*==============================================================*/
/* Table: PRESTAMO                                              */
/*==============================================================*/
CREATE TABLE PRESTAMO (
   FECHA_PRESTAMO       DATE                 NOT NULL,
   ID_ESTUDIANTE        INT4                 NULL,
   ID_LIBRO             INT4                 NULL,
   FECHA_DEVOLUCION_PREVISTA DATE                 NOT NULL,
   FECHA_DEVOLUCION_REAL DATE                 NULL,
   CONSTRAINT PK_PRESTAMO PRIMARY KEY (FECHA_PRESTAMO)
);

/*==============================================================*/
/* Index: SOLICITA_LIBRO_FK                                     */
/*==============================================================*/
CREATE  INDEX SOLICITA_LIBRO_FK ON PRESTAMO (
ID_ESTUDIANTE
);

/*==============================================================*/
/* Index: ES_PRESTADO_FK                                        */
/*==============================================================*/
CREATE  INDEX ES_PRESTADO_FK ON PRESTAMO (
ID_LIBRO
);

/*==============================================================*/
/* Table: PROCESO_TITULACION                                    */
/*==============================================================*/
CREATE TABLE PROCESO_TITULACION (
   ID_PROCESO           INT4                 NOT NULL,
   ID_ESTUDIANTE        INT4                 NULL,
   ID_DOCENTE           INT4                 NULL,
   MODALIDAD_PROCESO    VARCHAR(30)          NOT NULL,
   TEMA_PROPUESTO       VARCHAR(300)         NOT NULL,
   FECHA_DEFENSA        DATE                 NULL,
   NOTA_FINAL_GRADO     NUMERIC(4,2)         NULL,
   ESTADO_PROCESO       VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_PROCESO_TITULACION PRIMARY KEY (ID_PROCESO),
   CONSTRAINT CHK_ESTADO_TITULACION CHECK (ESTADO_PROCESO IN ('ANTEPROYECTO', 'DESARROLLO', 'REVISION', 'CORRECCIONES', 'DEFENSA', 'APROBADO', 'RECHAZADO'))
);

/*==============================================================*/
/* Index: SOLICITA_TITULACION_FK                                */
/*==============================================================*/
CREATE  INDEX SOLICITA_TITULACION_FK ON PROCESO_TITULACION (
ID_ESTUDIANTE
);

/*==============================================================*/
/* Index: TUTORA_PROCESO_FK                                     */
/*==============================================================*/
CREATE  INDEX TUTORA_PROCESO_FK ON PROCESO_TITULACION (
ID_DOCENTE
);

/*==============================================================*/
/* Table: PROYECTO_INVESTIGACION                                */
/*==============================================================*/
CREATE TABLE PROYECTO_INVESTIGACION (
   ID_PROYECTO          INT4                 NOT NULL,
   ID_DOCENTE           INT4                 NULL,
   ID_DEPARTAMENTO      INT4                 NULL,
   CODIGO_PROYECTO      VARCHAR(20)          NOT NULL,
   TITULO_PROYECTO      VARCHAR(200)         NOT NULL,
   LINEA_INVESTIGACION  VARCHAR(100)         NOT NULL,
   PRESUPUESTO_ASIGNADO NUMERIC(10,2)        NOT NULL,
   FECHA_INICIO         DATE                 NOT NULL,
   ESTADO_PROYECTO      VARCHAR(20)          NOT NULL,
   CONSTRAINT PK_PROYECTO_INVESTIGACION PRIMARY KEY (ID_PROYECTO)
);

/*==============================================================*/
/* Index: DIRIGE_PROYECTO_FK                                    */
/*==============================================================*/
CREATE  INDEX DIRIGE_PROYECTO_FK ON PROYECTO_INVESTIGACION (
ID_DOCENTE
);

/*==============================================================*/
/* Index: GESTIONA_INVESTIGACION_FK                             */
/*==============================================================*/
CREATE  INDEX GESTIONA_INVESTIGACION_FK ON PROYECTO_INVESTIGACION (
ID_DEPARTAMENTO
);

/*==============================================================*/
/* Table: PUBLICACION                                           */
/*==============================================================*/
CREATE TABLE PUBLICACION (
   ID_PUBLICACION       INT4                 NOT NULL,
   ID_PROYECTO          INT4                 NULL,
   TITULO_PUBLICACION   VARCHAR(100)         NOT NULL,
   DOI                  VARCHAR(100)         NOT NULL,
   REVISTA              VARCHAR(100)         NOT NULL,
   CONSTRAINT PK_PUBLICACION PRIMARY KEY (ID_PUBLICACION)
);

/*==============================================================*/
/* Index: PRODUCE_PUBLICACION_FK                                */
/*==============================================================*/
CREATE  INDEX PRODUCE_PUBLICACION_FK ON PUBLICACION (
ID_PROYECTO
);

/*==============================================================*/
/* Table: TIENE_PRERREQUISITO                                   */
/*==============================================================*/
CREATE TABLE TIENE_PRERREQUISITO (
   ASI_ID_ASIGNATURA    INT4                 NOT NULL,
   ID_ASIGNATURA        INT4                 NOT NULL,
   CONSTRAINT PK_TIENE_PRERREQUISITO PRIMARY KEY (ASI_ID_ASIGNATURA, ID_ASIGNATURA)
);

/*==============================================================*/
/* Index: TIENE_PRERREQUISITO2_FK                               */
/*==============================================================*/
CREATE  INDEX TIENE_PRERREQUISITO2_FK ON TIENE_PRERREQUISITO (
ID_ASIGNATURA
);

/*==============================================================*/
/* Index: TIENE_PRERREQUISITO_FK                                */
/*==============================================================*/
CREATE  INDEX TIENE_PRERREQUISITO_FK ON TIENE_PRERREQUISITO (
ASI_ID_ASIGNATURA
);

/*==============================================================*/
/* Table: TIPO_BECA                                             */
/*==============================================================*/
CREATE TABLE TIPO_BECA (
   ID_BECA              INT4                 NOT NULL,
   NOMBRE_BECA          VARCHAR(100)         NOT NULL,
   CONSTRAINT PK_TIPO_BECA PRIMARY KEY (ID_BECA)
);

/*==============================================================*/
/* Table: TITULO_ACADEMICO                                      */
/*==============================================================*/
CREATE TABLE TITULO_ACADEMICO (
   ID_TITULO            INT4                 NOT NULL,
   ID_DOCENTE           INT4                 NULL,
   NOMBRE_TITULO        VARCHAR(100)         NOT NULL,
   NIVEL_TITULO         VARCHAR(50)          NOT NULL,
   UNIVERSIDAD          VARCHAR(100)         NOT NULL,
   CONSTRAINT PK_TITULO_ACADEMICO PRIMARY KEY (ID_TITULO)
);

/*==============================================================*/
/* Index: POSEE_TITULO_FK                                       */
/*==============================================================*/
CREATE  INDEX POSEE_TITULO_FK ON TITULO_ACADEMICO (
ID_DOCENTE
);

/*==============================================================*/
/* Table: TRIBUNAL_GRADO                                        */
/*==============================================================*/
CREATE TABLE TRIBUNAL_GRADO (
   ID_PROCESO           INT4                 NOT NULL,
   ID_DOCENTE           INT4                 NOT NULL,
   CONSTRAINT PK_TRIBUNAL_GRADO PRIMARY KEY (ID_PROCESO, ID_DOCENTE)
);

/*==============================================================*/
/* Index: TRIBUNAL_GRADO2_FK                                    */
/*==============================================================*/
CREATE  INDEX TRIBUNAL_GRADO2_FK ON TRIBUNAL_GRADO (
ID_DOCENTE
);

/*==============================================================*/
/* Index: TRIBUNAL_GRADO_FK                                     */
/*==============================================================*/
CREATE  INDEX TRIBUNAL_GRADO_FK ON TRIBUNAL_GRADO (
ID_PROCESO
);

ALTER TABLE ASIGNACION_BECA
   ADD CONSTRAINT FK_ASIGNACI_ES_TIPO_B_TIPO_BEC FOREIGN KEY (ID_BECA)
      REFERENCES TIPO_BECA (ID_BECA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE ASIGNACION_BECA
   ADD CONSTRAINT FK_ASIGNACI_RECIBE_BE_ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE AUTORIA
   ADD CONSTRAINT FK_AUTORIA_ESCRIBE_A_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE AUTORIA
   ADD CONSTRAINT FK_AUTORIA_TIENE_AUT_PUBLICAC FOREIGN KEY (ID_PUBLICACION)
      REFERENCES PUBLICACION (ID_PUBLICACION)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CALIFICACION
   ADD CONSTRAINT FK_CALIFICA_GENERA_CA_OFERTA_A FOREIGN KEY (ID_OFERTA)
      REFERENCES OFERTA_ASIGNATURA (ID_OFERTA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CALIFICACION
   ADD CONSTRAINT FK_CALIFICA_TIENE_DET_MATRICUL FOREIGN KEY (ID_MATRICULA)
      REFERENCES MATRICULA (ID_MATRICULA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CARRERA
   ADD CONSTRAINT FK_CARRERA_ADMINISTR_FACULTAD FOREIGN KEY (ID_FACULTAD)
      REFERENCES FACULTAD (ID_FACULTAD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CARRERA
   ADD CONSTRAINT FK_CARRERA_TIENE_COO_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE COLABORAN_EN
   ADD CONSTRAINT FK_COLABORA_COLABORAN_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE COLABORAN_EN
   ADD CONSTRAINT FK_COLABORA_COLABORAN_PROYECTO FOREIGN KEY (ID_PROYECTO)
      REFERENCES PROYECTO_INVESTIGACION (ID_PROYECTO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CORREQUISITO
   ADD CONSTRAINT FK_CORREQ_ASIG_A FOREIGN KEY (ASI_ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CORREQUISITO
   ADD CONSTRAINT FK_CORREQ_ASIG_B FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DEPARTAMENTO
   ADD CONSTRAINT FK_DEPARTAM_TIENE_DEP_FACULTAD FOREIGN KEY (ID_FACULTAD)
      REFERENCES FACULTAD (ID_FACULTAD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DETALLE_MALLA
   ADD CONSTRAINT FK_DETALLE__ES_PARTE__MALLA_CU FOREIGN KEY (ID_MALLA)
      REFERENCES MALLA_CURRICULAR (ID_MALLA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DETALLE_MALLA
   ADD CONSTRAINT FK_DETALLE__SE_PRESEN_ASIGNATU FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DOCENTE
   ADD CONSTRAINT FK_DOCENTE_ENSENIAN__FACULTAD FOREIGN KEY (FAC_ID_FACULTAD)
      REFERENCES FACULTAD (ID_FACULTAD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DOCENTE
   ADD CONSTRAINT FK_DOCENTE_TIENE_COO_CARRERA FOREIGN KEY (ID_CARRERA)
      REFERENCES CARRERA (ID_CARRERA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DOCENTE
   ADD CONSTRAINT FK_DOCENTE_TIENE_DEC_FACULTAD FOREIGN KEY (ID_FACULTAD)
      REFERENCES FACULTAD (ID_FACULTAD)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FACULTAD
   ADD CONSTRAINT FK_FACULTAD_TIENE_DEC_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE HISTORIAL_ACADEMICO
   ADD CONSTRAINT FK_HISTORIA_OBTUVO_RE_PERIODO_ FOREIGN KEY (ID_PERIODO)
      REFERENCES PERIODO_ACADEMICO (ID_PERIODO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE HISTORIAL_ACADEMICO
   ADD CONSTRAINT FK_HISTORIA_TIENE_ASI_ASIGNATU FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE HISTORIAL_ACADEMICO
   ADD CONSTRAINT FK_HISTORIA_TIENE_HIS_ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE HORARIO_CLASE
   ADD CONSTRAINT FK_HORARIO__SE_DICTA__OFERTA_A FOREIGN KEY (ID_OFERTA)
      REFERENCES OFERTA_ASIGNATURA (ID_OFERTA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE HORARIO_CLASE
   ADD CONSTRAINT FK_HORARIO__TIENE_HOR_AULA FOREIGN KEY (ID_AULA)
      REFERENCES AULA (ID_AULA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MALLA_CURRICULAR
   ADD CONSTRAINT FK_MALLA_CU_TIENE_CAR_CARRERA FOREIGN KEY (ID_CARRERA)
      REFERENCES CARRERA (ID_CARRERA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MATRICULA
   ADD CONSTRAINT FK_MATRICUL_HA_REALIZ_ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MATRICULA
   ADD CONSTRAINT FK_MATRICUL_SE_REALIZ_PERIODO_ FOREIGN KEY (ID_PERIODO)
      REFERENCES PERIODO_ACADEMICO (ID_PERIODO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE OFERTA_ASIGNATURA
   ADD CONSTRAINT FK_OFERTA_A_DESIGNADO_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE OFERTA_ASIGNATURA
   ADD CONSTRAINT FK_OFERTA_A_TIENE_ASI_ASIGNATU FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE OFERTA_ASIGNATURA
   ADD CONSTRAINT FK_OFERTA_A_TIENE_PER_PERIODO_ FOREIGN KEY (ID_PERIODO)
      REFERENCES PERIODO_ACADEMICO (ID_PERIODO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PRESTAMO
   ADD CONSTRAINT FK_PRESTAMO_ES_PRESTA_LIBRO FOREIGN KEY (ID_LIBRO)
      REFERENCES LIBRO (ID_LIBRO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PRESTAMO
   ADD CONSTRAINT FK_PRESTAMO_SOLICITA__ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PROCESO_TITULACION
   ADD CONSTRAINT FK_PROCESO__SOLICITA__ESTUDIAN FOREIGN KEY (ID_ESTUDIANTE)
      REFERENCES ESTUDIANTE (ID_ESTUDIANTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PROCESO_TITULACION
   ADD CONSTRAINT FK_PROCESO__TUTORA_PR_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PROYECTO_INVESTIGACION
   ADD CONSTRAINT FK_PROYECTO_DIRIGE_PR_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PROYECTO_INVESTIGACION
   ADD CONSTRAINT FK_PROYECTO_GESTIONA__DEPARTAM FOREIGN KEY (ID_DEPARTAMENTO)
      REFERENCES DEPARTAMENTO (ID_DEPARTAMENTO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PUBLICACION
   ADD CONSTRAINT FK_PUBLICAC_PRODUCE_P_PROYECTO FOREIGN KEY (ID_PROYECTO)
      REFERENCES PROYECTO_INVESTIGACION (ID_PROYECTO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TIENE_PRERREQUISITO
   ADD CONSTRAINT FK_PRERREQ_ASIG_HIJA FOREIGN KEY (ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TIENE_PRERREQUISITO
   ADD CONSTRAINT FK_PRERREQ_ASIG_PADRE FOREIGN KEY (ASI_ID_ASIGNATURA)
      REFERENCES ASIGNATURA (ID_ASIGNATURA)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TITULO_ACADEMICO
   ADD CONSTRAINT FK_TITULO_A_POSEE_TIT_DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TRIBUNAL_GRADO
   ADD CONSTRAINT FK_TRIBUNAL_TRIBUNAL__DOCENTE FOREIGN KEY (ID_DOCENTE)
      REFERENCES DOCENTE (ID_DOCENTE)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE TRIBUNAL_GRADO
   ADD CONSTRAINT FK_TRIBUNAL_TRIBUNAL__PROCESO_ FOREIGN KEY (ID_PROCESO)
      REFERENCES PROCESO_TITULACION (ID_PROCESO)
      ON DELETE RESTRICT ON UPDATE RESTRICT;

