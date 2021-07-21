PRCESSING SINGLE TABLE 
	SELECT P.NIP, P.Nama, P.alamat 
	FROM pegawai p
	
	SELECT J.Nama, J.GajiPokok, J.GajiTunjangan 
	FROM JABATAN J
	
	SELECT p.NIP, p.Nama, d.NamaDivisi, j.Nama namajabatan 
	FROM pegawai P, divisi D, jabatan J
	
	SELECT * FROM ALOKASI a 
	WHERE A.NamaPosisi = "Project Manager (PM)"
	
	SELECT p.nip, p.Nama, d.NamaDivisi, j.Nama 
	FROM PEGAWAI P, DIVISI D, JABATAN j 
	where p.nip=200108211001 and p.DivisiID = d.DivisiID and j.JabatanID=p.JabatanID;
	
	SELECT p.nip, p.Nama, d.NamaDivisi, j.Nama 
	FROM PEGAWAI P, DIVISI D, JABATAN j 
	where j.GajiPokok < 50000000 and p.DivisiID = d.DivisiID and p.JabatanID=j.JabatanID
	
#untuk mencari dari variabel tengah maka menggunakan % depan belakang %
SELECT * 
FROM alokasi a 
WHERE a.NamaPosisi LIKE '%manager%'

jika yang diketik yang belakang maka % ditaruh di depan
SELECT * 
FROM alokasi a 
WHERE a.NamaPosisi LIKE '%engineer'

jika yang diketik yang belakang maka % ditaruh di belakang
SELECT * 
FROM alokasi a 
WHERE a.NamaPosisi LIKE 'site%'

Jika ingin mencari nama/variabel dengan misalkan huruf ke2 adalah a maka _a% jika huruf ke 3 a maka __a%
SELECT * FROM pegawai p WHERE P.Nama like '__a%'


SELECT p.Nama , p.Email , j.Nama 
FROM pegawai p, divisi d, jabatan j 
WHERE (p.DivisiID=d.DivisiID and j.JabatanID = p.DivisiID) and (j.Nama LIKE 'direktur%' OR j.nama LIKE 'dewan%') AND j.GajiPokok > 45000000

DISTINCT BERGUNA UNTUK MENAMPILKAN AGAR TIDAK DUPLIKAT.
SELECT DISTINCT j.GajiPokok FROM jabatan j

fungsi in sama saja dengan or
SELECT j.Nama FROM jabatan j 
WHERE j.Nama IN ('direktur utama', 'dewan penasehat')

UNTUK MENGURUTKAN
SELECT p.Nama, p.TanggalLahir, p.Email 
FROM pegawai p
ORDER BY p.Nama , p.Email;

untuk menghitung satu pekerjaan yang sama atau variabel yang sama kemudian disimpan dalam grup dan ditulis berapa yg sama
SELECT a.NamaPosisi, COUNT(a.NamaPosisi) 
FROM alokasi a 
GROUP BY a.NamaPosisi;

SELECT a.NamaPosisi, COUNT(a.NamaPosisi) 
FROM alokasi a 
GROUP BY a.NamaPosisi 
HAVING COUNT(a.NamaPosisi) > 2;

update baru
update pegawai set alamat="Jalan setongkol balado" where nama = "irwan reza firsmansyah"

show nomor___
SELECT Nama, Nomor1 from pegawai where Nomor1 like "__1%"

Show month
SELECT COUNT(*) FROM TASK WHERE month(tanggaltes)=1
select count(*) from task where tanggaltes like "%-01-%"

minimum
SELECT p.Nama, COUNT(a.ProyekID) 
FROM aktivitas a, pegawai p 
WHERE p.NIP = a.NIP 
group by p.nama
ORDER by COUNT(p.nama) ASC
limit 3

select p.nama, count(a.ProyekID) 
from aktivitas a, pegawai p
where p.NIP = a.NIP
GROUP by p.nama


-- soal 1
alter table flightschedule
modify destination varchar(100);

-- soal 2
select AirplaneID, AirportID, EligibilityStatus
from airplane;
-- soal 3

select count() as "JumlahData"
from ticket;

-- soal 4
select f.FlightScheduleID, FlightDate, count() JumlahRealisasi
from flightschedule f
join realizationschedule r on f.FlightScheduleID = r.FlightScheduleID
group by r.FlightScheduleID;

-- soal 5
select FlightDate
from flightschedule
where FlightScheduleID in (
    select crewName
    from crew
    where crewName like 'Raden Mulya%'
);


select p.Nama, a.NamaAktivitas
from aktivitas a, pegawai p
where a.NIP=p.NIP and p.Nama like "prajogo pangestu"

select p.nama, count(a.ProyekID) 
from aktivitas a, pegawai p
where p.NIP = a.NIP
GROUP by p.nama

select a.NIP, p.NamaProyek, t.Status, t.Approval
from alokasi a, proyek p, task t
where a.ProyekID=p.ProyekID and p.ProyekID=t.ProyekID

select p.proyekid, COUNT(a.NIP)
from alokasi a, proyek p, task t
where a.ProyekID=p.ProyekID and p.ProyekID=t.ProyekID
GROUP by p.ProyekID

SELECT p1.NIP, p1.Nama , p2.Nama AS Manager
FROM pegawai p1 , pegawai p2
WHERE p1.NIP = p2.Manager