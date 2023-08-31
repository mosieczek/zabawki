USE [biblio_ksiegarnia]
GO

/****** Object:  Table [dbo].[Author]    Script Date: 31.08.2023 23:01:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Author](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Book]    Script Date: 31.08.2023 23:01:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Book](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[Publisher] [varchar](50) NOT NULL,
	[PublicationYear] [date] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[ID_Author] [int] NULL,
	[StockQuantity] [int] NULL,
	[NetPrice] [numeric](5, 2) NULL,
	[GrossPrice] [numeric](5, 2) NULL,
	[Tax] [numeric](5, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Contractor]    Script Date: 31.08.2023 23:01:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Contractor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PhoneNumber] [numeric](9, 0) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[IsSuplier] [bit] NULL,
	[IsReader] [bit] NULL,
	[NIP] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Document]    Script Date: 31.08.2023 23:01:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Document](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IssueDate] [datetime] NOT NULL,
	[ID_Type] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[NetValue] [decimal](7, 2) NULL,
	[GrossValue] [decimal](7, 2) NULL,
	[DueDate] [datetime] NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[ID_Order] [int] NULL,
	[ID_ConnectedDocument] [int] NULL,
	[ID_Contractor] [int] NULL,
	[ID_Loan] [int] NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DocumentItem]    Script Date: 31.08.2023 23:01:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DocumentItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Book] [int] NOT NULL,
	[ID_Document] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[NetPrice] [numeric](5, 2) NOT NULL,
	[GrossPrice] [numeric](5, 2) NOT NULL,
	[NetValue] [numeric](5, 2) NOT NULL,
	[GrossValue] [numeric](5, 2) NOT NULL,
	[ID_Specimen] [int] NULL,
	[Discount] [decimal](5, 2) NULL,
	[Tax] [int] NULL,
 CONSTRAINT [PK_DocumentItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DocumentType]    Script Date: 31.08.2023 23:01:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DocumentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Symbol] [varchar](5) NOT NULL,
	[IsIncome] [bit] NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Loan]    Script Date: 31.08.2023 23:01:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Loan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Book] [int] NOT NULL,
	[ID_Client] [int] NOT NULL,
	[LoanDate] [datetime] NOT NULL,
	[ReturnDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[Fee] [numeric](5, 2) NULL,
	[Penalty] [numeric](5, 2) NULL,
	[IsPaid] [bit] NOT NULL,
	[ID_Specimen] [int] NULL,
 CONSTRAINT [PK_Loan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Order]    Script Date: 31.08.2023 23:01:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Client] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[TotalNetValue] [numeric](5, 2) NOT NULL,
	[TotalGrossValue] [numeric](5, 2) NOT NULL,
	[ID_Type] [int] NULL,
	[ID_Specimen] [int] NULL,
	[IsFinished] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[OrderItem]    Script Date: 31.08.2023 23:01:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Book] [int] NOT NULL,
	[ID_Order] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[NetPrice] [numeric](5, 2) NOT NULL,
	[GrossPrice] [numeric](5, 2) NOT NULL,
	[NetValue] [numeric](5, 2) NOT NULL,
	[GrossValue] [numeric](5, 2) NOT NULL,
	[ID_Specimen] [int] NULL,
	[Discount] [decimal](5, 2) NULL,
	[Tax] [int] NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Settings]    Script Date: 31.08.2023 23:01:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Settings](
	[MaxLoanDays] [numeric](4, 0) NOT NULL,
	[LateDayFee] [numeric](5, 2) NOT NULL,
	[RentalDayFee] [numeric](5, 2) NOT NULL,
	[DefaultLoanDays] [numeric](4, 0) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Specimen]    Script Date: 31.08.2023 23:01:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Specimen](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Book] [int] NOT NULL,
	[ForSell] [bit] NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Loan] ADD  CONSTRAINT [DF_Loan_Penalty]  DEFAULT ((0)) FOR [Penalty]
GO

ALTER TABLE [dbo].[Loan] ADD  CONSTRAINT [DF_Loan_IsPaid]  DEFAULT ((0)) FOR [IsPaid]
GO

ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor] FOREIGN KEY([ID_Author])
REFERENCES [dbo].[Author] ([ID])
GO

ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_BookAuthor]
GO

ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [DocumentContractor] FOREIGN KEY([ID_Contractor])
REFERENCES [dbo].[Contractor] ([ID])
GO

ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [DocumentContractor]
GO

ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [DocumentLoan] FOREIGN KEY([ID_Loan])
REFERENCES [dbo].[Loan] ([ID])
GO

ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [DocumentLoan]
GO

ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [DocumentOrder] FOREIGN KEY([ID_Order])
REFERENCES [dbo].[Order] ([ID])
GO

ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [DocumentOrder]
GO

ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_DocumentType] FOREIGN KEY([ID_Type])
REFERENCES [dbo].[DocumentType] ([ID])
GO

ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_DocumentType]
GO

ALTER TABLE [dbo].[DocumentItem]  WITH CHECK ADD  CONSTRAINT [DocumentItemSpecimen] FOREIGN KEY([ID_Specimen])
REFERENCES [dbo].[Specimen] ([ID])
GO

ALTER TABLE [dbo].[DocumentItem] CHECK CONSTRAINT [DocumentItemSpecimen]
GO

ALTER TABLE [dbo].[DocumentItem]  WITH CHECK ADD  CONSTRAINT [FK_DocumentItemBook] FOREIGN KEY([ID_Book])
REFERENCES [dbo].[Book] ([ID])
GO

ALTER TABLE [dbo].[DocumentItem] CHECK CONSTRAINT [FK_DocumentItemBook]
GO

ALTER TABLE [dbo].[DocumentItem]  WITH CHECK ADD  CONSTRAINT [FK_DocumentItemDocument] FOREIGN KEY([ID_Document])
REFERENCES [dbo].[Document] ([Id])
GO

ALTER TABLE [dbo].[DocumentItem] CHECK CONSTRAINT [FK_DocumentItemDocument]
GO

ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Loan] FOREIGN KEY([ID])
REFERENCES [dbo].[Loan] ([ID])
GO

ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Loan]
GO

ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_LoanBook] FOREIGN KEY([ID_Book])
REFERENCES [dbo].[Book] ([ID])
GO

ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_LoanBook]
GO

ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_LoanClient] FOREIGN KEY([ID_Client])
REFERENCES [dbo].[Contractor] ([ID])
GO

ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_LoanClient]
GO

ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [LoanSpecimen] FOREIGN KEY([ID_Specimen])
REFERENCES [dbo].[Specimen] ([ID])
GO

ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [LoanSpecimen]
GO

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_OrderClient] FOREIGN KEY([ID_Client])
REFERENCES [dbo].[Contractor] ([ID])
GO

ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_OrderClient]
GO

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_OrderType] FOREIGN KEY([ID_Type])
REFERENCES [dbo].[DocumentType] ([ID])
GO

ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_OrderType]
GO

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [OrderSpecimen] FOREIGN KEY([ID_Specimen])
REFERENCES [dbo].[Specimen] ([ID])
GO

ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [OrderSpecimen]
GO

ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemBook] FOREIGN KEY([ID_Book])
REFERENCES [dbo].[Book] ([ID])
GO

ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItemBook]
GO

ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemOrder] FOREIGN KEY([ID_Order])
REFERENCES [dbo].[Order] ([ID])
GO

ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItemOrder]
GO

ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [OrderItemSpecimen] FOREIGN KEY([ID_Specimen])
REFERENCES [dbo].[Specimen] ([ID])
GO

ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [OrderItemSpecimen]
GO

ALTER TABLE [dbo].[Specimen]  WITH CHECK ADD  CONSTRAINT [FK_SpecimenBook] FOREIGN KEY([ID_Book])
REFERENCES [dbo].[Book] ([ID])
GO

ALTER TABLE [dbo].[Specimen] CHECK CONSTRAINT [FK_SpecimenBook]
GO


