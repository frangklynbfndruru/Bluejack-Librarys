USE BluejackLibrary
GO

INSERT INTO MsBook(BookID, BookTitle, BookPublishDate, BookStock, BookRating, BookCategoryID) VALUES
('BK011','The Seven Deadly Sins', '2012-02-10', 4, 4.5, 'BC001'),
('BK012', 'Happiness', '2014-12-29', 5, 5.0, 'BC002')

INSERT INTO DonationHeader (DonationID, DonatorID, StaffID, TransactionDate) VALUES
('DT018', 'DR003', 'SF005', '2021-10-01'),
('DT019', 'DR004', 'SF006', '2021-10-02')

INSERT INTO DonationDetail (DonationID, BookID, Quantity) VALUES
('DT018', 'BK011', 11),
('DT019', 'BK012', 12)

INSERT INTO BorrowHeader (BorrowID, StudentID, StaffID, BorrowDate) VALUES
('BT019', 'ST004', 'SF002', '2020-11-10'),    
('BT020', 'ST006', 'SF003', '2020-12-10')

INSERT INTO BorrowDetail (BorrowID, BookID, ReturnDate) VALUES
('BT011', 'BK011', '2022-12-01'),
('BT012', 'BK012', '2022-12-02'),
('BT016', 'BK011', '2022-11-03'),
('BT017', 'BK012', '2022-11-06')