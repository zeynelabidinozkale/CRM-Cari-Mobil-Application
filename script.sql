USE [master]
GO
/****** Object:  Database [MobilCari]    Script Date: 11.10.2019 15:07:26 ******/
CREATE DATABASE [MobilCari]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MobilCari', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MobilCari.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MobilCari_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MobilCari_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MobilCari] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MobilCari].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MobilCari] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MobilCari] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MobilCari] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MobilCari] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MobilCari] SET ARITHABORT OFF 
GO
ALTER DATABASE [MobilCari] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MobilCari] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MobilCari] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MobilCari] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MobilCari] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MobilCari] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MobilCari] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MobilCari] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MobilCari] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MobilCari] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MobilCari] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MobilCari] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MobilCari] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MobilCari] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MobilCari] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MobilCari] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MobilCari] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MobilCari] SET RECOVERY FULL 
GO
ALTER DATABASE [MobilCari] SET  MULTI_USER 
GO
ALTER DATABASE [MobilCari] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MobilCari] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MobilCari] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MobilCari] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MobilCari] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MobilCari', N'ON'
GO
ALTER DATABASE [MobilCari] SET QUERY_STORE = OFF
GO
USE [MobilCari]
GO
/****** Object:  Table [dbo].[CariDosyalar]    Script Date: 11.10.2019 15:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CariDosyalar](
	[CariDosyalarID] [int] IDENTITY(1,1) NOT NULL,
	[cariId] [int] NULL,
	[path] [nvarchar](300) NULL,
	[yuklenmeTarihi] [datetime] NULL,
	[sil] [bit] NULL,
 CONSTRAINT [PK_CariDosyalar] PRIMARY KEY CLUSTERED 
(
	[CariDosyalarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cariler]    Script Date: 11.10.2019 15:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cariler](
	[CariId] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](80) NULL,
	[olTarih] [datetime] NULL,
	[gunTarih] [datetime] NULL,
	[tel] [nvarchar](50) NULL,
	[tel2] [nvarchar](50) NULL,
	[fax] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[sil] [bit] NOT NULL,
	[cariTip] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cariler] PRIMARY KEY CLUSTERED 
(
	[CariId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CariPersonelBirim]    Script Date: 11.10.2019 15:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CariPersonelBirim](
	[personelBirimID] [int] NOT NULL,
	[cariID] [int] NULL,
	[personelBirimAdi] [nvarchar](50) NULL,
	[email] [nvarchar](30) NULL,
	[tel] [nvarchar](20) NULL,
	[tel2] [nvarchar](20) NULL,
	[fax] [nvarchar](20) NULL,
 CONSTRAINT [PK_CariIletisim] PRIMARY KEY CLUSTERED 
(
	[personelBirimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kullanicilar]    Script Date: 11.10.2019 15:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kullanicilar](
	[kullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NULL,
	[sifre] [nvarchar](30) NULL,
 CONSTRAINT [PK_kullanicilar] PRIMARY KEY CLUSTERED 
(
	[kullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StokBirimler]    Script Date: 11.10.2019 15:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StokBirimler](
	[StokBirimlerID] [int] IDENTITY(1,1) NOT NULL,
	[StoklarID] [int] NULL,
	[birim] [nchar](100) NULL,
	[fiyat] [decimal](10, 2) NULL,
 CONSTRAINT [PK_StokBirimler] PRIMARY KEY CLUSTERED 
(
	[StokBirimlerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StokKategoriler]    Script Date: 11.10.2019 15:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StokKategoriler](
	[StokKategoriID] [int] IDENTITY(1,1) NOT NULL,
	[ustKategoriID] [int] NULL,
	[Ad] [nchar](50) NULL,
	[olTarihi] [datetime] NULL,
	[gunTarihi] [nchar](10) NULL,
 CONSTRAINT [PK_StokKategoriler] PRIMARY KEY CLUSTERED 
(
	[StokKategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stoklar]    Script Date: 11.10.2019 15:07:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stoklar](
	[StokID] [int] IDENTITY(1,1) NOT NULL,
	[StokKategoriID] [int] NULL,
	[ad] [nvarchar](50) NULL,
	[aciklama] [nvarchar](max) NULL,
	[gorsel] [nvarchar](300) NULL,
	[adet] [int] NULL,
 CONSTRAINT [PK_Stoklar] PRIMARY KEY CLUSTERED 
(
	[StokID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cariler] ADD  CONSTRAINT [DF_Cariler_cariSil]  DEFAULT ((0)) FOR [sil]
GO
USE [master]
GO
ALTER DATABASE [MobilCari] SET  READ_WRITE 
GO
