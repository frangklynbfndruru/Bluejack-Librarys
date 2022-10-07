USE BluejackLibrary
GO

INSERT INTO MsStaff (StaffID, StaffName, StaffGender, StaffAddress, StaffPhone, StaffSalary) VALUES
('SF001', 'Kevin Sanjaya', 'Male', 'Jl. Apel', '+6282594837506', '15000000'),
('SF002', 'Marcus Gideon', 'Male', 'Melati Street', '+62885739403827', '1500000'),
('SF003', 'Gregoria Mariska', 'Female', 'Downtown Street', '+6285749385730', '1000000'),
('SF004', 'Melati Daeva', 'Female', 'Jl. Uptown', '+628394817204', '750000'),
('SF005', 'Anthony Sinisuka Ginting', 'Male', 'Jalan Anggur', '+62874392734493', '750000'),
('SF006', 'Greysia Polii', 'Female', 'Jl. Mangga', '+6284750192837', '5000000'),
('SF007', 'Daniel Marthin', 'Male', 'Strawberry Street', '+6287364912835', '1000000'),
('SF008', 'Apriyani Rahayu', 'Female', 'Jl. Salak', '+6287364957683', '350000'),
('SF009', 'Jonathan Christie', 'Male', 'Anggur Street', '+6287364957628', '750000'),
('SF010', 'Ribka Sugiarto', 'Female', 'Avenue Street', '+6284750192832', '1000000'),
('SF011', 'Felix Lengyel', 'Male', 'Toronto Street', '+6284450260830', '900000')

INSERT INTO MsStudent (StudentID, StudentName, StudentGender, StudentAddress, StudentEmail) VALUES
('ST001', 'Daniel Widjaja', 'Male', 'Melati Street', 'widjajaDaniel@gmail.com'),
('ST002', 'Vivianit Indyca Vica', 'Female', 'Mawar Street', 'vivianit.vica@yahoo.com'),
('ST003', 'Felice Cendekia', 'Male', 'Matahari Avenue', 'felice@gmail.com'),
('ST004', 'Frangklyn Blair F. Ndruru', 'Female', 'Anggrek Avenue', 'ndruruFrangklyn@gmail.com'),
('ST005', 'Ucok Lelaki', 'Male', 'Jalan Aja Street', 'ucok@gmail.com'),
('ST006', 'Sibutet Anak Papa', 'Female', 'Gatau Apa Street', 'sibutet@binus.com'),
('ST007', 'Siucil Anak Mak', 'Male', 'Yah Jalan gitu Street', 'ucil@book.com'),
('ST008', 'Antara Riks', 'Female', 'Udahlah Avenue', 'riks@ang.com'),
('ST009', 'Indah', 'Female', 'Tapi Gajadian Street', 'indah@beach.com'),
('ST010', 'Pangman', 'Male', 'Cuma dianggap teman Street', 'pangman@peng.com'),
('ST011', 'Gawin Dean', 'Male', 'Sunflower Street', 'gawind@yahoo.com'),
('ST012', 'Mond Caskey', 'Male', 'Thunderous Avenue', 'caskeyyy@yahoo.com'),
('ST013', 'Fizi', 'Male', 'Sunflower Street', 'fizfizi@yahoo.com')

INSERT INTO MsDonator (DonatorID, DonatorName, DonatorGender, DonatorAddress, DonatorPhoneNumber)VALUES
('DR001', 'Marcus Sore',  'Male', 'Kunyit Street', '+62811654321'),
('DR002', 'Monik Dune',  'Female', 'Jl. Parkit', '+62811654322'),
('DR003', 'Donald Mace',  'Male', 'Jl. Buah', '+62811654323'),
('DR004', 'Hanah Nadi', 'Female', 'Jl. Kebun', '+62811654324'),
('DR005', 'Rebecca Ades', 'Female', 'Jl. Harta', '+62811654325'),
('DR006', 'Susi Alpha', 'Female', 'Jeruk Avenue', '+62811654326'),
('DR007', 'Riki Beta', 'Male', 'Pelangi Raya Street', '+62811654327'),
('DR008', 'Susanti Charlie', 'Female', 'Sakura Hanabi Avenue', '+62811654328'),
('DR009', 'Marc Gerg', 'Male', 'Jl. Udang', '+62811654329'),
('DR010', 'Budi Weto', 'Male', 'Elang Jaya Street', '+62811654330')

INSERT INTO MsBookCategory (BookCategoryID, BookCategory) VALUES
('BC001', 'Fantasy'),
('BC002', 'Mystery'),
('BC003', 'Education'),
('BC004', 'Romance'),
('BC005', 'Sci-fi')

INSERT INTO MsBook(BookID, BookTitle, BookPublishDate, BookStock, BookRating, BookCategoryID) VALUES
('BK001','Hyouka', '2012-03-21', 5, 3.5, 'BC001'),
('BK002','Demian', '2014-12-02', 7, 4.0, 'BC002'),
('BK003','I See You Like A Flower', '2015-04-03', 10, 5.0, 'BC004'),
('BK004','Almond', '2013-03-05', 8, 3.7, 'BC001'),
('BK005','20cm', '2013-09-20', 4, 2.8, 'BC004'),
('BK006','Starry Night', '2021-10-17', 9, 4.3, 'BC005'),
('BK007','Why?', '2018-03-19', 13, 3.7, 'BC003'),
('BK008','Into The Magic Shop', '2018-04-08', 16, 5.0, 'BC002'),
('BK009','Map of The Soul', '2012-01-26', 12, 4.3, 'BC003'),
('BK010','Omelas', '2019-12-15', 4, 3.7, 'BC005')

INSERT INTO BorrowHeader (BorrowID, StudentID, StaffID, BorrowDate) VALUES
('BT001', 'ST001', 'SF001', '2021-10-11'),    
('BT002', 'ST002', 'SF002', '2020-10-12'),    
('BT003', 'ST003', 'SF003', '2021-10-13'),    
('BT004', 'ST004', 'SF004', '2020-10-14'),    
('BT005', 'ST005', 'SF005', '2021-10-15'),    
('BT006', 'ST006', 'SF006', '2020-10-16'),    
('BT007', 'ST007', 'SF007', '2021-10-17'),    
('BT008', 'ST008', 'SF008', '2020-10-18'),    
('BT009', 'ST009', 'SF009', '2021-10-19'),    
('BT010', 'ST010', 'SF010', '2020-10-20'),    
('BT011', 'ST001', 'SF001', '2021-10-21'),    
('BT012', 'ST002', 'SF002', '2020-10-22'),    
('BT013', 'ST003', 'SF003', '2021-10-23'),    
('BT014', 'ST004', 'SF004', '2020-10-24'),    
('BT015', 'ST005', 'SF005', '2021-10-25'),
('BT016', 'ST011', 'SF008', '2021-10-29'),
('BT017', 'ST012', 'SF009', '2021-10-08'),
('BT018', 'ST013', 'SF001', '2021-10-09')

INSERT INTO BorrowDetail (BorrowID, BookID, ReturnDate) VALUES
('BT001', 'BK001', '2022-10-01'),
('BT002', 'BK002', '2022-10-02'),
('BT003', 'BK002', '2022-10-03'),
('BT004', 'BK003', '2022-10-04'),
('BT005', 'BK004', '2022-10-05'),
('BT006', 'BK005', '2022-10-05'),
('BT007', 'BK006', '2022-10-05'),
('BT008', 'BK007', '2022-10-06'),
('BT009', 'BK008', '2022-10-07'),
('BT010', 'BK009', '2022-10-08'),
('BT011', 'BK010', '2022-10-09'),
('BT012', 'BK010', '2022-10-09'),
('BT013', 'BK005', '2022-10-10'),
('BT014', 'BK004', '2022-10-11'),
('BT015', 'BK003', '2022-10-12'),
('BT006', 'BK007', '2022-10-13'),
('BT007', 'BK009', '2022-10-10'),
('BT008', 'BK010', '2022-10-12'),
('BT009', 'BK001', '2022-10-15'),
('BT010', 'BK002', '2022-10-17'),
('BT016', 'BK003', '2022-10-22'),
('BT017', 'BK004', '2022-10-21'),
('BT018', 'BK005', '2022-10-20')

INSERT INTO DonationHeader (DonationID, DonatorID, StaffID, TransactionDate) VALUES
('DT001', 'DR001', 'SF001', '2021-09-01'),
('DT002', 'DR002', 'SF002', '2021-09-02'),
('DT003', 'DR003', 'SF003', '2021-09-03'),
('DT004', 'DR004', 'SF004', '2021-09-04'),
('DT005', 'DR005', 'SF005', '2021-09-05'),
('DT006', 'DR005', 'SF006', '2021-09-05'),
('DT007', 'DR006', 'SF007', '2021-09-06'),
('DT008', 'DR007', 'SF008', '2021-09-07'),
('DT009', 'DR008', 'SF009', '2021-09-08'),
('DT010', 'DR009', 'SF010', '2021-09-09'),
('DT011', 'DR009', 'SF010', '2021-09-19'),
('DT012', 'DR010', 'SF011', '2021-09-20'),
('DT013', 'DR005', 'SF005', '2021-09-21'),
('DT014', 'DR004', 'SF004', '2021-09-22'),
('DT015', 'DR003', 'SF003', '2021-09-23'),
('DT016', 'DR001', 'SF009', '2021-09-24'),
('DT017', 'DR001', 'SF010', '2021-09-29')

INSERT INTO DonationDetail (DonationID, BookID, Quantity) VALUES
('DT001', 'BK001', 11),
('DT002', 'BK002', 11),
('DT003', 'BK004', 15),
('DT004', 'BK003', 12),
('DT005', 'BK007', 16),
('DT006', 'BK006', 12),
('DT007', 'BK008', 13),
('DT008', 'BK010', 23),
('DT009', 'BK009', 35),
('DT010', 'BK007', 48),
('DT010', 'BK005', 23),
('DT001', 'BK002', 12),
('DT002', 'BK004', 61),
('DT003', 'BK005', 16),
('DT004', 'BK006', 25),
('DT011', 'BK010', 33),
('DT012', 'BK009', 42),
('DT013', 'BK001', 51),
('DT014', 'BK002', 64),
('DT015', 'BK003', 17),
('DT016', 'BK003', 20),
('DT017', 'BK003', 26)