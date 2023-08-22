/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     21.08.2023 19:28:01                          */
/*==============================================================*/


drop index POLIS_EVENTS_FK;

drop index EVENTS_PK;

drop table EVENTS;

drop index PERSONS_PK;

drop table PERSONS;

drop index PERSON_POLISES_FK;

drop index POLISES_PK;

drop table POLISES;

drop index USERDATA_PK;

drop table USERDATA;

/*==============================================================*/
/* Table: EVENTS                                                */
/*==============================================================*/
create table EVENTS (
   id_event             INT4                 not null,
   id_polis             INT4                 not null,
   EventType            CHAR(128)            not null,
   DateOfEvent          DATE                 not null,
   constraint PK_EVENTS primary key (id_event)
);

/*==============================================================*/
/* Index: EVENTS_PK                                             */
/*==============================================================*/
create unique index EVENTS_PK on EVENTS (
id_event
);

/*==============================================================*/
/* Index: POLIS_EVENTS_FK                                       */
/*==============================================================*/
create  index POLIS_EVENTS_FK on EVENTS (
id_polis
);

/*==============================================================*/
/* Table: PERSONS                                               */
/*==============================================================*/
create table PERSONS (
   id_person            INT4                 not null,
   Surname              CHAR(128)            not null,
   Name                 CHAR(128)            not null,
   Patronymic           CHAR(128)            null,
   DateOfBirth          DATE                 not null,
   constraint PK_PERSONS primary key (id_person)
);

/*==============================================================*/
/* Index: PERSONS_PK                                            */
/*==============================================================*/
create unique index PERSONS_PK on PERSONS (
id_person
);

/*==============================================================*/
/* Table: POLISES                                               */
/*==============================================================*/
create table POLISES (
   id_polis             INT4                 not null,
   id_person            INT4                 not null,
   SerialNumber         CHAR(128)            not null,
   DateGot              DATE                 not null,
   DateTaken            DATE                 not null,
   constraint PK_POLISES primary key (id_polis)
);

/*==============================================================*/
/* Index: POLISES_PK                                            */
/*==============================================================*/
create unique index POLISES_PK on POLISES (
id_polis
);

/*==============================================================*/
/* Index: PERSON_POLISES_FK                                     */
/*==============================================================*/
create  index PERSON_POLISES_FK on POLISES (
id_person
);

/*==============================================================*/
/* Table: USERDATA                                              */
/*==============================================================*/
create table USERDATA (
   id_userdata          INT4                 not null,
   username             CHAR(128)            not null,
   password             CHAR(64)             not null,
   role                 CHAR(16)             not null,
   constraint PK_USERDATA primary key (id_userdata)
);

/*==============================================================*/
/* Index: USERDATA_PK                                           */
/*==============================================================*/
create unique index USERDATA_PK on USERDATA (
id_userdata
);

alter table EVENTS
   add constraint FK_EVENTS_POLIS_EVE_POLISES foreign key (id_polis)
      references POLISES (id_polis)
      on delete restrict on update restrict;

alter table POLISES
   add constraint FK_POLISES_PERSON_PO_PERSONS foreign key (id_person)
      references PERSONS (id_person)
      on delete restrict on update restrict;

