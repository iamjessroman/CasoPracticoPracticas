/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     1/12/2020 18:47:55                           */
/*==============================================================*/


drop table if exists ESTADO;

drop table if exists PERFIL;

drop table if exists PERFILSERVICIOS;

drop table if exists PERFILUSUARIOS;

drop table if exists SERVICIOS;

drop table if exists USUARIOS;

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO
(
   IDESTADO             int not null,
   ESTADO               varchar(15) not null,
   primary key (IDESTADO)
);

/*==============================================================*/
/* Table: PERFIL                                                */
/*==============================================================*/
create table PERFIL
(
   ID_PERFILES_USUARIO  int not null,
   NOMBRE_PERFILES_USUARIO varchar(15),
   primary key (ID_PERFILES_USUARIO)
);

/*==============================================================*/
/* Table: PERFILSERVICIOS                                       */
/*==============================================================*/
create table PERFILSERVICIOS
(
   ID_PERFIL_SERVICIO   int not null,
   ID_USUARIO           int,
   FECHASERVICIOS       datetime not null,
   primary key (ID_PERFIL_SERVICIO)
);

/*==============================================================*/
/* Table: PERFILUSUARIOS                                        */
/*==============================================================*/
create table PERFILUSUARIOS
(
   IDPERFILUSUARIO      int not null,
   IDESTADO             int,
   ID_USUARIO           int,
   ID_PERFILES_USUARIO  int,
   primary key (IDPERFILUSUARIO)
);

/*==============================================================*/
/* Table: SERVICIOS                                             */
/*==============================================================*/
create table SERVICIOS
(
   IDSERVICIO           int not null,
   ID_PERFIL_SERVICIO   int,
   NOMBRESERVICIO       varchar(30),
   COSTOSERVICIO        float,
   primary key (IDSERVICIO)
);

/*==============================================================*/
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS
(
   ID_USUARIO           int not null,
   CEDULA_USUARIO       varchar(10) not null,
   NOMBRE               varchar(30) not null,
   APELLIDO             varchar(30) not null,
   CORREO               varchar(18) not null,
   CLAVE                varchar(15) not null,
   primary key (ID_USUARIO)
);

alter table PERFILSERVICIOS add constraint FK_ES1 foreign key (ID_USUARIO)
      references USUARIOS (ID_USUARIO) on delete restrict on update restrict;

alter table PERFILUSUARIOS add constraint FK_ES foreign key (ID_USUARIO)
      references USUARIOS (ID_USUARIO) on delete restrict on update restrict;

alter table PERFILUSUARIOS add constraint FK_ES2 foreign key (ID_PERFILES_USUARIO)
      references PERFIL (ID_PERFILES_USUARIO) on delete restrict on update restrict;

alter table PERFILUSUARIOS add constraint FK_ES3 foreign key (IDESTADO)
      references ESTADO (IDESTADO) on delete restrict on update restrict;

alter table SERVICIOS add constraint FK_ES5 foreign key (ID_PERFIL_SERVICIO)
      references PERFILSERVICIOS (ID_PERFIL_SERVICIO) on delete restrict on update restrict;
