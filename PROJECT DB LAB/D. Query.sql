-- Staff yang memiliki gaji dibawah 15000 akan ditambahkan gajinya sebesar 10%

UPDATE MsStaff
SET StaffSalary = StaffSalary + (StaffSalary * (10/100))
WHERE StaffSalary < 15000

-- FlexPhone mengeluarkan staff yang berumur lebih dari 30 tahun

DELETE FROM MsStaff
WHERE 2021 - YEAR(StaffDateOfBirth) >= 30 

--Memasukkan data kepada tabel PurchaseTransaction dengan purchase ke 20 dari vendor melalui ID PH020 dari FlexPhone yang telah diurus oleh staff dengan ID ST0010 yang telah membeli HP yang diinginkan dari vendor dengan ID VE066 yang telah dilakukan pada tanggal 6 bulan November Tahun 2021 (20211106)
INSERT INTO PurchaseTransactionHeader
VALUES('PH020','ST010','VE006','20211106')

INSERT INTO PurchaseTransactionDetail
VALUES('SR032','PH020','PO002','20')

--Memasukkan data kepada tabel SalesTransaction saat sebuah pelanggan/customer melakukan transaksi di tokoh. SH051 merupakan transaksi ke 51 dari toko yang dilakukan melalui staff dengan ID staff ST006 dan dilakukan dengan customer dengan ID CU005 yang dilakukan pada tanggal 18 bulan November Tahun 2021 (20211118)
INSERT INTO SalesTransactionHeader
VALUES('SH051','ST006','CU005','20211118')

INSERT SalesTransactionDetail
VALUES('CT033','SH051','PO008','2')