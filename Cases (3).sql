USE BluejackLibrary

--1
SELECT
	StudentName,
	StudentAddress,
	[BorrowTransactionID] = bh.BorrowID,
	[BorrowTransactionDate] = BorrowDate,
	[number of books borrowed] = COUNT(bookID)
FROM 
	MsStudent mst 
	JOIN BorrowHeader bh ON mst.StudentID = bh.StudentID
	JOIN BorrowDetail bd ON bd.BorrowID = bh.BorrowID
WHERE YEAR(BorrowDate) = 2020 AND StudentAddress LIKE '% Street'
GROUP BY StudentName, StudentAddress, bh.BorrowID, BorrowDate

--2
SELECT
    [BookTitle] = mb.BookTitle,
    [Publish Month] = MONTH(mb.BookPublishDate),
    [BookCategoryName] = mbc.BookCategory,
    [Total Sum Donation] = SUM(dd.Quantity)
FROM 
	MsBook mb 
	JOIN MsBookCategory mbc ON mb.BookCategoryID = mbc.BookCategoryID
	JOIN DonationDetail dd ON dd.BookID = mb.BookID
WHERE BookCategory LIKE '%y%' AND MONTH(BookPublishDate) % 2 = 1
GROUP BY BookTitle, BookPublishDate, BookCategory

--3
SELECT 
	[BorrowTransactionID] = bh.BorrowID,
	[Borrow Transaction Date] = CONVERT(VARCHAR, BorrowDate, 106),
	[StudentName] = StudentName,
	[Books Borrowed] = COUNT(bd.BookID),
	[Average Book Rating] = AVG(BookRating),
	[StudentEmail] = StudentEmail
FROM 
	BorrowDetail bd
	JOIN BorrowHeader bh ON bd.BorrowID = bh.BorrowID
	JOIN MsStudent ms ON ms.StudentID = bh.StudentID
	JOIN MsBook mb ON mb.BookID = bd.BookID
WHERE StudentEmail LIKE '%gmail'
GROUP BY bh.BorrowID, BorrowDate, StudentName, StudentEmail
HAVING AVG(BookRating) > 4.0

--4
SELECT 
	[DonatorName] = 'Ms.' + MD.DonatorName, 
	[DonationDate] = CONVERT(VARCHAR, DH.TransactionDate, 107),
	[BooksDonated] = SUM(Quantity),
	[Average Rating] = AVG(BookRating)
FROM
	MsDonator MD
	JOIN DonationHeader DH ON DH.DonatorID = MD.DonatorID
	JOIN DonationDetail DD ON DH.DonationID = DD.DonationID
	JOIN MsBook MB ON MB.BookID = DD.BookID
WHERE DonatorGender IN('Female') AND DAY(TransactionDate) BETWEEN 1 AND 14
GROUP BY MD.DonatorName, DH.TransactionDate

--5
SELECT
    [DonatorName],
    [TransactionDate],
    [StaffName],
    [StaffGender],
    [StaffSalary] = 'Rp.' + CAST(MS.StaffSalary AS VARCHAR)
FROM 
	MsDonator MD
    JOIN DonationHeader DH ON DH.DonatorID = MD.DonatorID
    JOIN MsStaff MS ON MS.StaffID = DH.StaffID
WHERE  StaffSalary > (SELECT AVG(StaffSalary) FROM MsStaff) AND[DonatorName] LIKE '% %'
ORDER BY TransactionDate DESC

--6
SELECT
	[DonationID] = DH.DonationID,
	[BookTitle] = REPLACE(BookTitle, ' ', ''),
	[Rating Percentage] = CAST(BookRating * 20 AS VARCHAR(255)) + '%',
	[Quantity] = Quantity,
	[DonatorPhone] = DonatorPhoneNumber
FROM
	MsDonator MD
	JOIN DonationHeader DH ON DH.DonatorID = MD.DonatorID
	JOIN DonationDetail DD ON DH.DonationID = DD.DonationID
	JOIN MsBook MB ON MB.BookID = DD.BookID,
	(SELECT AVG(BookRating) AS avg_rating FROM MsBook) x
WHERE LEN(DonatorAddress) > 15 AND BookRating > x.avg_rating

--7
SELECT
	[BorrowTransactionID] = BH.BorrowID,
	[Borrow Date] = (SELECT CONVERT(VARCHAR, BH.BorrowDate, 110)),
	[Return Day] = (SELECT DATENAME(dw, BD.ReturnDate)),
	[BookTitle] = MB.BookTitle,
	[BookRating] = CAST(MB.BookRating AS VARCHAR) + ' star(s)',
	[BookCategoryName] = MBC.BookCategory
FROM 
	BorrowHeader BH
	JOIN BorrowDetail BD ON BH.BorrowID = BD.BorrowID
	JOIN MsBook MB ON BD.BookID = MB.BookID
	JOIN MsBookCategory MBC ON MB.BookCategoryID = MBC.BookCategoryID,
	(
		SELECT
			MIN(BookRating) AS 'Min_rating',
			MAX(BookRating) AS 'Max_rating'
		FROM MsBook
	) AS X
WHERE MB.BookStock > 10 AND (BookRating = X.Min_rating OR BookRating = X.Max_rating)
ORDER BY BH.BorrowID DESC

--8
SELECT 
	[StudentName] = 'Mr. ' + MS.StudentName,
	[StudentEmail] = REPLACE(MS.StudentEmail, '.com', ''),
	[Books Borrowed] = COUNT(BD.BookID)
FROM
	MsStudent MS
	JOIN BorrowHeader BH ON MS.StudentID = BH.StudentID
	JOIN BorrowDetail BD ON BH.BorrowID = BD.BorrowID
	JOIN MsStaff MSF ON BH.StaffID = MSF.StaffID,
	(
		SELECT
			AVG(StaffSalary) AS 'AVG_salary'
		FROM MsStaff
	) AS X
WHERE MS.StudentGender = 'Male' AND MSF.StaffSalary > X.AVG_salary
GROUP BY MS.StudentName, MS.StudentGender, MS.StudentEmail

UNION

SELECT 
	[StudentName] = 'Ms. ' + MS.StudentName,
	[StudentEmail] = REPLACE(MS.StudentEmail, '.com', ''),
	[Books Borrowed] = COUNT(BD.BookID)
FROM
	MsStudent MS
	JOIN BorrowHeader BH ON MS.StudentID = BH.StudentID
	JOIN BorrowDetail BD ON BH.BorrowID = BD.BorrowID
	JOIN MsStaff MSF ON BH.StaffID = MSF.StaffID,
	(
		SELECT
			AVG(StaffSalary) AS 'AVG_salary'
		FROM MsStaff
	) AS X
WHERE MS.StudentGender = 'Female' AND MSF.StaffSalary < X.AVG_salary
GROUP BY MS.StudentName, MS.StudentGender, MS.StudentEmail

--9
GO
CREATE VIEW ViewDonationDetail AS
    SELECT 
        [DonatorName],
        [Donation Transaction] = COUNT(DISTINCT DH.DonationID),
        [Average Quantity] = SUM(quantity) / COUNT(DISTINCT DH.DonationID)
    FROM
		MsDonator md
        JOIN DonationHeader dh ON md.DonatorID = dh.DonatorID
		JOIN DonationDetail dd ON dd.DonationID = dh.DonationID
    WHERE (md.DonatorAddress LIKE '% Street' OR md.DonatorAddress LIKE '% Avenue')
    GROUP BY md.DonatorName
	HAVING COUNT(DISTINCT dh.DonationID) > 1

GO
SELECT * 
FROM ViewDonationDetail

--10
GO
CREATE VIEW ViewStudentBorrowingData AS
    SELECT
        [StudentName],
        [Borrow Transaction] = COUNT(DISTINCT bh.BorrowID),
        [Average Duration] = SUM(DATEDIFF(DAY, borrowdate, returndate)) / COUNT(bh.BorrowID)
    FROM 
		BorrowHeader bh
        JOIN MsStudent ms ON bh.StudentID = ms.StudentID
		JOIN BorrowDetail bd ON bd.BorrowID = bh.BorrowID
    WHERE StudentGender = 'Male' AND StudentEmail LIKE '%yahoo%'
    GROUP BY StudentName

GO
SELECT * 
FROM ViewStudentBorrowingData