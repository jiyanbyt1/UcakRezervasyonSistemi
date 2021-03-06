USE [master]
GO
/****** Object:  Database [UcakRezervasyon]    Script Date: 14.09.2020 19:40:06 ******/
CREATE DATABASE [UcakRezervasyon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UcakRezervasyon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UcakRezervasyon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UcakRezervasyon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UcakRezervasyon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UcakRezervasyon] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UcakRezervasyon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UcakRezervasyon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET ARITHABORT OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UcakRezervasyon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UcakRezervasyon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UcakRezervasyon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UcakRezervasyon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET RECOVERY FULL 
GO
ALTER DATABASE [UcakRezervasyon] SET  MULTI_USER 
GO
ALTER DATABASE [UcakRezervasyon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UcakRezervasyon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UcakRezervasyon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UcakRezervasyon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UcakRezervasyon] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UcakRezervasyon', N'ON'
GO
ALTER DATABASE [UcakRezervasyon] SET QUERY_STORE = OFF
GO
USE [UcakRezervasyon]
GO
/****** Object:  Table [dbo].[FirmaBilgileri]    Script Date: 14.09.2020 19:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirmaBilgileri](
	[FirmaID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaUnvani] [nvarchar](50) NULL,
	[FaliyetAlani] [nvarchar](30) NULL,
	[MerkezAdresi] [nvarchar](150) NULL,
	[MerkezTel] [nvarchar](13) NULL,
	[PersonelSayisi] [int] NULL,
	[UcakSayisi] [int] NULL,
	[FirmaNo] [int] NULL,
	[FirmaSifre] [int] NULL,
	[FirmaLogo] [nvarchar](50) NULL,
	[Puanı] [int] NULL,
 CONSTRAINT [PK_FirmaBilgileri] PRIMARY KEY CLUSTERED 
(
	[FirmaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GecmisRezervasyon]    Script Date: 14.09.2020 19:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GecmisRezervasyon](
	[RezervasyonID] [int] IDENTITY(1,1) NOT NULL,
	[SeferID] [int] NULL,
	[UcakID] [int] NULL,
	[Logo] [nvarchar](50) NULL,
	[FirmaAdi] [nvarchar](50) NULL,
	[MusteriAdi] [nvarchar](50) NULL,
	[MusteriSoyadi] [nvarchar](50) NULL,
	[MusteriTel] [nvarchar](13) NULL,
	[KalkisKonumu] [nvarchar](100) NULL,
	[InisKonumu] [nvarchar](100) NULL,
	[KoltukNumarasi] [int] NULL,
	[Fiyat] [int] NULL,
	[Tarih] [date] NULL,
	[Saat] [time](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KartBilgileri]    Script Date: 14.09.2020 19:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KartBilgileri](
	[KartID] [int] IDENTITY(1,1) NOT NULL,
	[KartNumarasi] [nvarchar](16) NULL,
	[SonTarih] [nvarchar](5) NULL,
	[CVC] [nvarchar](3) NULL,
	[Bakiye] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Koltuklar]    Script Date: 14.09.2020 19:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Koltuklar](
	[KoltukID] [int] IDENTITY(1,1) NOT NULL,
	[UcakID] [int] NULL,
	[KoltukNumarasi] [int] NULL,
	[KoltukDurumu] [bit] NULL,
	[Konfor] [nvarchar](20) NULL,
 CONSTRAINT [PK_Koltuklar] PRIMARY KEY CLUSTERED 
(
	[KoltukID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusteriBilgileri]    Script Date: 14.09.2020 19:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusteriBilgileri](
	[MusteriID] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAdi] [nvarchar](50) NULL,
	[MusteriSoyadi] [nvarchar](50) NULL,
	[MusteriAdresi] [nvarchar](150) NULL,
	[MusteriTel] [nvarchar](13) NULL,
	[MusteriEposta] [nvarchar](50) NULL,
	[MusteriSifre] [nvarchar](50) NULL,
	[Aktiflik] [bit] NULL,
 CONSTRAINT [PK_MusteriBilgileri] PRIMARY KEY CLUSTERED 
(
	[MusteriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervasyon]    Script Date: 14.09.2020 19:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervasyon](
	[RezervasyonID] [int] IDENTITY(1,1) NOT NULL,
	[SeferID] [int] NULL,
	[UcakID] [int] NULL,
	[Logo] [nvarchar](50) NULL,
	[FirmaAdi] [nvarchar](50) NULL,
	[MusteriAdi] [nvarchar](50) NULL,
	[MusteriSoyadi] [nvarchar](50) NULL,
	[MusteriTel] [nvarchar](13) NULL,
	[KalkisKonumu] [nvarchar](100) NULL,
	[InisKonumu] [nvarchar](100) NULL,
	[KoltukNumarasi] [int] NULL,
	[Fiyat] [int] NULL,
	[Tarih] [date] NULL,
	[Saat] [time](7) NULL,
 CONSTRAINT [PK_Rezervasyon] PRIMARY KEY CLUSTERED 
(
	[RezervasyonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SatinAl]    Script Date: 14.09.2020 19:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SatinAl](
	[SatinAlID] [int] IDENTITY(1,1) NOT NULL,
	[SeferID] [int] NULL,
	[UcakID] [int] NULL,
	[FirmaAdi] [nvarchar](50) NULL,
	[MusteriAdi] [nvarchar](50) NULL,
	[MusteriSoyadi] [nvarchar](50) NULL,
	[MusteriTel] [nvarchar](13) NULL,
	[KalkisKonumu] [nvarchar](100) NULL,
	[InisKonumu] [nvarchar](100) NULL,
	[KoltukNumarasi] [int] NULL,
	[Tarih] [date] NULL,
	[Saat] [time](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seferler]    Script Date: 14.09.2020 19:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seferler](
	[SeferID] [int] IDENTITY(1,1) NOT NULL,
	[SeferSayisi] [int] NULL,
	[UcakID] [int] NULL,
	[Logo] [nvarchar](50) NULL,
	[FirmaAdi] [nvarchar](50) NULL,
	[KalkisKonumu] [nvarchar](100) NULL,
	[InisKonumu] [nvarchar](100) NULL,
	[Tarih] [date] NULL,
	[Saat] [time](7) NULL,
	[Fiyat] [int] NULL,
 CONSTRAINT [PK_Seferler] PRIMARY KEY CLUSTERED 
(
	[SeferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UcakBilgileri]    Script Date: 14.09.2020 19:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UcakBilgileri](
	[UcakID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaID] [int] NULL,
	[UcakAdi] [nvarchar](30) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[UcakID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FirmaBilgileri] ON 

INSERT [dbo].[FirmaBilgileri] ([FirmaID], [FirmaUnvani], [FaliyetAlani], [MerkezAdresi], [MerkezTel], [PersonelSayisi], [UcakSayisi], [FirmaNo], [FirmaSifre], [FirmaLogo], [Puanı]) VALUES (1, N'Türk Hava Yolları A.Ş', N'Havacılık', N'İstanbul', N'02125844578', 85, 12, 151515, 123456789, N'thy.png', NULL)
INSERT [dbo].[FirmaBilgileri] ([FirmaID], [FirmaUnvani], [FaliyetAlani], [MerkezAdresi], [MerkezTel], [PersonelSayisi], [UcakSayisi], [FirmaNo], [FirmaSifre], [FirmaLogo], [Puanı]) VALUES (2, N'Pegasus', N'Havacılık', N'Ankara', N'08501200058', 66, 15, 252525, 987654321, N'pegasus.png', NULL)
INSERT [dbo].[FirmaBilgileri] ([FirmaID], [FirmaUnvani], [FaliyetAlani], [MerkezAdresi], [MerkezTel], [PersonelSayisi], [UcakSayisi], [FirmaNo], [FirmaSifre], [FirmaLogo], [Puanı]) VALUES (3, N'Sun Express', N'Havacılık', N'Antalya', N'02125692200', 45, 9, 353535, 123654789, N'sun.png', NULL)
SET IDENTITY_INSERT [dbo].[FirmaBilgileri] OFF
SET IDENTITY_INSERT [dbo].[KartBilgileri] ON 

INSERT [dbo].[KartBilgileri] ([KartID], [KartNumarasi], [SonTarih], [CVC], [Bakiye]) VALUES (1, N'1111111111111111', N'11/11', N'333', 1950)
INSERT [dbo].[KartBilgileri] ([KartID], [KartNumarasi], [SonTarih], [CVC], [Bakiye]) VALUES (2, N'2222222222222222', N'22/22', N'444', 4000)
INSERT [dbo].[KartBilgileri] ([KartID], [KartNumarasi], [SonTarih], [CVC], [Bakiye]) VALUES (3, N'3333333333333333', N'33/33', N'666', 200)
SET IDENTITY_INSERT [dbo].[KartBilgileri] OFF
SET IDENTITY_INSERT [dbo].[Koltuklar] ON 

INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (2, 1, 1, 1, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (3, 1, 2, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (4, 1, 3, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (5, 1, 4, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (6, 1, 5, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (7, 1, 6, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (8, 1, 7, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (9, 1, 8, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (10, 1, 9, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (11, 1, 10, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (12, 1, 11, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (13, 1, 12, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (14, 1, 13, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (15, 1, 14, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (16, 1, 15, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (17, 1, 16, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (18, 1, 17, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (19, 1, 18, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (20, 1, 19, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (21, 1, 20, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (22, 1, 21, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (23, 1, 22, 1, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (24, 1, 23, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (25, 1, 24, 1, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (26, 1, 25, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (27, 1, 26, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (28, 1, 27, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (29, 1, 28, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (30, 1, 29, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (31, 1, 30, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (32, 1, 31, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (33, 1, 32, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (34, 1, 33, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (35, 1, 34, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (36, 1, 35, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (37, 1, 36, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (38, 1, 37, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (39, 1, 38, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (40, 1, 39, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (41, 1, 40, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (42, 1, 41, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (43, 1, 42, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (44, 1, 43, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (45, 1, 44, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (46, 1, 45, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (47, 1, 46, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (48, 1, 47, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (49, 1, 48, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (50, 1, 49, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (51, 1, 50, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (52, 1, 51, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (53, 1, 52, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (54, 1, 53, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (55, 1, 54, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (56, 1, 55, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (57, 1, 56, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (58, 1, 57, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (59, 1, 58, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (60, 1, 59, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (61, 1, 60, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (62, 1, 61, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (63, 1, 62, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (64, 1, 63, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (65, 1, 64, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (66, 1, 65, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (67, 1, 66, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (68, 1, 67, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (69, 1, 68, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (70, 1, 69, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (71, 1, 70, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (72, 1, 71, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (73, 1, 72, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (74, 1, 73, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (75, 1, 74, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (76, 1, 75, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (77, 1, 76, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (78, 1, 77, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (79, 1, 78, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (80, 1, 79, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (81, 1, 80, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (82, 1, 81, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (83, 1, 82, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (84, 1, 83, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (85, 1, 84, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (86, 1, 85, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (87, 1, 86, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (88, 1, 87, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (89, 1, 88, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (90, 1, 89, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (91, 1, 90, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (92, 1, 91, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (93, 1, 92, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (94, 1, 93, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (95, 1, 94, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (96, 1, 95, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (97, 1, 96, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (98, 1, 97, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (99, 1, 98, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (100, 1, 99, 0, N'economy')
GO
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (101, 3, 1, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (102, 3, 2, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (103, 3, 3, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (104, 3, 4, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (105, 3, 5, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (106, 3, 6, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (107, 3, 7, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (108, 3, 8, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (109, 3, 9, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (110, 3, 10, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (111, 3, 11, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (112, 3, 12, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (113, 3, 13, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (114, 3, 14, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (115, 3, 15, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (116, 3, 16, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (117, 3, 17, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (118, 3, 18, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (119, 3, 19, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (120, 3, 20, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (121, 3, 21, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (122, 3, 22, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (123, 3, 23, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (124, 3, 24, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (125, 3, 25, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (126, 3, 26, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (127, 3, 27, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (128, 3, 28, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (129, 3, 29, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (130, 3, 30, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (131, 3, 31, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (132, 3, 32, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (133, 3, 33, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (134, 3, 34, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (135, 3, 35, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (136, 3, 36, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (137, 3, 37, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (138, 3, 38, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (139, 3, 39, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (140, 3, 40, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (141, 3, 41, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (142, 3, 42, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (143, 3, 43, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (144, 3, 44, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (145, 3, 45, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (146, 3, 46, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (147, 3, 47, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (148, 3, 48, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (149, 3, 49, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (150, 3, 50, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (151, 3, 51, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (152, 3, 52, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (153, 3, 53, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (154, 3, 54, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (155, 3, 55, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (156, 3, 56, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (157, 3, 57, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (158, 3, 58, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (159, 3, 59, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (160, 3, 60, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (161, 3, 61, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (162, 3, 62, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (163, 3, 63, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (164, 3, 64, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (165, 3, 65, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (166, 3, 66, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (167, 3, 67, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (168, 3, 68, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (169, 3, 69, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (170, 3, 70, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (171, 3, 71, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (172, 3, 72, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (173, 3, 73, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (174, 3, 74, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (175, 3, 75, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (176, 3, 76, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (177, 3, 77, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (178, 3, 78, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (179, 3, 79, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (180, 3, 80, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (181, 3, 81, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (182, 3, 82, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (183, 3, 83, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (184, 3, 84, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (185, 3, 85, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (186, 3, 86, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (187, 3, 87, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (188, 3, 88, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (189, 3, 89, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (190, 3, 90, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (191, 3, 91, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (192, 3, 92, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (193, 3, 93, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (194, 3, 94, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (195, 3, 95, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (196, 3, 96, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (197, 3, 97, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (198, 3, 98, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (199, 3, 99, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (200, 3, 100, 0, N'economy')
GO
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (203, 7, 3, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (204, 7, 4, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (205, 7, 5, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (206, 7, 6, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (207, 7, 7, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (208, 7, 8, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (209, 7, 9, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (210, 7, 10, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (211, 7, 11, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (212, 7, 12, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (213, 7, 13, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (214, 7, 14, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (215, 7, 15, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (216, 7, 16, 1, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (217, 7, 17, 1, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (218, 7, 18, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (219, 7, 19, 1, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (220, 7, 20, 1, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (221, 7, 21, 1, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (222, 7, 22, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (223, 7, 23, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (224, 7, 24, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (225, 7, 25, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (226, 7, 26, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (227, 7, 27, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (228, 7, 28, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (229, 7, 29, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (230, 7, 30, 1, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (231, 7, 31, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (232, 7, 32, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (233, 7, 33, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (234, 7, 34, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (235, 7, 35, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (236, 7, 36, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (237, 7, 37, 1, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (238, 7, 38, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (239, 7, 39, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (240, 7, 40, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (241, 7, 41, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (242, 7, 42, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (243, 7, 43, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (244, 7, 44, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (245, 7, 45, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (246, 7, 46, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (247, 7, 47, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (248, 7, 48, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (249, 7, 49, 1, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (250, 7, 50, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (251, 7, 51, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (252, 7, 52, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (253, 7, 53, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (254, 7, 54, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (255, 7, 55, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (256, 7, 56, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (257, 7, 57, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (258, 7, 58, 1, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (259, 7, 59, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (260, 7, 60, 1, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (261, 7, 61, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (262, 7, 62, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (263, 7, 63, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (264, 7, 64, 1, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (265, 7, 65, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (266, 7, 66, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (267, 7, 67, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (268, 7, 68, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (269, 7, 69, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (270, 7, 70, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (271, 7, 71, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (272, 7, 72, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (273, 7, 73, 1, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (274, 7, 74, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (275, 7, 75, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (276, 7, 76, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (277, 7, 77, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (278, 7, 78, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (279, 7, 79, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (280, 7, 80, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (281, 7, 81, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (282, 7, 82, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (283, 7, 83, 1, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (284, 7, 84, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (285, 7, 85, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (286, 7, 86, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (287, 7, 87, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (288, 7, 88, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (289, 7, 89, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (290, 7, 90, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (291, 7, 91, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (292, 7, 92, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (293, 7, 93, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (294, 7, 94, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (295, 7, 95, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (296, 7, 96, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (297, 7, 97, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (298, 7, 98, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (299, 7, 99, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (300, 7, 1, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (301, 7, 2, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (302, 7, 3, 0, N'business')
GO
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (303, 7, 4, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (304, 7, 5, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (305, 7, 6, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (306, 7, 7, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (307, 7, 8, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (308, 7, 9, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (309, 7, 10, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (310, 7, 11, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (311, 7, 12, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (312, 7, 13, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (313, 7, 14, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (314, 7, 15, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (315, 7, 16, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (316, 7, 17, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (317, 7, 18, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (318, 7, 19, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (319, 7, 20, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (320, 7, 21, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (321, 7, 22, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (322, 7, 23, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (323, 7, 24, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (324, 7, 25, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (325, 7, 26, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (326, 7, 27, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (327, 7, 28, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (328, 7, 29, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (329, 7, 30, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (330, 7, 31, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (331, 7, 32, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (332, 7, 33, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (333, 7, 34, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (334, 7, 35, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (335, 7, 36, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (336, 7, 37, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (337, 7, 38, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (338, 7, 39, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (339, 7, 40, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (340, 7, 41, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (341, 7, 42, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (342, 7, 43, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (343, 7, 44, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (344, 7, 45, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (345, 7, 46, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (346, 7, 47, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (347, 7, 48, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (348, 7, 49, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (349, 7, 50, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (350, 7, 51, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (351, 7, 52, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (352, 7, 53, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (353, 7, 54, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (354, 7, 55, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (355, 7, 56, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (356, 7, 57, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (357, 7, 58, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (358, 7, 59, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (359, 7, 60, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (360, 7, 61, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (361, 7, 62, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (362, 7, 63, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (363, 7, 64, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (364, 7, 65, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (365, 7, 66, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (366, 7, 67, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (367, 7, 68, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (368, 7, 69, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (369, 7, 70, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (370, 7, 71, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (371, 7, 72, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (372, 7, 73, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (373, 7, 74, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (374, 7, 75, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (375, 7, 76, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (376, 7, 77, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (377, 7, 78, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (378, 7, 79, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (379, 7, 80, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (380, 7, 81, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (381, 7, 82, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (382, 7, 83, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (383, 7, 84, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (384, 7, 85, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (385, 7, 86, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (386, 7, 87, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (387, 7, 88, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (388, 7, 89, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (389, 7, 90, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (390, 7, 91, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (391, 7, 92, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (392, 7, 93, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (393, 7, 94, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (394, 7, 95, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (395, 7, 96, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (396, 7, 97, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (397, 7, 98, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (398, 7, 99, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (399, 7, 1, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (400, 7, 2, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (401, 7, 3, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (402, 7, 4, 0, N'business')
GO
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (403, 7, 5, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (404, 7, 6, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (405, 7, 7, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (406, 7, 8, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (407, 7, 9, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (408, 7, 10, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (409, 7, 11, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (410, 7, 12, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (411, 7, 13, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (412, 7, 14, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (413, 7, 15, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (414, 7, 16, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (415, 7, 17, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (416, 7, 18, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (417, 7, 19, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (418, 7, 20, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (419, 7, 21, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (420, 7, 22, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (421, 7, 23, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (422, 7, 24, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (423, 7, 25, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (424, 7, 26, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (425, 7, 27, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (426, 7, 28, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (427, 7, 29, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (428, 7, 30, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (429, 7, 31, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (430, 7, 32, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (431, 7, 33, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (432, 7, 34, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (433, 7, 35, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (434, 7, 36, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (435, 7, 37, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (436, 7, 38, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (437, 7, 39, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (438, 7, 40, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (439, 7, 41, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (440, 7, 42, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (441, 7, 43, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (442, 7, 44, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (443, 7, 45, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (444, 7, 46, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (445, 7, 47, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (446, 7, 48, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (447, 7, 49, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (448, 7, 50, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (449, 7, 51, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (450, 7, 52, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (451, 7, 53, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (452, 7, 54, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (453, 7, 55, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (454, 7, 56, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (455, 7, 57, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (456, 7, 58, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (457, 7, 59, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (458, 7, 60, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (459, 7, 61, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (460, 7, 62, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (461, 7, 63, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (462, 7, 64, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (463, 7, 65, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (464, 7, 66, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (465, 7, 67, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (466, 7, 68, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (467, 7, 69, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (468, 7, 70, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (469, 7, 71, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (470, 7, 72, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (471, 7, 73, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (472, 7, 74, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (473, 7, 75, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (474, 7, 76, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (475, 7, 77, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (476, 7, 78, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (477, 7, 79, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (478, 7, 80, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (479, 7, 81, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (480, 7, 82, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (481, 7, 83, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (482, 7, 84, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (483, 7, 85, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (484, 7, 86, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (485, 7, 87, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (486, 7, 88, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (487, 7, 89, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (488, 7, 90, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (489, 7, 91, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (490, 7, 92, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (491, 7, 93, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (492, 7, 94, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (493, 7, 95, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (494, 7, 96, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (495, 7, 97, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (496, 7, 98, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (497, 7, 99, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (498, 7, 1, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (499, 7, 2, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (500, 7, 3, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (501, 7, 4, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (502, 7, 5, 0, N'business')
GO
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (503, 7, 6, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (504, 7, 7, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (505, 7, 8, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (506, 7, 9, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (507, 7, 10, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (508, 7, 11, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (509, 7, 12, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (510, 7, 13, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (511, 7, 14, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (512, 7, 15, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (513, 7, 16, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (514, 7, 17, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (515, 7, 18, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (516, 7, 19, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (517, 7, 20, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (518, 7, 21, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (519, 7, 22, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (520, 7, 23, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (521, 7, 24, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (522, 7, 25, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (523, 7, 26, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (524, 7, 27, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (525, 7, 28, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (526, 7, 29, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (527, 7, 30, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (528, 7, 31, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (529, 7, 32, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (530, 7, 33, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (531, 7, 34, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (532, 7, 35, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (533, 7, 36, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (534, 7, 37, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (535, 7, 38, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (536, 7, 39, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (537, 7, 40, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (538, 7, 41, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (539, 7, 42, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (540, 7, 43, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (541, 7, 44, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (542, 7, 45, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (543, 7, 46, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (544, 7, 47, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (545, 7, 48, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (546, 7, 49, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (547, 7, 50, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (548, 7, 51, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (549, 7, 52, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (550, 7, 53, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (551, 7, 54, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (552, 7, 55, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (553, 7, 56, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (554, 7, 57, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (555, 7, 58, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (556, 7, 59, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (557, 7, 60, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (558, 7, 61, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (559, 7, 62, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (560, 7, 63, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (561, 7, 64, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (562, 7, 65, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (563, 7, 66, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (564, 7, 67, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (565, 7, 68, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (566, 7, 69, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (567, 7, 70, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (568, 7, 71, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (569, 7, 72, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (570, 7, 73, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (571, 7, 74, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (572, 7, 75, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (573, 7, 76, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (574, 7, 77, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (575, 7, 78, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (576, 7, 79, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (577, 7, 80, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (578, 7, 81, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (579, 7, 82, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (580, 7, 83, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (581, 7, 84, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (582, 7, 85, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (583, 7, 86, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (584, 7, 87, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (585, 7, 88, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (586, 7, 89, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (587, 7, 90, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (588, 7, 91, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (589, 7, 92, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (590, 7, 93, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (591, 7, 94, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (592, 7, 95, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (593, 7, 96, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (594, 7, 97, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (595, 7, 98, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (596, 7, 99, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (597, 7, 1, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (598, 7, 2, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (599, 7, 3, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (600, 7, 4, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (601, 7, 5, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (602, 7, 6, 0, N'business')
GO
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (603, 7, 7, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (604, 7, 8, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (605, 7, 9, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (606, 7, 10, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (607, 7, 11, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (608, 7, 12, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (609, 7, 13, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (610, 7, 14, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (611, 7, 15, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (612, 7, 16, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (613, 7, 17, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (614, 7, 18, 0, N'business')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (615, 7, 19, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (616, 7, 20, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (617, 7, 21, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (618, 7, 22, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (619, 7, 23, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (620, 7, 24, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (621, 7, 25, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (622, 7, 26, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (623, 7, 27, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (624, 7, 28, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (625, 7, 29, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (626, 7, 30, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (627, 7, 31, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (628, 7, 32, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (629, 7, 33, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (630, 7, 34, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (631, 7, 35, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (632, 7, 36, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (633, 7, 37, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (634, 7, 38, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (635, 7, 39, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (636, 7, 40, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (637, 7, 41, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (638, 7, 42, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (639, 7, 43, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (640, 7, 44, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (641, 7, 45, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (642, 7, 46, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (643, 7, 47, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (644, 7, 48, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (645, 7, 49, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (646, 7, 50, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (647, 7, 51, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (648, 7, 52, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (649, 7, 53, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (650, 7, 54, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (651, 7, 55, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (652, 7, 56, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (653, 7, 57, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (654, 7, 58, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (655, 7, 59, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (656, 7, 60, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (657, 7, 61, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (658, 7, 62, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (659, 7, 63, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (660, 7, 64, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (661, 7, 65, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (662, 7, 66, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (663, 7, 67, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (664, 7, 68, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (665, 7, 69, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (666, 7, 70, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (667, 7, 71, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (668, 7, 72, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (669, 7, 73, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (670, 7, 74, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (671, 7, 75, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (672, 7, 76, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (673, 7, 77, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (674, 7, 78, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (675, 7, 79, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (676, 7, 80, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (677, 7, 81, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (678, 7, 82, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (679, 7, 83, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (680, 7, 84, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (681, 7, 85, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (682, 7, 86, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (683, 7, 87, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (684, 7, 88, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (685, 7, 89, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (686, 7, 90, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (687, 7, 91, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (688, 7, 92, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (689, 7, 93, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (690, 7, 94, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (691, 7, 95, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (692, 7, 96, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (693, 7, 97, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (694, 7, 98, 0, N'economy')
INSERT [dbo].[Koltuklar] ([KoltukID], [UcakID], [KoltukNumarasi], [KoltukDurumu], [Konfor]) VALUES (695, 7, 99, 0, N'economy')
SET IDENTITY_INSERT [dbo].[Koltuklar] OFF
SET IDENTITY_INSERT [dbo].[MusteriBilgileri] ON 

INSERT [dbo].[MusteriBilgileri] ([MusteriID], [MusteriAdi], [MusteriSoyadi], [MusteriAdresi], [MusteriTel], [MusteriEposta], [MusteriSifre], [Aktiflik]) VALUES (1010, N'Ahmet Jiyan', N'Bayat', N'İstanbul', N'05555555555', N'jiyanbyt1@gmail.com', N'123', 0)
SET IDENTITY_INSERT [dbo].[MusteriBilgileri] OFF
SET IDENTITY_INSERT [dbo].[Seferler] ON 

INSERT [dbo].[Seferler] ([SeferID], [SeferSayisi], [UcakID], [Logo], [FirmaAdi], [KalkisKonumu], [InisKonumu], [Tarih], [Saat], [Fiyat]) VALUES (1, 16, 1, N'thy.png', N'Türk Hava Yolları', N'İstanbul', N'Adana', CAST(N'2020-12-25' AS Date), CAST(N'12:00:00' AS Time), 350)
INSERT [dbo].[Seferler] ([SeferID], [SeferSayisi], [UcakID], [Logo], [FirmaAdi], [KalkisKonumu], [InisKonumu], [Tarih], [Saat], [Fiyat]) VALUES (2, 32, 3, N'pegasus.png', N'Pegasus', N'Ankara', N'Antalya', CAST(N'2020-12-25' AS Date), CAST(N'15:30:00' AS Time), 130)
SET IDENTITY_INSERT [dbo].[Seferler] OFF
SET IDENTITY_INSERT [dbo].[UcakBilgileri] ON 

INSERT [dbo].[UcakBilgileri] ([UcakID], [FirmaID], [UcakAdi]) VALUES (1, 1, N'TürkJet1')
INSERT [dbo].[UcakBilgileri] ([UcakID], [FirmaID], [UcakAdi]) VALUES (3, 2, N'plyjet1')
INSERT [dbo].[UcakBilgileri] ([UcakID], [FirmaID], [UcakAdi]) VALUES (4, 3, N'SunExs1')
INSERT [dbo].[UcakBilgileri] ([UcakID], [FirmaID], [UcakAdi]) VALUES (5, 1, N'TürkJet2')
INSERT [dbo].[UcakBilgileri] ([UcakID], [FirmaID], [UcakAdi]) VALUES (6, 2, N'plyjet2')
INSERT [dbo].[UcakBilgileri] ([UcakID], [FirmaID], [UcakAdi]) VALUES (7, 3, N'SunExs2')
SET IDENTITY_INSERT [dbo].[UcakBilgileri] OFF
ALTER TABLE [dbo].[Rezervasyon] ADD  CONSTRAINT [DF_Rezervasyon_Tarih]  DEFAULT (getdate()) FOR [Tarih]
GO
ALTER TABLE [dbo].[Rezervasyon] ADD  CONSTRAINT [DF_Rezervasyon_Saat]  DEFAULT (getdate()) FOR [Saat]
GO
ALTER TABLE [dbo].[SatinAl] ADD  CONSTRAINT [DF_SatinAl_Tarih]  DEFAULT (getdate()) FOR [Tarih]
GO
ALTER TABLE [dbo].[SatinAl] ADD  CONSTRAINT [DF_SatinAl_Saat]  DEFAULT (getdate()) FOR [Saat]
GO
ALTER TABLE [dbo].[Seferler] ADD  CONSTRAINT [DF_Seferler_Tarih]  DEFAULT (getdate()) FOR [Tarih]
GO
ALTER TABLE [dbo].[Seferler] ADD  CONSTRAINT [DF_Seferler_Saat]  DEFAULT (getdate()) FOR [Saat]
GO
ALTER TABLE [dbo].[Koltuklar]  WITH CHECK ADD  CONSTRAINT [FK_Koltuklar_UcakBilgileri] FOREIGN KEY([UcakID])
REFERENCES [dbo].[UcakBilgileri] ([UcakID])
GO
ALTER TABLE [dbo].[Koltuklar] CHECK CONSTRAINT [FK_Koltuklar_UcakBilgileri]
GO
ALTER TABLE [dbo].[Rezervasyon]  WITH CHECK ADD  CONSTRAINT [FK_Rezervasyon_Seferler] FOREIGN KEY([SeferID])
REFERENCES [dbo].[Seferler] ([SeferID])
GO
ALTER TABLE [dbo].[Rezervasyon] CHECK CONSTRAINT [FK_Rezervasyon_Seferler]
GO
ALTER TABLE [dbo].[Rezervasyon]  WITH CHECK ADD  CONSTRAINT [FK_Rezervasyon_UcakBilgileri] FOREIGN KEY([UcakID])
REFERENCES [dbo].[UcakBilgileri] ([UcakID])
GO
ALTER TABLE [dbo].[Rezervasyon] CHECK CONSTRAINT [FK_Rezervasyon_UcakBilgileri]
GO
ALTER TABLE [dbo].[Seferler]  WITH CHECK ADD  CONSTRAINT [FK_Seferler_UcakBilgileri] FOREIGN KEY([UcakID])
REFERENCES [dbo].[UcakBilgileri] ([UcakID])
GO
ALTER TABLE [dbo].[Seferler] CHECK CONSTRAINT [FK_Seferler_UcakBilgileri]
GO
ALTER TABLE [dbo].[UcakBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_UcakBilgileri_FirmaBilgileri] FOREIGN KEY([FirmaID])
REFERENCES [dbo].[FirmaBilgileri] ([FirmaID])
GO
ALTER TABLE [dbo].[UcakBilgileri] CHECK CONSTRAINT [FK_UcakBilgileri_FirmaBilgileri]
GO
USE [master]
GO
ALTER DATABASE [UcakRezervasyon] SET  READ_WRITE 
GO
