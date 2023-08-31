USE [biblio_ksiegarnia]
GO

/****** Object:  StoredProcedure [dbo].[AddLoan]    Script Date: 31.08.2023 23:02:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AddLoan]
@id_specimen int, @id_client int, @LoanDate datetime,
@loanDays int = 0
as 
begin
declare @id_book int, @dueDate datetime, @isAvailable bit, @maxLoanDays int
	select @isAvailable = IsAvailable from Specimen where id = @id_specimen 
	select @maxLoanDays = MaxLoanDays from Settings
	if @isAvailable = 0
	begin
		select 'Ten egzemplarz jest już wypożyczony' as 'Result'
		return 0
	end
	else 
	begin
		if exists(
		select 1 from Loan
		where ID_Client = @id_client and ReturnDate is null and DATEADD(DAY, @maxLoanDays, DueDate) >= @LoanDate
		)
		begin
			select 'Ten czytelnik za długo przetrzymuje już co najmniej jedną książkę' as 'Result'
			return 0
		end


		if @loanDays = 0
			select @loanDays = DefaultLoanDays from Settings
		set @dueDate = @LoanDate + @loanDays

		select @id_book = id_book from Specimen where ID = @id_specimen

		insert into Loan(ID_Book, ID_Client, LoanDate, DueDate, IsPaid, ID_Specimen) values
		(@id_book, @id_client, @LoanDate, @dueDate, 0, @id_specimen)

		select @id_book, @id_client, @LoanDate, @dueDate, 0, @id_specimen
		update Specimen set IsAvailable = 0 where id = @id_specimen

		select 'Dodano wpis o wypożyczeniu' as 'Result'
		return 0
	end

end
GO

/****** Object:  StoredProcedure [dbo].[AddSpecimens]    Script Date: 31.08.2023 23:02:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[AddSpecimens]
@id_document int

as
begin
	declare @id_documentitem int, @id_book int, @quantity int, @counter int

	declare docitemcursor CURSOR FOR
		SELECT ID_Book, Quantity from DocumentItem where id_document = @id_document
		open docitemcursor

		while 1=1
		begin
			fetch next
			from docitemcursor into @id_book, @quantity
			if @@FETCH_STATUS < 0 BREAK
			if @quantity > 1
			begin
				set @counter = 0
				WHILE @counter < 10
				begin
				   insert into Specimen (ID_Book, ForSell, IsAvailable, IsDeleted) values (@id_book, 0, 1, 0)
				   SET @counter = @counter + 1;
				end;
			end
			else
				insert into Specimen (ID_Book, ForSell, IsAvailable, IsDeleted) values (@id_book, 0, 1, 0)
		end
close docitemcursor
DEALLOCATE docitemcursor 
end
GO

/****** Object:  StoredProcedure [dbo].[ReturnLoan]    Script Date: 31.08.2023 23:02:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ReturnLoan]
@id_loan int, @returnDate dateTime
as
begin
declare @id_specimen int, @id_client int, @LoanDate datetime, @DueDate datetime, @daysOfLoan int, @lateDays int = 0, @lateDayFeeDef numeric(5,2) = 0, @rentalDayFeeDef numeric(5,2) = 0, 
@docName varchar(50), @lateDayFee numeric(5,2) = 0, @rentalDayFee numeric(5,2) = 0, @value numeric(5,2) = 0, @currYear int, @maxDocNumber int, @NumberDoc varchar(4), @maxDocNumber2 int, @yearStr varchar(4)
	
	select @currYear = YEAR(GETDATE())
	select @maxDocNumber = x.MaxDocumentNumber from (
	SELECT 
    MAX(CAST(SUBSTRING(name, CHARINDEX('_', name) + 1, 4) AS INT)) AS MaxDocumentNumber
	FROM Document
	WHERE YEAR(IssueDate) = @currYear
	GROUP BY YEAR(IssueDate)
	) as x

	select @id_specimen = id_specimen, @id_client = ID_Client, @LoanDate = LoanDate, @DueDate = DueDate
	from loan where id = @id_loan
	select @lateDayFeeDef = LateDayFee, @rentalDayFeeDef = RentalDayFee from Settings
	if @returnDate > @DueDate
	begin
		select @daysOfLoan = DATEDIFF(DAY, @LoanDate, @DueDate)
		select @lateDays = DATEDIFF(day, @DueDate, @returnDate)
	end
	else
		select @daysOfLoan = DATEDIFF(DAY, @LoanDate, @returnDate)
	set @rentalDayFee = @daysOfLoan * @rentalDayFeeDef
	set @lateDayFee = @lateDays * @lateDayFeeDef
	set @value = @rentalDayFee + @lateDayFee
	update Loan
	set ReturnDate = @returnDate, Fee = @rentalDayFee, Penalty = @lateDayFee
	where ID = @id_loan

	update Specimen set IsAvailable = 1 where id = @id_specimen
	set @maxDocNumber = @maxDocNumber + 1
	select @maxDocNumber2 = RIGHT('0000' + FORMAT(@maxDocNumber, '0'), 4)
	SET @NumberDoc = CAST(@maxDocNumber2 AS VARCHAR(4))
	set @yearStr = cast(@currYear as varchar(4))
	select @docName = 'OBW_' + @NumberDoc + '_' + @yearStr

	insert into Document (IssueDate, ID_Type, Name, NetValue, GrossValue, DueDate, IsPaid, ID_Loan)
	values
	(@returnDate, 9, @docName, @value, @value, @returnDate, 0, @id_loan)
		
end
GO


