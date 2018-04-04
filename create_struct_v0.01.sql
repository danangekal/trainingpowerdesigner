/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     4/4/2018 10:28:36 AM                         */
/*==============================================================*/


/*==============================================================*/
/* User: ref                                                    */
/*==============================================================*/
create schema ref;

/*==============================================================*/
/* Domain: email                                                */
/*==============================================================*/
create domain email as VARCHAR(40);

/*==============================================================*/
/* Domain: nama_orang                                           */
/*==============================================================*/
create domain nama_orang as VARCHAR(50);

/*==============================================================*/
/* Domain: nama_ref                                             */
/*==============================================================*/
create domain nama_ref as VARCHAR(40);

/*==============================================================*/
/* Domain: no_hp                                                */
/*==============================================================*/
create domain no_hp as VARCHAR(15);

/*==============================================================*/
/* Domain: password                                             */
/*==============================================================*/
create domain password as VARCHAR(200);

/*==============================================================*/
/* Domain: serial                                               */
/*==============================================================*/
create domain serial as INT4;

/*==============================================================*/
/* Domain: uuid                                                 */
/*==============================================================*/
create domain uuid as uuid;

/*==============================================================*/
/* Table: jenjang_pendidikan                                    */
/*==============================================================*/
create table ref.jenjang_pendidikan (
   jenjang_pendidikan_id serial               not null,
   nama_jenjang_pendidikan nama_ref             null,
   constraint PK_JENJANG_PENDIDIKAN primary key (jenjang_pendidikan_id)
);

/*==============================================================*/
/* Index: JENJANG_PENDIDIKAN_PK                                 */
/*==============================================================*/
create unique index JENJANG_PENDIDIKAN_PK on ref.jenjang_pendidikan  (
jenjang_pendidikan_id
);

/*==============================================================*/
/* Table: master_wilayah                                        */
/*==============================================================*/
create table ref.master_wilayah (
   kode_wilayah         CHAR(10)             not null,
   ref_mst_kode_wilayah CHAR(10)             null,
   nama_wilayah         nama_orang           null,
   id_level_wilayah     INT4                 null,
   constraint PK_MASTER_WILAYAH primary key (kode_wilayah)
);

/*==============================================================*/
/* Index: MASTER_WILAYAH_PK                                     */
/*==============================================================*/
create unique index MASTER_WILAYAH_PK on ref.master_wilayah  (
kode_wilayah
);

/*==============================================================*/
/* Index: REF_MST_KODE_WILAYAH_FK                               */
/*==============================================================*/
create  index REF_MST_KODE_WILAYAH_FK on ref.master_wilayah  (
ref_mst_kode_wilayah
);

/*==============================================================*/
/* Table: pengguna                                              */
/*==============================================================*/
create table pengguna (
   pengguna_id          uuid                 not null,
   peran_id             serial               not null,
   sekolah_id           uuid                 null,
   nama_pengguna        nama_orang           null,
   email                email                null,
   no_hp                no_hp                null,
   constraint PK_PENGGUNA primary key (pengguna_id)
);

/*==============================================================*/
/* Index: PENGGUNA_PK                                           */
/*==============================================================*/
create unique index PENGGUNA_PK on pengguna  (
pengguna_id
);

/*==============================================================*/
/* Index: REF_PERAN_PENGGUNA_FK                                 */
/*==============================================================*/
create  index REF_PERAN_PENGGUNA_FK on pengguna  (
peran_id
);

/*==============================================================*/
/* Index: REF_SEKOLAH_PENGGUNA_FK                               */
/*==============================================================*/
create  index REF_SEKOLAH_PENGGUNA_FK on pengguna  (
sekolah_id
);

/*==============================================================*/
/* Table: peran                                                 */
/*==============================================================*/
create table ref.peran (
   peran_id             serial               not null,
   nama_peran           nama_ref             null,
   constraint PK_PERAN primary key (peran_id)
);

/*==============================================================*/
/* Index: PERAN_PK                                              */
/*==============================================================*/
create unique index PERAN_PK on ref.peran  (
peran_id
);

/*==============================================================*/
/* Table: sekolah                                               */
/*==============================================================*/
create table sekolah (
   sekolah_id           uuid                 not null,
   kode_wilayah         CHAR(10)             not null,
   jenjang_pendidikan_id serial               not null,
   nama_sekolah         nama_ref             null,
   npsn                 VARCHAR(8)           null,
   constraint PK_SEKOLAH primary key (sekolah_id)
);

/*==============================================================*/
/* Index: SEKOLAH_PK                                            */
/*==============================================================*/
create unique index SEKOLAH_PK on sekolah  (
sekolah_id
);

/*==============================================================*/
/* Index: REF_MASTER_WILAYAH_SEKOLAH_FK                         */
/*==============================================================*/
create  index REF_MASTER_WILAYAH_SEKOLAH_FK on sekolah  (
kode_wilayah
);

/*==============================================================*/
/* Index: REF_JENJANG_PENDIDIKAN_FK                             */
/*==============================================================*/
create  index REF_JENJANG_PENDIDIKAN_FK on sekolah  (
jenjang_pendidikan_id
);

alter table  ref.master_wilayah
   add constraint FK_MASTER_W_REF_MST_K_MASTER_W foreign key (ref_mst_kode_wilayah)
      references  ref.master_wilayah (kode_wilayah)
      on delete restrict on update restrict;

alter table  pengguna
   add constraint FK_PENGGUNA_REF_PERAN_PERAN foreign key (peran_id)
      references  ref.peran (peran_id)
      on delete restrict on update restrict;

alter table  pengguna
   add constraint FK_PENGGUNA_REF_SEKOL_SEKOLAH foreign key (sekolah_id)
      references  sekolah (sekolah_id)
      on delete restrict on update restrict;

alter table  sekolah
   add constraint FK_SEKOLAH_REF_JENJA_JENJANG_ foreign key (jenjang_pendidikan_id)
      references  ref.jenjang_pendidikan (jenjang_pendidikan_id)
      on delete restrict on update restrict;

alter table  sekolah
   add constraint FK_SEKOLAH_REF_MASTE_MASTER_W foreign key (kode_wilayah)
      references  ref.master_wilayah (kode_wilayah)
      on delete restrict on update restrict;

