USE [master]
GO
/****** Object:  Database [DB_AUTO]    Script Date: 12/23/2014 12:08:42 AM ******/
CREATE DATABASE [DB_AUTO] ON  PRIMARY 
( NAME = N'DB_AUTO', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLSERVER2012\MSSQL\DATA\DB_AUTO.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_AUTO_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLSERVER2012\MSSQL\DATA\DB_AUTO_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[AConst]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ACuaHang]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[ADanhMucDV]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[ADichVu]    Script Date: 12/23/2014 12:08:42 AM ******/
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
	[DateUpdate] [datetime] NULL,
	[Aportid] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ADonHang]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[ADonHangDV]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[ADonHangSP]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[AGiaoDichNapTien]    Script Date: 12/23/2014 12:08:42 AM ******/
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
	[Ghichu] [nvarchar](3350) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AGioHangTemp]    Script Date: 12/23/2014 12:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AGioHangTemp](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[ALichSuLog]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[ALichSuVaoRa]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[ANhanVien]    Script Date: 12/23/2014 12:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ANhanVien](
	[Id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[APhieuNhapKho]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[Aport]    Script Date: 12/23/2014 12:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PortNumber] [int] NULL,
	[mota] [nvarchar](350) NULL,
	[date_create] [datetime] NULL,
	[ACuaHangId] [int] NULL,
 CONSTRAINT [PK_Aport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AQuan]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ATaiKhoan]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[ATheThanhVien]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BuyItemList]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[CateType]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[CateTypeDoiTac]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[CateTypeParent]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[ClientInfo]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FileDownload]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[FileDownloadEn]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[GioGiaoHang]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[GioiThieu]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[GroupItem]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HienTrangChu]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[HoiDap]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[Info]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemDetail]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemDetailImage]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemDetailKH]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[Member]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MyProductImage]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsHot]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsHotTwo]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsWeb]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[NewsWebINFO]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[NewsWebnb]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[SPWeb]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[SystemUp]    Script Date: 12/23/2014 12:08:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nicksys] [nvarchar](250) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuVien]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[USER_INFO_IMAGES]    Script Date: 12/23/2014 12:08:42 AM ******/
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
/****** Object:  Table [dbo].[UserInfo]    Script Date: 12/23/2014 12:08:42 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AConst] ON 

INSERT [dbo].[AConst] ([Id], [CName], [CType], [OrdNumber], [CId]) VALUES (1, N'Trưởng cửa hàng', 1, 1, 1)
INSERT [dbo].[AConst] ([Id], [CName], [CType], [OrdNumber], [CId]) VALUES (2, N'Nhân Viên', 1, 2, 2)
INSERT [dbo].[AConst] ([Id], [CName], [CType], [OrdNumber], [CId]) VALUES (3, N'Đại lý', 1, 3, 3)
INSERT [dbo].[AConst] ([Id], [CName], [CType], [OrdNumber], [CId]) VALUES (4, N'Người dùng', 1, 4, 4)
INSERT [dbo].[AConst] ([Id], [CName], [CType], [OrdNumber], [CId]) VALUES (5, N'Cấp bậc vàng', 2, 5, 5)
INSERT [dbo].[AConst] ([Id], [CName], [CType], [OrdNumber], [CId]) VALUES (6, N'Cấp bậc bạc', 2, 6, 6)
INSERT [dbo].[AConst] ([Id], [CName], [CType], [OrdNumber], [CId]) VALUES (7, N'Cấp bậc đồng', 2, 7, 7)
SET IDENTITY_INSERT [dbo].[AConst] OFF
SET IDENTITY_INSERT [dbo].[ACuaHang] ON 

INSERT [dbo].[ACuaHang] ([Id], [TenCuaHang], [DiaChi], [VietTat], [NgayThanhLap], [DateCreate]) VALUES (1, N'Cua hang so 1', N'Cua hang so 1', N'CH1', NULL, NULL)
INSERT [dbo].[ACuaHang] ([Id], [TenCuaHang], [DiaChi], [VietTat], [NgayThanhLap], [DateCreate]) VALUES (2, N'Cua hang so 2', N'Cua hang so 2', N'CH2', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ACuaHang] OFF
SET IDENTITY_INSERT [dbo].[ADanhMucDV] ON 

INSERT [dbo].[ADanhMucDV] ([Id], [Title], [Type], [stt], [image1], [CreateDate], [UpdateDate], [parid], [ACuaHangId]) VALUES (1, N'nhom moi 1', 1, 1, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ADanhMucDV] ([Id], [Title], [Type], [stt], [image1], [CreateDate], [UpdateDate], [parid], [ACuaHangId]) VALUES (2, N'nhom moi 2', 1, 1, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ADanhMucDV] OFF
SET IDENTITY_INSERT [dbo].[ADichVu] ON 

INSERT [dbo].[ADichVu] ([Id], [TenDV], [ADanhMucDVId], [SoPhut], [PriceSale], [ACuaHangId], [DateCreate], [DateUpdate], [Aportid]) VALUES (1, N'', 1, 30, 25000, 1, NULL, NULL, NULL)
INSERT [dbo].[ADichVu] ([Id], [TenDV], [ADanhMucDVId], [SoPhut], [PriceSale], [ACuaHangId], [DateCreate], [DateUpdate], [Aportid]) VALUES (2, N'', 1, 60, 60000, 1, NULL, NULL, NULL)
INSERT [dbo].[ADichVu] ([Id], [TenDV], [ADanhMucDVId], [SoPhut], [PriceSale], [ACuaHangId], [DateCreate], [DateUpdate], [Aportid]) VALUES (3, N'', 1, 90, 90000, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ADichVu] OFF
SET IDENTITY_INSERT [dbo].[ADonHang] ON 

INSERT [dbo].[ADonHang] ([Id], [guid_id], [Athanhvienid], [date_create], [ACuaHangId], [MaDonHang]) VALUES (1, N'39cd8519-79b2-25c5-2c1a-4fad2597f005', 13, CAST(0x0000A40A000002BE AS DateTime), 1, N'14122300000213')
SET IDENTITY_INSERT [dbo].[ADonHang] OFF
SET IDENTITY_INSERT [dbo].[AGiaoDichNapTien] ON 

INSERT [dbo].[AGiaoDichNapTien] ([Id], [guid_id], [Athanhvienid], [Sotien], [ANhanvienidNap], [ATheNapid], [date_create], [ACuaHangId], [Ghichu]) VALUES (3, N'39cd798f-a5ff-4b05-1bb8-7ff8c72cf58c', 13, -2000, NULL, NULL, CAST(0x0000A407012B1654 AS DateTime), 1, N'admin')
INSERT [dbo].[AGiaoDichNapTien] ([Id], [guid_id], [Athanhvienid], [Sotien], [ANhanvienidNap], [ATheNapid], [date_create], [ACuaHangId], [Ghichu]) VALUES (2, N'39cd798d-e79e-e4c4-187c-c6547d9cad93', 13, 200000, NULL, NULL, CAST(0x0000A407012A8FFF AS DateTime), 1, N'tien tra no')
INSERT [dbo].[AGiaoDichNapTien] ([Id], [guid_id], [Athanhvienid], [Sotien], [ANhanvienidNap], [ATheNapid], [date_create], [ACuaHangId], [Ghichu]) VALUES (4, N'39cd7992-84c6-c1af-5555-a47e1bf1d792', 13, -2000, NULL, NULL, CAST(0x0000A407012BF24E AS DateTime), 1, N'bi tru tien phat')
INSERT [dbo].[AGiaoDichNapTien] ([Id], [guid_id], [Athanhvienid], [Sotien], [ANhanvienidNap], [ATheNapid], [date_create], [ACuaHangId], [Ghichu]) VALUES (5, N'39cd7e33-a12e-80e0-e891-04dea5a9c5b2', NULL, NULL, NULL, NULL, CAST(0x0000A4080103F8F3 AS DateTime), NULL, NULL)
INSERT [dbo].[AGiaoDichNapTien] ([Id], [guid_id], [Athanhvienid], [Sotien], [ANhanvienidNap], [ATheNapid], [date_create], [ACuaHangId], [Ghichu]) VALUES (6, N'39cd7e56-349c-ab93-e75d-bacd321b41a5', 13, 20000, NULL, NULL, CAST(0x0000A408010E583C AS DateTime), 1, N'mung sinh nhat')
SET IDENTITY_INSERT [dbo].[AGiaoDichNapTien] OFF
SET IDENTITY_INSERT [dbo].[AGioHangTemp] ON 

INSERT [dbo].[AGioHangTemp] ([id], [guid_id], [ngay], [gio], [loai], [idsp], [isdichvu], [aportid], [soluong], [giathanh], [acuahangid], [anhanvienid], [adonhang_guid_id], [date_create], [guid_giohang]) VALUES (19, N'39cd851d-aacb-8f6e-d633-4416aaa99e9e', CAST(0x0000A40900000000 AS DateTime), NULL, NULL, 31, 0, NULL, 1, 20000, NULL, 13, N'39cd8519-79b2-25c5-2c1a-4fad2597f005', CAST(0x0000A409018B79B1 AS DateTime), N'39cd8519-79b2-25c5-2c1a-4fad2597f005')
INSERT [dbo].[AGioHangTemp] ([id], [guid_id], [ngay], [gio], [loai], [idsp], [isdichvu], [aportid], [soluong], [giathanh], [acuahangid], [anhanvienid], [adonhang_guid_id], [date_create], [guid_giohang]) VALUES (20, N'39cd851d-c5c1-3b28-ba0c-1f3a9fb35452', CAST(0x0000A409018B3BB0 AS DateTime), NULL, NULL, 3, 1, 3, 1, 90000, NULL, 13, N'39cd8519-79b2-25c5-2c1a-4fad2597f005', CAST(0x0000A409018B81C6 AS DateTime), N'39cd8519-79b2-25c5-2c1a-4fad2597f005')
SET IDENTITY_INSERT [dbo].[AGioHangTemp] OFF
SET IDENTITY_INSERT [dbo].[ANhanVien] ON 

INSERT [dbo].[ANhanVien] ([Id], [ACuaHangId], [TenDangNhap], [MatKhau], [SDT], [Email], [APhanCapId], [HoTen], [ThauChi], [ALoaiThanhVienId], [CMND], [NgaySinh], [GioiTinh], [CongViec], [DiaChi], [QuanId], [date_create], [ATheThanhVienId]) VALUES (13, 1, N'nvxx', N'123456', N'13285544', N'jkkd@gmail.com', 1, N'nguyen van nvxx', 0, 5, N'', NULL, 1, N'', N'', NULL, CAST(0x0000A40701289555 AS DateTime), 6)
SET IDENTITY_INSERT [dbo].[ANhanVien] OFF
SET IDENTITY_INSERT [dbo].[APhieuNhapKho] ON 

INSERT [dbo].[APhieuNhapKho] ([Id], [SupName], [SPwebId], [Quantity], [date_create], [PriceBuy], [Note], [ACuaHangId]) VALUES (6, NULL, 28, 111, CAST(0x0000A40501566376 AS DateTime), 1111, N'111', NULL)
INSERT [dbo].[APhieuNhapKho] ([Id], [SupName], [SPwebId], [Quantity], [date_create], [PriceBuy], [Note], [ACuaHangId]) VALUES (7, NULL, 28, 2, CAST(0x0000A40501570AA7 AS DateTime), 111, N'111', 2)
INSERT [dbo].[APhieuNhapKho] ([Id], [SupName], [SPwebId], [Quantity], [date_create], [PriceBuy], [Note], [ACuaHangId]) VALUES (8, NULL, NULL, NULL, CAST(0x0000A4050161E940 AS DateTime), NULL, N'', 1)
INSERT [dbo].[APhieuNhapKho] ([Id], [SupName], [SPwebId], [Quantity], [date_create], [PriceBuy], [Note], [ACuaHangId]) VALUES (4, NULL, 26, 55544, CAST(0x0000A404017BCFD6 AS DateTime), 55544, N'8888', NULL)
INSERT [dbo].[APhieuNhapKho] ([Id], [SupName], [SPwebId], [Quantity], [date_create], [PriceBuy], [Note], [ACuaHangId]) VALUES (9, NULL, 29, 15, CAST(0x0000A40800BCE855 AS DateTime), 20000, N'', 1)
INSERT [dbo].[APhieuNhapKho] ([Id], [SupName], [SPwebId], [Quantity], [date_create], [PriceBuy], [Note], [ACuaHangId]) VALUES (5, NULL, 26, 22, CAST(0x0000A404018199BF AS DateTime), 22, N'222', NULL)
INSERT [dbo].[APhieuNhapKho] ([Id], [SupName], [SPwebId], [Quantity], [date_create], [PriceBuy], [Note], [ACuaHangId]) VALUES (10, NULL, 31, 20, CAST(0x0000A408010D11B3 AS DateTime), 10000, N'nhap tu ba nam ab con notien', 1)
INSERT [dbo].[APhieuNhapKho] ([Id], [SupName], [SPwebId], [Quantity], [date_create], [PriceBuy], [Note], [ACuaHangId]) VALUES (11, NULL, NULL, NULL, CAST(0x0000A409018153EE AS DateTime), NULL, N'', 1)
SET IDENTITY_INSERT [dbo].[APhieuNhapKho] OFF
SET IDENTITY_INSERT [dbo].[Aport] ON 

INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (1, 1, NULL, CAST(0x0000A40901570722 AS DateTime), 1)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (2, 2, NULL, CAST(0x0000A40901570948 AS DateTime), 1)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (3, 3, NULL, CAST(0x0000A40901570A8E AS DateTime), 1)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (4, 4, NULL, CAST(0x0000A40901570B98 AS DateTime), 1)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (5, 5, NULL, CAST(0x0000A40901570C62 AS DateTime), 1)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (6, 6, NULL, CAST(0x0000A40901570E00 AS DateTime), 1)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (7, 7, NULL, CAST(0x0000A40901570F51 AS DateTime), 1)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (8, 8, NULL, CAST(0x0000A40901571058 AS DateTime), 1)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (9, 9, NULL, CAST(0x0000A40901571366 AS DateTime), 1)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (10, 10, NULL, CAST(0x0000A40901571540 AS DateTime), 1)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (11, 11, NULL, CAST(0x0000A4090157164C AS DateTime), 1)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (12, 12, NULL, CAST(0x0000A40901571783 AS DateTime), 1)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (13, 1, NULL, CAST(0x0000A40901570722 AS DateTime), 2)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (14, 2, NULL, CAST(0x0000A40901570948 AS DateTime), 2)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (15, 3, NULL, CAST(0x0000A40901570A8E AS DateTime), 2)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (16, 4, NULL, CAST(0x0000A40901570B98 AS DateTime), 2)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (17, 5, NULL, CAST(0x0000A40901570C62 AS DateTime), 2)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (18, 6, NULL, CAST(0x0000A40901570E00 AS DateTime), 2)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (19, 7, NULL, CAST(0x0000A40901570F51 AS DateTime), 2)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (20, 8, NULL, CAST(0x0000A40901571058 AS DateTime), 2)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (21, 9, NULL, CAST(0x0000A40901571366 AS DateTime), 2)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (22, 10, NULL, CAST(0x0000A40901571540 AS DateTime), 2)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (23, 11, NULL, CAST(0x0000A4090157164C AS DateTime), 2)
INSERT [dbo].[Aport] ([Id], [PortNumber], [mota], [date_create], [ACuaHangId]) VALUES (24, 12, NULL, CAST(0x0000A40901571783 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Aport] OFF
SET IDENTITY_INSERT [dbo].[AQuan] ON 

INSERT [dbo].[AQuan] ([Id], [MaQuan], [TenQuan], [AThanhPhoId], [STT]) VALUES (1, NULL, N'Tân Bình', NULL, 1)
INSERT [dbo].[AQuan] ([Id], [MaQuan], [TenQuan], [AThanhPhoId], [STT]) VALUES (2, NULL, N'Quận 10', NULL, 2)
INSERT [dbo].[AQuan] ([Id], [MaQuan], [TenQuan], [AThanhPhoId], [STT]) VALUES (3, NULL, N'Quận 3', NULL, 3)
SET IDENTITY_INSERT [dbo].[AQuan] OFF
SET IDENTITY_INSERT [dbo].[ATaiKhoan] ON 

INSERT [dbo].[ATaiKhoan] ([Id], [guid_id], [AThanhVienId], [SoTien], [date_create]) VALUES (2, N'39cd7987-4eff-9bf2-0bb8-4c5e2cf3d678', 13, 216000, CAST(0x0000A40701289559 AS DateTime))
SET IDENTITY_INSERT [dbo].[ATaiKhoan] OFF
SET IDENTITY_INSERT [dbo].[ATheThanhVien] ON 

INSERT [dbo].[ATheThanhVien] ([Id], [MaThe], [NgayCap], [ANhanVienId], [Islock], [date_create], [ANhanVienId_NhanVienCap], [Ghichu], [ACuaHangId]) VALUES (6, N'123456', CAST(0x0000A40801313877 AS DateTime), 13, 0, CAST(0x0000A40801313877 AS DateTime), NULL, N'admin', 1)
INSERT [dbo].[ATheThanhVien] ([Id], [MaThe], [NgayCap], [ANhanVienId], [Islock], [date_create], [ANhanVienId_NhanVienCap], [Ghichu], [ACuaHangId]) VALUES (7, NULL, CAST(0x0000A409018148CD AS DateTime), NULL, 1, CAST(0x0000A409018148CD AS DateTime), NULL, N'', NULL)
SET IDENTITY_INSERT [dbo].[ATheThanhVien] OFF
SET IDENTITY_INSERT [dbo].[CateType] ON 

INSERT [dbo].[CateType] ([Id], [Title], [Type], [stt], [image1], [CreateDate], [UpdateDate], [parid], [ACuaHangId]) VALUES (13, N'Thức ăn', 1, 1, NULL, CAST(0x0000A4040157AB89 AS DateTime), CAST(0x0000A4040157AB89 AS DateTime), 0, 1)
INSERT [dbo].[CateType] ([Id], [Title], [Type], [stt], [image1], [CreateDate], [UpdateDate], [parid], [ACuaHangId]) VALUES (2, N'Trái cây', 1, 1, N'group_2_vo_cat.png', CAST(0x00009ECD00B61C49 AS DateTime), CAST(0x00009ECD00B61C49 AS DateTime), 0, 1)
INSERT [dbo].[CateType] ([Id], [Title], [Type], [stt], [image1], [CreateDate], [UpdateDate], [parid], [ACuaHangId]) VALUES (3, N'Nước uống', 1, 2, N'group_3_quandetkim_cat1.png', CAST(0x00009ECD00B61C51 AS DateTime), CAST(0x00009ECD00B61C51 AS DateTime), 0, 1)
INSERT [dbo].[CateType] ([Id], [Title], [Type], [stt], [image1], [CreateDate], [UpdateDate], [parid], [ACuaHangId]) VALUES (4, N'Nước chai', 1, 3, N'group_4_cimg1872_web1.png', CAST(0x00009ECD00B63E5C AS DateTime), CAST(0x00009ECD00B63E5C AS DateTime), 0, 1)
INSERT [dbo].[CateType] ([Id], [Title], [Type], [stt], [image1], [CreateDate], [UpdateDate], [parid], [ACuaHangId]) VALUES (14, N'ch2 bánh', 1, 1, NULL, CAST(0x0000A4050153D22D AS DateTime), CAST(0x0000A4050153D22D AS DateTime), 0, 2)
SET IDENTITY_INSERT [dbo].[CateType] OFF
SET IDENTITY_INSERT [dbo].[CateTypeDoiTac] ON 

INSERT [dbo].[CateTypeDoiTac] ([Id], [Title], [Type], [stt], [image1], [CreateDate], [UpdateDate], [parid]) VALUES (1, N'Hệ Thống Phân Phối', 1, 1, NULL, CAST(0x00009ED40108F4CE AS DateTime), CAST(0x00009ED40108F4CE AS DateTime), 0)
INSERT [dbo].[CateTypeDoiTac] ([Id], [Title], [Type], [stt], [image1], [CreateDate], [UpdateDate], [parid]) VALUES (2, N'Hệ Thống Showroom', 1, 2, NULL, CAST(0x00009ED40109097E AS DateTime), CAST(0x00009ED40109097E AS DateTime), 0)
INSERT [dbo].[CateTypeDoiTac] ([Id], [Title], [Type], [stt], [image1], [CreateDate], [UpdateDate], [parid]) VALUES (3, N'Công Trình Tiêu Biểu', 1, 3, NULL, CAST(0x00009ED401090B7C AS DateTime), CAST(0x00009ED401090B7C AS DateTime), 0)
INSERT [dbo].[CateTypeDoiTac] ([Id], [Title], [Type], [stt], [image1], [CreateDate], [UpdateDate], [parid]) VALUES (4, N'Công Ty Liên Kết', 1, 4, NULL, CAST(0x00009ED401095230 AS DateTime), CAST(0x00009ED401095230 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[CateTypeDoiTac] OFF
SET IDENTITY_INSERT [dbo].[FileDownload] ON 

INSERT [dbo].[FileDownload] ([Id], [Title], [Path], [CreateDate], [UpdateDate]) VALUES (2, N'Thông số hoàn thiện', N'download_ThongSoHoanThien.xls2.xls', CAST(0x00009ED500E9FD5E AS DateTime), CAST(0x00009ED500E9FD5E AS DateTime))
SET IDENTITY_INSERT [dbo].[FileDownload] OFF
SET IDENTITY_INSERT [dbo].[GioiThieu] ON 

INSERT [dbo].[GioiThieu] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En]) VALUES (4, N'Giới thiệu chung', NULL, N'', N'<p>Đầu thư Chúng tôi xin chúc Quý Khách hàng Thịnh vượng và Thành công!</p>
<p><strong>ĐÔI NÉT VỀ TẬP ĐOÀN AALBORGPORTLAND CỦA ĐAN MẠCH</strong></p>
<p>Tập đoàn Aalborg Portland là tập đoàn lớn nhất thế giới trong nghành sản xuất xi măng trắng với các nhà máy sản xuất ở Đan Mạch, Ai Cập, Malaysia, Trung Quốc và Mỹ. Nhóm này sản xuất hơn 3 triệu tấn xi măng trắng và đang trong quá trình mở rộng khả năng của mình. Tập đoàn Aalborg Portland trụ sở chính tại Đan Mạch, web tham khảo <a href="http://www.aalborgportland.dk/">www.aalborgportland.dk</a></p>
<p>Aalborg Portland ra đời vào năm 1889 và đến nay đã hơn 120 năm tuổi đời trong nghành sản xuât xi măng trắng, bột trét, vữa xây, keo dán /ốp gạch và sơn skimcem. Hiện nay tập đoàn có 20 nhà máy sản xuất xi măng và nghiền trong đó có 4 ở Italy, 4 tại Thổ Nhĩ Kỳ, 1 ở Đan Mạch, 5 ở Bồ Đào Nha (trong liên doanh với CRH), 1 ở Ai Cập, 3 ở Mỹ (trong đó 2 trong liên doanh với HeidelbergCement và Cemex) , 1 ở Trung Quốc, 1 ở Malaysia. Một hệ thống dày các chi nhánh và văn phòng đại diện ở Na Uy, Thụy Điển, Iceland, Ba Lan, Nga, Ý, Bồ Đào Nha, Australia, Ai Cập, Trung Quốc, Malaysia và Mỹ hàng năm đem về doanh thu từ việc sản xuất và kinh doanh xi măng trắng lên tới 445 triệu Euro và sử dụng 1.700 nhân viên.</p>
<p>Aalborgportland tập trung vào sự cần thiết cho nhu cầu chất lượng của các sản phẩm và dịch vụ, giúp đảm bảo sự hài lòng của khách hàng và nâng cao khả năng cạnh tranh của tập đoàn trên thị trường thế giới.</p>
<p><strong>GIỚI THIỆU CÁC SẢN PHẨM CÔNG TY TNHH TM THÀNH AN AN</strong></p>
<p>Công ty TNHH TM Thành An An 100% vốn nước ngoài đã được thành lập từ nhu cầu và sự cần thiết của thị trường Việt Nam, để đáp ứng nhu cầu tại thị trường Công ty TNHH TM Thành An An được sự ùy quyền từ tập đoàn Hãng Aalborgportland Đan Mạch đã nhập khẩu và phân phối độc quyền sản phẩm SCI tại 3 nước Việt Nam, Lào, Campuchia.</p>
<p>Chúng tôi xin giới thiệu các sản phẩm SCI mà Công ty Thành An An đang phân phối:</p>
<p>-         Bột trét SCI: Sở hữu những giá trị mà khó có một loại bột nào sánh kịp. Khi trét lên các loại bề mặt thích hợp cần sử dụng, người thợ bê không cần xả nhám, việc này vừa tiết kiệm nhân công và bột, vừa tránh bụi làm ảnh hưởng đến sức khỏe người thi công, khu vực xung quanh thi công và không gây ô nhiễm môi trường. Đây là tính năng vượt trội hơn hẳn bột trét khác. Ngoài ra, lớp phủ này rất mịn, nhẵn bóng và rất chắc. Bên cạnh đó, bột SCI chống nứt chân chim tuyệt đối, và hạn chế tối đa chống thấm nước. Nếu bị bẩn có thể dùng dẻ lau nhẹ là sạch vết bẩn và nhiều ưu điểm khác.</p>
<p>-         Vữa xây SCI: được pha chế theo tiêu chuẩn kỹ thuật cao của Châu Âu dùng thay thế xi măng và cát. Độ kết dính chắc chắn, lực liên kết mạnh phù hợp với mọi bề mặt bê tông và gạch xây, đáp ứng nhu cầu trong những điều kiện mặt bằng pha trộn nguyên liệu chật hẹp, tiến độ thi công nhanh.</p>
<p>-         Keo dán / ốp gạch: là sản phẩm có các tính năng chống thấm và độ dính cao, chịu được lực kéo, tăng độ bám chắc, và cường độ nén cao, kinh tế hiệu quả nhờ thi công nhanh.</p>
<p>-         Sơn skimcem: có các tính năng chống thấm, chống ẩm ướt rêu mốc, không bong rộp, độ kết dính tuyệt hảo, cực kỳ bền do thay đổi thời tiết và nhiệt độ tác dụng lên bề mặt xây dựng.</p>
<p>Sản phẩm được đóng bao bì tại chi nhánh Malaysia và được nhập về Việt Nam theo sự ủy quyền của tập đoàn Aalborgportland Đan Mạch.</p>
<p>Sản phẩm đã được trung tâm kỹ thuật đo lường chất lượng 3 kiểm định và cấp giấy chứng nhận xây dựng tại Việt Nam.</p>
<p>Công ty TNHH TM Thành An An mong muốn đem lại sự tự tin và thịnh vượng cho các đối tác, các Quý khách hàng.</p>
<p><strong>QUÝ KHÁCH CÓ NHU CẦU XIN VUI LÒNG LIÊN HỆ: </strong></p>
<p><strong>+ Chi nhánh VPĐD Công ty TNHH TM Thành An An</strong></p>
<p><strong>Đ/C: Số 42 Đường Số 1, P. Bình Trị Đông B, Q. Bình Tân</strong></p>
<p><strong>+ Chi nhánh showroom công ty TNHH TM Thành An An</strong></p>
<p><strong>Đ/C: 198 Đường Số 55, P. Tân Tạo, Q. Bình Tân, Tp.hcm</strong></p>
<p><strong>ĐT/ Fax: (08) 73001474 </strong></p>
<p>&nbsp;</p>
<p>&nbsp;</p>', 1, CAST(0x00009ECD00FA6C8D AS DateTime), CAST(0x00009ECD00FA6C8D AS DateTime), 0, 0)
INSERT [dbo].[GioiThieu] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En]) VALUES (5, N'Sơ đồ tổ chức công ty', NULL, N'', N'<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/sodo.jpg" border="0" alt="" width="577" height="577" /></p>', 1, CAST(0x00009ED0011465AF AS DateTime), CAST(0x00009ED0011465AF AS DateTime), 0, 0)
INSERT [dbo].[GioiThieu] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En]) VALUES (6, N'Định hướng', NULL, N'', N'', 1, CAST(0x00009ED001146E13 AS DateTime), CAST(0x00009ED001146E13 AS DateTime), 0, 0)
INSERT [dbo].[GioiThieu] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En]) VALUES (7, N'Tài liệu văn bản', NULL, N'', N'<p><img src="../ItemImage/Album/kinh doanh.jpg" alt="" width="536" height="696" /></p>
<p><img src="../ItemImage/Album/kinh doanh 001.jpg" alt="" width="538" height="691" /></p>
<p><img src="../ItemImage/Album/web.JPG" alt="" width="539" height="737" /></p>
<p><img src="../ItemImage/Album/web1.JPG" alt="" width="518" height="708" /></p>
<p><img src="../ItemImage/Album/web2.JPG" alt="" width="536" height="736" /></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>', 1, CAST(0x00009ED00114963E AS DateTime), CAST(0x00009ED00114963E AS DateTime), 0, 0)
INSERT [dbo].[GioiThieu] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En]) VALUES (8, N'Tuyển dụng', NULL, N'', N'<p>Đang cập nhật!</p>', 1, CAST(0x00009ED001149ED5 AS DateTime), CAST(0x00009ED001149ED5 AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[GioiThieu] OFF
SET IDENTITY_INSERT [dbo].[Info] ON 

INSERT [dbo].[Info] ([Id], [Code], [HTMLContent], [HTMLContentEn]) VALUES (1, N'sd', N'<span style="text-decoration: underline;"><span style="font-size: large; color: #ff9900;"><strong>THƯ NGỎ!</strong></span></span><br /><br />Đầu thư Chúng tôi xin chúc Quý Khách hàng Thịnh vượng và Thành công!<br />CTY TNHH MTV THẾ ANH NGUYỄN<br />Địa chỉ:60/24C Phan Huy Ích, P.12, Gò Vấp, HCM<br />MST:0312319095<br /><span style="color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 12px;"><strong><span style="text-decoration: underline;">Email:the20081976@icloud.com</span></strong></span>', NULL)
INSERT [dbo].[Info] ([Id], [Code], [HTMLContent], [HTMLContentEn]) VALUES (2, N'sdf', NULL, NULL)
INSERT [dbo].[Info] ([Id], [Code], [HTMLContent], [HTMLContentEn]) VALUES (3, N'sdf', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Info] OFF
SET IDENTITY_INSERT [dbo].[ItemDetail] ON 

INSERT [dbo].[ItemDetail] ([Id], [GroupItemId], [Code], [Name], [Price], [ShortDescription], [Description], [DescriptionEn], [IsActive], [IsDelete], [PathImage], [IsHome], [ViewPriority], [Price1], [ThoiLuong], [HanSuDung], [HienGG], [HienQC], [TitleI], [maso], [dongia], [baohanh], [quicach], [dacdiem], [image1]) VALUES (77, 0, NULL, NULL, NULL, N'Render White Finish Coat : Bột trét tường cao cấp dùng trong nhà và ngoài trời, dành cho lớp đầu tiên . Thành phần chủ yếu là ciment trắng và các chất phụ gia nên khả năng cách nhiệt, chống thấm, chống rạng nức rất cao. Được đặc chế để sử dụng cho cả trong nhà và ngoài trời. Thích hợp cho các loại tường: gạch, bê tông, tường đã xây, khối bê tông ALC…

Skim Plaster White: Là bột trét cao cấp dành cho lớp hoàn thiện ngoài cùng trong nhà và ngoài trời. Thành phần chủ yếu là ciment trắng và các chất phụ gia đặc biệt của công nghệ Đan Mạch. Nên khi hoàn tất lớp hoàn thiện này lên bề mặt đã phẳng, bóng, chắc, láng giống như tường đã sơn xong, không có bụi trong công trình.', NULL, N'step 2', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, N'#0077', N'', N'', N'xcvxc', N'', N'itemdetail_77.jpg')
INSERT [dbo].[ItemDetail] ([Id], [GroupItemId], [Code], [Name], [Price], [ShortDescription], [Description], [DescriptionEn], [IsActive], [IsDelete], [PathImage], [IsHome], [ViewPriority], [Price1], [ThoiLuong], [HanSuDung], [HienGG], [HienQC], [TitleI], [maso], [dongia], [baohanh], [quicach], [dacdiem], [image1]) VALUES (80, 0, NULL, NULL, NULL, N'Cement Paint Skimcem Paint: Là một loại sơn có nền tảng từ xi măng trắng được dùng để ứng dụng cho các nơi đòi hỏi chống thấm cao. Dùng cho nội thất và ngoại thất. Sơn có nền tảng từ xi măng nên khả năng chống thấm rất tốt và độ bền cao ngay cả những nơi có điều kiện thời tiết khắc nghiệt. Sơn không bị bong tróc hay rộp sau thời gian sử dụng.
 Bờ mặt thích hợp: Gạch bê tông, khối bê tông, tấm xi măng a-mi-ang, tất cả các loại tường, các loại bột trét tường. Skimcem không được sử dụng cho lớp phủ bằng thạch cao, kim loại, gỗ, sơn ( dầu hay nhựa) hay keo.', NULL, N'step 1', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, N'#0080', N'', N'', N'', N'', N'itemdetail_80.jpg')
INSERT [dbo].[ItemDetail] ([Id], [GroupItemId], [Code], [Name], [Price], [ShortDescription], [Description], [DescriptionEn], [IsActive], [IsDelete], [PathImage], [IsHome], [ViewPriority], [Price1], [ThoiLuong], [HanSuDung], [HienGG], [HienQC], [TitleI], [maso], [dongia], [baohanh], [quicach], [dacdiem], [image1]) VALUES (83, 0, NULL, NULL, NULL, N'Skimbond Thin Bed Adhesive (vữa xây): Là sản phẩm được pha chế theo tiêu chuẩn kỹ thuật cao của Châu Âu. Nguyên vật liệu chính là xi măng trắng, phụ gia và chất kết dính dùng thay thế cho xi măng và cát. Đáp ứng nhu cầu xây dựng trong những điều kiện mặt bằng pha trộn nguyên liệu hạn hẹp, vận chuyển khó khăn. Đảm bảo chất lượng công trình, tiến độ thi công nhanh, sử dụng thuận tiện để xây, hoàn thiện các công trình xây dựng, an toàn vệ sinh môi trường phù hợp quá trình xây dựng thi công trong mọi điều kiện mặt bằng và thời tiết. Chuyên dụng nhất là công nghệ gạch block, bê tông nhẹ.
Skimgrip Tile Adhesive (keo dán / ốp gạch): Là sản phẩm được xuất theo công nghệ mới của Châu Âu. Với hê vật liệu tổng hợp dựa trên ưu điểm của các thành phần cấp phối. Nguyên liệu chính là ciment trắng, keo dính, chất phụ gia chống thấm… Tạo nên một hệ khi trộn nước có độ dẻo và độ bám dính ban đầu cao, tạo điều kiện cho sự liên kết chắc chắn trên bề mặt gạch, làm cho mối dán được bền vững. Chịu được lực kéo, tăng độ bám chắc và cường độ nén cao là những ưu điểm nổi trội của dòng sản phẩm này.', NULL, N'', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, N'#0081', N'', N'', N'', N'', N'itemdetail_83.jpg')
SET IDENTITY_INSERT [dbo].[ItemDetail] OFF
SET IDENTITY_INSERT [dbo].[ItemDetailKH] ON 

INSERT [dbo].[ItemDetailKH] ([Id], [TenKH], [TenKHEn], [GroupItemId], [Code], [Name], [Price], [ShortDescription], [Description], [DescriptionEn], [IsActive], [IsDelete], [PathImage], [IsHome], [ViewPriority], [Price1], [ThoiLuong], [HanSuDung], [HienGG], [HienQC], [TitleI], [maso], [dongia], [baohanh], [quicach], [dacdiem], [image1]) VALUES (7, N'', N'', 0, NULL, NULL, NULL, N'KHÁCH SẠN VIỆT - ÚC', NULL, N'', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, N'#0006', N'', N'', N'', N'', N'ItemDetailKH_7.jpg')
INSERT [dbo].[ItemDetailKH] ([Id], [TenKH], [TenKHEn], [GroupItemId], [Code], [Name], [Price], [ShortDescription], [Description], [DescriptionEn], [IsActive], [IsDelete], [PathImage], [IsHome], [ViewPriority], [Price1], [ThoiLuong], [HanSuDung], [HienGG], [HienQC], [TitleI], [maso], [dongia], [baohanh], [quicach], [dacdiem], [image1]) VALUES (3, N'Chung cư LONG PHỤNG được thi công bởi tổng cty xd COSACO', N'LONG PHUNG APARTMENT', 0, NULL, NULL, NULL, N'Chung cư LONG PHỤNG', NULL, N'LONG PHUNG APARTMENT', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, N'#0003', N'', N'', N'', N'', N'ItemDetailKH_3.png')
INSERT [dbo].[ItemDetailKH] ([Id], [TenKH], [TenKHEn], [GroupItemId], [Code], [Name], [Price], [ShortDescription], [Description], [DescriptionEn], [IsActive], [IsDelete], [PathImage], [IsHome], [ViewPriority], [Price1], [ThoiLuong], [HanSuDung], [HienGG], [HienQC], [TitleI], [maso], [dongia], [baohanh], [quicach], [dacdiem], [image1]) VALUES (5, N'CHUNG CƯ LONG PHỤNG', N'LONG PHUNG APARTMENT', 0, NULL, NULL, NULL, N'CHUNG CƯ LONG PHỤNG', NULL, N'LONG PHUNG APARTMENT', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, N'#0004', N'', N'', N'', N'', N'ItemDetailKH_5.jpg')
INSERT [dbo].[ItemDetailKH] ([Id], [TenKH], [TenKHEn], [GroupItemId], [Code], [Name], [Price], [ShortDescription], [Description], [DescriptionEn], [IsActive], [IsDelete], [PathImage], [IsHome], [ViewPriority], [Price1], [ThoiLuong], [HanSuDung], [HienGG], [HienQC], [TitleI], [maso], [dongia], [baohanh], [quicach], [dacdiem], [image1]) VALUES (8, N'CÔNG TRÌNH KUALA LUMPUR MALAYSIA', N'KUALA LUMPUR MALAYSIA', 0, NULL, NULL, NULL, N'', NULL, N'KUALA LUMPUR MALAYSIA', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, N'#0008', N'', N'', N'', N'', N'ItemDetailKH_8.JPG')
SET IDENTITY_INSERT [dbo].[ItemDetailKH] OFF
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([Id], [Username], [FirstName], [LastName], [Sex], [DateOfBirth], [Email], [Telephone], [Address], [City], [State], [Country], [HashedPassword], [LastLogin], [RegisterDate], [Permission], [AverageRate], [Avatar], [ActivateCode], [IsActive], [CellPhone]) VALUES (1, N'admin', N'1', N'1', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'123456', CAST(0x00009EB00092077D AS DateTime), CAST(0x00009EB00092077D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Member] OFF
SET IDENTITY_INSERT [dbo].[NewsWeb] ON 

INSERT [dbo].[NewsWeb] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En]) VALUES (18, N'CÔNG NGHỆ CỐP PHA MỚI', N'news_18.jpg', N'', N'<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/P1050044.JPG" border="0" alt="" width="500" height="436" /></p>
<p> </p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/P1030160.JPG" border="0" alt="" width="505" height="411" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/111.jpg" border="0" alt="" width="508" height="346" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/112.jpg" border="0" alt="" width="507" height="374" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/113.jpg" border="0" alt="" width="507" height="375" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/114.jpg" border="0" alt="" width="508" height="374" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/115.jpg" border="0" alt="" width="509" height="368" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/116.jpg" border="0" alt="" width="504" height="381" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/118.JPG" border="0" alt="" width="511" height="371" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/120.JPG" border="0" alt="" width="509" height="372" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/121.JPG" border="0" alt="" width="510" height="367" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/123.JPG" border="0" alt="" width="512" height="368" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/125.JPG" border="0" alt="" width="512" height="381" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/130.JPG" border="0" alt="" width="510" height="362" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/135.JPG" border="0" alt="" width="508" height="366" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/149.JPG" border="0" alt="" width="511" height="369" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/144.JPG" border="0" alt="" width="515" height="391" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/151.JPG" border="0" alt="" width="518" height="390" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/2.JPG" border="0" alt="" width="516" height="380" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/3.JPG" border="0" alt="" width="515" height="372" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/4.JPG" border="0" alt="" width="519" height="396" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/10.JPG" border="0" alt="" width="514" height="394" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/12.JPG" border="0" alt="" width="515" height="358" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/13.JPG" border="0" alt="" width="513" height="404" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/28.JPG" border="0" alt="" width="507" height="388" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/apgq114.JPG" border="0" alt="" width="512" height="396" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/Cmmm115.JPG" border="0" alt="" width="508" height="388" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/124.JPG" border="0" alt="" width="508" height="379" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/126.jpg" border="0" alt="" width="509" height="402" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/127.jpg" border="0" alt="" width="506" height="386" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/128.jpg" border="0" alt="" width="503" height="361" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/131.JPG" border="0" alt="" width="506" height="359" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/133.JPG" border="0" alt="" width="505" height="351" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/134.JPG" border="0" alt="" width="509" height="429" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/FLIi3.JPG" border="0" alt="" width="513" height="368" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/14.JPG" border="0" alt="" width="512" height="391" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/16.JPG" border="0" alt="" width="514" height="393" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/20.JPG" border="0" alt="" width="513" height="385" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/23.JPG" border="0" alt="" width="513" height="366" /></p>
<p> </p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/EpaJ28.JPG" border="0" alt="" width="512" height="401" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/35.JPG" border="0" alt="" width="512" height="386" /></p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>', 1, CAST(0x00009EC400EABFA9 AS DateTime), CAST(0x00009EC400EABFA9 AS DateTime), 0, 0)
INSERT [dbo].[NewsWeb] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En]) VALUES (19, N'CÔNG NGHỆ 3D', N'news_19.JPG', N'', N'<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/Photo 001.jpg" border="0" alt="" width="528" height="345" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/Photo 003.jpg" border="0" alt="" width="527" height="379" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/Photo 004.jpg" border="0" alt="" width="526" height="359" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/Photo 010.jpg" border="0" alt="" width="521" height="381" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/Photo 023.jpg" border="0" alt="" width="521" height="383" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/Photo 032.JPG" border="0" alt="" width="524" height="374" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/Photo 035.JPG" border="0" alt="" width="522" height="355" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/Photo 038.JPG" border="0" alt="" width="521" height="357" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/011.JPG" border="0" alt="" width="521" height="372" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/012.JPG" border="0" alt="" width="520" height="399" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/014.JPG" border="0" alt="" width="518" height="382" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/020.JPG" border="0" alt="" width="518" height="357" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/035.JPG" border="0" alt="" width="517" height="384" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/047.JPG" border="0" alt="" width="518" height="356" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/053.JPG" border="0" alt="" width="517" height="340" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/062.JPG" border="0" alt="" width="522" height="355" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/007.JPG" border="0" alt="" width="522" height="370" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/008.JPG" border="0" alt="" width="520" height="378" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/CFpg020.JPG" border="0" alt="" width="519" height="406" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/037.JPG" border="0" alt="" width="519" height="374" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/038.JPG" border="0" alt="" width="518" height="354" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/048.jpg" border="0" alt="" width="517" height="394" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/iJqq053.JPG" border="0" alt="" width="517" height="384" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/056.JPG" border="0" alt="" width="516" height="384" /></p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>', 1, CAST(0x00009EC500C5AF7E AS DateTime), CAST(0x00009EC500C5AF7E AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[NewsWeb] OFF
SET IDENTITY_INSERT [dbo].[NewsWebINFO] ON 

INSERT [dbo].[NewsWebINFO] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En]) VALUES (1, N'1', NULL, N'MỘT SỐ HÌNH ẢNH HOẠT ĐỘNG VÀ SẢN PHẨM CỦA CÔNG TY THÀNH AN AN', N'<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/DSC00533.JPG" border="0" alt="" width="549" height="362" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/DSC00534.JPG" border="0" alt="" width="543" height="376" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/DSC00540.JPG" border="0" alt="" width="540" height="421" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/DSC00542.JPG" border="0" alt="" width="539" height="418" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/DSC00552.JPG" border="0" alt="" width="543" height="405" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/DSC00557.JPG" border="0" alt="" width="541" height="378" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/DSC00559.JPG" border="0" alt="" width="542" height="363" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/DSC01836.JPG" border="0" alt="" width="540" height="342" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/23032011235.jpg" border="0" alt="" width="541" height="381" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/230~7795.JPG" border="0" alt="" width="540" height="375" /></p>
<p><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/23032011237.jpg" border="0" alt="" width="538" height="366" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/23032011212.jpg" border="0" alt="" width="536" height="344" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/23032011222.jpg" border="0" alt="" width="536" height="367" /></p>
<p> </p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/DSC00559.JPG" border="0" alt="" width="536" height="354" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/1[1].jpg" border="0" alt="" width="535" height="362" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/3[1].jpg" border="0" alt="" width="537" height="366" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/450_apm_news_mal_jul_10_archidex_2010_1[1].jpg" border="0" alt="" width="535" height="377" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/5479[2].jpg" border="0" alt="" width="537" height="348" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/1804490319_21c6921ad7[1].jpg" border="0" alt="" width="533" height="371" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/Aalborg_Portland_525149x[1].jpg" border="0" alt="" width="537" height="366" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/ap_generel11[1].jpg" border="0" alt="" width="535" height="372" /></p>
<p> <img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/450_references_bench02[1].jpg" border="0" alt="" width="536" height="366" /></p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>
<p> </p>', 1, CAST(0x00009EC300B6FDBE AS DateTime), CAST(0x00009EC300B6FDBE AS DateTime), 0, 0)
INSERT [dbo].[NewsWebINFO] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En]) VALUES (2, N'en', NULL, N'tin moi tieng anh', N'', 1, CAST(0x00009EC300B6FDC2 AS DateTime), CAST(0x00009EC300B6FDC2 AS DateTime), 0, 0)
INSERT [dbo].[NewsWebINFO] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En]) VALUES (3, N'linhvuchoatdongviet', NULL, N'', N'<p><strong><span class="Apple-style-span" style="font-size: medium; word-spacing: 0px; text-transform: none; color: #000000; text-indent: 0px; font-family: ''Times New Roman''; white-space: normal; letter-spacing: normal; border-collapse: separate; font-size-adjust: none; font-stretch: normal; orphans: 2; widows: 2;"><span class="Apple-style-span" style="font-size: 16px; font-family: arial,sans-serif;"><span class="hps" title="Nhấp để xem bản dịch thay thế">- Xây dựng và dân dụng công nghiệp <br /><br />- Trang trí nội thất<br /><br />- San lấp mặt bằng<br /><br />- Kinh doanh vật liệu xây dựng</span></span></span></strong></p>
<p><strong><span class="Apple-style-span" style="font-size: medium; word-spacing: 0px; text-transform: none; color: #000000; text-indent: 0px; font-family: ''Times New Roman''; white-space: normal; letter-spacing: normal; border-collapse: separate; font-size-adjust: none; font-stretch: normal; orphans: 2; widows: 2;"><span class="Apple-style-span" style="font-size: 16px; font-family: arial,sans-serif;"><span class="hps" title="Nhấp để xem bản dịch thay thế"><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/DSCN1956.JPG" border="0" alt="" width="516" height="397" /></span></span></span></strong></p>
<p><strong><span class="Apple-style-span" style="font-size: medium; word-spacing: 0px; text-transform: none; color: #000000; text-indent: 0px; font-family: ''Times New Roman''; white-space: normal; letter-spacing: normal; border-collapse: separate; font-size-adjust: none; font-stretch: normal; orphans: 2; widows: 2;"><span class="Apple-style-span" style="font-size: 16px; font-family: arial,sans-serif;"><span class="hps" title="Nhấp để xem bản dịch thay thế"><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/DSCN1969.JPG" border="0" alt="" width="517" height="349" /></span></span></span></strong></p>
<p><strong><span class="Apple-style-span" style="font-size: medium; word-spacing: 0px; text-transform: none; color: #000000; text-indent: 0px; font-family: ''Times New Roman''; white-space: normal; letter-spacing: normal; border-collapse: separate; font-size-adjust: none; font-stretch: normal; orphans: 2; widows: 2;"><span class="Apple-style-span" style="font-size: 16px; font-family: arial,sans-serif;"><span class="hps" title="Nhấp để xem bản dịch thay thế"><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/DSCN2031.JPG" border="0" alt="" width="517" height="373" /></span></span></span></strong></p>
<p><strong><span class="Apple-style-span" style="font-size: medium; word-spacing: 0px; text-transform: none; color: #000000; text-indent: 0px; font-family: ''Times New Roman''; white-space: normal; letter-spacing: normal; border-collapse: separate; font-size-adjust: none; font-stretch: normal; orphans: 2; widows: 2;"><span class="Apple-style-span" style="font-size: 16px; font-family: arial,sans-serif;"><span class="hps" title="Nhấp để xem bản dịch thay thế"><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/DSCN1985.JPG" border="0" alt="" width="517" height="384" /></span></span></span></strong></p>
<p><strong><span class="Apple-style-span" style="font-size: medium; word-spacing: 0px; text-transform: none; color: #000000; text-indent: 0px; font-family: ''Times New Roman''; white-space: normal; letter-spacing: normal; border-collapse: separate; font-size-adjust: none; font-stretch: normal; orphans: 2; widows: 2;"></span></strong></p>
<p><strong><span class="Apple-style-span" style="font-size: medium; word-spacing: 0px; text-transform: none; color: #000000; text-indent: 0px; font-family: ''Times New Roman''; white-space: normal; letter-spacing: normal; border-collapse: separate; font-size-adjust: none; font-stretch: normal; orphans: 2; widows: 2;"><span class="Apple-style-span" style="font-size: 16px; font-family: arial,sans-serif;"><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/450_apm_news_mal_jul_10_archidex_2010_2[1].jpg" border="0" alt="" width="518" height="379" /></span></span></strong></p>
<p><strong><span style="font-size: small; font-family: Arial;"><img title="imgip" src="../jscripts/tiny_mce/plugins/eBizIcon/img/450_aw01[1].jpg" border="0" alt="" width="517" height="392" /></span></strong></p>
<p><strong></strong></p>
<p><strong></strong></p>
<p><strong></strong></p>
<p><strong></strong></p>
<p><strong></strong></p>
<p><strong></strong></p>
<p><strong></strong></p>
<p><strong></strong></p>', 1, CAST(0x00009EC300B6FDC3 AS DateTime), CAST(0x00009EC300B6FDC3 AS DateTime), 0, 0)
INSERT [dbo].[NewsWebINFO] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En]) VALUES (4, N'linhvuchoatdongvieten', NULL, N'', N'<p><strong><span class="Apple-style-span" style="word-spacing: 0px; font-style: normal; font-variant: normal; font-weight: normal; font-size: medium; line-height: normal; font-size-adjust: none; font-stretch: normal; text-transform: none; text-indent: 0px; white-space: normal; letter-spacing: normal; border-collapse: separate; orphans: 2; widows: 2; font-family: ''Times New Roman''; color: #000000;"><span class="Apple-style-span" style="font-size: 16px; font-family: arial,sans-serif;"><span class="hps" title="Nhấp để xem bản dịch thay thế">-</span><span class="Apple-converted-space"> </span><span class="hps" title="Nhấp để xem bản dịch thay thế">Civil</span><span class="Apple-converted-space"> </span><span class="hps" title="Nhấp để xem bản dịch thay thế">Construction</span><span class="Apple-converted-space"> </span><span class="hps" title="Nhấp để xem bản dịch thay thế">and</span><span class="Apple-converted-space"> </span><span class="hps" title="Nhấp để xem bản dịch thay thế">Industrial</span><br /><br /><span class="hps" title="Nhấp để xem bản dịch thay thế">-</span><span class="Apple-converted-space"> </span><span class="hps" title="Nhấp để xem bản dịch thay thế">Home Decor</span><br /><br /><span class="hps" title="Nhấp để xem bản dịch thay thế">-</span><span class="Apple-converted-space"> </span><span class="hps" title="Nhấp để xem bản dịch thay thế">Leveling</span><br /><br /><span class="hps" title="Nhấp để xem bản dịch thay thế">- Trading in</span><span class="Apple-converted-space"> </span><span class="hps" title="Nhấp để xem bản dịch thay thế">building materials</span></span></span></strong></p>', 1, CAST(0x00009EC300B6FDC5 AS DateTime), CAST(0x00009EC300B6FDC5 AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[NewsWebINFO] OFF
SET IDENTITY_INSERT [dbo].[NewsWebnb] ON 

INSERT [dbo].[NewsWebnb] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En]) VALUES (4, N'Đầu năm, giá vật liệu xây dựng tăng cao', NULL, N'', N'<h2 class="contentheading"><a class="contentpagetitle" href="http://congtruong.vn/index.php?option=com_content&amp;view=article&amp;id=753:u-nm-gia-vt-liu-xay-dng-tng-cao&amp;catid=1:vt-liu&amp;Itemid=32"> </a></h2>
<p style="text-align: justify;"><img style="float: left; margin-left: 5px; margin-right: 5px;" src="http://congtruong.vn/images/stories/vatlieu/k196.gif" border="0" alt="" /></p>
<p style="text-align: justify;">(Theo <a href="http://www.baodatviet.vn/" target="_blank">Đất Việt</a>)</p>
<p style="text-align: justify;">Đầu năm, tình hình xây dựng khá trầm lắng, trong khi đó giá liệu xây dựng lại thay đổi theo hướng tăng cao.</p>
<p style="text-align: justify;">Giá xi măng, gạch, cát, đặc biệt là sắt  thép tăng mạnh ngay khi các cửa hàng mở cửa trở lại sau những ngày nghỉ  tết. Bên cạnh những tác động chủ yếu từ bên ngoài như giá phôi thép,  thép phế (phụ thuộc vào nhập)  tăng cao, thì tỉ giá, giá điện (chiếm 5% -  7% giá thép), giá xăng dầu, phí vận chuyển… tăng đã góp  phần làm giá  sắt, thép đội lên cao. Còn xi măng, từ tháng 2, Tổng Công ty Công nghiệp  xi măng Việt Nam (Vicem) điều chỉnh giá bán tăng 60.000 đồng/tấn, khiến  thị trường VLXD ngay đầu năm cùng dắt nhau đi lên.<br /> <br /> Theo chủ  cửa hàng VLXD trên đường Hoàng Quốc Việt - Hà Nội, sắt thép vừa lên thêm  10% - 15%. Thép pi 10, pi 25 của Tập đoàn Thép Hòa Phát cuối năm 2010  là 100.000 đồng/cây và 693.000 đồng/cây,  nay đã lên 112.000 đồng/cây và  784.000 đồng/ cây, thép Việt - Úc pi25 cũng lên giá 780.000 đồng /cây.   Gạch và cát cũng nhích lên. Gạch xây đặc và gạch 2 lỗ loại A có giá  1.250đ/ viên, cát đen có giá 95.000 đồng /m3, cát vàng là 200.000  đồng  /m3.</p>
<p style="text-align: center;"><img src="http://congtruong.vn/images/stories/vatlieu/k197.gif" border="0" alt="" /></p>
<p style="text-align: justify;">Tuy giá cao, nhưng việc tiêu thụ lại hết  sức chậm. Chị Hồng Thu, quản lý Công ty cổ phần thép An Bình (26C Đường  Phạm Hùng - Mỹ Đình - Hà Nội) chia sẻ: “Với các công trình cũ thường đã  chuẩn bị vật liệu xây dựng từ trước Tết, còn  công trình sau Tết, người  dân đang nghe ngóng giá, chưa dám mua, nên lượng tiêu thụ không bao  nhiêu. So với cùng kỳ năm trước, năm nay, sản lượng tiêu thụ sắt thép  xây dựng của công ty chậm hơn nhiều”.<br /> <br /> Tỷ lệ nghịch với giá các  loại VLXD, thị trường xây dựng đầu năm chưa thật sự khởi động, dù đã vào  mùa. Các nhà thầu đều chung tâm trạng lo lằng trước tình hình xây dựng  trầm lắng. Anh Chương Đô, quản lý công trình ở La Khê - Hà Đông - Hà Nội  chia sẻ: “Vào mùa xây dựng đầu năm rồi mà công trình vẫn chưa nhiều,  tình hình xây dựng kém hơn hẳn năm trước.”.<br /> <br /> Một số chủ thầu xây  dựng khác thì mong ngóng và hy vọng tình hình xây dựng sẽ sôi động trở  lại vào tháng 3, khi mà giá VLXD dù có tăng cao thì nhà đầu tư lớn và cả  hộ lẻ đều có thể quen và chấp nhận mức giá mới.<br /> <br /> Đây cũng là  thông tin lạc quan từ ông Nguyễn Trí Cường, Chủ tịch Hiệp hội thép Việt  Nam: “Hiện giá nguyên liệu đầu vào của ngành thép bắt đầu có dấu hiệu  chững lại. Đây có thể coi là một tín hiệu tốt cho tình hình xây dựng  những tháng tới, khi mà giá vật liệu ổn định”, ông Cường nói.</p>', 1, CAST(0x00009ED300DFAA01 AS DateTime), CAST(0x00009ED300DFAA01 AS DateTime), 0, 0)
INSERT [dbo].[NewsWebnb] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En]) VALUES (3, N'sz', N'newsnb_3.jpg', N'Công ty TNHH XNK TM Thành An An 100% vốn nước ngoài nhập khẩu và cung cấp, phân phối độc quyền tại Việt Nam, sản phẩm của tập đoàn Châu âu, tập đoàn cimen trắng Aalborgportland Đan Mạch.   

 Bột trét SCI và Sơn Skimcem đã có tuổi thọ và sự ưa chuộng khá lâu ở Châu Âu cũng như nhiều nơi trên thế giới, với các tính năng vượt trội như:

- Bột trét tường trong nhà và ngoài trời dùng cho lớp đầu tiên chì cần trét lên không cần xả chống thấm, chống nứt, chịu nhiệt cao, không bong rộp, không có bụi trong lúc thi công.

- Bột trét ngoài cùng dùng trong nhà và ngoài trời, lớp này không cần chà nhám chỉ trét lên mà vẫn phẳng, bóng và chắc, bề mặt láng giống như tường đã sơn xong. Nếu muốn sơn để có màu thì rất ít hao sơn. không có bụi trong lúc thi công.

- Vữa xây được pha chế theo tiêu chuẩn kỹ thuật cao của Châu âu dùng thay thế xi măng và cát, phù hợp với mọi bề mặt bê tông và gạch.

- Keo dán ốp gạch không cần xi măng, có các tính năng chống thắm và độ dính cao.

- Sơn skimcem có các tính năng chống thắm, chống ẩm ướt rêu mốc.', N'<p>dd</p>', 1, CAST(0x00009ED200A6409A AS DateTime), CAST(0x00009ED200A6409A AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[NewsWebnb] OFF
SET IDENTITY_INSERT [dbo].[SPWeb] ON 

INSERT [dbo].[SPWeb] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En], [PriceSale], [Quantity], [ACuaHangId]) VALUES (27, N'spham cua hang 1', NULL, N'', N'', 2, CAST(0x0000A4050152E393 AS DateTime), CAST(0x0000A4050152E393 AS DateTime), 0, 0, 11222, 10, 1)
INSERT [dbo].[SPWeb] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En], [PriceSale], [Quantity], [ACuaHangId]) VALUES (28, N'ch 2 san pham 1', NULL, N'', N'', 14, CAST(0x0000A40501540151 AS DateTime), CAST(0x0000A40501540151 AS DateTime), 0, 0, 300000, 0, 2)
INSERT [dbo].[SPWeb] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En], [PriceSale], [Quantity], [ACuaHangId]) VALUES (29, N'saphm 2', NULL, N'', N'', 13, CAST(0x0000A40800BB67C9 AS DateTime), CAST(0x0000A40800BB67C9 AS DateTime), 0, 0, 15000, 15, 1)
INSERT [dbo].[SPWeb] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En], [PriceSale], [Quantity], [ACuaHangId]) VALUES (30, N'', NULL, NULL, NULL, NULL, CAST(0x0000A408010CCED5 AS DateTime), CAST(0x0000A408010CCED5 AS DateTime), 0, 0, NULL, 0, NULL)
INSERT [dbo].[SPWeb] ([Id], [Title], [ImageNews], [Shortdescription], [Description], [CateId], [DateCreate], [DateUpdate], [IsDelete], [En], [PriceSale], [Quantity], [ACuaHangId]) VALUES (31, N'dua tuoi', NULL, N'', N'', 2, CAST(0x0000A408010CDB5F AS DateTime), CAST(0x0000A408010CDB5F AS DateTime), 0, 0, 20000, 20, 1)
SET IDENTITY_INSERT [dbo].[SPWeb] OFF
SET IDENTITY_INSERT [dbo].[ThuVien] ON 

INSERT [dbo].[ThuVien] ([Id], [product_id], [proimage], [proimage_thumb], [comment]) VALUES (8, 7, N'thuvien_8.jpg', NULL, N'')
INSERT [dbo].[ThuVien] ([Id], [product_id], [proimage], [proimage_thumb], [comment]) VALUES (9, 7, N'thuvien_9.jpg', NULL, N'')
INSERT [dbo].[ThuVien] ([Id], [product_id], [proimage], [proimage_thumb], [comment]) VALUES (3, 7, N'thuvien_3.jpg', NULL, N'')
INSERT [dbo].[ThuVien] ([Id], [product_id], [proimage], [proimage_thumb], [comment]) VALUES (6, 7, N'thuvien_6.jpg', NULL, N'')
INSERT [dbo].[ThuVien] ([Id], [product_id], [proimage], [proimage_thumb], [comment]) VALUES (7, 7, N'thuvien_7.jpg', NULL, N'')
SET IDENTITY_INSERT [dbo].[ThuVien] OFF
SET IDENTITY_INSERT [dbo].[USER_INFO_IMAGES] ON 

INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(5 AS Numeric(18, 0)), 1, N'1_20131212193653.jpg', N'vớ', NULL)
INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(7 AS Numeric(18, 0)), 4, N'4_20131212195223.jpg', N'', NULL)
INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(8 AS Numeric(18, 0)), 4, N'4_20131212195228.jpg', N'', NULL)
INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(9 AS Numeric(18, 0)), 4, N'4_20131212195232.jpg', N'', NULL)
INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(12 AS Numeric(18, 0)), 1, N'1_20131212214626.jpg', N'', NULL)
INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(11 AS Numeric(18, 0)), 7, N'7_20131212214320.jpg', N'', NULL)
INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(15 AS Numeric(18, 0)), 5, N'5_20131213064549.jpg', N'', NULL)
INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(17 AS Numeric(18, 0)), 9, N'9_20131213065108.jpg', N'', NULL)
INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(19 AS Numeric(18, 0)), 1, N'1_20131215083200.jpg', N'', NULL)
INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(10 AS Numeric(18, 0)), 7, N'7_20131212214316.jpg', N'', NULL)
INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(13 AS Numeric(18, 0)), 1, N'1_20131212215115.jpg', N'', NULL)
INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(14 AS Numeric(18, 0)), 2, N'2_20131212234101.jpg', N'', NULL)
INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(16 AS Numeric(18, 0)), 8, N'8_20131213064726.jpg', N'', NULL)
INSERT [dbo].[USER_INFO_IMAGES] ([ID], [USER_INFO_ID], [IMAGE1], [MOTA], [USER_INFO_GUID_ID]) VALUES (CAST(18 AS Numeric(18, 0)), 3, N'3_20131213065211.jpg', N'', NULL)
SET IDENTITY_INSERT [dbo].[USER_INFO_IMAGES] OFF
ALTER TABLE [dbo].[ACuaHang] ADD  CONSTRAINT [DF_ACuaHang_DateCreate]  DEFAULT (getdate()) FOR [DateCreate]
GO
ALTER TABLE [dbo].[ADonHang] ADD  CONSTRAINT [DF_ADonHang_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
ALTER TABLE [dbo].[ADonHangDV] ADD  CONSTRAINT [DF_AGiaoDichDV_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
ALTER TABLE [dbo].[AGiaoDichNapTien] ADD  CONSTRAINT [DF_AGiaoDichNapTien_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
ALTER TABLE [dbo].[AGioHangTemp] ADD  CONSTRAINT [DF_AGioHangTemp_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
ALTER TABLE [dbo].[ALichSuVaoRa] ADD  CONSTRAINT [DF_ALichSuVaoRa_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
ALTER TABLE [dbo].[ANhanVien] ADD  CONSTRAINT [DF_ANhanVien_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
ALTER TABLE [dbo].[APhieuNhapKho] ADD  CONSTRAINT [DF_APhieuNhapKho_DateCreate]  DEFAULT (getdate()) FOR [date_create]
GO
ALTER TABLE [dbo].[Aport] ADD  CONSTRAINT [DF_Aport_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
ALTER TABLE [dbo].[ATaiKhoan] ADD  CONSTRAINT [DF_ATaiKhoan_SoTien]  DEFAULT ((0)) FOR [SoTien]
GO
ALTER TABLE [dbo].[ATaiKhoan] ADD  CONSTRAINT [DF_ATaiKhoan_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
ALTER TABLE [dbo].[ATheThanhVien] ADD  CONSTRAINT [DF_ATheThanhVien_NgayCap]  DEFAULT (getdate()) FOR [NgayCap]
GO
ALTER TABLE [dbo].[ATheThanhVien] ADD  CONSTRAINT [DF_ATheThanhVien_Islock]  DEFAULT ((1)) FOR [Islock]
GO
ALTER TABLE [dbo].[ATheThanhVien] ADD  CONSTRAINT [DF_ATheThanhVien_date_create]  DEFAULT (getdate()) FOR [date_create]
GO
ALTER TABLE [dbo].[BuyItemList] ADD  CONSTRAINT [DF_GioHangList_DateCreate]  DEFAULT (getdate()) FOR [DateCreate]
GO
ALTER TABLE [dbo].[BuyItemList] ADD  CONSTRAINT [DF_GioHangList_IsView]  DEFAULT ((0)) FOR [IsView]
GO
ALTER TABLE [dbo].[CateType] ADD  CONSTRAINT [DF_CateType_Type]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[CateType] ADD  CONSTRAINT [DF_CateType_stt]  DEFAULT ((1)) FOR [stt]
GO
ALTER TABLE [dbo].[CateType] ADD  CONSTRAINT [aDF_MyProduct_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[CateType] ADD  CONSTRAINT [aDF_MyProduct_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[CateType] ADD  CONSTRAINT [DF_CateType_parid]  DEFAULT ((0)) FOR [parid]
GO
ALTER TABLE [dbo].[CateTypeDoiTac] ADD  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[CateTypeDoiTac] ADD  DEFAULT ((1)) FOR [stt]
GO
ALTER TABLE [dbo].[CateTypeDoiTac] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[CateTypeDoiTac] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[CateTypeDoiTac] ADD  DEFAULT ((0)) FOR [parid]
GO
ALTER TABLE [dbo].[CateTypeParent] ADD  CONSTRAINT [DF_CateType_Type1]  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[CateTypeParent] ADD  CONSTRAINT [DF_CateType_stt1]  DEFAULT ((1)) FOR [stt]
GO
ALTER TABLE [dbo].[CateTypeParent] ADD  CONSTRAINT [aDF_MyPsroduct_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[CateTypeParent] ADD  CONSTRAINT [aDF_MyPsroduct_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[CateTypeParent] ADD  CONSTRAINT [DF_CassteType_parid]  DEFAULT ((0)) FOR [parid]
GO
ALTER TABLE [dbo].[ClientInfo] ADD  CONSTRAINT [DF_UserInfo_Create1Date]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ClientInfo] ADD  CONSTRAINT [DF_UserInfo_UpdateD1ate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_DateCreate]  DEFAULT (getdate()) FOR [DateCreate]
GO
ALTER TABLE [dbo].[FileDownload] ADD  CONSTRAINT [awDF_MyProduct_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[FileDownload] ADD  CONSTRAINT [aDwF_MyProduct_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[GioGiaoHang] ADD  CONSTRAINT [DF_GioGiaoHang_stt]  DEFAULT ((1)) FOR [stt]
GO
ALTER TABLE [dbo].[GioiThieu] ADD  DEFAULT (getdate()) FOR [DateCreate]
GO
ALTER TABLE [dbo].[GioiThieu] ADD  DEFAULT (getdate()) FOR [DateUpdate]
GO
ALTER TABLE [dbo].[GioiThieu] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[GioiThieu] ADD  DEFAULT ((0)) FOR [En]
GO
ALTER TABLE [dbo].[GroupItem] ADD  CONSTRAINT [DF_GroupItem_ViewPriority]  DEFAULT ((0)) FOR [ViewPriority]
GO
ALTER TABLE [dbo].[ItemDetail] ADD  CONSTRAINT [DF_ItemDetail_IsHome]  DEFAULT ((0)) FOR [IsHome]
GO
ALTER TABLE [dbo].[ItemDetail] ADD  CONSTRAINT [DF_ItemDetail_HienQC]  DEFAULT ((0)) FOR [HienGG]
GO
ALTER TABLE [dbo].[ItemDetail] ADD  CONSTRAINT [DF_ItemDetail_HienKM]  DEFAULT ((0)) FOR [HienQC]
GO
ALTER TABLE [dbo].[ItemDetailKH] ADD  CONSTRAINT [DF_ItemDeeteail_IsHome]  DEFAULT ((0)) FOR [IsHome]
GO
ALTER TABLE [dbo].[ItemDetailKH] ADD  CONSTRAINT [DF_ItemDeetail_HienQC]  DEFAULT ((0)) FOR [HienGG]
GO
ALTER TABLE [dbo].[ItemDetailKH] ADD  CONSTRAINT [DF_ItemDeetail_HienKM]  DEFAULT ((0)) FOR [HienQC]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_LastLogin]  DEFAULT (getdate()) FOR [LastLogin]
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Member_RegisterDate]  DEFAULT (getdate()) FOR [RegisterDate]
GO
ALTER TABLE [dbo].[NewsHot] ADD  CONSTRAINT [DF_NewsHot_DateCreate]  DEFAULT (getdate()) FOR [DateCreate]
GO
ALTER TABLE [dbo].[NewsHot] ADD  CONSTRAINT [DF_NewsHot_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[NewsHot] ADD  CONSTRAINT [DF_NewsHot_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[NewsHot] ADD  CONSTRAINT [DF_NewsHot_ViewPriority]  DEFAULT ((0)) FOR [ViewPriority]
GO
ALTER TABLE [dbo].[NewsHot] ADD  CONSTRAINT [DF_NewsHot_IsHome]  DEFAULT ((0)) FOR [IsHome]
GO
ALTER TABLE [dbo].[NewsHot] ADD  CONSTRAINT [DF_NewsHot_GroupId]  DEFAULT ((0)) FOR [GroupId]
GO
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_DateCreate1]  DEFAULT (getdate()) FOR [DateCreate]
GO
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_IsActive1]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_IsDelete1]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_ViewPriority1]  DEFAULT ((0)) FOR [ViewPriority]
GO
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_IsHome1]  DEFAULT ((0)) FOR [IsHome]
GO
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_GroupId1]  DEFAULT ((0)) FOR [GroupId]
GO
ALTER TABLE [dbo].[NewsHotTwo] ADD  CONSTRAINT [DF_NewsHot_GroupId11]  DEFAULT ((0)) FOR [ParId]
GO
ALTER TABLE [dbo].[NewsWeb] ADD  CONSTRAINT [vaDF_MyProduct_CreateDate]  DEFAULT (getdate()) FOR [DateCreate]
GO
ALTER TABLE [dbo].[NewsWeb] ADD  CONSTRAINT [vaDF_MyProduct_UpdateDate]  DEFAULT (getdate()) FOR [DateUpdate]
GO
ALTER TABLE [dbo].[NewsWeb] ADD  CONSTRAINT [DF_NewsWeb_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[NewsWeb] ADD  CONSTRAINT [DF_NewsWeb_En]  DEFAULT ((0)) FOR [En]
GO
ALTER TABLE [dbo].[NewsWebINFO] ADD  CONSTRAINT [vaDF_MyPqroduct_CreateDate]  DEFAULT (getdate()) FOR [DateCreate]
GO
ALTER TABLE [dbo].[NewsWebINFO] ADD  CONSTRAINT [vaDF_MyProqduct_UpdateDate]  DEFAULT (getdate()) FOR [DateUpdate]
GO
ALTER TABLE [dbo].[NewsWebINFO] ADD  CONSTRAINT [DF_NewsWqeb_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[NewsWebINFO] ADD  CONSTRAINT [DF_NewsWeqb_En]  DEFAULT ((0)) FOR [En]
GO
ALTER TABLE [dbo].[NewsWebnb] ADD  DEFAULT (getdate()) FOR [DateCreate]
GO
ALTER TABLE [dbo].[NewsWebnb] ADD  DEFAULT (getdate()) FOR [DateUpdate]
GO
ALTER TABLE [dbo].[NewsWebnb] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[NewsWebnb] ADD  DEFAULT ((0)) FOR [En]
GO
ALTER TABLE [dbo].[SPWeb] ADD  CONSTRAINT [vaD2F_MyProduct_CreateDate]  DEFAULT (getdate()) FOR [DateCreate]
GO
ALTER TABLE [dbo].[SPWeb] ADD  CONSTRAINT [vaD2F_MyProduct_UpdateDate]  DEFAULT (getdate()) FOR [DateUpdate]
GO
ALTER TABLE [dbo].[SPWeb] ADD  CONSTRAINT [DF_New2sWeb_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[SPWeb] ADD  CONSTRAINT [DF_Ne2wsWeb_En]  DEFAULT ((0)) FOR [En]
GO
ALTER TABLE [dbo].[SPWeb] ADD  CONSTRAINT [DF_SPWeb_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
USE [master]
GO
ALTER DATABASE [DB_AUTO] SET  READ_WRITE 
GO
