USE [master]
GO
/****** Object:  Database [Session1]    Script Date: 27.05.2023 10:43:28 ******/
CREATE DATABASE [Session1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Session1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Session1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Session1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Session1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Session1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Session1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Session1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Session1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Session1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Session1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Session1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Session1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Session1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Session1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Session1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Session1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Session1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Session1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Session1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Session1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Session1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Session1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Session1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Session1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Session1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Session1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Session1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Session1] SET RECOVERY FULL 
GO
ALTER DATABASE [Session1] SET  MULTI_USER 
GO
ALTER DATABASE [Session1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Session1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Session1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Session1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Session1', N'ON'
GO
USE [Session1]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 27.05.2023 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (101, N'Полумаска "Moon" (Элипс) P3', 1)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (109, N'Повязка санитарно–гигиеническая многоразовая', 1)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (112, N'Повязка санитарно–гигиеническая многоразовая ч', 5)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (114, N'Маска одноразовая трехслойная из нетканого мат', 9)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (116, N'Повязка санитарно–гигиеническая многоразовая с пр', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (117, N'Маска из нетканого материала KN95', 1)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (118, N'Маска из нетканого материала с клапаном KN95', 3)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (119, N'Респиратор У-2К', 1)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (120, N'Респиратор 9101 FFP1', 1)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (121, N'Респиратор противоаэрозольный 9312', 2)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (123, N'Респиратор 3M 8112 противоаэрозольный', 2)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (124, N'Респиратор 3M 8101 противоаэрозольный', 2)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (125, N'Респиратор "Алина" 110', 3)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (126, N'Респиратор "Алина" 100', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (127, N'Респиратор "Нева" 109', 1)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (128, N'Респиратор "Юлия" 109', 3)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (129, N'Респиратор "Юлия" 119', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (130, N'Респиратор 3M с клапаном 9162', 2)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (131, N'Респиратор 3M 9152 FFP2', 10)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (132, N'Респиратор противоаэрозольный 9322', 2)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (133, N'Респиратор с клапаном 9926', 1)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (134, N'Респиратор 3M 8102 противоаэрозольный', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (135, N'Респиратор 3M 8122', 3)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (136, N'Респиратор M1200VWC FFP2 Delta Plus (Дельта Плюс)', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (137, N'Респиратор RK6021', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (138, N'Респиратор RK6020', 7)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (139, N'Респиратор Алина 210', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (140, N'Респиратор Алина 211', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (141, N'Респиратор "Алина" 200', 9)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (142, N'Респиратор "Алина" П', 1)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (143, N'Респиратор "Алина" АВ', 10)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (144, N'Респиратор "Нева" 210', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (145, N'Респиратор "Нева" 200', 10)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (146, N'Респиратор полумаска НРЗ-0102 FFP2 NR D', 9)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (147, N'Респиратор "Юлия" 219', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (148, N'Респиратор "Юлия" 215', 9)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (149, N'Респиратор "Юлия" 209', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (150, N'Респиратор M1300V2С FFP3 Delta Plus (Дельта Плюс)', 6)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (151, N'Респиратор RK6030', 2)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (152, N'Респиратор "Алина" 310', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (153, N'Респиратор "Нева" 310', 9)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (154, N'Респиратор "Юлия" 319', 5)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (155, N'Полумаска "Elipse" (Элипс) ABEK1P3', 1)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (156, N'Полумаска "Elipse" (Элипс) A2P3', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (157, N'Полумаска "Elipse" (Элипс) А1', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (158, N'Полумаска "Elipse" (Элипс) P3 (анти-запах)', 10)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (159, N'Полумаска "Elipse" (Элипс) P3', 10)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (160, N'Полумаска "Elipse" (Элипс) A1P3', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (161, N'Полумаска "Elipse" (Элипс) ABEK1', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (162, N'Респиратор-полумаска "3М" серия 6000', 7)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (163, N'Респиратор-полумаска Исток 300/400', 7)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (164, N'Комплект для защиты дыхания J-SET 6500 JETA', 10)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (165, N'Лицевая маска Elipse Integra А1P3', 9)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (166, N'Лицевая маска Elipse Integra P3', 2)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (168, N'Полнолицевая маска 5950 JETA', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (171, N'Сменный фильтр 6510 A1 JETA', 9)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (172, N'Запасные фильтры к полумаске Elipse ABEK1P3', 5)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (173, N'Запасные фильтры к полумаске Elipse A2P3', 9)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (174, N'Запасные фильтры к полумаске Elipse (Элипс) А1', 3)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (175, N'Сменный фильтр 6541 ABEK1 JETA', 5)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (177, N'Запасные фильтры к полумаске "Elipse" (Элипс) P3', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (178, N'Запасные фильтры к полумаске "Elipse" (Элипс) A1P3', 3)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (183, N'Держатель предфильтра 5101 JETA', 1)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (185, N'Предфильтр Р2 (4 шт) 6020 JETA', 3)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (186, N'Предфильтры для масок и полумасок "3М" серии 6000', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (187, N'Респиратор "Мадонна" 110', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (188, N'Респиратор "Витязь" 100', 7)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (189, N'Респиратор "Серёга" 109', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (190, N'Респиратор "Амперметр" 109', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (191, N'Респиратор "Фирюза" 110', 9)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (192, N'Респиратор "Красный" 100', 1)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (193, N'Респиратор "Волга" 109', 10)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (194, N'Респиратор "Мадонна" 220', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (195, N'Респиратор "Витязь" 220', 10)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (196, N'Респиратор "Серёга" 220', 9)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (197, N'Респиратор "Амперметр" 220', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (198, N'Респиратор "Фирюза" 220', 9)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (199, N'Респиратор "Красный" 220', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (200, N'Респиратор "Волга" 220', 6)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (201, N'Полумаска "Sunset" ABEK1P3', 2)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (202, N'Полумаска "Sunset" A2P3', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (203, N'Полумаска "Sunset" А1', 9)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (204, N'Полумаска "Sunset" P3 (анти-запах)', 5)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (205, N'Полумаска "Sunset" (Элипс) P3', 1)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (206, N'Полумаска "Sunset" A1P3', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (207, N'Полумаска "Sunset" ABEK1', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (208, N'Полумаска "Moon" ABEK1', 10)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (209, N'Полумаска "Moon" ABEK1P3', 10)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (210, N'Полумаска "Moon" A2P3', 8)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (211, N'Полумаска "Moon" А1', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (212, N'Полумаска "Moon" P3 (анти-запах)', 7)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (609, N'Полумаска "Moon" (Элипс) P3', 203, N'59922', N'203', N'\products\5fb128cd1e2b9.jpg', 5, 4, CAST(2690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (610, N'Повязка санитарно–гигиеническая многоразовая с логотипом СОЮЗСПЕЦОДЕЖДА', 204, N'5028556', N'204', N'не указано', 5, 9, CAST(49.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (611, N'Повязка санитарно–гигиеническая многоразовая черная', 205, N'5028272', N'205', N'отсутствует', 4, 4, CAST(59.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (612, N'Маска одноразовая трехслойная из нетканого материала  нестерильная', 206, N'5028247', N'206', N' \products\5fb128cc69235.jpg', 3, 2, CAST(50282476.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (613, N'Повязка санитарно–гигиеническая многоразовая с принтом', 207, N'5028229', N'207', N'отсутствует', 2, 10, CAST(49.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (614, N'Маска из нетканого материала KN95', 208, N'5030981', N'208', N'\products\5fb128cc719a6.jpg', 3, 5, CAST(59.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (615, N'Маска из нетканого материала с клапаном KN95', 209, N'5029784', N'209', N'\products\5fb128cc753e3.jpg', 3, 4, CAST(79.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (616, N'Респиратор У-2К', 208, N'58953', N'208', N'\products\5fb128cc7941f.jpg', 2, 6, CAST(95.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (617, N'Респиратор 9101 FFP1', 212, N'5026662', N'212', N'\products\5fb128cc7d798.jpg', 5, 8, CAST(189.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (618, N'Респиратор противоаэрозольный 9312', 212, N'59043', N'212', N'\products\5fb128cc80a10.jpg', 4, 7, CAST(399.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (619, N'Респиратор 3M 8112 противоаэрозольный с клапаном выдоха', 212, N'58376', N'212', N'\products\5fb128cc84474.jpg', 3, 1, CAST(299.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (620, N'Респиратор 3M 8101 противоаэрозольный', 212, N'58375', N'212', N'\products\5fb128cc87b90.jpg', 1, 4, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (621, N'Респиратор "Алина" 110', 212, N'59324', N'212', N'\products\5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (622, N'Респиратор "Алина" 100', 212, N'58827', N'212', N'\products\5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (623, N'Респиратор "Нева" 109', 212, N'59898', N'212', N'\products\5fb128cc9414b.jpg', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (624, N'Респиратор "Юлия" 109', 212, N'59474', N'212', N'\products\5fb128cc97ff4.jpg', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (625, N'Респиратор "Юлия" 119', 212, N'59472', N'212', N'\products\5fb128cc9bd36.jpg', 3, 7, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (626, N'Респиратор 3M с клапаном 9162', 212, N'5033136', N'212', N'\products\5fb128cc9f069.jpg', 2, 9, CAST(349.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (627, N'Респиратор 3M 9152 FFP2', 212, N'5028048', N'212', N'\products\5fb128cca31d9.jpg', 2, 8, CAST(390.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (628, N'Респиратор противоаэрозольный 9322', 212, N'58796', N'212', N'\products\5fb128cca6910.jpg', 4, 4, CAST(449.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (629, N'Респиратор с клапаном 9926', 212, N'58568', N'212', N'\products\5fb128cca9d9b.jpg', 3, 5, CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (630, N'Респиратор 3M 8102 противоаэрозольный', 212, N'58466', N'212', N'\products\5fb128ccae21a.jpg', 3, 9, CAST(199.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (631, N'Респиратор 3M 8122', 212, N'58445', N'212', N'\products\5fb128ccb1958.jpg', 3, 6, CAST(299.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (632, N'Респиратор M1200VWC FFP2 Delta Plus (Дельта Плюс)', 212, N'5031919', N'212', N'\products\5fb128ccb4e8c.jpg', 2, 8, CAST(349.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (633, N'Респиратор RK6021', 212, N'5030026', N'212', N'\products\5fb128ccb97a0.jpg', 5, 8, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (634, N'Респиратор RK6020', 212, N'5030020', N'212', N'\products\5fb128ccbd227.jpg', 3, 5, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (635, N'Респиратор Алина 210', 212, N'5030072', N'212', N'\products\5fb128ccc1592.jpg', 1, 5, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (636, N'Респиратор Алина 211', 212, N'5030062', N'212', N'\products\5fb128ccc4a86.jpg', 1, 6, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (637, N'Респиратор "Алина" 200', 212, N'58826', N'212', N'\products\5fb128ccc9a9e.jpg', 4, 5, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (638, N'Респиратор "Алина" П', 212, N'58825', N'212', N'\products\5fb128cccdbee.jpg', 4, 5, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (639, N'Респиратор "Алина" АВ', 212, N'58584', N'212', N'\products\5fb128ccd133c.jpg', 2, 5, CAST(249.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (640, N'Респиратор "Нева" 210', 212, N'59736', N'212', N'\products\5fb128ccd5dc2.jpg', 1, 3, CAST(109.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (641, N'Респиратор "Нева" 200', 212, N'59735', N'212', N'\products\5fb128ccd8ff6.jpg', 2, 3, CAST(79.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (642, N'Респиратор полумаска НРЗ-0102 FFP2 NR D', 212, N'5027238', N'212', N'\products\5fb128ccdca1e.jpg', 4, 4, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (643, N'Респиратор "Юлия" 219', 212, N'59475', N'212', N'\products\5fb128cce0042.jpg', 4, 8, CAST(249.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (644, N'Респиратор "Юлия" 215', 212, N'59473', N'212', N'\products\5fb128cce39fa.jpg', 3, 4, CAST(349.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (645, N'Респиратор "Юлия" 209', 212, N'59470', N'212', N'\products\5fb128cce7971.jpg', 2, 8, CAST(179.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (646, N'Респиратор M1300V2С FFP3 Delta Plus (Дельта Плюс)', 212, N'5031924', N'212', N'\products\5fb128cceae7c.jpg', 5, 2, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (647, N'Респиратор RK6030', 212, N'5030022', N'212', N'\products\5fb128ccef256.jpg', 3, 6, CAST(390.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (648, N'Респиратор "Алина" 310', 212, N'58850', N'212', N'\products\5fb128ccf3dd2.jpg', 5, 6, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (649, N'Респиратор "Нева" 310', 212, N'59739', N'212', N'\products\5fb128cd0544b.jpg', 4, 3, CAST(289.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (650, N'Респиратор "Юлия" 319', 212, N'59471', N'212', N'\products\5fb128cd08e3f.jpg', 4, 8, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (651, N'Полумаска "Elipse" (Элипс) ABEK1P3', 212, N'5027980', N'212', N'\products\5fb128cd0d0b1.jpg', 2, 1, CAST(4990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (652, N'Полумаска "Elipse" (Элипс) A2P3', 203, N'5027965', N'203', N'\products\5fb128cd10ec2.jpg', 4, 2, CAST(4490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (653, N'Полумаска "Elipse" (Элипс) А1', 203, N'5027958', N'203', N'\products\5fb128cd157f9.jpg', 2, 4, CAST(3190.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (654, N'Полумаска "Elipse" (Элипс) P3 (анти-запах)', 203, N'59923', N'203', N'\products\5fb128cd19baa.jpg', 1, 9, CAST(2790.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (655, N'Полумаска "Elipse" (Элипс) P3', 203, N'59922', N'203', N'\products\5fb128cd1e2b9.jpg', 5, 4, CAST(2690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (656, N'Полумаска "Elipse" (Элипс) A1P3', 203, N'59921', N'203', N'\products\5fb128cd2215f.jpg', 3, 9, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (657, N'Полумаска "Elipse" (Элипс) ABEK1', 203, N'59920', N'203', N'\products\5fb128cd268bf.jpg', 2, 8, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (658, N'Респиратор-полумаска "3М" серия 6000', 203, N'58974', N'203', N'\products\5fb128cd2ab69.jpg', 5, 9, CAST(3490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (659, N'Респиратор-полумаска Исток 300/400', 203, N'59334', N'203', N'\products\5fb128cd2ef7a.jpg', 4, 7, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (660, N'Комплект для защиты дыхания J-SET 6500 JETA', 203, N'4969295', N'203', N'\products\5fb128cd331c4.jpg', 4, 4, CAST(2490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (661, N'Лицевая маска Elipse Integra А1P3', 203, N'5029610', N'203', N'\products\5fb128cd3674d.jpg', 2, 10, CAST(9890.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (662, N'Лицевая маска Elipse Integra P3', 256, N'5029091', N'256', N'\products\5fb128cd3af5c.jpg', 5, 9, CAST(7490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (663, N'Лицевая маска Elipse Integra (Элипс интегра) P3 (анти-запах)', 256, N'60360', N'256', N'\products\5fb128cd3e7e4.jpg', 2, 4, CAST(7590.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (664, N'Полнолицевая маска 5950 JETA', 256, N'4958042', N'256', N'\products\5fb128cd41ece.jpg', 1, 5, CAST(11490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (665, N'Сменный патрон с фильтром 6054 для масок и полумасок "3М" серии 6000', 259, N'59271', N'259', N'\products\5fb128cd4672c.jpg', 4, 2, CAST(1890.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (666, N'Сменный патрон с фильтром 6059 для масок и полумасок "3М" серии 6000', 260, N'59253', N'260', N'\products\5fb128cd4c99d.jpg', 2, 9, CAST(2290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (667, N'Сменный фильтр 6510 A1 JETA', 260, N'5028197', N'260', N'\products\5fb128cd50a70.jpg', 5, 9, CAST(990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (668, N'Запасные фильтры к полумаске Elipse ABEK1P3', 260, N'5027978', N'260', N'\products\5fb128cd5433e.jpg', 3, 6, CAST(2990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (669, N'Запасные фильтры к полумаске Elipse A2P3', 263, N'5027961', N'263', N'\products\5fb128cd5838d.jpg', 2, 9, CAST(2590.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (670, N'Запасные фильтры к полумаске Elipse (Элипс) А1', 263, N'5027921', N'263', N'\products\5fb128cd5bb7d.jpg', 3, 4, CAST(1290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (671, N'Сменный фильтр 6541 ABEK1 JETA', 260, N'4958040', N'260', N'\products\5fb128cd5ff78.jpg', 4, 6, CAST(1290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (672, N'Запасные фильтры к полумаске "Elipse" (Элипс) P3 (анти-запах)', 263, N'59919', N'263', N'\products\5fb128cd63666.jpg', 4, 4, CAST(1690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (673, N'Запасные фильтры к полумаске "Elipse" (Элипс) P3', 263, N'59918', N'263', N'\products\5fb128cd66df6.jpg', 4, 7, CAST(1390.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (674, N'Запасные фильтры к полумаске "Elipse" (Элипс) A1P3', 263, N'59917', N'263', N'\products\5fb128cd6a2b6.jpg', 1, 3, CAST(2190.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (675, N'Запасные фильтры к полумаске "Elipse" (Элипс) ABEK1', 263, N'59916', N'263', N'\products\5fb128cd6e4ee.jpg', 3, 10, CAST(2590.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (676, N'Запасные фильтры (пара) АВЕ1 к полумаскам "Адвантейдж"', 263, N'59708', N'263', N'\products\5fb128cd71db3.jpg', 2, 3, CAST(1490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (677, N'Запасной фильтр к полумаске Исток-300 (РПГ-67) марка В', 263, N'67661', N'263', N'\products\5fb128cd7518c.jpg', 5, 9, CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (678, N'Запасной фильтр к полумаске Исток-300 (РПГ-67) марка А', 263, N'67660', N'263', N'\products\5fb128cd78fce.jpg', 3, 1, CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (679, N'Держатель предфильтра 5101 JETA', 263, N'4958041', N'263', N'\products\5fb128cd7d2cd.jpg', 1, 7, CAST(199.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (680, N'Держатели предфильтра для масок и полумасок "3М" серии 6000', 274, N'58431', N'274', N'\products\5fb128cd80a06.jpg', 1, 4, CAST(264.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (681, N'Предфильтр Р2 (4 шт) 6020 JETA', 274, N'4958039', N'274', N'\products\5fb128cd8417e.jpg', 1, 7, CAST(380.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (682, N'Предфильтр для масок и полумасок "3М" серии 6000', 276, N'58917', N'276', N'\products\5fb128cd8818d.jpg', 5, 3, CAST(409.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (683, N'Респиратор "Мадонна" 110', 212, N'59324', N'212', N'\products\5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (684, N'Респиратор "Витязь" 100', 212, N'58827', N'212', N'\products\5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (685, N'Респиратор "Серёга" 109', 212, N'59898', N'212', N'\products\5fb128cc9414b.jpg', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (686, N'Респиратор "Амперметр" 109', 212, N'59474', N'212', N'\products\5fb128cc97ff4.jpg', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (687, N'Респиратор "Фирюза" 110', 212, N'59324', N'212', N'\products\5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (688, N'Респиратор "Красный" 100', 212, N'58827', N'212', N'\products\5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (689, N'Респиратор "Волга" 109', 212, N'59898', N'212', N'\products\5fb128cc9414b.jpg', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (690, N'Респиратор "Мадонна" 220', 212, N'59474', N'212', N'\products\5fb128cc97ff4.jpg', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (691, N'Респиратор "Витязь" 220', 212, N'59324', N'212', N'\products\5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (692, N'Респиратор "Серёга" 220', 212, N'58827', N'212', N'\products\5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (693, N'Респиратор "Амперметр" 220', 212, N'59898', N'212', N'\products\5fb128cc9414b.jpg', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (694, N'Респиратор "Фирюза" 220', 212, N'59474', N'212', N'\products\5fb128cc97ff4.jpg', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (695, N'Респиратор "Красный" 220', 212, N'59324', N'212', N'\products\5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (696, N'Респиратор "Волга" 220', 212, N'58827', N'212', N'\products\5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (697, N'Полумаска "Sunset" ABEK1P3', 212, N'5027980', N'212', N'\products\5fb128cd0d0b1.jpg', 2, 1, CAST(4990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (698, N'Полумаска "Sunset" A2P3', 203, N'5027965', N'203', N'\products\5fb128cd10ec2.jpg', 4, 2, CAST(4490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (699, N'Полумаска "Sunset" А1', 203, N'5027958', N'203', N'\products\5fb128cd157f9.jpg', 2, 4, CAST(3190.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (700, N'Полумаска "Sunset" P3 (анти-запах)', 203, N'59923', N'203', N'\products\5fb128cd19baa.jpg', 1, 9, CAST(2790.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (701, N'Полумаска "Sunset" (Элипс) P3', 203, N'59922', N'203', N'\products\5fb128cd1e2b9.jpg', 5, 4, CAST(2690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (702, N'Полумаска "Sunset" A1P3', 203, N'59921', N'203', N'\products\5fb128cd2215f.jpg', 3, 9, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (703, N'Полумаска "Sunset" ABEK1', 203, N'59920', N'203', N'\products\5fb128cd268bf.jpg', 2, 8, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (704, N'Полумаска "Moon" ABEK1', 203, N'59920', N'203', N'\products\5fb128cd268bf.jpg', 2, 8, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (705, N'Полумаска "Moon" ABEK1P3', 212, N'5027980', N'212', N'\products\5fb128cd0d0b1.jpg', 2, 1, CAST(4990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (706, N'Полумаска "Moon" A2P3', 203, N'5027965', N'203', N'\products\5fb128cd10ec2.jpg', 4, 2, CAST(4490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (707, N'Полумаска "Moon" А1', 203, N'5027958', N'203', N'\products\5fb128cd157f9.jpg', 2, 4, CAST(3190.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (708, N'Полумаска "Moon" P3 (анти-запах)', 203, N'59923', N'203', N'\products\5fb128cd19baa.jpg', 1, 9, CAST(2790.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (203, N'Полумаски', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (204, N'Повязки', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (205, N'Повязки', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (206, N'Повязки', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (207, N'Повязки', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (208, N'Маски', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (209, N'Маски', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (210, N'Маски', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (211, N'Респираторы', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (212, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (213, N'Респираторы', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (214, N'Респираторы', 1)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (215, N'Респираторы', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (216, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (217, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (218, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (219, N'Респираторы', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (220, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (221, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (222, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (223, N'Респираторы', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (224, N'Респираторы', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (225, N'Респираторы', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (226, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (227, N'Респираторы', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (228, N'Респираторы', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (229, N'Респираторы', 1)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (230, N'Респираторы', 1)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (231, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (232, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (233, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (234, N'Респираторы', 1)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (235, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (236, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (237, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (238, N'Респираторы', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (239, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (240, N'Респираторы', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (241, N'Респираторы', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (242, N'Респираторы', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (243, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (244, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (245, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (246, N'Полумаски', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (247, N'Полумаски', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (248, N'Полумаски', 1)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (249, N'Полумаски', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (250, N'Полумаски', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (251, N'Полумаски', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (252, N'Полумаски', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (253, N'Полумаски', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (254, N'Полумаски', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (255, N'Полумаски', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (256, N'На лицо', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (257, N'На лицо', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (258, N'На лицо', 1)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (259, N'Полнолицевые', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (260, N'Сменные части', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (261, N'Сменные части', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (262, N'Сменные части', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (263, N'Запасные части', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (264, N'Запасные части', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (265, N'Сменные части', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (266, N'Запасные части', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (267, N'Запасные части', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (268, N'Запасные части', 1)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (269, N'Запасные части', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (270, N'Запасные части', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (271, N'Запасные части', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (272, N'Запасные части', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (273, N'Запасные части', 1)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (274, N'Держители', 1)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (275, N'Держители', 1)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (276, N'Предфильтры', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (277, N'Респираторы', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (278, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (279, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (280, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (281, N'Респираторы', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (282, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (283, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (284, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (285, N'Респираторы', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (286, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (287, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (288, N'Респираторы', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (289, N'Респираторы', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (290, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (291, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (292, N'Полумаски', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (293, N'Полумаски', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (294, N'Полумаски', 1)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (295, N'Полумаски', 5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (296, N'Полумаски', 3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (297, N'Полумаски', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (298, N'Полумаски', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (299, N'Респираторы', 2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (300, N'Полумаски', 4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (301, N'Полумаски', 2)
GO
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (302, N'Полумаски', 1)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
USE [master]
GO
ALTER DATABASE [Session1] SET  READ_WRITE 
GO
