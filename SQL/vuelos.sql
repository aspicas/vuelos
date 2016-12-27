drop index ESTA_FK;
drop index AEROPUERTO_PK;
drop index SALE_FK;
drop index SALEN_FK;
drop index AER_VUE_PK;
drop index AVION_PK;
drop index CLIENTE_PK;
drop index TIENE_FK;
drop index LUGAR_PK;
drop index PLAZA_PK;
drop index ASEGURA_FK;
drop index LO_RESERVAN_FK;
drop index RESERVA_PK;
drop index PAGA_FK;
drop index TARJETA_PK;
drop index PERTENECE_FK;
drop index ASIGNA_FK;
drop index ASGINA_FK;
drop index TARJETA_DE_EMBARQUE_PK;
drop index REALIZA_FK;
drop index VUELO_PK;
drop table AEROPUERTO cascade;
drop table AER_VUE cascade;
drop table AVION cascade;
drop table CLIENTE cascade;
drop table LUGAR cascade;
drop table PLAZA cascade;
drop table RESERVA cascade;
drop table TARJETA cascade;
drop table TARJETA_DE_EMBARQUE cascade;
drop table VUELO cascade;

/*==============================================================*/
/* Table: AEROPUERTO                                            */
/*==============================================================*/
create table AEROPUERTO (
   AER_ID               NUMERIC              not null,
   AER_NOMBRE           CHAR(500)            not null,
   FK_LUG               NUMERIC              not null,
   constraint PK_AEROPUERTO primary key (AER_ID)
);

/*==============================================================*/
/* Index: AEROPUERTO_PK                                         */
/*==============================================================*/
create unique index AEROPUERTO_PK on AEROPUERTO (
AER_ID
);

/*==============================================================*/
/* Index: ESTA_FK                                               */
/*==============================================================*/
create  index ESTA_FK on AEROPUERTO (
FK_LUG
);

/*==============================================================*/
/* Table: AER_VUE                                               */
/*==============================================================*/
create table AER_VUE (
   AV_FK_VUE            NUMERIC              not null,
   AV_FK_AER            NUMERIC              not null,
   AV_SALIDA            NUMERIC(1)           not null,
   constraint PK_AER_VUE primary key (AV_FK_VUE, AV_FK_AER)
);

/*==============================================================*/
/* Index: AER_VUE_PK                                            */
/*==============================================================*/
create unique index AER_VUE_PK on AER_VUE (
AV_FK_VUE,
AV_FK_AER
);

/*==============================================================*/
/* Index: SALEN_FK                                              */
/*==============================================================*/
create  index SALEN_FK on AER_VUE (
AV_FK_AER
);

/*==============================================================*/
/* Index: SALE_FK                                               */
/*==============================================================*/
create  index SALE_FK on AER_VUE (
AV_FK_VUE
);

/*==============================================================*/
/* Table: AVION                                                 */
/*==============================================================*/
create table AVION (
   AVI_ID               NUMERIC              not null,
   AVI_CANTIDAD         NUMERIC              not null,
   constraint PK_AVION primary key (AVI_ID)
);

/*==============================================================*/
/* Index: AVION_PK                                              */
/*==============================================================*/
create unique index AVION_PK on AVION (
AVI_ID
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CLI_CI               NUMERIC              not null,
   CLI_NOMBRE           CHAR(50)             not null,
   CLI_APELLIDO         CHAR(50)             not null,
   CLI_TELEFONO         NUMERIC(15)          not null,
   constraint PK_CLIENTE primary key (CLI_CI)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
CLI_CI
);

/*==============================================================*/
/* Table: LUGAR                                                 */
/*==============================================================*/
create table LUGAR (
   LUG_ID               NUMERIC              not null,
   LUG_NOMBRE           CHAR(100)            not null,
   LUG_TIPO             CHAR(10)             not null,
   FK_LUG               NUMERIC              null,
   constraint PK_LUGAR primary key (LUG_ID)
);

/*==============================================================*/
/* Index: LUGAR_PK                                              */
/*==============================================================*/
create unique index LUGAR_PK on LUGAR (
LUG_ID
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on LUGAR (
FK_LUG
);

/*==============================================================*/
/* Table: PLAZA                                                 */
/*==============================================================*/
create table PLAZA (
   PLA_ID               NUMERIC              not null,
   PLA_FILA             NUMERIC              not null,
   PLA_COLUMNA          NUMERIC              not null,
   PLA_PLANTA           NUMERIC              not null,
   constraint PK_PLAZA primary key (PLA_ID)
);

/*==============================================================*/
/* Index: PLAZA_PK                                              */
/*==============================================================*/
create unique index PLAZA_PK on PLAZA (
PLA_ID
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA (
   RES_ID               NUMERIC              not null,
   RES_FECHA_RES        DATE                 not null,
   RES_STATUS           NUMERIC(1)           not null,
   RES_CANTIDAD         NUMERIC              not null,
   FK_VUE               NUMERIC              not null,
   FK_CLI               NUMERIC              not null,
   constraint PK_RESERVA primary key (RES_ID)
);

/*==============================================================*/
/* Index: RESERVA_PK                                            */
/*==============================================================*/
create unique index RESERVA_PK on RESERVA (
RES_ID
);

/*==============================================================*/
/* Index: LO_RESERVAN_FK                                        */
/*==============================================================*/
create  index LO_RESERVAN_FK on RESERVA (
FK_VUE
);

/*==============================================================*/
/* Index: ASEGURA_FK                                            */
/*==============================================================*/
create  index ASEGURA_FK on RESERVA (
FK_CLI
);

/*==============================================================*/
/* Table: TARJETA                                               */
/*==============================================================*/
create table TARJETA (
   TAR_NUMERO           NUMERIC              not null,
   TAR_BANCO            CHAR(50)             not null,
   FK_CLI               NUMERIC              not null,
   constraint PK_TARJETA primary key (TAR_NUMERO)
);

/*==============================================================*/
/* Index: TARJETA_PK                                            */
/*==============================================================*/
create unique index TARJETA_PK on TARJETA (
TAR_NUMERO
);

/*==============================================================*/
/* Index: PAGA_FK                                               */
/*==============================================================*/
create  index PAGA_FK on TARJETA (
FK_CLI
);

/*==============================================================*/
/* Table: TARJETA_DE_EMBARQUE                                   */
/*==============================================================*/
create table TARJETA_DE_EMBARQUE (
   TDE_ID               NUMERIC              not null,
   FK_CLI               NUMERIC              not null,
   FK_PLA               NUMERIC              not null,
   FK_VUE               NUMERIC              not null,
   constraint PK_TARJETA_DE_EMBARQUE primary key (TDE_ID, FK_CLI, FK_PLA)
);

/*==============================================================*/
/* Index: TARJETA_DE_EMBARQUE_PK                                */
/*==============================================================*/
create unique index TARJETA_DE_EMBARQUE_PK on TARJETA_DE_EMBARQUE (
TDE_ID,
FK_CLI,
FK_PLA
);

/*==============================================================*/
/* Index: ASGINA_FK                                             */
/*==============================================================*/
create  index ASGINA_FK on TARJETA_DE_EMBARQUE (
FK_CLI
);

/*==============================================================*/
/* Index: ASIGNA_FK                                             */
/*==============================================================*/
create  index ASIGNA_FK on TARJETA_DE_EMBARQUE (
FK_PLA
);

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create  index PERTENECE_FK on TARJETA_DE_EMBARQUE (
FK_VUE
);

/*==============================================================*/
/* Table: VUELO                                                 */
/*==============================================================*/
create table VUELO (
   VUE_ID               NUMERIC              not null,
   VUE_FECHA_SAL        DATE                 not null,
   VUE_FECHA_LLE        DATE                 not null,
   VUE_PRECIO           NUMERIC(7,2)         not null,
   FK_AVI               NUMERIC              not null,
   constraint PK_VUELO primary key (VUE_ID)
);

/*==============================================================*/
/* Index: VUELO_PK                                              */
/*==============================================================*/
create unique index VUELO_PK on VUELO (
VUE_ID
);

/*==============================================================*/
/* Index: REALIZA_FK                                            */
/*==============================================================*/
create  index REALIZA_FK on VUELO (
FK_AVI
);

alter table AEROPUERTO
   add constraint FK_AEROPUER_ESTA_LUGAR foreign key (FK_LUG)
      references LUGAR (LUG_ID)
      on delete restrict on update restrict;

alter table AER_VUE
   add constraint FK_AER_VUE_SALE_VUELO foreign key (AV_FK_VUE)
      references VUELO (VUE_ID)
      on delete restrict on update restrict;

alter table AER_VUE
   add constraint FK_AER_VUE_SALEN_AEROPUER foreign key (AV_FK_AER)
      references AEROPUERTO (AER_ID)
      on delete restrict on update restrict;

alter table LUGAR
   add constraint FK_LUGAR_TIENE_LUGAR foreign key (FK_LUG)
      references LUGAR (LUG_ID)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_ASEGURA_CLIENTE foreign key (FK_CLI)
      references CLIENTE (CLI_CI)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_LO_RESERV_VUELO foreign key (FK_VUE)
      references VUELO (VUE_ID)
      on delete restrict on update restrict;

alter table TARJETA
   add constraint FK_TARJETA_PAGA_CLIENTE foreign key (FK_CLI)
      references CLIENTE (CLI_CI)
      on delete restrict on update restrict;

alter table TARJETA_DE_EMBARQUE
   add constraint FK_TARJETA__ASGINA_CLIENTE foreign key (FK_CLI)
      references CLIENTE (CLI_CI)
      on delete restrict on update restrict;

alter table TARJETA_DE_EMBARQUE
   add constraint FK_TARJETA__ASIGNA_PLAZA foreign key (FK_PLA)
      references PLAZA (PLA_ID)
      on delete restrict on update restrict;

alter table TARJETA_DE_EMBARQUE
   add constraint FK_TARJETA__PERTENECE_VUELO foreign key (FK_VUE)
      references VUELO (VUE_ID)
      on delete restrict on update restrict;

alter table VUELO
   add constraint FK_VUELO_REALIZA_AVION foreign key (FK_AVI)
      references AVION (AVI_ID)
      on delete restrict on update restrict;