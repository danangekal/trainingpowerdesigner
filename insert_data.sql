INSERT INTO "ref"."jenjang_pendidikan"("jenjang_pendidikan_id", "nama_jenjang_pendidikan") VALUES (8, 'SMK');
INSERT INTO "ref"."jenjang_pendidikan"("jenjang_pendidikan_id", "nama_jenjang_pendidikan") VALUES (7, 'SMA');
INSERT INTO "ref"."jenjang_pendidikan"("jenjang_pendidikan_id", "nama_jenjang_pendidikan") VALUES (6, 'SMP');
INSERT INTO "ref"."jenjang_pendidikan"("jenjang_pendidikan_id", "nama_jenjang_pendidikan") VALUES (5, 'SD');


INSERT INTO "ref"."peran"("peran_id", "nama_peran") VALUES (1, 'Super Admin');
INSERT INTO "ref"."peran"("peran_id", "nama_peran") VALUES (2, 'Admin');
INSERT INTO "ref"."peran"("peran_id", "nama_peran") VALUES (3, 'Operator Pusat');
INSERT INTO "ref"."peran"("peran_id", "nama_peran") VALUES (4, 'Operator Propinsi');
INSERT INTO "ref"."peran"("peran_id", "nama_peran") VALUES (5, 'Operator Dinas');
INSERT INTO "ref"."peran"("peran_id", "nama_peran") VALUES (6, 'Operator Sekolah');


INSERT INTO "ref"."master_wilayah"("kode_wilayah", "ref_mst_kode_wilayah", "nama_wilayah", "id_level_wilayah") VALUES ('020000    ', NULL, 'Jawa Barat', 1);
INSERT INTO "ref"."master_wilayah"("kode_wilayah", "ref_mst_kode_wilayah", "nama_wilayah", "id_level_wilayah") VALUES ('010000    ', NULL, 'DKI', 1);
INSERT INTO "ref"."master_wilayah"("kode_wilayah", "ref_mst_kode_wilayah", "nama_wilayah", "id_level_wilayah") VALUES ('030000    ', NULL, 'Jawa Timur', 1);
INSERT INTO "ref"."master_wilayah"("kode_wilayah", "ref_mst_kode_wilayah", "nama_wilayah", "id_level_wilayah") VALUES ('026000    ', '020000    ', 'Kota Bandung', 2);
INSERT INTO "ref"."master_wilayah"("kode_wilayah", "ref_mst_kode_wilayah", "nama_wilayah", "id_level_wilayah") VALUES ('026100    ', '020000    ', 'Kota Bogor', 2);
INSERT INTO "ref"."master_wilayah"("kode_wilayah", "ref_mst_kode_wilayah", "nama_wilayah", "id_level_wilayah") VALUES ('020800    ', '020000    ', 'Kab. Bandung', 2);
INSERT INTO "ref"."master_wilayah"("kode_wilayah", "ref_mst_kode_wilayah", "nama_wilayah", "id_level_wilayah") VALUES ('016200    ', '020000    ', 'Kota Jakarta Barat', 2);


INSERT INTO "public"."pengguna"("pengguna_id", "peran_id", "sekolah_id", "nama_pengguna", "email", "no_hp", "username", "password") VALUES ('1c4472d8-3715-11e8-9b9c-9f6befef8545', 1, '13a66072-3716-11e8-9b9d-83fb59aab283', 'Admin', 'admin@nufaza.com', '08912839123', NULL, NULL);

INSERT INTO "public"."sekolah"("sekolah_id", "kode_wilayah", "jenjang_pendidikan_id", "nama_sekolah", "npsn") VALUES ('13a66072-3716-11e8-9b9d-83fb59aab283', '026000    ', 5, 'SD Assalaam I', '91230981');