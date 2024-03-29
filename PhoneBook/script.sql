USE [master]
GO
/****** Object:  Database [PhoneBookDb]    Script Date: 31.01.2019 15:42:15 ******/
CREATE DATABASE [PhoneBookDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PhoneBookDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PhoneBookDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PhoneBookDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PhoneBookDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PhoneBookDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PhoneBookDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PhoneBookDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PhoneBookDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PhoneBookDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PhoneBookDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PhoneBookDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [PhoneBookDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PhoneBookDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PhoneBookDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PhoneBookDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PhoneBookDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PhoneBookDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PhoneBookDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PhoneBookDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PhoneBookDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PhoneBookDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PhoneBookDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PhoneBookDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PhoneBookDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PhoneBookDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PhoneBookDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PhoneBookDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PhoneBookDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PhoneBookDb] SET RECOVERY FULL 
GO
ALTER DATABASE [PhoneBookDb] SET  MULTI_USER 
GO
ALTER DATABASE [PhoneBookDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PhoneBookDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PhoneBookDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PhoneBookDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PhoneBookDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PhoneBookDb', N'ON'
GO
ALTER DATABASE [PhoneBookDb] SET QUERY_STORE = OFF
GO
USE [PhoneBookDb]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 31.01.2019 15:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (14, N'emre', N'kara', N'+90 (555) 264-27-84', CAST(N'2019-01-30T20:25:56.947' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (16, N'mehmet', N'şahin', N'+90 (555) 906-87-17', CAST(N'2019-01-30T20:28:19.047' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (17, N'hasan', N'tekin', N'+90 (555) 391-03-27', CAST(N'2019-01-30T20:29:13.090' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (18, N'hüseyin', N'sarı', N'+90 (555) 243-37-10', CAST(N'2019-01-30T20:32:50.873' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (19, N'salih', N'çetinkaya', N'+90 (555) 009-99-87', CAST(N'2019-01-30T20:34:31.470' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (20, N'mahmut', N'alkaç', N'+90 (555) 847-65-47', CAST(N'2019-01-30T20:35:12.593' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (21, N'ayşe', N'yazıcı', N'+90 (555) 389-71-64', CAST(N'2019-01-30T20:36:14.300' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (22, N'fatma', N'güçlü', N'+90 (555) 187-89-70', CAST(N'2019-01-30T20:36:35.863' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (23, N'taner', N'uyar', N'+90 (555) 798-54-62', CAST(N'2019-01-30T20:37:02.750' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (24, N'erdal', N'kara', N'+90 (555) 898-78-66', CAST(N'2019-01-30T20:40:36.507' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (25, N'ekrem', N'demir', N'+90 (555) 132-78-05', CAST(N'2019-01-30T20:40:58.843' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (26, N'emin', N'şanlı', N'+90 (555) 959-01-43', CAST(N'2019-01-30T20:43:12.273' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (27, N'yavuz', N'yüzbaşı', N'+90 (555) 212-18-21', CAST(N'2019-01-30T20:46:01.920' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (28, N'şenol', N'öztürk', N'+90 (555) 204-07-07', CAST(N'2019-01-30T20:47:54.413' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (35, N'mustafa', N'tüten', N'+90 (555) 405-20-14', CAST(N'2019-01-30T20:49:55.000' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (36, N'mert', N'erkuran', N'+90 (555) 640-88-42', CAST(N'2019-01-30T20:51:33.980' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (37, N'amine', N'çevik', N'+90 (555) 542-47-40', CAST(N'2019-01-30T20:52:03.800' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (38, N'makbule', N'kandemir', N'+90 (555) 555-55-65', CAST(N'2019-01-30T20:54:18.913' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (40, N'Turgut', N'Kaplan', N'+90 (555) 123-23-12', CAST(N'2019-01-31T13:54:36.507' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (41, N'Ziya', N'Gökalp', N'+90 (532) 235-45-45', CAST(N'2019-01-31T14:01:18.563' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (42, N'Zafer', N'Ağa', N'+90 (512) 524-52-48', CAST(N'2019-01-31T14:02:48.970' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (43, N'Sadık', N'Bosnalı', N'+90 (555) 457-88-85', CAST(N'2019-01-31T14:04:14.117' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (44, N'Remzi', N'Uçar', N'+90 (555) 874-88-44', CAST(N'2019-01-31T14:05:01.050' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (45, N'Ramazan', N'Karataş', N'+90 (555) 458-59-21', CAST(N'2019-01-31T14:06:57.337' AS DateTime))
INSERT [dbo].[Contacts] ([Id], [FirstName], [LastName], [PhoneNumber], [CreatedTime]) VALUES (46, N'Oktay', N'Demir', N'+90 (515) 415-45-45', CAST(N'2019-01-31T14:11:45.277' AS DateTime))
SET IDENTITY_INSERT [dbo].[Contacts] OFF
USE [master]
GO
ALTER DATABASE [PhoneBookDb] SET  READ_WRITE 
GO
