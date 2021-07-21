--SOAL
--BeyondUs
--Membutuhkan sistem untuk mendukung proses
--bisnis perusahaan Sistem ini dapat menyimpan data

-- pegawai yaitu NIP, nama tanggal lahir tanggal masuk perusahaan alamat email, dan nomor ponsel bisa lebih dari satu Pegawai tergabung hanya dalam satu 
-- divisi dan satu --jabatan dalam satu waktu tetapi -- histori perpindahan pegawai ke divisi lain dan perubahan jabatan pegawai disimpan dalam sistem

-- Besarnya gaji pegawai tergantung dari jabatan pegawai Setiap divisi dipimpin oleh satu pegawai sebagai kepala divisi, dan tiap divisi dapat memiliki banyak pegawai yang menjadi manajer yang membawahi banyak pegawai lainnya

-- Pegawai diwajibkan untuk mensubmit aktivitas yang dilakukan dan durasi waktunya setiap hari baik dalam pengerjaan proyek maupun kegiatan rutin yang berhubungan dengan divisinya  Alokasi pegawai dalam pengerjaan proyek juga dapat dilakukan melalui sistem ini Alokasi ini berisi data posisi pegawai dalam proyek 

-- Data proyek yang disimpan meliputi nama deskripsi durasi proyek dan tanggal mulai proyek Proyek dapat memiliki banyak task yang harus dikerjakan oleh pegawai yang terlibat di dalamnya 

-- Setiap task berisi deskripsi pekerjaan, durasi waktu pengerjaan dan nilai progres yang sudah dikerjakan Task dibagi menjadi task yang sudah selesai dan yang belum selesai Task yang sudah selesai memiliki tanggal test dan approval dari pegawai yang melakukan test Sedangkan task yang belum selesai memiliki feedback bisa lebih dari satu

CREATE TABLE jabatan ( 
    jabatan_ID varchar2(20) not null primary key,
    nama varchar2(150) not null,
    gajipokok numeric(15),
    gajitunjangan numeric(15) 
);

CREATE TABLE divisi (
	divisiID varchar2(20) not null primary key,
	namadivisi varchar(100)
);

CREATE TABLE pegawai (
	NIP varchar2(20) not null primary key,
	nama varchar(100),
    tanggallahir date,
    tanggalmasuk date,
    email varchar(100),
    nomor1 varchar(100),
    nomor2 varchar(100),
    divisiID varchar2(20) not null,
    jabatan_ID varchar2(20) not null,
    CONSTRAINT fk_divisi
    FOREIGN KEY (divisiID)
    REFERENCES divisi(divisiID),
    CONSTRAINT fk_jabatan
    FOREIGN KEY (jabatan_ID)
    REFERENCES jabatan(jabatan_ID)  
);

CREATE TABLE history (
    historyID varchar2(20) not null primary key,
    NIP varchar2(20) not null,
    constraint fk_nip
    FOREIGN KEY (NIP)
    REFERENCES pegawai(NIP),
    divisiID varchar2(20) not null,
    CONSTRAINT divisifkhs
    FOREIGN KEY (divisiID)
    REFERENCES divisi(divisiID),
    jabatan_ID varchar2(20) not null,
    CONSTRAINT jabatanfkhs
    FOREIGN KEY (jabatan_ID)
    REFERENCES jabatan(jabatan_ID),
    TimeStampHistory TIMESTAMP WITH TIME ZONE
);

CREATE TABLE proyek (
	proyekID varchar2(20) not null primary key,
	namaproyek varchar(100),
    TimeStampProyek TIMESTAMP WITH TIME ZONE
);

CREATE TABLE alokasi (
	alokasiID varchar2(20) not null primary key,
	NIP varchar2(20) not null,
    constraint nipfk
    FOREIGN KEY (NIP)
    REFERENCES pegawai(NIP),
    proyekID varchar2(20),
    constraint proyekfk
    FOREIGN KEY (proyekID)
    REFERENCES proyek(proyekID)
);

CREATE TABLE task (
	taskID varchar2(20) not null primary key,
    proyekID varchar2(20),
    constraint proyekfktask
    FOREIGN KEY (proyekID)
    REFERENCES proyek(proyekID),
    pekerjaan varchar2(150) not null,
    TimeStampTask TIMESTAMP WITH TIME ZONE,
    nilaiTask numeric(10),
    status varchar(100),
    tanggaltes date,
    approval varchar(500),
    feedbacktask varchar(500)
);

CREATE TABLE aktivitas (
    aktivitasID varchar2(20) not null primary key,
    NIP varchar2(20) not null,
    namaaktivitas varchar2(50),
    durasi varchar2(10),
    constraint nipfkaktvts
    FOREIGN KEY (NIP)
    REFERENCES pegawai(NIP),
    proyekID varchar2(20),
    constraint proyekfkaktvts
    FOREIGN KEY (proyekID)
    REFERENCES proyek(proyekID)
);


-- INSERT AKTIVITAS

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT01', TIMESTAMP('2019-07-17 12:06:31'), 'Membuat Algoritma AI', 'PROJ02');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT02', TIMESTAMP('2017-01-01 15:00:31'), 'Membuat Algoritma menggunakan flutter', 'PROJ05');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT03', TIMESTAMP('2019-11-19 13:30:00'), 'Membuat Algoritma google assistant menggunakan C++', 'PROJ15');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT04', TIMESTAMP('2020-09-12 12:06:31'), 'Membuat tabel Query', 'PROJ01');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT05', TIMESTAMP('2020-05-01 09:00:30'), 'Membuat Algoritma AI SIRI menggunakan JAVA', 'PROJ03');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT06', TIMESTAMP('2018-06-01 08:00:00'), 'Membuat Algoritma windows 10 dengan JAVA', 'PROJ04');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT07', TIMESTAMP('2020-01-15 12:05:40'), 'Membuat algoritma ChatBot dengan bahasa python', 'PROJ06');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT08', TIMESTAMP('2020-03-16 20:00:31'), 'Membuat Algoritma Hologram dengan JAVA', 'PROJ07');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT09', TIMESTAMP('2015-06-06 07:30:00'), 'Menyiapkan hardware lampu dan berbagai komposisi mekanika', 'PROJ09');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT10', TIMESTAMP('2020-06-10 1:00:00'), 'Melakukan pengujian self driving car(finalisasi)', 'PROJ08');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT11', TIMESTAMP('2018-06-01 13:00:00'), 'Mempersiapkan hardware untuk membuat badan pesawat drone', 'PROJ10');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT12', TIMESTAMP('2019-04-01 12:06:31'), 'Menguji ketahanan daya baterai pada mobil listrik', 'PROJ11');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT13', TIMESTAMP('2021-01-12 21:00:00'), 'menguji layar lipat', 'PROJ12');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT14', TIMESTAMP('2020-10-01 09:05:21'), 'Mempersiapkan yang dibutuhkan untuk membuat kaca anti hujan', 'PROJ13');

INSERT INTO aktivitas(AktivitasID, TimestampAktivitas, NamaAktivitas, ProyekID) 
VALUES('ACT15', TIMESTAMP('2018-03-03 10:06:31'), 'Mengumpulkan dan mencatat berbagai sintax dari berbagai bahasa pemograman', 'PROJ14');


-- INSERT DATA ALOKASI
INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK01', 'PROJ03', 'Project Manager (PM)');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK02', 'PROJ10', 'Project Manager (PM)');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK03', 'PROJ13', 'Site Engineer');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK04', 'PROJ06', 'Structure Engineering');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK05', 'PROJ15', 'Architect Engineering');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK06', 'PROJ02', 'Staff Akutansi');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK07', 'PROJ01', 'Mechanic');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK08', 'PROJ12', 'Supervisor');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK09', 'PROJ11', 'Petugas Logistik');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK10', 'PROJ09', 'Project Manager (PM)');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK11', 'PROJ04', 'Chief Inspector');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK12', 'PROJ08', 'Project Manager (PM)');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK13', 'PROJ05', 'Staff Akutansi');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK14', 'PROJ07', 'Staff Akutansi');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK15', 'PROJ06', 'Site Engineer');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK16', 'PROJ10', 'Staff Akutansi');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK17', 'PROJ03', 'Project Manager (PM)');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK18', 'PROJ15', 'Site Engineer');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK19', 'PROJ06', 'Supervisor' );

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK20', 'PROJ13', 'Architect Engineering');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK21', 'PROJ02', 'Project Manager (PM)');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK22', 'PROJ01', 'Mechanic');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK23', 'PROJ12', 'Structure Engineering');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK24', 'PROJ11', 'Petugas Logistik');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK25', 'PROJ08', 'Project Manager (PM)');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK26', 'PROJ09', 'Chief Inspector');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK27', 'PROJ04', 'Project Manager (PM)');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK28', 'PROJ05', 'Staff Akutansi');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK29', 'PROJ07', 'Site Engineer');

INSERT INTO alokasi(AlokasiID, ProyekID, NamaPosisi)
VALUES ('ALOK30', 'PROJ06', 'Staff Akutansi' );

-- INSERT DATA PROYEK
INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ01', 'Query SQL', 'Membuat Query SQL dengan menggunakan SQLDeveloper', 30, 2020-08-21)

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ02', 'Developing Artificial Intelligence', 'Mengembangkan keakuratan pada artifical intelligence', 240, DATE '2019-07-17');

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ03', 'SIRI on Iphone', 'Pembuatan sistem AI pada Iphone yang bernam SIRI', 168, DATE '2020-05-1');

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ04', 'Windows 10', 'Membuat windows 10 yang akan diterapkan pada berbagai laptop', 720, DATE '2018-06-01');

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ05', 'Application Trading', 'Melakukan pembuatan aplikasi trading yang berisi saham maupun reksadana', 168, DATE '2017-01-01');

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ06', 'ChatBot Whatsapp', 'membuat chat bot tentang penulisan otomatis yang nantinya akan diterapkan pada buku oleh sistem, sehingga user tinggal mengetik dan nantinya hasil ketikan yang sudah dibuat oleh user akan dipindahkan ke dalam buku tulis oleh bot', 72, DATE '2020-01-15');

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ07', 'Hologram', 'Membuat hologram yang berbentuk manusia', 720, DATE '2020-03-16');

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ08', 'Self Driving Car', 'Mengembangkan sistem auto pilot pada pilot menggunakan AI sehingga memudahkan para sopir', 168, DATE '20120-03-10');

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ09', 'Automatic Lamp', 'Membuat lampu otomatis, yang mana lampu akan tetap menyala meskipun mati listrik', 48, DATE '2015-06-06');

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ10', 'Drone', 'Membuat drone, atau istilahnya adalah unmanned aerial vehicle', 168, DATE '2018-06-01');

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ11', 'Mobil Listrik', 'mengembangkan sebuah mobil yang dulunya masih menggunakan bahan bakar minyak, maka akan diganti dengan berbahan bakar listrik sebagai tenaga utamanya', 2160, DATE '2019-01-01');

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ12', 'Ponsel Lipat', 'Membuat layar sentuh yang mana layarnya bisa dilipat', 720, DATE '2020-12-12');

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ13', 'Penutup Kaca Mobil Anti Hujan Otomatis', 'Membuat penutup kaca mobil anti hujan otomatis sehingga akan memudahkan para pengemudi, tidak perlu khawatir lagi pandangan tertutup air hujan', 720, DATE '2020-10-01');

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ14', 'Membuat Web pemograman', 'pembuatan web pemrograman yang dimana web tersebut berisi sintax dari setiap bahasa pemrgraman. sehingga akan memudahkan para programmer untuk mempelajari bahasa pemrograman',48, DATE '2018-03-03');

INSERT INTO PROYEK(ProyekID, NamaProyek, Deskripsi, `Durasi(jam)` , TanggalMulai) 
VALUES ('PROJ15', 'Smart Home', 'membuat rumah agar lebih futuristik dengan memanfaatkan teknologi, yaitu menggunakan google assisten', 240, DATE '2019-11-19');