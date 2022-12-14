USE [master]
GO
/****** Object:  Database [BookManagement]    Script Date: 11/9/2022 1:45:07 PM ******/
CREATE DATABASE [BookManagement]
 CONTAINMENT = NONE
GO
ALTER DATABASE [BookManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookManagement] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BookManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [BookManagement] SET  MULTI_USER 
GO
ALTER DATABASE [BookManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookManagement', N'ON'
GO
ALTER DATABASE [BookManagement] SET QUERY_STORE = OFF
GO
USE [BookManagement]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/9/2022 1:45:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Phone] [nvarchar](50) NULL,
	[Point] [int] NULL,
	[Rank] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleId] [int] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 11/9/2022 1:45:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Author] [nvarchar](255) NULL,
	[CategoryId] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[User_ID] [int] NULL,
	[Image] [varchar](200) NULL,
 CONSTRAINT [PK_dbo.Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/9/2022 1:45:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/9/2022 1:45:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/9/2022 1:45:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[BuyDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[CustomerName] [nvarchar](255) NULL,
	[status] [nvarchar](225) NULL,
	[CustomerID] [int] NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/9/2022 1:45:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[RoleName] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [FullName], [Phone], [Point], [Rank], [Address], [username], [password], [roleId], [isDeleted]) VALUES (1, N'Luu Duc Hung', N'12312312', 0, N'Low', N'1032/Nguyen Trai ', N'hung', N'12345', 2, 0)
INSERT [dbo].[Account] ([ID], [FullName], [Phone], [Point], [Rank], [Address], [username], [password], [roleId], [isDeleted]) VALUES (3, N'Tsubasa Hanekawa', N'10239120312', 0, N'Normal', N'Some where in Japan', N'hanekawa', N'12345', 2, 0)
INSERT [dbo].[Account] ([ID], [FullName], [Phone], [Point], [Rank], [Address], [username], [password], [roleId], [isDeleted]) VALUES (4, N'abjnsbdha', N'09120391', 0, N'Normal', N'aksdjasjijkjdask', N'lily', N'123456', 2, 0)
INSERT [dbo].[Account] ([ID], [FullName], [Phone], [Point], [Rank], [Address], [username], [password], [roleId], [isDeleted]) VALUES (5, N'Senjougahara Hitagi', N'9123012901', 0, N'Normal', N'1200 saokdsakd', N'hitagi', N'araragi', 2, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Name], [Quantity], [Price], [Author], [CategoryId], [status], [User_ID], [Image]) VALUES (1, N'Norgerian Wood', 6, CAST(120.00 AS Decimal(18, 2)), N'Haruki Murakami', 1, 1, NULL, N'Images/1.jpg')
INSERT [dbo].[Books] ([Id], [Name], [Quantity], [Price], [Author], [CategoryId], [status], [User_ID], [Image]) VALUES (4, N'Kafka On the Shore', 7, CAST(123.00 AS Decimal(18, 2)), N'Haruki Murakami', 1, 1, NULL, N'Images/2.jpg')
INSERT [dbo].[Books] ([Id], [Name], [Quantity], [Price], [Author], [CategoryId], [status], [User_ID], [Image]) VALUES (5, N'Sherlock Holmes', 13, CAST(300.00 AS Decimal(18, 2)), N'Conan Doyle', 4, 1, NULL, N'Images/3.jpg')
INSERT [dbo].[Books] ([Id], [Name], [Quantity], [Price], [Author], [CategoryId], [status], [User_ID], [Image]) VALUES (6, N'Maze Runner', 16, CAST(140.00 AS Decimal(18, 2)), N'I Don''t Remember', 3, 1, NULL, N'Images/4.jpg')
INSERT [dbo].[Books] ([Id], [Name], [Quantity], [Price], [Author], [CategoryId], [status], [User_ID], [Image]) VALUES (7, N'Percy Jackson', 16, CAST(100.00 AS Decimal(18, 2)), N'Rick Riordan', 2, 1, NULL, N'Images/5.jpg')
INSERT [dbo].[Books] ([Id], [Name], [Quantity], [Price], [Author], [CategoryId], [status], [User_ID], [Image]) VALUES (8, N'Red Rising', 13, CAST(200.00 AS Decimal(18, 2)), N'Pierce Brown', 2, 1, NULL, N'Images/6.jpg')
INSERT [dbo].[Books] ([Id], [Name], [Quantity], [Price], [Author], [CategoryId], [status], [User_ID], [Image]) VALUES (9, N'1Q84', 6, CAST(400.00 AS Decimal(18, 2)), N'Haruki Murakami', 1, 1, NULL, N'Images/1Q84.jpg')
INSERT [dbo].[Books] ([Id], [Name], [Quantity], [Price], [Author], [CategoryId], [status], [User_ID], [Image]) VALUES (10, N'Tam ly Hoc Toi Pham', 12, CAST(78.00 AS Decimal(18, 2)), N'Some One', 4, 1, NULL, N'Images/7.jpg')
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Surreal')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Fantasy')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Scifi')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Detective')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (1, 1, 1, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (2, 1, 4, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (3, 2, 1, 1, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (4, 2, 9, 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (5, 2, 7, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (6, 3, 4, 2, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (7, 3, 5, 1, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (8, 3, 6, 1, CAST(140.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (12, 4, 1, 1, CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (13, 4, 4, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (14, 4, 9, 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (17, 7, 1, 1, CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (18, 7, 8, 2, CAST(200.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (19, 7, 9, 3, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (20, 8, 4, 1, CAST(123.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (21, 8, 1, 1, CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (22, 8, 6, 2, CAST(140.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (23, 9, 1, 3, CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [BookId], [Quantity], [Price]) VALUES (24, 9, 4, 1, CAST(123.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [Total], [Address], [Phone], [BuyDate], [Email], [CustomerName], [status], [CustomerID]) VALUES (1, 4, CAST(223.00 AS Decimal(18, 2)), N'Grimgar', N'0123121321', CAST(N'2022-03-22T17:34:23.470' AS DateTime), NULL, N'Yume', N'Completed', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Total], [Address], [Phone], [BuyDate], [Email], [CustomerName], [status], [CustomerID]) VALUES (2, 4, CAST(10900.00 AS Decimal(18, 2)), N'Hell', N'0123456789', CAST(N'2022-03-26T08:18:01.197' AS DateTime), NULL, N'Some One', N'Waiting', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Total], [Address], [Phone], [BuyDate], [Email], [CustomerName], [status], [CustomerID]) VALUES (3, 5, CAST(686.00 AS Decimal(18, 2)), N'Hell', N'12321321', CAST(N'2022-03-26T08:19:41.787' AS DateTime), NULL, N'Ai DO', N'Waiting', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Total], [Address], [Phone], [BuyDate], [Email], [CustomerName], [status], [CustomerID]) VALUES (4, 6, CAST(1043.00 AS Decimal(18, 2)), N'123 Cau Giay', N'012345678', CAST(N'2022-03-26T08:38:28.000' AS DateTime), NULL, NULL, N'Completed', NULL)
INSERT [dbo].[Orders] ([Id], [UserId], [Total], [Address], [Phone], [BuyDate], [Email], [CustomerName], [status], [CustomerID]) VALUES (6, 1, CAST(343.00 AS Decimal(18, 2)), N'1032/Nguyen Trai ', N'12312312', CAST(N'2022-11-05T20:48:16.273' AS DateTime), N'khongco@mail', N'hung', N'Pending', 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Total], [Address], [Phone], [BuyDate], [Email], [CustomerName], [status], [CustomerID]) VALUES (7, 1, CAST(1720.00 AS Decimal(18, 2)), N'1032/Nguyen Trai ', N'12312312', CAST(N'2022-11-05T20:56:28.397' AS DateTime), N'khongco@mail', N'hung', N'Pending', 1)
INSERT [dbo].[Orders] ([Id], [UserId], [Total], [Address], [Phone], [BuyDate], [Email], [CustomerName], [status], [CustomerID]) VALUES (8, 3, CAST(523.00 AS Decimal(18, 2)), N'Some where in Japan', N'10239120312', CAST(N'2022-11-06T14:44:59.660' AS DateTime), N'khongco@mail', N'hanekawa', N'Pending', 3)
INSERT [dbo].[Orders] ([Id], [UserId], [Total], [Address], [Phone], [BuyDate], [Email], [CustomerName], [status], [CustomerID]) VALUES (9, 5, CAST(483.00 AS Decimal(18, 2)), N'1200 saokdsakd', N'9123012901', CAST(N'2022-11-06T14:48:03.820' AS DateTime), N'khongco@mail', N'hitagi', N'Pending', 5)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'User')
GO
/****** Object:  Index [IX_CategoryId]    Script Date: 11/9/2022 1:45:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_CategoryId] ON [dbo].[Books]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookId]    Script Date: 11/9/2022 1:45:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookId] ON [dbo].[OrderDetails]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderId]    Script Date: 11/9/2022 1:45:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderId] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/9/2022 1:45:07 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Customer_Role]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Books_dbo.Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_dbo.Books_dbo.Categories_CategoryId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Books_BookId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
USE [master]
GO
ALTER DATABASE [BookManagement] SET  READ_WRITE 
GO
