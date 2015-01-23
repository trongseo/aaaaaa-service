USE [master]
GO
/****** Object:  Database [DB_AUTO]    Script Date: 12/24/2014 17:55:14 ******/
CREATE DATABASE [DB_AUTO] ON  PRIMARY 
( NAME = N'DB_AUTO', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DB_AUTO.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_AUTO_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DB_AUTO_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_AUTO] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_AUTO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_AUTO] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DB_AUTO] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DB_AUTO] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DB_AUTO] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DB_AUTO] SET ARITHABORT OFF
GO
ALTER DATABASE [DB_AUTO] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DB_AUTO] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DB_AUTO] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DB_AUTO] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DB_AUTO] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DB_AUTO] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DB_AUTO] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DB_AUTO] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DB_AUTO] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DB_AUTO] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DB_AUTO] SET  DISABLE_BROKER
GO
ALTER DATABASE [DB_AUTO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DB_AUTO] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DB_AUTO] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DB_AUTO] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DB_AUTO] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DB_AUTO] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DB_AUTO] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DB_AUTO] SET  READ_WRITE
GO
ALTER DATABASE [DB_AUTO] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DB_AUTO] SET  MULTI_USER
GO
ALTER DATABASE [DB_AUTO] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DB_AUTO] SET DB_CHAINING OFF
GO
USE [DB_AUTO]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](250) NULL,
	[user_email] [nvarchar](50) NULL,
	[user_pass] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER_INFO_IMAGES]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_INFO_IMAGES](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[USER_INFO_ID] [int] NULL,
	[IMAGE1] [nvarchar](50) NULL,
	[MOTA] [nvarchar](350) NULL,
	[USER_INFO_GUID_ID] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuVien]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuVien](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[proimage] [nvarchar](50) NULL,
	[proimage_thumb] [nvarchar](50) NULL,
	[comment] [nvarchar](1150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUp]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nicksys] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPWeb]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPWeb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](550) NULL,
	[ImageNews] [nvarchar](550) NULL,
	[Shortdescription] [ntext] NULL,
	[Description] [ntext] NULL,
	[CateId] [int] NULL,
	[DateCreate] [datetime] NULL,
	[DateUpdate] [datetime] NULL,
	[IsDelete] [int] NULL,
	[En] [int] NULL,
	[PriceSale] [float] NULL,
	[Quantity] [int] NULL,
	[ACuaHangId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsWebnb]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsWebnb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](550) NULL,
	[ImageNews] [nvarchar](550) NULL,
	[Shortdescription] [ntext] NULL,
	[Description] [ntext] NULL,
	[CateId] [int] NULL,
	[DateCreate] [datetime] NULL,
	[DateUpdate] [datetime] NULL,
	[IsDelete] [int] NULL,
	[En] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsWebINFO]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsWebINFO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](550) NULL,
	[ImageNews] [nvarchar](550) NULL,
	[Shortdescription] [ntext] NULL,
	[Description] [ntext] NULL,
	[CateId] [int] NULL,
	[DateCreate] [datetime] NULL,
	[DateUpdate] [datetime] NULL,
	[IsDelete] [int] NULL,
	[En] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsWeb]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsWeb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](550) NULL,
	[ImageNews] [nvarchar](550) NULL,
	[Shortdescription] [ntext] NULL,
	[Description] [ntext] NULL,
	[CateId] [int] NULL,
	[DateCreate] [datetime] NULL,
	[DateUpdate] [datetime] NULL,
	[IsDelete] [int] NULL,
	[En] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsHotTwo]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsHotTwo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[DateCreate] [datetime] NULL,
	[Shortdescription] [nvarchar](1000) NULL,
	[Description] [ntext] NULL,
	[Image1] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[ViewPriority] [int] NULL,
	[IsHome] [bit] NULL,
	[GroupId] [int] NULL,
	[ParId] [int] NULL,
 CONSTRAINT [PK_News1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsHot]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsHot](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[DateCreate] [datetime] NULL,
	[Shortdescription] [nvarchar](1000) NULL,
	[Description] [ntext] NULL,
	[Image1] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[ViewPriority] [int] NULL,
	[IsHome] [bit] NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyProductImage]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyProductImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[proimage] [nvarchar](50) NULL,
	[proimage_thumb] [nvarchar](50) NULL,
 CONSTRAINT [PK_MyProductImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](200) NULL,
	[Sex] [bit] NULL,
	[DateOfBirth] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[Telephone] [varchar](30) NULL,
	[Address] [nvarchar](120) NULL,
	[City] [nvarchar](40) NULL,
	[State] [nvarchar](40) NULL,
	[Country] [nvarchar](40) NULL,
	[HashedPassword] [varchar](100) NULL,
	[LastLogin] [datetime] NULL,
	[RegisterDate] [datetime] NULL,
	[Permission] [int] NULL,
	[AverageRate] [float] NULL,
	[Avatar] [varchar](20) NULL,
	[ActivateCode] [varchar](200) NULL,
	[IsActive] [bit] NULL,
	[CellPhone] [nchar](20) NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemDetailKH]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemDetailKH](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](500) NULL,
	[TenKHEn] [nvarchar](500) NULL,
	[GroupItemId] [int] NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](1000) NULL,
	[Price] [float] NULL,
	[ShortDescription] [ntext] NULL,
	[Description] [ntext] NULL,
	[DescriptionEn] [ntext] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[PathImage] [nvarchar](110) NULL,
	[IsHome] [bit] NULL,
	[ViewPriority] [int] NULL,
	[Price1] [float] NULL,
	[ThoiLuong] [nvarchar](100) NULL,
	[HanSuDung] [nvarchar](150) NULL,
	[HienGG] [int] NULL,
	[HienQC] [int] NULL,
	[TitleI] [nvarchar](350) NULL,
	[maso] [nvarchar](250) NULL,
	[dongia] [nvarchar](250) NULL,
	[baohanh] [nvarchar](1250) NULL,
	[quicach] [nvarchar](1250) NULL,
	[dacdiem] [nvarchar](1250) NULL,
	[image1] [nvarchar](250) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemDetailImage]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemDetailImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemDetailId] [int] NOT NULL,
	[PathImage] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ItemDetailImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemDetail]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupItemId] [int] NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](1000) NULL,
	[Price] [float] NULL,
	[ShortDescription] [ntext] NULL,
	[Description] [ntext] NULL,
	[DescriptionEn] [ntext] NULL,
	[IsActive] [bit] NULL,
	[IsDelete] [bit] NULL,
	[PathImage] [nvarchar](110) NULL,
	[IsHome] [bit] NULL,
	[ViewPriority] [int] NULL,
	[Price1] [float] NULL,
	[ThoiLuong] [nvarchar](100) NULL,
	[HanSuDung] [nvarchar](150) NULL,
	[HienGG] [int] NULL,
	[HienQC] [int] NULL,
	[TitleI] [nvarchar](350) NULL,
	[maso] [nvarchar](250) NULL,
	[dongia] [nvarchar](250) NULL,
	[baohanh] [nvarchar](1250) NULL,
	[quicach] [nvarchar](1250) NULL,
	[dacdiem] [nvarchar](1250) NULL,
	[image1] [nvarchar](250) NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[HTMLContent] [ntext] NULL,
	[HTMLContentEn] [ntext] NULL,
 CONSTRAINT [PK_Info] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDap]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoiDap](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Telephone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[Subject] [nvarchar](200) NULL,
	[Message] [nvarchar](2000) NULL,
	[CGroup] [nvarchar](450) NULL,
	[Name1] [nvarchar](200) NULL,
	[Telephone1] [varchar](50) NULL,
	[Fax1] [varchar](50) NULL,
	[Email1] [nvarchar](200) NULL,
	[Address1] [nvarchar](200) NULL,
	[Subject1] [nvarchar](200) NULL,
	[Message1] [nvarchar](2000) NULL,
	[CGroup1] [nvarchar](450) NULL,
	[createdate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HienTrangChu]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HienTrangChu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CTNhaCCId] [int] NULL,
	[CTLoaiSimId] [int] NULL,
	[stt] [int] NULL,
	[image1] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupItem]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[ParentGroupItemId] [int] NULL,
	[Image1] [nvarchar](200) NULL,
	[Description] [nvarchar](2000) NULL,
	[ViewPriority] [int] NULL,
	[linkhelp] [nvarchar](500) NULL,
 CONSTRAINT [PK_GroupItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioiThieu]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioiThieu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](550) NULL,
	[ImageNews] [nvarchar](550) NULL,
	[Shortdescription] [ntext] NULL,
	[Description] [ntext] NULL,
	[CateId] [int] NULL,
	[DateCreate] [datetime] NULL,
	[DateUpdate] [datetime] NULL,
	[IsDelete] [int] NULL,
	[En] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioGiaoHang]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioGiaoHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DiaDanh] [nvarchar](250) NULL,
	[stt] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileDownloadEn]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileDownloadEn](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](550) NULL,
	[Path] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileDownload]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileDownload](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](550) NULL,
	[Path] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Telephone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[Subject] [nvarchar](200) NULL,
	[Message] [nvarchar](2000) NULL,
	[CGroup] [nvarchar](450) NULL,
	[DateCreate] [datetime] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientInfo]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](250) NULL,
	[user_email] [nvarchar](50) NULL,
	[user_pass] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_UserInfo1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CateTypeParent]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CateTypeParent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](550) NULL,
	[Type] [int] NULL,
	[stt] [int] NULL,
	[image1] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[parid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CateTypeDoiTac]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CateTypeDoiTac](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](550) NULL,
	[Type] [int] NULL,
	[stt] [int] NULL,
	[image1] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[parid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CateType]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CateType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](550) NULL,
	[Type] [int] NULL,
	[stt] [int] NULL,
	[image1] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[parid] [int] NULL,
	[ACuaHangId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuyItemList]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuyItemList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[SoLuong] [int] NULL,
	[DateCreate] [datetime] NULL,
	[IsView] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ATheThanhVien]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATheThanhVien](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaThe] [nvarchar](350) NULL,
	[NgayCap] [datetime] NULL,
	[ANhanVienId] [int] NULL,
	[Islock] [int] NULL,
	[date_create] [datetime] NULL,
	[ANhanVienId_NhanVienCap] [int] NULL,
	[Ghichu] [nvarchar](350) NULL,
	[ACuaHangId] [int] NULL,
 CONSTRAINT [PK_ATheThanhVien] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ATheCao]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATheCao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SoTheCao] [nvarchar](50) NOT NULL,
	[Gia] [float] NULL,
	[Block] [int] NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
	[IsFinish] [int] NULL,
	[IsLock] [int] NULL,
	[NgayNap] [datetime] NULL,
	[so12] [nchar](10) NULL,
 CONSTRAINT [PK_ATheCao] PRIMARY KEY CLUSTERED 
(
	[SoTheCao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ATheCao] ON [dbo].[ATheCao] 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ATaiKhoan]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATaiKhoan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[guid_id] [nvarchar](350) NULL,
	[AThanhVienId] [int] NULL,
	[SoTien] [float] NULL,
	[date_create] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AQuan]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AQuan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaQuan] [nvarchar](50) NULL,
	[TenQuan] [nvarchar](250) NULL,
	[AThanhPhoId] [int] NULL,
	[STT] [int] NULL,
 CONSTRAINT [PK_AQuan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aport]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aport](
	[Id] [int] NULL,
	[portnumber] [int] NULL,
	[MoTa] [nvarchar](50) NULL,
	[date_create] [datetime] NULL,
	[acuahangid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APhieuNhapKho]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APhieuNhapKho](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupName] [nvarchar](500) NULL,
	[SPwebId] [int] NULL,
	[Quantity] [int] NULL,
	[date_create] [datetime] NULL,
	[PriceBuy] [float] NULL,
	[Note] [nvarchar](500) NULL,
	[ACuaHangId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ANhanVien]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ANhanVien](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[guid_id] [nvarchar](50) NULL,
	[ACuaHangId] [int] NULL,
	[TenDangNhap] [nvarchar](250) NULL,
	[MatKhau] [nvarchar](250) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](250) NULL,
	[APhanCapId] [int] NULL,
	[HoTen] [nvarchar](450) NULL,
	[ThauChi] [float] NULL,
	[ALoaiThanhVienId] [int] NULL,
	[CMND] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [int] NULL,
	[CongViec] [nvarchar](450) NULL,
	[DiaChi] [nvarchar](650) NULL,
	[QuanId] [int] NULL,
	[date_create] [datetime] NULL,
	[ATheThanhVienId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALichSuVaoRa]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALichSuVaoRa](
	[Id] [int] NULL,
	[guid_id] [nvarchar](50) NULL,
	[Athanhvienid] [int] NULL,
	[date_login] [datetime] NULL,
	[date_logout] [datetime] NULL,
	[ip] [datetime] NULL,
	[Iscard] [int] NULL,
	[date_create] [datetime] NULL,
	[ACuaHangId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALichSuLog]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALichSuLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[guid_id] [nvarchar](50) NULL,
	[Athanhvienid] [int] NULL,
	[date_login] [datetime] NULL,
	[date_logout] [datetime] NULL,
	[ip] [datetime] NULL,
	[date_create] [datetime] NULL,
	[Iscard] [int] NULL,
	[ACuaHangId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AGioHangTemp]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AGioHangTemp](
	[guid_id] [nvarchar](50) NULL,
	[ngay] [datetime] NULL,
	[gio] [nchar](10) NULL,
	[loai] [nvarchar](50) NULL,
	[idsp] [int] NULL,
	[isdichvu] [int] NULL,
	[aportid] [int] NULL,
	[soluong] [int] NULL,
	[giathanh] [float] NULL,
	[acuahangid] [int] NULL,
	[anhanvienid] [int] NULL,
	[adonhang_guid_id] [nvarchar](50) NULL,
	[date_create] [datetime] NULL,
	[guid_giohang] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AGiaoDichNapTien]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AGiaoDichNapTien](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[guid_id] [nvarchar](50) NULL,
	[Athanhvienid] [int] NULL,
	[Sotien] [float] NULL,
	[ANhanvienidNap] [float] NULL,
	[ATheNapid] [float] NULL,
	[date_create] [datetime] NULL,
	[ACuaHangId] [int] NULL,
	[Ghichu] [nvarchar](3350) NULL,
	[LoaiGiaoDich] [int] NULL,
	[Adonhang_guid_id] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADonHangSP]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADonHangSP](
	[Id] [int] NULL,
	[guid_id] [nvarchar](50) NULL,
	[Athanhvienid] [int] NULL,
	[SPWebId] [int] NULL,
	[PriceBuy] [float] NULL,
	[date_create] [datetime] NULL,
	[aDonHang_guid_id] [nvarchar](50) NULL,
	[ACuaHangId] [int] NULL,
	[Quantity] [int] NULL,
	[SumPrice] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADonHangDV]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADonHangDV](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[guid_id] [nvarchar](50) NULL,
	[Athanhvienid] [int] NULL,
	[ADichVuId] [int] NULL,
	[PriceBuy] [float] NULL,
	[date_create] [datetime] NULL,
	[aDonHang_guid_id] [nvarchar](50) NULL,
	[ACuaHangId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADonHang]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADonHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[guid_id] [nvarchar](50) NULL,
	[Athanhvienid] [int] NULL,
	[date_create] [datetime] NULL,
	[ACuaHangId] [int] NULL,
	[MaDonHang] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADichVu]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADichVu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenDV] [nvarchar](550) NULL,
	[ADanhMucDVId] [int] NULL,
	[SoPhut] [int] NULL,
	[PriceSale] [float] NULL,
	[ACuaHangId] [int] NULL,
	[DateCreate] [datetime] NULL,
	[DateUpdate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADanhMucDV]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADanhMucDV](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](550) NULL,
	[Type] [int] NULL,
	[stt] [int] NULL,
	[image1] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[parid] [int] NULL,
	[ACuaHangId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACuaHang]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACuaHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenCuaHang] [nvarchar](3000) NULL,
	[DiaChi] [nvarchar](450) NULL,
	[VietTat] [nvarchar](500) NULL,
	[NgayThanhLap] [datetime] NULL,
	[DateCreate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AConst]    Script Date: 12/24/2014 17:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AConst](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CName] [nvarchar](250) NULL,
	[CType] [int] NULL,
	[OrdNumber] [int] NULL,
	[CId] [int] NULL,
 CONSTRAINT [PK_AConst] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_UserInfo_CreateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_UserInfo_UpdateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
/****** Object:  Default [vaD2F_MyProduct_CreateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[SPWeb] ADD  CONSTRAINT [vaD2F_MyProduct_CreateDate]  DEFAULT (getdate()) FOR [DateCreate]
GO
/****** Object:  Default [vaD2F_MyProduct_UpdateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[SPWeb] ADD  CONSTRAINT [vaD2F_MyProduct_UpdateDate]  DEFAULT (getdate()) FOR [DateUpdate]
GO
/****** Object:  Default [DF_New2sWeb_IsDelete]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[SPWeb] ADD  CONSTRAINT [DF_New2sWeb_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
/****** Object:  Default [DF_Ne2wsWeb_En]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[SPWeb] ADD  CONSTRAINT [DF_Ne2wsWeb_En]  DEFAULT ((0)) FOR [En]
GO
/****** Object:  Default [DF_SPWeb_Quantity]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[SPWeb] ADD  CONSTRAINT [DF_SPWeb_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
/****** Object:  Default [DF__NewsWebnb__DateC__7F2BE32F]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsWebnb] ADD  DEFAULT (getdate()) FOR [DateCreate]
GO
/****** Object:  Default [DF__NewsWebnb__DateU__00200768]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsWebnb] ADD  DEFAULT (getdate()) FOR [DateUpdate]
GO
/****** Object:  Default [DF__NewsWebnb__IsDel__01142BA1]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsWebnb] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
/****** Object:  Default [DF__NewsWebnb__En__02084FDA]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsWebnb] ADD  DEFAULT ((0)) FOR [En]
GO
/****** Object:  Default [vaDF_MyPqroduct_CreateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsWebINFO] ADD  CONSTRAINT [vaDF_MyPqroduct_CreateDate]  DEFAULT (getdate()) FOR [DateCreate]
GO
/****** Object:  Default [vaDF_MyProqduct_UpdateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsWebINFO] ADD  CONSTRAINT [vaDF_MyProqduct_UpdateDate]  DEFAULT (getdate()) FOR [DateUpdate]
GO
/****** Object:  Default [DF_NewsWqeb_IsDelete]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsWebINFO] ADD  CONSTRAINT [DF_NewsWqeb_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
/****** Object:  Default [DF_NewsWeqb_En]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsWebINFO] ADD  CONSTRAINT [DF_NewsWeqb_En]  DEFAULT ((0)) FOR [En]
GO
/****** Object:  Default [vaDF_MyProduct_CreateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsWeb] ADD  CONSTRAINT [vaDF_MyProduct_CreateDate]  DEFAULT (getdate()) FOR [DateCreate]
GO
/****** Object:  Default [vaDF_MyProduct_UpdateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsWeb] ADD  CONSTRAINT [vaDF_MyProduct_UpdateDate]  DEFAULT (getdate()) FOR [DateUpdate]
GO
/****** Object:  Default [DF_NewsWeb_IsDelete]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsWeb] ADD  CONSTRAINT [DF_NewsWeb_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
/****** Object:  Default [DF_NewsWeb_En]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsWeb] ADD  CONSTRAINT [DF_NewsWeb_En]  DEFAULT ((0)) FOR [En]
GO
/****** Object:  Default [DF_NewsHot_DateCreate1]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_DateCreate1]  DEFAULT (getdate()) FOR [DateCreate]
GO
/****** Object:  Default [DF_NewsHot_IsActive1]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_IsActive1]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_NewsHot_IsDelete1]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_IsDelete1]  DEFAULT ((0)) FOR [IsDelete]
GO
/****** Object:  Default [DF_NewsHot_ViewPriority1]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_ViewPriority1]  DEFAULT ((0)) FOR [ViewPriority]
GO
/****** Object:  Default [DF_NewsHot_IsHome1]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_IsHome1]  DEFAULT ((0)) FOR [IsHome]
GO
/****** Object:  Default [DF_NewsHot_GroupId1]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_GroupId1]  DEFAULT ((0)) FOR [GroupId]
GO
/****** Object:  Default [DF_NewsHot_GroupId11]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_GroupId11]  DEFAULT ((0)) FOR [ParId]
GO
/****** Object:  Default [DF_NewsHot_DateCreate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsHot] ADD  CONSTRAINT [DF_NewsHot_DateCreate]  DEFAULT (getdate()) FOR [DateCreate]
GO
/****** Object:  Default [DF_NewsHot_IsActive]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsHot] ADD  CONSTRAINT [DF_NewsHot_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Default [DF_NewsHot_IsDelete]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsHot] ADD  CONSTRAINT [DF_NewsHot_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
/****** Object:  Default [DF_NewsHot_ViewPriority]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsHot] ADD  CONSTRAINT [DF_NewsHot_ViewPriority]  DEFAULT ((0)) FOR [ViewPriority]
GO
/****** Object:  Default [DF_NewsHot_IsHome]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsHot] ADD  CONSTRAINT [DF_NewsHot_IsHome]  DEFAULT ((0)) FOR [IsHome]
GO
/****** Object:  Default [DF_NewsHot_GroupId]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[NewsHot] ADD  CONSTRAINT [DF_NewsHot_GroupId]  DEFAULT ((0)) FOR [GroupId]
GO
/****** Object:  Default [DF_Member_LastLogin]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_LastLogin]  DEFAULT (getdate()) FOR [LastLogin]
GO
/****** Object:  Default [DF_Member_RegisterDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_RegisterDate]  DEFAULT (getdate()) FOR [RegisterDate]
GO
/****** Object:  Default [DF_ItemDeeteail_IsHome]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ItemDetailKH] ADD  CONSTRAINT [DF_ItemDeeteail_IsHome]  DEFAULT ((0)) FOR [IsHome]
GO
/****** Object:  Default [DF_ItemDeetail_HienQC]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ItemDetailKH] ADD  CONSTRAINT [DF_ItemDeetail_HienQC]  DEFAULT ((0)) FOR [HienGG]
GO
/****** Object:  Default [DF_ItemDeetail_HienKM]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ItemDetailKH] ADD  CONSTRAINT [DF_ItemDeetail_HienKM]  DEFAULT ((0)) FOR [HienQC]
GO
/****** Object:  Default [DF_ItemDetail_IsHome]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ItemDetail] ADD  CONSTRAINT [DF_ItemDetail_IsHome]  DEFAULT ((0)) FOR [IsHome]
GO
/****** Object:  Default [DF_ItemDetail_HienQC]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ItemDetail] ADD  CONSTRAINT [DF_ItemDetail_HienQC]  DEFAULT ((0)) FOR [HienGG]
GO
/****** Object:  Default [DF_ItemDetail_HienKM]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ItemDetail] ADD  CONSTRAINT [DF_ItemDetail_HienKM]  DEFAULT ((0)) FOR [HienQC]
GO
/****** Object:  Default [DF_GroupItem_ViewPriority]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[GroupItem] ADD  CONSTRAINT [DF_GroupItem_ViewPriority]  DEFAULT ((0)) FOR [ViewPriority]
GO
/****** Object:  Default [DF__GioiThieu__DateC__5EBF139D]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[GioiThieu] ADD  DEFAULT (getdate()) FOR [DateCreate]
GO
/****** Object:  Default [DF__GioiThieu__DateU__5FB337D6]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[GioiThieu] ADD  DEFAULT (getdate()) FOR [DateUpdate]
GO
/****** Object:  Default [DF__GioiThieu__IsDel__60A75C0F]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[GioiThieu] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
/****** Object:  Default [DF__GioiThieu__En__619B8048]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[GioiThieu] ADD  DEFAULT ((0)) FOR [En]
GO
/****** Object:  Default [DF_GioGiaoHang_stt]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[GioGiaoHang] ADD  CONSTRAINT [DF_GioGiaoHang_stt]  DEFAULT ((1)) FOR [stt]
GO
/****** Object:  Default [awDF_MyProduct_CreateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[FileDownload] ADD  CONSTRAINT [awDF_MyProduct_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [aDwF_MyProduct_UpdateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[FileDownload] ADD  CONSTRAINT [aDwF_MyProduct_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
/****** Object:  Default [DF_Contact_DateCreate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_DateCreate]  DEFAULT (getdate()) FOR [DateCreate]
GO
/****** Object:  Default [DF_UserInfo_Create1Date]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ClientInfo] ADD  CONSTRAINT [DF_UserInfo_Create1Date]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_UserInfo_UpdateD1ate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ClientInfo] ADD  CONSTRAINT [DF_UserInfo_UpdateD1ate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
/****** Object:  Default [DF_CateType_Type1]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateTypeParent] ADD  CONSTRAINT [DF_CateType_Type1]  DEFAULT ((1)) FOR [Type]
GO
/****** Object:  Default [DF_CateType_stt1]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateTypeParent] ADD  CONSTRAINT [DF_CateType_stt1]  DEFAULT ((1)) FOR [stt]
GO
/****** Object:  Default [aDF_MyPsroduct_CreateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateTypeParent] ADD  CONSTRAINT [aDF_MyPsroduct_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [aDF_MyPsroduct_UpdateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateTypeParent] ADD  CONSTRAINT [aDF_MyPsroduct_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
/****** Object:  Default [DF_CassteType_parid]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateTypeParent] ADD  CONSTRAINT [DF_CassteType_parid]  DEFAULT ((0)) FOR [parid]
GO
/****** Object:  Default [DF__CateTypeDo__Type__4F7CD00D]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateTypeDoiTac] ADD  DEFAULT ((1)) FOR [Type]
GO
/****** Object:  Default [DF__CateTypeDoi__stt__5070F446]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateTypeDoiTac] ADD  DEFAULT ((1)) FOR [stt]
GO
/****** Object:  Default [DF__CateTypeD__Creat__5165187F]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateTypeDoiTac] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF__CateTypeD__Updat__52593CB8]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateTypeDoiTac] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
/****** Object:  Default [DF__CateTypeD__parid__534D60F1]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateTypeDoiTac] ADD  DEFAULT ((0)) FOR [parid]
GO
/****** Object:  Default [DF_CateType_Type]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateType] ADD  CONSTRAINT [DF_CateType_Type]  DEFAULT ((1)) FOR [Type]
GO
/****** Object:  Default [DF_CateType_stt]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateType] ADD  CONSTRAINT [DF_CateType_stt]  DEFAULT ((1)) FOR [stt]
GO
/****** Object:  Default [aDF_MyProduct_CreateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateType] ADD  CONSTRAINT [aDF_MyProduct_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [aDF_MyProduct_UpdateDate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateType] ADD  CONSTRAINT [aDF_MyProduct_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
/****** Object:  Default [DF_CateType_parid]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[CateType] ADD  CONSTRAINT [DF_CateType_parid]  DEFAULT ((0)) FOR [parid]
GO
/****** Object:  Default [DF_GioHangList_DateCreate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[BuyItemList] ADD  CONSTRAINT [DF_GioHangList_DateCreate]  DEFAULT (getdate()) FOR [DateCreate]
GO
/****** Object:  Default [DF_GioHangList_IsView]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[BuyItemList] ADD  CONSTRAINT [DF_GioHangList_IsView]  DEFAULT ((0)) FOR [IsView]
GO
/****** Object:  Default [DF_ATheThanhVien_NgayCap]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ATheThanhVien] ADD  CONSTRAINT [DF_ATheThanhVien_NgayCap]  DEFAULT (getdate()) FOR [NgayCap]
GO
/****** Object:  Default [DF_ATheThanhVien_Islock]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ATheThanhVien] ADD  CONSTRAINT [DF_ATheThanhVien_Islock]  DEFAULT ((1)) FOR [Islock]
GO
/****** Object:  Default [DF_ATheThanhVien_date_create]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ATheThanhVien] ADD  CONSTRAINT [DF_ATheThanhVien_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
/****** Object:  Default [DF_ATheCao_IsFinish]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ATheCao] ADD  CONSTRAINT [DF_ATheCao_IsFinish]  DEFAULT ((0)) FOR [IsFinish]
GO
/****** Object:  Default [DF_ATheCao_IsLock]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ATheCao] ADD  CONSTRAINT [DF_ATheCao_IsLock]  DEFAULT ((0)) FOR [IsLock]
GO
/****** Object:  Default [DF_ATaiKhoan_SoTien]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ATaiKhoan] ADD  CONSTRAINT [DF_ATaiKhoan_SoTien]  DEFAULT ((0)) FOR [SoTien]
GO
/****** Object:  Default [DF_ATaiKhoan_date_create]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ATaiKhoan] ADD  CONSTRAINT [DF_ATaiKhoan_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
/****** Object:  Default [DF_aport_date_create]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[aport] ADD  CONSTRAINT [DF_aport_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
/****** Object:  Default [DF_APhieuNhapKho_DateCreate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[APhieuNhapKho] ADD  CONSTRAINT [DF_APhieuNhapKho_DateCreate]  DEFAULT (getdate()) FOR [date_create]
GO
/****** Object:  Default [DF_ANhanVien_date_create]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ANhanVien] ADD  CONSTRAINT [DF_ANhanVien_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
/****** Object:  Default [DF_ALichSuVaoRa_date_create]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ALichSuVaoRa] ADD  CONSTRAINT [DF_ALichSuVaoRa_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
/****** Object:  Default [DF_AGioHangTemp_soluong]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[AGioHangTemp] ADD  CONSTRAINT [DF_AGioHangTemp_soluong]  DEFAULT ((0)) FOR [soluong]
GO
/****** Object:  Default [DF_AGioHangTemp_date_create]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[AGioHangTemp] ADD  CONSTRAINT [DF_AGioHangTemp_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
/****** Object:  Default [DF_AGiaoDichNapTien_date_create]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[AGiaoDichNapTien] ADD  CONSTRAINT [DF_AGiaoDichNapTien_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
/****** Object:  Default [DF_AGiaoDichNapTien_LoaiGiaoDich]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[AGiaoDichNapTien] ADD  CONSTRAINT [DF_AGiaoDichNapTien_LoaiGiaoDich]  DEFAULT ((0)) FOR [LoaiGiaoDich]
GO
/****** Object:  Default [DF_AGiaoDichDV_date_create]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ADonHangDV] ADD  CONSTRAINT [DF_AGiaoDichDV_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
/****** Object:  Default [DF_ACuaHang_DateCreate]    Script Date: 12/24/2014 17:55:17 ******/
ALTER TABLE [dbo].[ACuaHang] ADD  CONSTRAINT [DF_ACuaHang_DateCreate]  DEFAULT (getdate()) FOR [DateCreate]
GO
