USE [master]
GO
/****** Object:  Database [DemoEkzAbramov420]    Script Date: 26.02.2024 16:25:02 ******/
CREATE DATABASE [DemoEkzAbramov420]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoEkzAbramov420', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DemoEkzAbramov420.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoEkzAbramov420_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DemoEkzAbramov420_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DemoEkzAbramov420] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoEkzAbramov420].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoEkzAbramov420] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoEkzAbramov420] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoEkzAbramov420] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoEkzAbramov420] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoEkzAbramov420] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DemoEkzAbramov420] SET  MULTI_USER 
GO
ALTER DATABASE [DemoEkzAbramov420] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoEkzAbramov420] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoEkzAbramov420] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoEkzAbramov420] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoEkzAbramov420] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemoEkzAbramov420] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DemoEkzAbramov420] SET QUERY_STORE = OFF
GO
USE [DemoEkzAbramov420]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 26.02.2024 16:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[idMaterial] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[idMaterialType] [int] NOT NULL,
	[CountInPackage] [int] NOT NULL,
	[idUnit] [int] NOT NULL,
	[CountInStorage] [int] NOT NULL,
	[MinCount] [int] NOT NULL,
	[Cost] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[idMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 26.02.2024 16:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[idMaterialType] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[idMaterialType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 26.02.2024 16:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[idProduct] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Article] [varchar](50) NOT NULL,
	[MinCost] [int] NOT NULL,
	[Image] [varchar](150) NULL,
	[CountOfWorkers] [int] NOT NULL,
	[idWorkshop] [int] NOT NULL,
	[idProductType] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[idProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Material]    Script Date: 26.02.2024 16:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Material](
	[idProduct_Material] [int] IDENTITY(1,1) NOT NULL,
	[idProduct] [int] NOT NULL,
	[idMaterial] [int] NOT NULL,
	[CountOfMaterial] [int] NOT NULL,
 CONSTRAINT [PK_Product_Material] PRIMARY KEY CLUSTERED 
(
	[idProduct_Material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 26.02.2024 16:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[idProductType] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[idProductType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 26.02.2024 16:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[idUnit] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[idUnit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workshop]    Script Date: 26.02.2024 16:25:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workshop](
	[idWorkshop] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Workshop] PRIMARY KEY CLUSTERED 
(
	[idWorkshop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (1, N'Спрессованный материал серый 0x2', 1, 5, 1, 140, 49, 33128)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (2, N'Рулон бумаги зеленый 1x1', 2, 3, 1, 634, 36, 26841)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (3, N'Спрессованный материал розовый 2x1', 1, 8, 1, 636, 21, 52606)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (4, N'Гранулы для бумаги розовый 2x2', 4, 10, 3, 661, 16, 10608)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (5, N'Спрессованный материал белый 1x1', 1, 7, 2, 843, 16, 43440)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (6, N'Рулон бумаги белый 1x0', 2, 1, 1, 501, 49, 15833)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (7, N'Переработка бумаги синий 0x3', 3, 9, 1, 958, 32, 14180)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (8, N'Рулон бумаги цветной 2x0', 2, 3, 1, 386, 46, 35544)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (9, N'Рулон бумаги зеленый 2x2', 2, 8, 2, 593, 20, 55016)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (10, N'Рулон бумаги белый 3x2', 2, 4, 2, 16, 31, 53759)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (11, N'Переработка бумаги серый 3x3', 3, 10, 1, 89, 20, 49391)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (12, N'Гранулы для бумаги синий 1x2', 4, 6, 3, 112, 34, 25624)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (13, N'Рулон бумаги серый 3x3', 2, 3, 1, 596, 8, 50247)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (14, N'Спрессованный материал цветной 1x3', 1, 3, 1, 772, 40, 51672)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (15, N'Рулон бумаги синий 2x2', 2, 6, 2, 363, 47, 38450)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (16, N'Гранулы для бумаги розовый 0x3', 4, 4, 3, 379, 41, 3868)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (17, N'Переработка бумаги цветной 1x3', 3, 6, 2, 32, 34, 37930)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (18, N'Гранулы для бумаги цветной 0x1', 4, 5, 3, 759, 28, 9216)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (19, N'Рулон бумаги цветной 1x2', 2, 10, 1, 246, 37, 5016)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (20, N'Переработка бумаги серый 1x2', 3, 8, 1, 516, 49, 35981)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (21, N'Спрессованный материал синий 0x2', 1, 3, 2, 514, 40, 6555)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (22, N'Переработка бумаги синий 1x2', 3, 4, 1, 81, 32, 47873)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (23, N'Спрессованный материал цветной 1x2', 1, 1, 1, 429, 47, 15802)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (24, N'Рулон бумаги розовый 2x1', 2, 1, 1, 349, 9, 36163)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (25, N'Рулон бумаги белый 3x3', 2, 2, 2, 201, 46, 51261)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (26, N'Рулон бумаги цветной 2x2', 2, 10, 2, 534, 46, 50776)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (27, N'Спрессованный материал розовый 2x3', 1, 3, 1, 552, 7, 4657)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (28, N'Рулон бумаги розовый 3x2', 2, 9, 1, 144, 41, 51776)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (29, N'Переработка бумаги синий 0x1', 3, 7, 1, 97, 30, 47937)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (30, N'Спрессованный материал розовый 1x2', 1, 7, 1, 509, 26, 10604)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (31, N'Рулон бумаги цветной 1x3', 2, 10, 2, 149, 13, 22724)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (32, N'Рулон бумаги синий 3x2', 2, 9, 1, 508, 16, 25561)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (33, N'Рулон бумаги зеленый 2x3', 2, 2, 1, 181, 35, 45388)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (34, N'Гранулы для бумаги розовый 0x2', 4, 7, 2, 37, 50, 17227)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (35, N'Переработка бумаги цветной 0x0', 3, 9, 1, 508, 19, 51147)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (36, N'Переработка бумаги серый 0x2', 3, 3, 1, 167, 17, 10248)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (37, N'Гранулы для бумаги цветной 0x3', 4, 10, 2, 962, 33, 35922)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (38, N'Рулон бумаги зеленый 3x3', 2, 3, 1, 861, 45, 37283)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (39, N'Рулон бумаги белый 0x3', 2, 2, 1, 933, 50, 7253)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (40, N'Рулон бумаги синий 3x1', 2, 3, 1, 720, 11, 44675)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (41, N'Спрессованный материал белый 3x3', 1, 8, 1, 942, 12, 17600)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (42, N'Рулон бумаги белый 1x3', 2, 2, 2, 382, 10, 32770)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (43, N'Переработка бумаги белый 3x0', 3, 10, 1, 247, 11, 39500)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (44, N'Гранулы для бумаги синий 1x3', 4, 10, 3, 841, 18, 38700)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (45, N'Спрессованный материал синий 3x1', 1, 10, 1, 270, 50, 38809)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (46, N'Спрессованный материал цветной 0x0', 1, 6, 1, 754, 24, 4611)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (47, N'Переработка бумаги цветной 0x1', 3, 8, 1, 833, 34, 53875)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (48, N'Спрессованный материал цветной 1x0', 1, 8, 1, 856, 26, 12817)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (49, N'Переработка бумаги синий 0x2', 3, 9, 2, 709, 47, 23157)
INSERT [dbo].[Material] ([idMaterial], [Title], [idMaterialType], [CountInPackage], [idUnit], [CountInStorage], [MinCount], [Cost]) VALUES (50, N'Переработка бумаги белый 2x0', 3, 5, 1, 794, 17, 21637)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([idMaterialType], [Title]) VALUES (1, N'Пресс')
INSERT [dbo].[MaterialType] ([idMaterialType], [Title]) VALUES (2, N'Рулон')
INSERT [dbo].[MaterialType] ([idMaterialType], [Title]) VALUES (3, N'Нарезка')
INSERT [dbo].[MaterialType] ([idMaterialType], [Title]) VALUES (4, N'Гранулы')
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (1, N'Полотенце 28М Клубника', N'334385', 9208, N'\products\paper_20.jpg', 2, 6, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (2, N'Набор 24М Дыня', N'337632', 11471, N'нет', 5, 5, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (3, N'Набор 9М Бриз', N'259548', 2317, N'нет', 4, 5, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (4, N'Набор 50М Клубника', N'278721', 14220, N'нет', 3, 1, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (5, N'Полотенце 24М Дыня', N'264493', 10479, N'отсутствует', 5, 10, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (6, N'Бумага 21М Дыня', N'366160', 11064, N'\products\paper_2.jpg', 1, 2, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (7, N'Полотенце 37М Клубника', N'292358', 3961, N'отсутствует', 4, 2, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (8, N'Набор 6М Бриз', N'289779', 14154, N'нет', 1, 6, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (9, N'Бумага 37М Клубника', N'442634', 12664, N'\products\paper_14.jpg', 5, 4, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (10, N'Набор 41М Дыня', N'385037', 3295, N'\products\paper_21.jpg', 5, 9, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (11, N'Бумага 26М Ваниль', N'444337', 3007, N'отсутствует', 4, 4, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (12, N'Бумага 50М Ваниль', N'454479', 3163, N'отсутствует', 3, 9, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (13, N'Набор 25М Бриз', N'434113', 13047, N'не указано', 4, 4, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (14, N'Бумага 32М Бриз', N'379800', 6832, N'отсутствует', 1, 7, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (15, N'Полотенце 41М Дыня', N'239349', 6238, N'отсутствует', 2, 9, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (16, N'Бумага 9М Ваниль', N'446348', 13568, N'нет', 3, 1, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (17, N'Бумага 3М Бриз', N'260492', 8278, N'не указано', 1, 9, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (18, N'Бумага 5М Дыня', N'256862', 3712, N'\products\paper_5.jpg', 5, 5, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (19, N'Полотенце 16М Ваниль', N'259488', 10095, N'не указано', 3, 6, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (20, N'Бумага 44М Бриз', N'422185', 6441, N'не указано', 2, 5, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (21, N'Набор 19М Дыня', N'382063', 2373, N'отсутствует', 1, 7, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (22, N'Бумага 29М Клубника', N'334943', 5997, N'не указано', 1, 10, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (23, N'Полотенце 27М Дыня', N'238686', 7864, N'не указано', 2, 2, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (24, N'Набор 11М Дыня', N'450659', 5956, N'\products\paper_16.jpg', 3, 7, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (25, N'Полотенце 48М Клубника', N'292206', 9801, N'отсутствует', 3, 3, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (26, N'Полотенце 16М Бриз', N'418298', 7342, N'отсутствует', 2, 1, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (27, N'Полотенце 14М Клубника', N'309862', 10682, N'\products\paper_17.jpg', 4, 8, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (28, N'Полотенце 43М Клубника', N'425641', 14151, N'отсутствует', 2, 6, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (29, N'Набор 19М Бриз', N'277950', 9962, N'отсутствует', 5, 9, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (30, N'Набор 32М Клубника', N'351062', 4450, N'нет', 3, 8, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (31, N'Набор 26М Дыня', N'279801', 4628, N'нет', 2, 1, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (32, N'Бумага 15М Клубника', N'449359', 10009, N'отсутствует', 3, 7, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (33, N'Полотенце 45М Бриз', N'303994', 13081, N'\products\paper_6.jpg', 2, 1, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (34, N'Набор 50М Бриз', N'414595', 10750, N'\products\paper_8.jpg', 4, 6, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (35, N'Набор 16М Дыня', N'376834', 11927, N'отсутствует', 4, 6, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (36, N'Бумага 45М Бриз', N'374276', 13605, N'не указано', 3, 9, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (37, N'Бумага 45М Клубника', N'400484', 3475, N'нет', 3, 4, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (38, N'Бумага 16М Дыня', N'262257', 9107, N'нет', 5, 2, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (39, N'Набор 40М Дыня', N'346154', 3427, N'не указано', 4, 8, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (40, N'Бумага 33М Бриз', N'347239', 13767, N'отсутствует', 5, 9, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (41, N'Полотенце 45М Клубника', N'352034', 11939, N'отсутствует', 2, 5, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (42, N'Набор 43М Клубника', N'443538', 13786, N'отсутствует', 1, 10, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (43, N'Набор 34М Ваниль', N'316033', 13533, N'нет', 1, 4, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (44, N'Бумага 32М Дыня', N'268393', 7424, N'отсутствует', 4, 3, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (45, N'Бумага 12М Бриз', N'426804', 10703, N'отсутствует', 1, 4, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (46, N'Полотенце 6М Ваниль', N'324941', 5594, N'не указано', 1, 2, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (47, N'Полотенце 47М Клубника', N'378723', 3871, N'нет', 4, 2, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (48, N'Полотенце 15М Бриз', N'365615', 13013, N'нет', 1, 6, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (49, N'Набор 9М Дыня', N'440942', 2580, N'нет', 3, 4, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (50, N'Набор 17М Клубника', N'441239', 14863, N'не указано', 2, 10, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (51, N'Набор 5М Бриз', N'278382', 7325, N'нет', 3, 9, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (52, N'Набор 29М Ваниль', N'344868', 7618, N'\products\paper_4.jpg', 1, 9, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (53, N'Набор 31М Дыня', N'449401', 5236, N'отсутствует', 5, 10, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (54, N'Набор 45М Бриз', N'349802', 12040, N'отсутствует', 1, 8, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (55, N'Бумага 13М Дыня', N'348651', 3477, N'нет', 3, 8, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (56, N'Набор 24М Клубника', N'296007', 14162, N'отсутствует', 2, 3, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (57, N'Набор 10М Дыня', N'431234', 3816, N'\products\paper_22.jpg', 4, 9, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (58, N'Бумага 12М Клубника', N'456129', 6467, N'\products\paper_1.jpg', 3, 4, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (59, N'Полотенце 11М Дыня', N'400418', 11660, N'\products\paper_25.jpg', 2, 7, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (60, N'Набор 42М Дыня', N'390914', 14344, N'\products\paper_13.jpg', 5, 10, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (61, N'Бумага 5М Бриз', N'345239', 9243, N'отсутствует', 1, 8, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (62, N'Набор 14М Дыня', N'373939', 3382, N'нет', 2, 3, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (63, N'Бумага 33М Клубника', N'252485', 4240, N'\products\paper_0.jpg', 3, 6, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (64, N'Набор 34М Клубника', N'381110', 2372, N'не указано', 3, 1, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (65, N'Полотенце 14М Дыня', N'331688', 10330, N'нет', 2, 8, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (66, N'Бумага 40М Бриз', N'326200', 12927, N'\products\paper_19.jpg', 5, 1, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (67, N'Бумага 20М Клубника', N'253218', 11684, N'отсутствует', 2, 6, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (68, N'Бумага 50М Бриз', N'340583', 6788, N'\products\paper_15.jpg', 4, 7, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (69, N'Полотенце 23М Ваниль', N'437519', 3317, N'отсутствует', 1, 10, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (70, N'Набор 8М Дыня', N'240580', 7465, N'отсутствует', 5, 2, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (71, N'Бумага 10М Клубника', N'275591', 13600, N'\products\paper_7.jpg', 4, 8, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (72, N'Набор 41М Клубника', N'281425', 9908, N'\products\paper_23.jpg', 4, 6, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (73, N'Набор 10М Ваниль', N'261465', 13028, N'\products\paper_12.jpg', 5, 3, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (74, N'Полотенце 17М Бриз', N'309067', 13825, N'\products\paper_24.jpg', 1, 6, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (75, N'Полотенце 27М Ваниль', N'278463', 3978, N'\products\paper_10.jpg', 3, 5, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (76, N'Полотенце 50М Ваниль', N'310212', 13204, N'\products\paper_11.jpg', 1, 10, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (77, N'Набор 20М Бриз', N'377042', 9227, N'\products\paper_9.jpg', 5, 9, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (78, N'Полотенце 47М Дыня', N'294441', 11460, N'не указано', 4, 5, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (79, N'Бумага 29М Дыня', N'332522', 5439, N'\products\paper_18.jpg', 3, 6, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (80, N'Полотенце 44М Ваниль', N'357053', 3396, N'нет', 5, 1, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (81, N'Полотенце 7М Ваниль', N'397143', 2868, N'не указано', 2, 9, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (82, N'Бумага 49М Бриз', N'414339', 10786, N'отсутствует', 1, 6, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (83, N'Полотенце 7М Бриз', N'350515', 4986, N'отсутствует', 2, 2, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (84, N'Полотенце 25М Бриз', N'258695', 3631, N'не указано', 1, 8, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (85, N'Полотенце 17М Ваниль', N'403054', 5048, N'нет', 2, 9, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (86, N'Бумага 14М Бриз', N'310507', 7846, N'отсутствует', 1, 3, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (87, N'Набор 40М Бриз', N'353930', 12767, N'не указано', 2, 8, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (88, N'Набор 22М Клубника', N'360424', 13524, N'отсутствует', 4, 3, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (89, N'Бумага 13М Бриз', N'349861', 3842, N'не указано', 4, 6, 2)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (90, N'Бумага 7М Ваниль', N'290729', 6934, N'не указано', 4, 4, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (91, N'Набор 24М Ваниль', N'374263', 3907, N'отсутствует', 5, 9, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (92, N'Набор 43М Дыня', N'330360', 5867, N'нет', 5, 4, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (93, N'Полотенце 33М Бриз', N'297840', 4611, N'отсутствует', 4, 1, 4)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (94, N'Набор 12М Бриз', N'349614', 2551, N'\products\paper_3.jpg', 1, 7, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (95, N'Бумага 38М Ваниль', N'416066', 12175, N'нет', 2, 2, 1)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (96, N'Бумага 20М Бриз', N'285792', 14370, N'отсутствует', 3, 7, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (97, N'Бумага 28М Дыня', N'298632', 14671, N'не указано', 4, 4, 3)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (98, N'Бумага 10М Дыня', N'446103', 13975, N'нет', 1, 3, 5)
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (99, N'Набор 22М Бриз', N'443382', 4501, N'отсутствует', 3, 5, 3)
GO
INSERT [dbo].[Product] ([idProduct], [Title], [Article], [MinCost], [Image], [CountOfWorkers], [idWorkshop], [idProductType]) VALUES (100, N'Набор 18М Ваниль', N'331270', 11171, N'отсутствует', 4, 8, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Material] ON 

INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (1, 63, 24, 20)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (2, 71, 6, 1)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (3, 37, 6, 4)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (4, 58, 24, 18)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (5, 94, 6, 3)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (6, 1, 24, 9)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (7, 2, 23, 15)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (8, 63, 25, 3)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (9, 11, 39, 12)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (10, 19, 25, 20)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (11, 94, 42, 4)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (12, 47, 33, 4)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (13, 52, 39, 12)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (14, 28, 25, 8)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (15, 1, 25, 4)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (16, 59, 42, 3)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (17, 57, 42, 4)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (18, 67, 42, 6)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (19, 70, 2, 1)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (20, 70, 8, 1)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (21, 79, 38, 15)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (22, 44, 13, 3)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (23, 52, 27, 6)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (24, 11, 40, 15)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (25, 66, 13, 1)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (26, 18, 13, 6)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (27, 10, 2, 16)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (28, 92, 38, 19)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (29, 33, 21, 5)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (30, 67, 27, 6)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (31, 96, 27, 14)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (32, 16, 40, 8)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (33, 99, 2, 3)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (34, 34, 40, 6)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (35, 99, 36, 2)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (36, 54, 14, 9)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (37, 76, 13, 10)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (38, 90, 40, 15)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (39, 47, 40, 14)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (40, 41, 13, 3)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (41, 68, 8, 2)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (42, 19, 21, 4)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (43, 24, 14, 11)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (44, 33, 10, 4)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (45, 16, 22, 15)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (46, 64, 16, 1)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (47, 70, 16, 16)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (48, 92, 16, 11)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (49, 78, 16, 1)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (50, 94, 18, 20)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (51, 10, 18, 18)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (52, 40, 18, 18)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (53, 72, 18, 6)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (54, 47, 18, 3)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (55, 11, 46, 11)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (56, 58, 14, 19)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (57, 66, 12, 18)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (58, 77, 46, 19)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (59, 41, 17, 3)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (60, 76, 46, 19)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (61, 24, 12, 6)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (62, 27, 46, 7)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (63, 47, 12, 14)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (64, 64, 34, 14)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (65, 18, 34, 5)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (66, 32, 29, 15)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (67, 92, 5, 13)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (68, 67, 5, 10)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (69, 27, 5, 5)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (70, 72, 30, 20)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (71, 79, 41, 8)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (72, 11, 48, 19)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (73, 1, 3, 13)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (74, 66, 48, 18)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (75, 95, 47, 8)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (76, 40, 32, 20)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (77, 41, 32, 4)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (78, 41, 49, 14)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (79, 19, 7, 8)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (80, 77, 35, 10)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (81, 47, 28, 5)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (82, 63, 35, 1)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (83, 33, 28, 10)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (84, 18, 7, 19)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (85, 66, 32, 16)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (86, 52, 28, 17)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (87, 100, 44, 8)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (88, 60, 37, 17)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (89, 76, 37, 10)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (90, 52, 44, 11)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (91, 49, 43, 4)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (92, 34, 26, 16)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (93, 71, 26, 11)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (94, 71, 11, 4)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (95, 66, 44, 12)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (96, 92, 44, 16)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (97, 95, 11, 3)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (98, 32, 43, 4)
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (99, 63, 37, 10)
GO
INSERT [dbo].[Product_Material] ([idProduct_Material], [idProduct], [idMaterial], [CountOfMaterial]) VALUES (100, 72, 44, 6)
SET IDENTITY_INSERT [dbo].[Product_Material] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([idProductType], [Type]) VALUES (1, N'Три Слоя')
INSERT [dbo].[ProductType] ([idProductType], [Type]) VALUES (2, N'Два слоя')
INSERT [dbo].[ProductType] ([idProductType], [Type]) VALUES (3, N'Детская')
INSERT [dbo].[ProductType] ([idProductType], [Type]) VALUES (4, N'Супер мягкая')
INSERT [dbo].[ProductType] ([idProductType], [Type]) VALUES (5, N'Один слой')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([idUnit], [Title]) VALUES (1, N'м')
INSERT [dbo].[Unit] ([idUnit], [Title]) VALUES (2, N'кг')
INSERT [dbo].[Unit] ([idUnit], [Title]) VALUES (3, N'л')
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[Workshop] ON 

INSERT [dbo].[Workshop] ([idWorkshop], [Title]) VALUES (1, N'Цех № 1')
INSERT [dbo].[Workshop] ([idWorkshop], [Title]) VALUES (2, N'Цех № 2')
INSERT [dbo].[Workshop] ([idWorkshop], [Title]) VALUES (3, N'Цех № 3')
INSERT [dbo].[Workshop] ([idWorkshop], [Title]) VALUES (4, N'Цех № 4')
INSERT [dbo].[Workshop] ([idWorkshop], [Title]) VALUES (5, N'Цех № 5')
INSERT [dbo].[Workshop] ([idWorkshop], [Title]) VALUES (6, N'Цех № 6')
INSERT [dbo].[Workshop] ([idWorkshop], [Title]) VALUES (7, N'Цех № 7')
INSERT [dbo].[Workshop] ([idWorkshop], [Title]) VALUES (8, N'Цех № 8')
INSERT [dbo].[Workshop] ([idWorkshop], [Title]) VALUES (9, N'Цех № 9')
INSERT [dbo].[Workshop] ([idWorkshop], [Title]) VALUES (10, N'Цех №10')
SET IDENTITY_INSERT [dbo].[Workshop] OFF
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([idMaterialType])
REFERENCES [dbo].[MaterialType] ([idMaterialType])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Unit] FOREIGN KEY([idUnit])
REFERENCES [dbo].[Unit] ([idUnit])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Unit]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([idProductType])
REFERENCES [dbo].[ProductType] ([idProductType])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Workshop] FOREIGN KEY([idWorkshop])
REFERENCES [dbo].[Workshop] ([idWorkshop])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Workshop]
GO
ALTER TABLE [dbo].[Product_Material]  WITH CHECK ADD  CONSTRAINT [FK_Product_Material_Material] FOREIGN KEY([idMaterial])
REFERENCES [dbo].[Material] ([idMaterial])
GO
ALTER TABLE [dbo].[Product_Material] CHECK CONSTRAINT [FK_Product_Material_Material]
GO
ALTER TABLE [dbo].[Product_Material]  WITH CHECK ADD  CONSTRAINT [FK_Product_Material_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([idProduct])
GO
ALTER TABLE [dbo].[Product_Material] CHECK CONSTRAINT [FK_Product_Material_Product]
GO
USE [master]
GO
ALTER DATABASE [DemoEkzAbramov420] SET  READ_WRITE 
GO
