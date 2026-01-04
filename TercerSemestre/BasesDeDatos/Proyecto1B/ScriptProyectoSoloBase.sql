/* ==========================================================================
   ENTREGABLE 3: IMPLEMENTACION EN ORACLE
   PROYECTO: SISTEMA DE GESTION ACADEMICA UNIVERSITARIA
   INTEGRANTES: Aidan Carrasco, Mathew Verdezoto, Luz Salazar, Alex Pogo, Kenneth Gaona, Zenan Fernandez, Alejandro Guanocunga, Andres Merino
   FECHA: Noviembre 2025
   ========================================================================== */


/*
PRIMERA FASE: Generacion del Script DDL a partir de los modelos diseniados en Power Designer. En esta parte se
encuentran la creacion de las tablas y de los indices. Ademas, adicionalmente se crean las secuencias y los uniques.
En las ultimas lineas de esta parte se encuentran la creacion de los constraints para las foreigns keys.
*/

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
CREATE TABLE HISTORIAL_ACADEMICO 
(
   ID_HISTORIAL         INTEGER              NOT NULL,
   ID_ESTUDIANTE        INTEGER,
   ID_PERIODO           INTEGER,
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

PROMPT === APLICANDO RESTRICCIONES UNIQUE ===

-- 1. ESTUDIANTES (Identificación y Correo)
-- Regla: Cada estudiante tiene matrícula única, cédula única y email único.
ALTER TABLE ESTUDIANTE ADD CONSTRAINT UQ_EST_CEDULA UNIQUE (CEDULA);
ALTER TABLE ESTUDIANTE ADD CONSTRAINT UQ_EST_MATRICULA UNIQUE (NUMERO_UNICO);
ALTER TABLE ESTUDIANTE ADD CONSTRAINT UQ_EST_EMAIL UNIQUE (EMAIL_INSTITUCIONAL);

-- 2. DOCENTES (Identificación y Correo)
-- Regla: Cada docente tiene código único, cédula única y email único.
ALTER TABLE DOCENTE ADD CONSTRAINT UQ_DOC_CEDULA UNIQUE (CEDULA);
ALTER TABLE DOCENTE ADD CONSTRAINT UQ_DOC_CODIGO UNIQUE (NUMERO_UNICO);
ALTER TABLE DOCENTE ADD CONSTRAINT UQ_DOC_EMAIL UNIQUE (EMAIL_INSTITUCIONAL);

-- 3. ASIGNATURAS (Código Académico)
-- Regla: El código de la materia (ej: CS-101) no puede repetirse.
ALTER TABLE ASIGNATURA ADD CONSTRAINT UQ_ASIG_CODIGO UNIQUE (CODIGO_ASIGNATURA);

-- 4. PERIODOS ACADÉMICOS (Código de Semestre)
-- Regla: No pueden existir dos periodos con el mismo código (ej: 2024-A).
ALTER TABLE PERIODO_ACADEMICO ADD CONSTRAINT UQ_PERIODO_CODIGO UNIQUE (CODIGO_PERIODO);

-- 5. LIBROS (ISBN)
-- Regla: El ISBN es el identificador universal único del libro.
ALTER TABLE LIBRO ADD CONSTRAINT UQ_LIBRO_ISBN UNIQUE (ISBN);

-- 6. PROYECTOS DE INVESTIGACIÓN (Código)
-- Regla: Cada proyecto tiene un código interno único.
ALTER TABLE PROYECTO_INVESTIGACION ADD CONSTRAINT UQ_PROY_CODIGO UNIQUE (CODIGO_PROYECTO);

-- Creacion de secuencias
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



/*
SEGUNDA FASE: Disenio de reglas complejas, en donde se modela la logica dificil, tales como prerrequisitos exclusivos,
mallas versionadas y horarios/aulas. Se asegura que las foreign keys tengan la integridad correcta (CASCADE/RESTRICT).
Ademas, se crean los uniques y se especifican los constraints para cada tabla e indice.
*/

--------------------------------------------------------
--  DDL for Table ASIGNACION_BECA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" 
   (	"FECHA_ASIGNACION" DATE, 
	"ID_ESTUDIANTE" NUMBER(*,0), 
	"ID_BECA" NUMBER(*,0), 
	"PORCENTAJE_COBERTURA" NUMBER(4,2), 
	"MONTO_ALIMENTACION" NUMBER(6,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA"."FECHA_ASIGNACION" IS 'Fecha en la que el estudiante recibe la beca. Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA"."ID_ESTUDIANTE" IS 'Identificador del estudiante que recibe la beca. Clave foránea hacia estudiante(id_estudiante).';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA"."ID_BECA" IS 'Identificador de la beca asignada al estudiante. Clave foránea hacia beca(id_beca).';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA"."PORCENTAJE_COBERTURA" IS 'Porcentaje de cobertura financiera aplicada a la beca (0–100%). Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA"."MONTO_ALIMENTACION" IS 'Monto monetario asignado para la cobertura de alimentación del estudiante.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA"  IS 'Registra la relación entre estudiantes y becas asignadas. Cada registro representa una asignación específica, indicando la fecha y el porcentaje de cobertura. Referencia a estudiante(id_estudiante) y beca(id_beca). Los campos fecha_asignacion y porcentaje_cobertura son obligatorios.';
--------------------------------------------------------
--  DDL for Table ASIGNATURA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" 
   (	"ID_ASIGNATURA" NUMBER(*,0), 
	"CODIGO_ASIGNATURA" VARCHAR2(15 BYTE), 
	"NOMBRE_ASIGNATURA" VARCHAR2(100 BYTE), 
	"NUMERO_CREDITOS" NUMBER(*,0), 
	"TIPO_ASIGNATURA" VARCHAR2(50 BYTE), 
	"AREA_CONOCIMIENTO" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNATURA"."ID_ASIGNATURA" IS 'Clave primaria que identifica a cada asignatura registrada. Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNATURA"."CODIGO_ASIGNATURA" IS 'Código único asignado a cada asignatura. Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNATURA"."NOMBRE_ASIGNATURA" IS 'Nombre oficial de la asignatura. Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNATURA"."NUMERO_CREDITOS" IS 'Número de créditos académicos de la asignatura. Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNATURA"."TIPO_ASIGNATURA" IS 'Clasificación de la asignatura (por ejemplo, de carrera, formación básica, optativa, etc.). Campo obligatorio.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ASIGNATURA"."AREA_CONOCIMIENTO" IS 'Área de conocimiento o facultad a la que pertenece la asignatura. Campo obligatorio.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA"  IS 'Contiene el catálogo de asignaturas de la institución, incluyendo su código, nombre, área de conocimiento, créditos y clasificación académica. La clave primaria es id_asignatura.';
--------------------------------------------------------
--  DDL for Table AULA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."AULA" 
   (	"ID_AULA" NUMBER(*,0), 
	"EDIFICIO_AULA" VARCHAR2(10 BYTE), 
	"PISO_AULA" NUMBER(*,0), 
	"NUMERO_AULA" VARCHAR2(10 BYTE), 
	"CAPACIDAD_ESTUDIANTES" NUMBER(*,0), 
	"TIPO_AULA" VARCHAR2(30 BYTE), 
	"TIENE_PROYECTOR" NUMBER(*,0), 
	"DETALLE_EQUIPAMIENTO" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."ID_AULA" IS 'Clave primaria que identifica de manera única al aula. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."EDIFICIO_AULA" IS 'Edificio en el que se encuentra ubicada el aula. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."PISO_AULA" IS 'Piso del edificio donde está ubicada el aula. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."NUMERO_AULA" IS 'Número asignado al aula. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."CAPACIDAD_ESTUDIANTES" IS 'Cantidad máxima de estudiantes que puede albergar el aula. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."TIPO_AULA" IS 'Clasificación del aula (laboratorio, aula regular, etc.). Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."TIENE_PROYECTOR" IS 'Indica mediante valor booleano si el aula cuenta con proyector. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AULA"."DETALLE_EQUIPAMIENTO" IS 'Descripción detallada del equipamiento disponible en el aula.';
--------------------------------------------------------
--  DDL for Table AUTORIA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" 
   (	"ID_PUBLICACION" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"ORDEN_AUTOR" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AUTORIA"."ID_PUBLICACION" IS 'Identificador de la publicación asociada. Forma parte de la clave primaria compuesta y referencia a la tabla PUBLICACION. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AUTORIA"."ID_DOCENTE" IS 'Identificador del docente autor de la publicación. Forma parte de la clave primaria compuesta y referencia a la tabla DOCENTE. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."AUTORIA"."ORDEN_AUTOR" IS 'Posición o prioridad del docente dentro de la autoría de la publicación (primer autor, segundo autor, etc.). Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA"  IS 'Tabla que relaciona publicaciones con docentes y define el orden de autoría en cada producción académica.';
--------------------------------------------------------
--  DDL for Table CALIFICACION
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" 
   (	"ID_CALIFICACION" NUMBER(*,0), 
	"ID_MATRICULA" NUMBER(*,0), 
	"ID_OFERTA" NUMBER(*,0), 
	"NOTA_PARCIAL_1" NUMBER(4,2), 
	"NOTA_PARCIAL_2" NUMBER(4,2), 
	"NOTA_FINAL" NUMBER(4,2), 
	"NOTA_SUPLETORIO" NUMBER(4,2), 
	"NOTA_MEJORAMIENTO" NUMBER(4,2), 
	"ESTADO_APROBACION" VARCHAR2(20 BYTE), 
	"ASISTENCIA_PORCENTAJE" NUMBER(5,2)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."ID_CALIFICACION" IS 'Identificador único de cada registro (PK). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."ID_MATRICULA" IS 'Identificador de la matrícula del estudiante (FK hacia MATRICULA). Relaciona la calificación con un estudiante matriculado.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."ID_OFERTA" IS 'Identificador de la oferta académica (FK hacia OFERTA). Relaciona la calificación con la asignatura ofertada.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."NOTA_PARCIAL_1" IS 'Nota obtenida en el primer parcial. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."NOTA_PARCIAL_2" IS 'Nota obtenida en el segundo parcial. Puede estar vacía si no aplica.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."NOTA_FINAL" IS 'Nota final obtenida en la asignatura. Puede estar vacía si aún no se calcula.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."NOTA_SUPLETORIO" IS 'Nota obtenida en el examen supletorio. Puede estar vacía si no aplica.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."NOTA_MEJORAMIENTO" IS 'Nota obtenida en el examen de mejoramiento. Puede estar vacía si no aplica.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."ESTADO_APROBACION" IS 'Estado final del estudiante en la asignatura (Aprobado/Reprobado).';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CALIFICACION"."ASISTENCIA_PORCENTAJE" IS 'Porcentaje de asistencia registrado (0–100%). Campo obligatorio.';
--------------------------------------------------------
--  DDL for Table CARRERA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" 
   (	"ID_CARRERA" NUMBER(*,0), 
	"ID_FACULTAD" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"NOMBRE_CARRERA" VARCHAR2(100 BYTE), 
	"NIVEL_CARRERA" VARCHAR2(20 BYTE), 
	"MODALIDAD_CARRERA" VARCHAR2(20 BYTE), 
	"DURACION_SEMESTRES" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."ID_CARRERA" IS 'Identificador único de la carrera (PK). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."ID_FACULTAD" IS 'Identificador de la facultad a la que pertenece la carrera (FK hacia FACULTAD). Permite vincular la carrera con su facultad correspondiente.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."ID_DOCENTE" IS 'Identificador del docente encargado o coordinador de la carrera (FK hacia DOCENTE). Permite relacionar la carrera con su responsable académico.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."NOMBRE_CARRERA" IS 'Nombre oficial de la carrera ofertada. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."NIVEL_CARRERA" IS 'Nivel académico de la carrera (Tecnología, Ingeniería, Licenciatura, etc.). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."MODALIDAD_CARRERA" IS 'Modalidad de estudio de la carrera (Presencial, Virtual, Híbrida). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CARRERA"."DURACION_SEMESTRES" IS 'Duración total de la carrera expresada en semestres. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."CARRERA"  IS 'Tabla donde se almacena la información principal de las carreras ofertadas por la institución. La PK es ID_CARRERA, mientras que ID_FACULTAD e ID_DOCENTE son FK usadas para asociar cada carrera con su facultad y con el docente responsable. Se registran datos como nombre, modalidad, nivel y duración en semestres.';
--------------------------------------------------------
--  DDL for Table COLABORAN_EN
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" 
   (	"ID_PROYECTO" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."COLABORAN_EN"."ID_PROYECTO" IS 'Identificador del proyecto en el que participa el docente (FK hacia PROYECTO). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."COLABORAN_EN"."ID_DOCENTE" IS 'Identificador del docente que colabora en el proyecto (FK hacia DOCENTE). Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN"  IS 'Tabla relacional donde se registran los docentes que colaboran en cada proyecto. Conformada únicamente por claves foráneas: ID_PROYECTO (FK hacia PROYECTO) e ID_DOCENTE (FK hacia DOCENTE). La combinación de ambas columnas funciona como PK compuesta.';
--------------------------------------------------------
--  DDL for Table CORREQUISITO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO" 
   (	"ASI_ID_ASIGNATURA" NUMBER(*,0), 
	"ID_ASIGNATURA" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CORREQUISITO"."ASI_ID_ASIGNATURA" IS 'Identificador de la asignatura que tiene el correquisito (FK hacia ASIGNATURA). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."CORREQUISITO"."ID_ASIGNATURA" IS 'Identificador de la asignatura requerida como correquisito (FK hacia ASIGNATURA). Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO"  IS 'Tabla relacional donde se registran las asignaturas que actúan como correquisitos de otras materias. Está compuesta únicamente por claves foráneas: ASI_ID_ASIGNATURA (FK hacia ASIGNATURA) e ID_ASIGNATURA (FK hacia ASIGNATURA). La combinación de ambos campos funciona como PK compuesta.';
--------------------------------------------------------
--  DDL for Table DEPARTAMENTO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" 
   (	"ID_DEPARTAMENTO" NUMBER(*,0), 
	"ID_FACULTAD" NUMBER(*,0), 
	"NOMBRE_DEPARTAMENTO" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO"."ID_DEPARTAMENTO" IS 'Clave primaria (PK) que identifica de manera única el departamento. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO"."ID_FACULTAD" IS 'Clave foránea (FK) que referencia la facultad a la cual pertenece el departamento. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO"."NOMBRE_DEPARTAMENTO" IS 'Nombre oficial del departamento académico. Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO"  IS 'Tabla que almacena los departamentos académicos asociados a una facultad dentro de la institución.';
--------------------------------------------------------
--  DDL for Table DETALLE_MALLA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" 
   (	"ID_ASIGNATURA" NUMBER(*,0), 
	"ID_MALLA" NUMBER(*,0), 
	"SEMESTRE_SUGERIDO" NUMBER(*,0), 
	"HORAS_TEORICAS" NUMBER(*,0), 
	"HORAS_PRACTICAS" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA"."ID_ASIGNATURA" IS 'Clave foránea (FK) que referencia la asignatura incluida dentro de la malla. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA"."ID_MALLA" IS 'Clave foránea (FK) que referencia la malla curricular a la que pertenece la asignatura. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA"."SEMESTRE_SUGERIDO" IS 'Semestre recomendado dentro del plan académico para cursar la asignatura. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA"."HORAS_TEORICAS" IS 'Número de horas teóricas asignadas a la materia dentro de la malla. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA"."HORAS_PRACTICAS" IS 'Número de horas prácticas asignadas a la materia dentro de la malla. Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA"  IS 'Tabla que relaciona cada asignatura con la malla curricular correspondiente. Permite especificar el semestre sugerido y la distribución de horas teóricas y prácticas.';
--------------------------------------------------------
--  DDL for Table DOCENTE
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" 
   (	"ID_DOCENTE" NUMBER(*,0), 
	"ID_FACULTAD" NUMBER(*,0), 
	"FAC_ID_FACULTAD" NUMBER(*,0), 
	"ID_CARRERA" NUMBER(*,0), 
	"NUMERO_UNICO" VARCHAR2(9 BYTE), 
	"CEDULA" VARCHAR2(10 BYTE), 
	"NOMBRES_DOCENTE" VARCHAR2(100 BYTE), 
	"APELLIDOS_DOCENTE" VARCHAR2(100 BYTE), 
	"EMAIL_INSTITUCIONAL" VARCHAR2(100 BYTE), 
	"TIPO_PROFESOR" VARCHAR2(50 BYTE), 
	"CATEGORIA_DOCENTE" VARCHAR2(50 BYTE), 
	"FECHA_INGRESO" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."ID_DOCENTE" IS 'Clave primaria (PK) que identifica de manera única a cada docente registrado. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."ID_FACULTAD" IS 'Clave foránea (FK) que referencia la facultad principal a la que pertenece el docente. Este campo puede estar vacío según la relación.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."FAC_ID_FACULTAD" IS 'Clave foránea (FK) alterna que puede representar la facultad de adscripción administrativa. Requiere validación del modelo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."ID_CARRERA" IS 'Clave foránea (FK) que referencia la carrera a la cual está adscrito el docente. Este campo puede estar vacío si el docente no pertenece a una carrera específica.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."NUMERO_UNICO" IS 'Código institucional único asignado al docente. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."CEDULA" IS 'Número de identificación legal del docente. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."NOMBRES_DOCENTE" IS 'Nombres del docente. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."APELLIDOS_DOCENTE" IS 'Apellidos del docente. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."EMAIL_INSTITUCIONAL" IS 'Correo institucional del docente. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."TIPO_PROFESOR" IS 'Tipo de nombramiento del docente (por ejemplo: titular, contrato, hora-cátedra). Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."CATEGORIA_DOCENTE" IS 'Categoría docente según escalafón académico. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."DOCENTE"."FECHA_INGRESO" IS 'Fecha en la que el docente ingresó a la institución. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE"  IS 'Tabla que almacena la información personal, académica y administrativa de los docentes vinculados a la institución. Contiene relaciones hacia facultad y carrera.';
--------------------------------------------------------
--  DDL for Table ESTUDIANTE
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" 
   (	"ID_ESTUDIANTE" NUMBER(*,0), 
	"NUMERO_UNICO" VARCHAR2(9 BYTE), 
	"CEDULA" VARCHAR2(10 BYTE), 
	"NOMBRES_ESTUDIANTE" VARCHAR2(100 BYTE), 
	"APELLIDOS_ESTUDIANTE" VARCHAR2(100 BYTE), 
	"EMAIL_INSTITUCIONAL" VARCHAR2(100 BYTE), 
	"FECHA_INGRESO" DATE, 
	"ESTADO_ESTUDIANTE" VARCHAR2(20 BYTE), 
	"IRA" NUMBER(4,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."ID_ESTUDIANTE" IS 'Clave primaria (PK) que identifica de manera única a cada estudiante registrado. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."NUMERO_UNICO" IS 'Código institucional único asignado al estudiante. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."CEDULA" IS 'Número de identificación legal del estudiante. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."NOMBRES_ESTUDIANTE" IS 'Nombres completos del estudiante. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."APELLIDOS_ESTUDIANTE" IS 'Apellidos completos del estudiante. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."EMAIL_INSTITUCIONAL" IS 'Correo institucional del estudiante. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."FECHA_INGRESO" IS 'Fecha en la que el estudiante ingresó o se matriculó oficialmente en la institución. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."ESTADO_ESTUDIANTE" IS 'Estado académico actual del estudiante (activo, egresado, retirado, etc.). Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"."IRA" IS 'Índice de Rendimiento Académico del estudiante. Puede ser nulo si el estudiante aún no posee historial académico.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE"  IS 'Tabla que almacena la información personal, académica y administrativa de los estudiantes matriculados en la institución.';
--------------------------------------------------------
--  DDL for Table FACULTAD
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD" 
   (	"ID_FACULTAD" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"NOMBRE_FACULTAD" VARCHAR2(100 BYTE), 
	"NUMERO_EDIFICIO" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."FACULTAD"."ID_FACULTAD" IS 'Clave primaria (PK) que identifica de manera única cada facultad registrada. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."FACULTAD"."ID_DOCENTE" IS 'Clave foránea (FK) que referencia al docente encargado o directivo asociado a la facultad. Puede ser nulo si no existe asignación.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."FACULTAD"."NOMBRE_FACULTAD" IS 'Nombre oficial de la facultad dentro de la institución. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."FACULTAD"."NUMERO_EDIFICIO" IS 'Número del edificio físico donde se ubica la facultad. Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD"  IS 'Tabla que almacena las facultades de la institución, incluyendo su identificación, nombre, edificio asignado y docente responsable.';
--------------------------------------------------------
--  DDL for Table HISTORIAL_ACADEMICO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" 
   (	"ID_HISTORIAL" NUMBER(*,0), 
	"ID_ESTUDIANTE" NUMBER(*,0), 
	"ID_PERIODO" NUMBER(*,0), 
	"NOTA_DEFINITIVA" NUMBER(4,2), 
	"ESTADO_MATERIA" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO"."ID_HISTORIAL" IS 'Clave primaria (PK) que identifica de manera única cada registro de historial académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO"."ID_ESTUDIANTE" IS 'Clave foránea (FK) que referencia al estudiante al que pertenece el registro académico. Puede ser nulo según el contexto de registro.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO"."ID_PERIODO" IS 'Clave foránea (FK) que referencia el periodo académico en el cual se cursó la materia. Puede estar vacío en registros no asociados a ciclos oficiales.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO"."NOTA_DEFINITIVA" IS 'Nota final obtenida en la materia cursada durante el periodo académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO"."ESTADO_MATERIA" IS 'Estado final de la materia (Aprobado, Reprobado, Retirado, en Curso, etc.). Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO"  IS 'Tabla que registra el historial académico de cada estudiante, almacenando las calificaciones finales y el estado de cada materia cursada por periodo académico.';
--------------------------------------------------------
--  DDL for Table HORARIO_CLASE
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" 
   (	"ID_HORARIO" NUMBER(*,0), 
	"ID_AULA" NUMBER(*,0), 
	"ID_OFERTA" NUMBER(*,0), 
	"DIA_SEMANA" VARCHAR2(15 BYTE), 
	"HORA_INICIO" DATE, 
	"HORA_FIN" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"."ID_HORARIO" IS 'Clave primaria (PK) que identifica de manera única cada registro de horario asignado. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"."ID_AULA" IS 'Clave foránea (FK) que referencia el aula donde se impartirá la clase. Puede ser nulo si aún no se asigna aula.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"."ID_OFERTA" IS 'Clave foránea (FK) que referencia la oferta académica asociada al horario. Puede ser nulo si el horario aún no está vinculado.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"."DIA_SEMANA" IS 'Día de la semana en el cual se dicta la clase (Lunes, Martes, etc.). Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"."HORA_INICIO" IS 'Hora de inicio de la clase programada. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"."HORA_FIN" IS 'Hora de finalización de la clase programada. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE"  IS 'Tabla que registra los horarios asignados a una oferta académica específica, incluyendo el aula, día y rango de tiempo donde se impartirá la clase.';
--------------------------------------------------------
--  DDL for Table LIBRO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" 
   (	"ID_LIBRO" NUMBER(*,0), 
	"ISBN" VARCHAR2(20 BYTE), 
	"TITULO_LIBRO" VARCHAR2(200 BYTE), 
	"AUTOR" VARCHAR2(100 BYTE), 
	"EDITORIAL" VARCHAR2(100 BYTE), 
	"STOCK_DISPONIBLE" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."LIBRO"."ID_LIBRO" IS 'Clave primaria (PK) que identifica de manera única cada libro registrado en el sistema. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."LIBRO"."ISBN" IS 'Código ISBN del libro, utilizado como identificador bibliográfico estándar. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."LIBRO"."TITULO_LIBRO" IS 'Título oficial del libro registrado. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."LIBRO"."AUTOR" IS 'Nombre del autor o autores del libro. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."LIBRO"."EDITORIAL" IS 'Editorial responsable de la publicación del libro. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."LIBRO"."STOCK_DISPONIBLE" IS 'Cantidad de ejemplares disponibles en inventario para préstamo o uso institucional. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."LIBRO"  IS 'Tabla que almacena el catálogo de libros disponibles en la institución, incluyendo su identificación, datos bibliográficos y cantidad en inventario.';
--------------------------------------------------------
--  DDL for Table MALLA_CURRICULAR
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" 
   (	"ID_MALLA" NUMBER(*,0), 
	"ID_CARRERA" NUMBER(*,0), 
	"CODIGO_COHORTE" VARCHAR2(10 BYTE), 
	"FECHA_APROBACION" DATE, 
	"TOTAL_CREDITOS" NUMBER(*,0), 
	"ESTADO_MALLA" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"."ID_MALLA" IS 'Clave primaria (PK) que identifica de manera única cada malla curricular registrada. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"."ID_CARRERA" IS 'Clave foránea (FK) que referencia la carrera a la cual pertenece la malla curricular. Puede estar vacío si aún no se asocia.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"."CODIGO_COHORTE" IS 'Código asignado a la cohorte de la malla curricular. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"."FECHA_APROBACION" IS 'Fecha oficial en la que la malla curricular fue aprobada institucionalmente. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"."TOTAL_CREDITOS" IS 'Cantidad total de créditos definidos en la malla curricular. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"."ESTADO_MALLA" IS 'Estado actual de la malla curricular (Activa, Obsoleta, en Revisión, etc.). Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR"  IS 'Tabla que registra las mallas curriculares de cada carrera, incluyendo cohorte, fecha de aprobación, estado y la carga total de créditos definida.';
--------------------------------------------------------
--  DDL for Table MATRICULA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" 
   (	"ID_MATRICULA" NUMBER(*,0), 
	"ID_ESTUDIANTE" NUMBER(*,0), 
	"ID_PERIODO" NUMBER(*,0), 
	"FECHA_REGISTRO" DATE, 
	"FORMA_MATRICULA" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MATRICULA"."ID_MATRICULA" IS 'Clave primaria (PK) que identifica de manera única cada matrícula registrada. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MATRICULA"."ID_ESTUDIANTE" IS 'Clave foránea (FK) que referencia al estudiante asociado a la matrícula. Este campo puede estar vacío si aún no se asigna estudiante.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MATRICULA"."ID_PERIODO" IS 'Clave foránea (FK) que referencia el periodo académico correspondiente a la matrícula. Este campo puede estar vacío si aún no se asigna periodo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MATRICULA"."FECHA_REGISTRO" IS 'Fecha en la que se realizó la matrícula del estudiante. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."MATRICULA"."FORMA_MATRICULA" IS 'Forma en la que se realizó la matrícula (presencial, virtual, etc.). Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA"  IS 'Tabla que registra las matrículas de los estudiantes en cada periodo académico, incluyendo la fecha de registro y la forma de matrícula.';
--------------------------------------------------------
--  DDL for Table OFERTA_ASIGNATURA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" 
   (	"ID_OFERTA" NUMBER(*,0), 
	"ID_PERIODO" NUMBER(*,0), 
	"ID_ASIGNATURA" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"CODIGO_PARALELO" VARCHAR2(10 BYTE), 
	"CUPO_MAXIMO" NUMBER(*,0), 
	"CUPO_DISPONIBLE" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."ID_OFERTA" IS 'Clave primaria (PK) que identifica de manera única cada oferta de asignatura. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."ID_PERIODO" IS 'Clave foránea (FK) que referencia el periodo académico en el que se oferta la asignatura. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."ID_ASIGNATURA" IS 'Clave foránea (FK) que referencia la asignatura incluida en la oferta. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."ID_DOCENTE" IS 'Clave foránea (FK) que referencia al docente asignado a la oferta de la asignatura. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."CODIGO_PARALELO" IS 'Código asignado al paralelo de la oferta de la asignatura. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."CUPO_MAXIMO" IS 'Cantidad máxima de estudiantes permitidos en la oferta de asignatura. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"."CUPO_DISPONIBLE" IS 'Cantidad de cupos actualmente disponibles en la oferta de asignatura. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA"  IS 'Tabla que registra las ofertas de asignaturas por periodo académico, incluyendo docente asignado, código de paralelo y cupos disponibles.';
--------------------------------------------------------
--  DDL for Table PERIODO_ACADEMICO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" 
   (	"ID_PERIODO" NUMBER(*,0), 
	"CODIGO_PERIODO" VARCHAR2(10 BYTE), 
	"NOMBRE_PERIODO" VARCHAR2(10 BYTE), 
	"FECHA_INICIO" DATE, 
	"FECHA_FIN" DATE, 
	"ESTADO_PERIODO" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"."ID_PERIODO" IS 'Clave primaria (PK) que identifica de manera única cada periodo académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"."CODIGO_PERIODO" IS 'Código único asignado al periodo académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"."NOMBRE_PERIODO" IS 'Nombre descriptivo del periodo académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"."FECHA_INICIO" IS 'Fecha de inicio oficial del periodo académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"."FECHA_FIN" IS 'Fecha de finalización oficial del periodo académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"."ESTADO_PERIODO" IS 'Estado actual del periodo académico (Activo, Cerrado, Planificado, etc.). Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO"  IS 'Tabla que almacena los periodos académicos de la institución, incluyendo código, nombre, fechas de inicio y fin, y estado del periodo.';
--------------------------------------------------------
--  DDL for Table PRESTAMO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO" 
   (	"FECHA_PRESTAMO" DATE, 
	"ID_ESTUDIANTE" NUMBER(*,0), 
	"ID_LIBRO" NUMBER(*,0), 
	"FECHA_DEVOLUCION_PREVISTA" DATE, 
	"FECHA_DEVOLUCION_REAL" DATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PRESTAMO"."FECHA_PRESTAMO" IS 'Clave primaria (PK) que identifica de manera única cada préstamo de libro. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PRESTAMO"."ID_ESTUDIANTE" IS 'Clave foránea (FK) que referencia al estudiante que realiza el préstamo. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PRESTAMO"."ID_LIBRO" IS 'Clave foránea (FK) que referencia al libro que se presta. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PRESTAMO"."FECHA_DEVOLUCION_PREVISTA" IS 'Fecha en la que se espera que el libro sea devuelto. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PRESTAMO"."FECHA_DEVOLUCION_REAL" IS 'Fecha en la que el libro fue efectivamente devuelto. Este campo puede estar vacío si el libro aún no se ha devuelto.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO"  IS 'Tabla que registra los préstamos de libros por parte de los estudiantes, incluyendo fechas de préstamo, devolución prevista y real.';
--------------------------------------------------------
--  DDL for Table PROCESO_TITULACION
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" 
   (	"ID_PROCESO" NUMBER(*,0), 
	"ID_ESTUDIANTE" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"MODALIDAD_PROCESO" VARCHAR2(30 BYTE), 
	"TEMA_PROPUESTO" VARCHAR2(300 BYTE), 
	"FECHA_DEFENSA" DATE, 
	"NOTA_FINAL_GRADO" NUMBER(4,2), 
	"ESTADO_PROCESO" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."ID_PROCESO" IS 'Clave primaria (PK) que identifica de manera única cada proceso de titulación. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."ID_ESTUDIANTE" IS 'Clave foránea (FK) que referencia al estudiante que realiza el proceso de titulación. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."ID_DOCENTE" IS 'Clave foránea (FK) que referencia al docente asignado como tutor o evaluador del proceso de titulación. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."MODALIDAD_PROCESO" IS 'Modalidad del proceso de titulación (Trabajo de Grado, Proyecto, Tesis, etc.). Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."TEMA_PROPUESTO" IS 'Tema propuesto por el estudiante para el proceso de titulación. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."FECHA_DEFENSA" IS 'Fecha programada para la defensa del proceso de titulación. Este campo puede estar vacío si aún no se ha programado.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."NOTA_FINAL_GRADO" IS 'Calificación final obtenida por el estudiante en el proceso de titulación. Este campo puede estar vacío hasta que se asigne nota.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"."ESTADO_PROCESO" IS 'Estado actual del proceso de titulación (En Proceso, Aprobado, Reprobado, Suspendido, etc.). Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION"  IS 'Tabla que registra los procesos de titulación de los estudiantes, incluyendo modalidad, tema propuesto, fechas, calificación final y estado del proceso.';
--------------------------------------------------------
--  DDL for Table PROYECTO_INVESTIGACION
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" 
   (	"ID_PROYECTO" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"ID_DEPARTAMENTO" NUMBER(*,0), 
	"CODIGO_PROYECTO" VARCHAR2(20 BYTE), 
	"TITULO_PROYECTO" VARCHAR2(200 BYTE), 
	"LINEA_INVESTIGACION" VARCHAR2(100 BYTE), 
	"PRESUPUESTO_ASIGNADO" NUMBER(10,2), 
	"FECHA_INICIO" DATE, 
	"ESTADO_PROYECTO" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."ID_PROYECTO" IS 'Clave primaria (PK) que identifica de manera única cada proyecto de investigación. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."ID_DOCENTE" IS 'Clave foránea (FK) que referencia al docente responsable del proyecto. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."ID_DEPARTAMENTO" IS 'Clave foránea (FK) que referencia al departamento asociado al proyecto. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."CODIGO_PROYECTO" IS 'Código único asignado al proyecto de investigación. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."TITULO_PROYECTO" IS 'Título oficial del proyecto de investigación. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."LINEA_INVESTIGACION" IS 'Línea de investigación a la que pertenece el proyecto. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."PRESUPUESTO_ASIGNADO" IS 'Monto financiero asignado al proyecto. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."FECHA_INICIO" IS 'Fecha en la que inicia el proyecto de investigación. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"."ESTADO_PROYECTO" IS 'Estado actual del proyecto (Activo, Concluido, Cancelado, etc.). Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION"  IS 'Tabla que registra los proyectos de investigación de la institución, incluyendo docente responsable, departamento, código, título, línea de investigación, presupuesto, fechas y estado del proyecto.';
--------------------------------------------------------
--  DDL for Table PUBLICACION
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" 
   (	"ID_PUBLICACION" NUMBER(*,0), 
	"ID_PROYECTO" NUMBER(*,0), 
	"TITULO_PUBLICACION" VARCHAR2(100 BYTE), 
	"DOI" VARCHAR2(100 BYTE), 
	"REVISTA" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PUBLICACION"."ID_PUBLICACION" IS 'Clave primaria (PK) que identifica de manera única cada publicación. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PUBLICACION"."ID_PROYECTO" IS 'Clave foránea (FK) que referencia al proyecto de investigación asociado a la publicación. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PUBLICACION"."TITULO_PUBLICACION" IS 'Título oficial de la publicación. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PUBLICACION"."DOI" IS 'Identificador DOI de la publicación. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."PUBLICACION"."REVISTA" IS 'Nombre de la revista donde se publicó el artículo. Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION"  IS 'Tabla que registra las publicaciones derivadas de proyectos de investigación, incluyendo título, DOI y revista donde se publica.';
--------------------------------------------------------
--  DDL for Table TIENE_PRERREQUISITO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" 
   (	"ASI_ID_ASIGNATURA" NUMBER(*,0), 
	"ID_ASIGNATURA" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO"."ASI_ID_ASIGNATURA" IS 'Clave foránea (FK) que referencia la asignatura que tiene prerrequisito. Parte de la clave primaria (PK) compuesta. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO"."ID_ASIGNATURA" IS 'Clave foránea (FK) que referencia la asignatura que actúa como prerrequisito. Parte de la clave primaria (PK) compuesta. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO"  IS 'Tabla que relaciona las asignaturas con sus prerrequisitos, estableciendo qué asignaturas deben aprobarse antes de cursar otra.';
--------------------------------------------------------
--  DDL for Table TIPO_BECA
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."TIPO_BECA" 
   (	"ID_BECA" NUMBER(*,0), 
	"NOMBRE_BECA" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TIPO_BECA"."ID_BECA" IS 'Clave primaria (PK) que identifica de manera única cada tipo de beca. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TIPO_BECA"."NOMBRE_BECA" IS 'Nombre descriptivo del tipo de beca. Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."TIPO_BECA"  IS 'Tabla que almacena los diferentes tipos de becas disponibles, incluyendo su nombre y código identificador.';
--------------------------------------------------------
--  DDL for Table TITULO_ACADEMICO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" 
   (	"ID_TITULO" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0), 
	"NOMBRE_TITULO" VARCHAR2(100 BYTE), 
	"NIVEL_TITULO" VARCHAR2(50 BYTE), 
	"UNIVERSIDAD" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO"."ID_TITULO" IS 'Clave primaria (PK) que identifica de manera única cada título académico. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO"."ID_DOCENTE" IS 'Clave foránea (FK) que referencia al docente que posee el título académico. Este campo puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO"."NOMBRE_TITULO" IS 'Nombre oficial del título académico. Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO"."NIVEL_TITULO" IS 'Nivel académico del título (Licenciatura, Maestría, Doctorado, etc.). Este campo no puede estar vacío.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO"."UNIVERSIDAD" IS 'Nombre de la universidad que expidió el título académico. Este campo no puede estar vacío.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO"  IS 'Tabla que registra los títulos académicos obtenidos por los docentes, incluyendo nombre, nivel y universidad emisora.';
--------------------------------------------------------
--  DDL for Table TRIBUNAL_GRADO
--------------------------------------------------------

  CREATE TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" 
   (	"ID_PROCESO" NUMBER(*,0), 
	"ID_DOCENTE" NUMBER(*,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO"."ID_PROCESO" IS 'Clave foránea (FK) que referencia al proceso de titulación. Parte de la clave primaria (PK) compuesta. Este campo no puede ser nulo.';
   COMMENT ON COLUMN "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO"."ID_DOCENTE" IS 'Clave foránea (FK) que referencia al docente que integra el tribunal de grado. Parte de la clave primaria (PK) compuesta. Este campo no puede ser nulo.';
   COMMENT ON TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO"  IS 'Tabla que registra los docentes que conforman el tribunal de grado de cada proceso de titulación.';
REM INSERTING into SISTEMA_UNIVERSITARIO.ASIGNACION_BECA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.ASIGNATURA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.AULA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.AUTORIA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.CALIFICACION
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.CARRERA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.COLABORAN_EN
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.CORREQUISITO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.DEPARTAMENTO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.DETALLE_MALLA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.DOCENTE
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.ESTUDIANTE
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.FACULTAD
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.HISTORIAL_ACADEMICO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.HORARIO_CLASE
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.LIBRO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.MALLA_CURRICULAR
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.MATRICULA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.OFERTA_ASIGNATURA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.PERIODO_ACADEMICO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.PRESTAMO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.PROCESO_TITULACION
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.PROYECTO_INVESTIGACION
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.PUBLICACION
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.TIENE_PRERREQUISITO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.TIPO_BECA
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.TITULO_ACADEMICO
SET DEFINE OFF;
REM INSERTING into SISTEMA_UNIVERSITARIO.TRIBUNAL_GRADO
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index ADMINISTRA_CARRERA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ADMINISTRA_CARRERA_FK" ON "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COLABORAN_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."COLABORAN_EN_FK" ON "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ("ID_PROYECTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COLABORAN_EN2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."COLABORAN_EN2_FK" ON "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CORREQUISITO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."CORREQUISITO_FK" ON "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ("ASI_ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CORREQUISITO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."CORREQUISITO2_FK" ON "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DESIGNADO_OFERTA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."DESIGNADO_OFERTA_FK" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DIRIGE_PROYECTO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."DIRIGE_PROYECTO_FK" ON "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ENSENIAN_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ENSENIAN_EN_FK" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("FAC_ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ESCRIBE_ARTICULO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ESCRIBE_ARTICULO_FK" ON "SISTEMA_UNIVERSITARIO"."AUTORIA" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ES_PARTE_DE_MALLA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ES_PARTE_DE_MALLA_FK" ON "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ("ID_MALLA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ES_PRESTADO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ES_PRESTADO_FK" ON "SISTEMA_UNIVERSITARIO"."PRESTAMO" ("ID_LIBRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ES_TIPO_BECA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ES_TIPO_BECA_FK" ON "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ("ID_BECA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GENERA_CALIFICACIONES_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."GENERA_CALIFICACIONES_FK" ON "SISTEMA_UNIVERSITARIO"."CALIFICACION" ("ID_OFERTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GESTIONA_INVESTIGACION_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."GESTIONA_INVESTIGACION_FK" ON "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_DEPARTAMENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HA_REALIZADO_MATRICULA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."HA_REALIZADO_MATRICULA_FK" ON "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index OBTUVO_RESULTADOS_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."OBTUVO_RESULTADOS_EN_FK" ON "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ASIGNACION_BECA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_ASIGNACION_BECA" ON "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ("FECHA_ASIGNACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ASIGNATURA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_ASIGNATURA" ON "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_AULA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_AULA" ON "SISTEMA_UNIVERSITARIO"."AULA" ("ID_AULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_AUTORIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_AUTORIA" ON "SISTEMA_UNIVERSITARIO"."AUTORIA" ("ID_PUBLICACION", "ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CALIFICACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_CALIFICACION" ON "SISTEMA_UNIVERSITARIO"."CALIFICACION" ("ID_CALIFICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CARRERA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_CARRERA" ON "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_CARRERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_COLABORAN_EN
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_COLABORAN_EN" ON "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ("ID_PROYECTO", "ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CORREQUISITO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_CORREQUISITO" ON "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ("ASI_ID_ASIGNATURA", "ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_DEPARTAMENTO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_DEPARTAMENTO" ON "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ("ID_DEPARTAMENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_DETALLE_MALLA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_DETALLE_MALLA" ON "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ("ID_ASIGNATURA", "ID_MALLA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_DOCENTE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_DOCENTE" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ESTUDIANTE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_ESTUDIANTE" ON "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_FACULTAD
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_FACULTAD" ON "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_HISTORIAL_ACADEMICO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_HISTORIAL_ACADEMICO" ON "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ("ID_HISTORIAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_HORARIO_CLASE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_HORARIO_CLASE" ON "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ("ID_HORARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_LIBRO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_LIBRO" ON "SISTEMA_UNIVERSITARIO"."LIBRO" ("ID_LIBRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MALLA_CURRICULAR
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_MALLA_CURRICULAR" ON "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ("ID_MALLA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MATRICULA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_MATRICULA" ON "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_MATRICULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_OFERTA_ASIGNATURA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_OFERTA_ASIGNATURA" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_OFERTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PERIODO_ACADEMICO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PERIODO_ACADEMICO" ON "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PRESTAMO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PRESTAMO" ON "SISTEMA_UNIVERSITARIO"."PRESTAMO" ("FECHA_PRESTAMO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PROCESO_TITULACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PROCESO_TITULACION" ON "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_PROCESO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PROYECTO_INVESTIGACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PROYECTO_INVESTIGACION" ON "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_PROYECTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PUBLICACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PUBLICACION" ON "SISTEMA_UNIVERSITARIO"."PUBLICACION" ("ID_PUBLICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TIENE_PRERREQUISITO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TIENE_PRERREQUISITO" ON "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ("ASI_ID_ASIGNATURA", "ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TIPO_BECA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TIPO_BECA" ON "SISTEMA_UNIVERSITARIO"."TIPO_BECA" ("ID_BECA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TITULO_ACADEMICO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TITULO_ACADEMICO" ON "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" ("ID_TITULO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TRIBUNAL_GRADO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TRIBUNAL_GRADO" ON "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ("ID_PROCESO", "ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index POSEE_TITULO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."POSEE_TITULO_FK" ON "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCE_PUBLICACION_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."PRODUCE_PUBLICACION_FK" ON "SISTEMA_UNIVERSITARIO"."PUBLICACION" ("ID_PROYECTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RECIBE_BECA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."RECIBE_BECA_FK" ON "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SE_DICTA_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SE_DICTA_EN_FK" ON "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ("ID_OFERTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SE_PRESENTA_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SE_PRESENTA_EN_FK" ON "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SE_REALIZAN_PERIODO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SE_REALIZAN_PERIODO_FK" ON "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SOLICITA_LIBRO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SOLICITA_LIBRO_FK" ON "SISTEMA_UNIVERSITARIO"."PRESTAMO" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SOLICITA_TITULACION_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SOLICITA_TITULACION_FK" ON "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_ASIGNATURA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_ASIGNATURA_FK" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_AUTORES_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_AUTORES_FK" ON "SISTEMA_UNIVERSITARIO"."AUTORIA" ("ID_PUBLICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_CARRERA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_CARRERA_FK" ON "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ("ID_CARRERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_COORDINADOR_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_COORDINADOR_FK" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_CARRERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_COORDINADOR2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_COORDINADOR2_FK" ON "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DECANO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DECANO_FK" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DECANO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DECANO2_FK" ON "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DEPARTAMENTOS_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DEPARTAMENTOS_FK" ON "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DETALLE_NOTAS_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DETALLE_NOTAS_FK" ON "SISTEMA_UNIVERSITARIO"."CALIFICACION" ("ID_MATRICULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_HISTORIALES_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_HISTORIALES_FK" ON "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_HORARIO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_HORARIO_FK" ON "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ("ID_AULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_PERIODO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_PERIODO_FK" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_PRERREQUISITO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO_FK" ON "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ("ASI_ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_PRERREQUISITO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO2_FK" ON "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TRIBUNAL_GRADO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO_FK" ON "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ("ID_PROCESO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TRIBUNAL_GRADO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO2_FK" ON "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TUTORA_PROCESO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TUTORA_PROCESO_FK" ON "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ASIGNACION_BECA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_ASIGNACION_BECA" ON "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ("FECHA_ASIGNACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index RECIBE_BECA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."RECIBE_BECA_FK" ON "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ES_TIPO_BECA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ES_TIPO_BECA_FK" ON "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ("ID_BECA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ASIGNATURA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_ASIGNATURA" ON "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_AULA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_AULA" ON "SISTEMA_UNIVERSITARIO"."AULA" ("ID_AULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_AUTORIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_AUTORIA" ON "SISTEMA_UNIVERSITARIO"."AUTORIA" ("ID_PUBLICACION", "ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ESCRIBE_ARTICULO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ESCRIBE_ARTICULO_FK" ON "SISTEMA_UNIVERSITARIO"."AUTORIA" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_AUTORES_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_AUTORES_FK" ON "SISTEMA_UNIVERSITARIO"."AUTORIA" ("ID_PUBLICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CALIFICACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_CALIFICACION" ON "SISTEMA_UNIVERSITARIO"."CALIFICACION" ("ID_CALIFICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DETALLE_NOTAS_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DETALLE_NOTAS_FK" ON "SISTEMA_UNIVERSITARIO"."CALIFICACION" ("ID_MATRICULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GENERA_CALIFICACIONES_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."GENERA_CALIFICACIONES_FK" ON "SISTEMA_UNIVERSITARIO"."CALIFICACION" ("ID_OFERTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CARRERA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_CARRERA" ON "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_CARRERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ADMINISTRA_CARRERA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ADMINISTRA_CARRERA_FK" ON "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_COORDINADOR2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_COORDINADOR2_FK" ON "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_COLABORAN_EN
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_COLABORAN_EN" ON "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ("ID_PROYECTO", "ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COLABORAN_EN2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."COLABORAN_EN2_FK" ON "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index COLABORAN_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."COLABORAN_EN_FK" ON "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ("ID_PROYECTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_CORREQUISITO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_CORREQUISITO" ON "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ("ASI_ID_ASIGNATURA", "ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CORREQUISITO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."CORREQUISITO2_FK" ON "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index CORREQUISITO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."CORREQUISITO_FK" ON "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ("ASI_ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_DEPARTAMENTO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_DEPARTAMENTO" ON "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ("ID_DEPARTAMENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DEPARTAMENTOS_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DEPARTAMENTOS_FK" ON "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ES_PARTE_DE_MALLA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ES_PARTE_DE_MALLA_FK" ON "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ("ID_MALLA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SE_PRESENTA_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SE_PRESENTA_EN_FK" ON "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_DETALLE_MALLA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_DETALLE_MALLA" ON "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ("ID_ASIGNATURA", "ID_MALLA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_DOCENTE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_DOCENTE" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DECANO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DECANO_FK" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ENSENIAN_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ENSENIAN_EN_FK" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("FAC_ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_COORDINADOR_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_COORDINADOR_FK" ON "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_CARRERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ESTUDIANTE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_ESTUDIANTE" ON "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_FACULTAD
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_FACULTAD" ON "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_FACULTAD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_DECANO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_DECANO2_FK" ON "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_HISTORIAL_ACADEMICO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_HISTORIAL_ACADEMICO" ON "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ("ID_HISTORIAL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_HISTORIALES_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_HISTORIALES_FK" ON "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index OBTUVO_RESULTADOS_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."OBTUVO_RESULTADOS_EN_FK" ON "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_HORARIO_CLASE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_HORARIO_CLASE" ON "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ("ID_HORARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_HORARIO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_HORARIO_FK" ON "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ("ID_AULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SE_DICTA_EN_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SE_DICTA_EN_FK" ON "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ("ID_OFERTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_LIBRO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_LIBRO" ON "SISTEMA_UNIVERSITARIO"."LIBRO" ("ID_LIBRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MALLA_CURRICULAR
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_MALLA_CURRICULAR" ON "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ("ID_MALLA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_CARRERA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_CARRERA_FK" ON "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ("ID_CARRERA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HA_REALIZADO_MATRICULA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."HA_REALIZADO_MATRICULA_FK" ON "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SE_REALIZAN_PERIODO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SE_REALIZAN_PERIODO_FK" ON "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MATRICULA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_MATRICULA" ON "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_MATRICULA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_OFERTA_ASIGNATURA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_OFERTA_ASIGNATURA" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_OFERTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_PERIODO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_PERIODO_FK" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_ASIGNATURA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_ASIGNATURA_FK" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DESIGNADO_OFERTA_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."DESIGNADO_OFERTA_FK" ON "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PERIODO_ACADEMICO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PERIODO_ACADEMICO" ON "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" ("ID_PERIODO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PRESTAMO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PRESTAMO" ON "SISTEMA_UNIVERSITARIO"."PRESTAMO" ("FECHA_PRESTAMO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SOLICITA_LIBRO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SOLICITA_LIBRO_FK" ON "SISTEMA_UNIVERSITARIO"."PRESTAMO" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ES_PRESTADO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."ES_PRESTADO_FK" ON "SISTEMA_UNIVERSITARIO"."PRESTAMO" ("ID_LIBRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PROCESO_TITULACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PROCESO_TITULACION" ON "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_PROCESO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SOLICITA_TITULACION_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."SOLICITA_TITULACION_FK" ON "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_ESTUDIANTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TUTORA_PROCESO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TUTORA_PROCESO_FK" ON "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PROYECTO_INVESTIGACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PROYECTO_INVESTIGACION" ON "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_PROYECTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DIRIGE_PROYECTO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."DIRIGE_PROYECTO_FK" ON "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index GESTIONA_INVESTIGACION_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."GESTIONA_INVESTIGACION_FK" ON "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_DEPARTAMENTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PUBLICACION
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_PUBLICACION" ON "SISTEMA_UNIVERSITARIO"."PUBLICACION" ("ID_PUBLICACION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRODUCE_PUBLICACION_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."PRODUCE_PUBLICACION_FK" ON "SISTEMA_UNIVERSITARIO"."PUBLICACION" ("ID_PROYECTO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_PRERREQUISITO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO_FK" ON "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ("ASI_ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TIENE_PRERREQUISITO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TIENE_PRERREQUISITO" ON "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ("ASI_ID_ASIGNATURA", "ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TIENE_PRERREQUISITO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO2_FK" ON "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ("ID_ASIGNATURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TIPO_BECA
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TIPO_BECA" ON "SISTEMA_UNIVERSITARIO"."TIPO_BECA" ("ID_BECA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TITULO_ACADEMICO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TITULO_ACADEMICO" ON "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" ("ID_TITULO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index POSEE_TITULO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."POSEE_TITULO_FK" ON "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_TRIBUNAL_GRADO
--------------------------------------------------------

  CREATE UNIQUE INDEX "SISTEMA_UNIVERSITARIO"."PK_TRIBUNAL_GRADO" ON "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ("ID_PROCESO", "ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TRIBUNAL_GRADO2_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO2_FK" ON "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ("ID_DOCENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TRIBUNAL_GRADO_FK
--------------------------------------------------------

  CREATE INDEX "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO_FK" ON "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ("ID_PROCESO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ASIGNACION_BECA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" MODIFY ("FECHA_ASIGNACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" MODIFY ("PORCENTAJE_COBERTURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ADD CONSTRAINT "PK_ASIGNACION_BECA" PRIMARY KEY ("FECHA_ASIGNACION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ASIGNATURA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" MODIFY ("ID_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" MODIFY ("CODIGO_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" MODIFY ("NOMBRE_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" MODIFY ("NUMERO_CREDITOS" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" MODIFY ("TIPO_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" MODIFY ("AREA_CONOCIMIENTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ADD CONSTRAINT "PK_ASIGNATURA" PRIMARY KEY ("ID_ASIGNATURA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table AULA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("ID_AULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("EDIFICIO_AULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("PISO_AULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("NUMERO_AULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("CAPACIDAD_ESTUDIANTES" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("TIPO_AULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" MODIFY ("TIENE_PROYECTOR" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AULA" ADD CONSTRAINT "PK_AULA" PRIMARY KEY ("ID_AULA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table AUTORIA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" MODIFY ("ID_PUBLICACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" MODIFY ("ID_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" MODIFY ("ORDEN_AUTOR" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" ADD CONSTRAINT "PK_AUTORIA" PRIMARY KEY ("ID_PUBLICACION", "ID_DOCENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CALIFICACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" MODIFY ("ID_CALIFICACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" MODIFY ("NOTA_PARCIAL_1" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" MODIFY ("ASISTENCIA_PORCENTAJE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" ADD CONSTRAINT "PK_CALIFICACION" PRIMARY KEY ("ID_CALIFICACION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CARRERA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" MODIFY ("ID_CARRERA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" MODIFY ("NOMBRE_CARRERA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" MODIFY ("NIVEL_CARRERA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" MODIFY ("MODALIDAD_CARRERA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" MODIFY ("DURACION_SEMESTRES" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" ADD CONSTRAINT "PK_CARRERA" PRIMARY KEY ("ID_CARRERA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COLABORAN_EN
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" MODIFY ("ID_PROYECTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" MODIFY ("ID_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ADD CONSTRAINT "PK_COLABORAN_EN" PRIMARY KEY ("ID_PROYECTO", "ID_DOCENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CORREQUISITO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO" MODIFY ("ASI_ID_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO" MODIFY ("ID_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ADD CONSTRAINT "PK_CORREQUISITO" PRIMARY KEY ("ASI_ID_ASIGNATURA", "ID_ASIGNATURA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPARTAMENTO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" MODIFY ("ID_DEPARTAMENTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" MODIFY ("NOMBRE_DEPARTAMENTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ADD CONSTRAINT "PK_DEPARTAMENTO" PRIMARY KEY ("ID_DEPARTAMENTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DETALLE_MALLA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" MODIFY ("ID_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" MODIFY ("ID_MALLA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" MODIFY ("SEMESTRE_SUGERIDO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" MODIFY ("HORAS_TEORICAS" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" MODIFY ("HORAS_PRACTICAS" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ADD CONSTRAINT "PK_DETALLE_MALLA" PRIMARY KEY ("ID_ASIGNATURA", "ID_MALLA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DOCENTE
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("ID_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("NUMERO_UNICO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("CEDULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("NOMBRES_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("APELLIDOS_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("EMAIL_INSTITUCIONAL" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("TIPO_PROFESOR" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("CATEGORIA_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" MODIFY ("FECHA_INGRESO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" ADD CONSTRAINT "PK_DOCENTE" PRIMARY KEY ("ID_DOCENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ESTUDIANTE
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("ID_ESTUDIANTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("NUMERO_UNICO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("CEDULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("NOMBRES_ESTUDIANTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("APELLIDOS_ESTUDIANTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("EMAIL_INSTITUCIONAL" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("FECHA_INGRESO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" MODIFY ("ESTADO_ESTUDIANTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ADD CONSTRAINT "PK_ESTUDIANTE" PRIMARY KEY ("ID_ESTUDIANTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FACULTAD
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD" MODIFY ("ID_FACULTAD" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD" MODIFY ("NOMBRE_FACULTAD" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD" MODIFY ("NUMERO_EDIFICIO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD" ADD CONSTRAINT "PK_FACULTAD" PRIMARY KEY ("ID_FACULTAD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table HISTORIAL_ACADEMICO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" MODIFY ("ID_HISTORIAL" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" MODIFY ("NOTA_DEFINITIVA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" MODIFY ("ESTADO_MATERIA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ADD CONSTRAINT "PK_HISTORIAL_ACADEMICO" PRIMARY KEY ("ID_HISTORIAL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table HORARIO_CLASE
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" MODIFY ("ID_HORARIO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" MODIFY ("DIA_SEMANA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" MODIFY ("HORA_INICIO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" MODIFY ("HORA_FIN" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ADD CONSTRAINT "PK_HORARIO_CLASE" PRIMARY KEY ("ID_HORARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LIBRO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" MODIFY ("ID_LIBRO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" MODIFY ("ISBN" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" MODIFY ("TITULO_LIBRO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" MODIFY ("AUTOR" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" MODIFY ("EDITORIAL" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" MODIFY ("STOCK_DISPONIBLE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."LIBRO" ADD CONSTRAINT "PK_LIBRO" PRIMARY KEY ("ID_LIBRO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MALLA_CURRICULAR
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" MODIFY ("ID_MALLA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" MODIFY ("CODIGO_COHORTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" MODIFY ("FECHA_APROBACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" MODIFY ("TOTAL_CREDITOS" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" MODIFY ("ESTADO_MALLA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ADD CONSTRAINT "PK_MALLA_CURRICULAR" PRIMARY KEY ("ID_MALLA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MATRICULA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" MODIFY ("ID_MATRICULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" MODIFY ("FECHA_REGISTRO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" MODIFY ("FORMA_MATRICULA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" ADD CONSTRAINT "PK_MATRICULA" PRIMARY KEY ("ID_MATRICULA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table OFERTA_ASIGNATURA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" MODIFY ("ID_OFERTA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" MODIFY ("CODIGO_PARALELO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" MODIFY ("CUPO_MAXIMO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" MODIFY ("CUPO_DISPONIBLE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ADD CONSTRAINT "PK_OFERTA_ASIGNATURA" PRIMARY KEY ("ID_OFERTA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PERIODO_ACADEMICO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" MODIFY ("ID_PERIODO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" MODIFY ("CODIGO_PERIODO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" MODIFY ("NOMBRE_PERIODO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" MODIFY ("FECHA_INICIO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" MODIFY ("FECHA_FIN" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" MODIFY ("ESTADO_PERIODO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" ADD CONSTRAINT "PK_PERIODO_ACADEMICO" PRIMARY KEY ("ID_PERIODO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRESTAMO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO" MODIFY ("FECHA_PRESTAMO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO" MODIFY ("FECHA_DEVOLUCION_PREVISTA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO" ADD CONSTRAINT "PK_PRESTAMO" PRIMARY KEY ("FECHA_PRESTAMO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROCESO_TITULACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" MODIFY ("ID_PROCESO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" MODIFY ("MODALIDAD_PROCESO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" MODIFY ("TEMA_PROPUESTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" MODIFY ("ESTADO_PROCESO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ADD CONSTRAINT "PK_PROCESO_TITULACION" PRIMARY KEY ("ID_PROCESO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PROYECTO_INVESTIGACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("ID_PROYECTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("CODIGO_PROYECTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("TITULO_PROYECTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("LINEA_INVESTIGACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("PRESUPUESTO_ASIGNADO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("FECHA_INICIO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" MODIFY ("ESTADO_PROYECTO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ADD CONSTRAINT "PK_PROYECTO_INVESTIGACION" PRIMARY KEY ("ID_PROYECTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PUBLICACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" MODIFY ("ID_PUBLICACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" MODIFY ("TITULO_PUBLICACION" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" MODIFY ("DOI" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" MODIFY ("REVISTA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" ADD CONSTRAINT "PK_PUBLICACION" PRIMARY KEY ("ID_PUBLICACION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TIENE_PRERREQUISITO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" MODIFY ("ASI_ID_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" MODIFY ("ID_ASIGNATURA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ADD CONSTRAINT "PK_TIENE_PRERREQUISITO" PRIMARY KEY ("ASI_ID_ASIGNATURA", "ID_ASIGNATURA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TIPO_BECA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIPO_BECA" MODIFY ("ID_BECA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIPO_BECA" MODIFY ("NOMBRE_BECA" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIPO_BECA" ADD CONSTRAINT "PK_TIPO_BECA" PRIMARY KEY ("ID_BECA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TITULO_ACADEMICO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" MODIFY ("ID_TITULO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" MODIFY ("NOMBRE_TITULO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" MODIFY ("NIVEL_TITULO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" MODIFY ("UNIVERSIDAD" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" ADD CONSTRAINT "PK_TITULO_ACADEMICO" PRIMARY KEY ("ID_TITULO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TRIBUNAL_GRADO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" MODIFY ("ID_PROCESO" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" MODIFY ("ID_DOCENTE" NOT NULL ENABLE);
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ADD CONSTRAINT "PK_TRIBUNAL_GRADO" PRIMARY KEY ("ID_PROCESO", "ID_DOCENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ASIGNACION_BECA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ADD CONSTRAINT "FK_ASIGNACI_ES_TIPO_B_TIPO_BEC" FOREIGN KEY ("ID_BECA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."TIPO_BECA" ("ID_BECA") ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."ASIGNACION_BECA" ADD CONSTRAINT "FK_ASIGNACI_RECIBE_BE_ESTUDIAN" FOREIGN KEY ("ID_ESTUDIANTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table AUTORIA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" ADD CONSTRAINT "FK_AUTORIA_ESCRIBE_A_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."AUTORIA" ADD CONSTRAINT "FK_AUTORIA_TIENE_AUT_PUBLICAC" FOREIGN KEY ("ID_PUBLICACION")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PUBLICACION" ("ID_PUBLICACION") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CALIFICACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" ADD CONSTRAINT "FK_CALIFICA_TIENE_DET_MATRICUL" FOREIGN KEY ("ID_MATRICULA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."MATRICULA" ("ID_MATRICULA") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CALIFICACION" ADD CONSTRAINT "FK_CALIFICA_GENERA_CA_OFERTA_A" FOREIGN KEY ("ID_OFERTA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_OFERTA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CARRERA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" ADD CONSTRAINT "FK_CARRERA_ADMINISTR_FACULTAD" FOREIGN KEY ("ID_FACULTAD")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_FACULTAD") ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CARRERA" ADD CONSTRAINT "FK_CARRERA_TIENE_COO_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COLABORAN_EN
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ADD CONSTRAINT "FK_COLABORA_COLABORAN_PROYECTO" FOREIGN KEY ("ID_PROYECTO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_PROYECTO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."COLABORAN_EN" ADD CONSTRAINT "FK_COLABORA_COLABORAN_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CORREQUISITO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ADD CONSTRAINT "FK_CORREQ_ASIG_A" FOREIGN KEY ("ASI_ID_ASIGNATURA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."CORREQUISITO" ADD CONSTRAINT "FK_CORREQ_ASIG_B" FOREIGN KEY ("ID_ASIGNATURA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPARTAMENTO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ADD CONSTRAINT "FK_DEPARTAM_TIENE_DEP_FACULTAD" FOREIGN KEY ("ID_FACULTAD")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_FACULTAD") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DETALLE_MALLA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ADD CONSTRAINT "FK_DETALLE__ES_PARTE__MALLA_CU" FOREIGN KEY ("ID_MALLA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ("ID_MALLA") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DETALLE_MALLA" ADD CONSTRAINT "FK_DETALLE__SE_PRESEN_ASIGNATU" FOREIGN KEY ("ID_ASIGNATURA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DOCENTE
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" ADD CONSTRAINT "FK_DOCENTE_ENSENIAN__FACULTAD" FOREIGN KEY ("FAC_ID_FACULTAD")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_FACULTAD") ON DELETE SET NULL ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" ADD CONSTRAINT "FK_DOCENTE_TIENE_COO_CARRERA" FOREIGN KEY ("ID_CARRERA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_CARRERA") ON DELETE SET NULL ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."DOCENTE" ADD CONSTRAINT "FK_DOCENTE_TIENE_DEC_FACULTAD" FOREIGN KEY ("ID_FACULTAD")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."FACULTAD" ("ID_FACULTAD") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FACULTAD
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."FACULTAD" ADD CONSTRAINT "FK_FACULTAD_TIENE_DEC_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HISTORIAL_ACADEMICO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ADD CONSTRAINT "FK_HISTORIA_TIENE_HIS_ESTUDIAN" FOREIGN KEY ("ID_ESTUDIANTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HISTORIAL_ACADEMICO" ADD CONSTRAINT "FK_HISTORIA_OBTUVO_RE_PERIODO_" FOREIGN KEY ("ID_PERIODO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" ("ID_PERIODO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HORARIO_CLASE
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ADD CONSTRAINT "FK_HORARIO__SE_DICTA__OFERTA_A" FOREIGN KEY ("ID_OFERTA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ("ID_OFERTA") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."HORARIO_CLASE" ADD CONSTRAINT "FK_HORARIO__TIENE_HOR_AULA" FOREIGN KEY ("ID_AULA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."AULA" ("ID_AULA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MALLA_CURRICULAR
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MALLA_CURRICULAR" ADD CONSTRAINT "FK_MALLA_CU_TIENE_CAR_CARRERA" FOREIGN KEY ("ID_CARRERA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."CARRERA" ("ID_CARRERA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MATRICULA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" ADD CONSTRAINT "FK_MATRICUL_HA_REALIZ_ESTUDIAN" FOREIGN KEY ("ID_ESTUDIANTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."MATRICULA" ADD CONSTRAINT "FK_MATRICUL_SE_REALIZ_PERIODO_" FOREIGN KEY ("ID_PERIODO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" ("ID_PERIODO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OFERTA_ASIGNATURA
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ADD CONSTRAINT "FK_OFERTA_A_DESIGNADO_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE SET NULL ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ADD CONSTRAINT "FK_OFERTA_A_TIENE_ASI_ASIGNATU" FOREIGN KEY ("ID_ASIGNATURA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."OFERTA_ASIGNATURA" ADD CONSTRAINT "FK_OFERTA_A_TIENE_PER_PERIODO_" FOREIGN KEY ("ID_PERIODO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PERIODO_ACADEMICO" ("ID_PERIODO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRESTAMO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO" ADD CONSTRAINT "FK_PRESTAMO_SOLICITA__ESTUDIAN" FOREIGN KEY ("ID_ESTUDIANTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PRESTAMO" ADD CONSTRAINT "FK_PRESTAMO_ES_PRESTA_LIBRO" FOREIGN KEY ("ID_LIBRO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."LIBRO" ("ID_LIBRO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROCESO_TITULACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ADD CONSTRAINT "FK_PROCESO__TUTORA_PR_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE SET NULL ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ADD CONSTRAINT "FK_PROCESO__SOLICITA__ESTUDIAN" FOREIGN KEY ("ID_ESTUDIANTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ESTUDIANTE" ("ID_ESTUDIANTE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PROYECTO_INVESTIGACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ADD CONSTRAINT "FK_PROYECTO_DIRIGE_PR_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE SET NULL ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ADD CONSTRAINT "FK_PROYECTO_GESTIONA__DEPARTAM" FOREIGN KEY ("ID_DEPARTAMENTO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DEPARTAMENTO" ("ID_DEPARTAMENTO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PUBLICACION
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."PUBLICACION" ADD CONSTRAINT "FK_PUBLICAC_PRODUCE_P_PROYECTO" FOREIGN KEY ("ID_PROYECTO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PROYECTO_INVESTIGACION" ("ID_PROYECTO") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TIENE_PRERREQUISITO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ADD CONSTRAINT "FK_PRERREQ_ASIG_HIJA" FOREIGN KEY ("ID_ASIGNATURA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TIENE_PRERREQUISITO" ADD CONSTRAINT "FK_PRERREQ_ASIG_PADRE" FOREIGN KEY ("ASI_ID_ASIGNATURA")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."ASIGNATURA" ("ID_ASIGNATURA") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TITULO_ACADEMICO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TITULO_ACADEMICO" ADD CONSTRAINT "FK_TITULO_A_POSEE_TIT_DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRIBUNAL_GRADO
--------------------------------------------------------

  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ADD CONSTRAINT "FK_TRIBUNAL_TRIBUNAL__PROCESO_" FOREIGN KEY ("ID_PROCESO")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."PROCESO_TITULACION" ("ID_PROCESO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SISTEMA_UNIVERSITARIO"."TRIBUNAL_GRADO" ADD CONSTRAINT "FK_TRIBUNAL_TRIBUNAL__DOCENTE" FOREIGN KEY ("ID_DOCENTE")
	  REFERENCES "SISTEMA_UNIVERSITARIO"."DOCENTE" ("ID_DOCENTE") ON DELETE CASCADE ENABLE;