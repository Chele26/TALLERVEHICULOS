USE [master]
GO
/****** Object:  Database [CARSSV]    Script Date: 3/9/2024 13:08:38 ******/
CREATE DATABASE [CARSSV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CARSSV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CARSSV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CARSSV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CARSSV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CARSSV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CARSSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CARSSV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CARSSV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CARSSV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CARSSV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CARSSV] SET ARITHABORT OFF 
GO
ALTER DATABASE [CARSSV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CARSSV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CARSSV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CARSSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CARSSV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CARSSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CARSSV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CARSSV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CARSSV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CARSSV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CARSSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CARSSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CARSSV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CARSSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CARSSV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CARSSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CARSSV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CARSSV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CARSSV] SET  MULTI_USER 
GO
ALTER DATABASE [CARSSV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CARSSV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CARSSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CARSSV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CARSSV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CARSSV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CARSSV] SET QUERY_STORE = OFF
GO
USE [CARSSV]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/9/2024 13:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 3/9/2024 13:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sells]    Script Date: 3/9/2024 13:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sells](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SellTotal] [float] NOT NULL,
	[Amount] [int] NOT NULL,
	[VehicleId] [int] NOT NULL,
 CONSTRAINT [PK_Sells] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 3/9/2024 13:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Year] [int] NOT NULL,
	[Doors] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Sells_VehicleId]    Script Date: 3/9/2024 13:08:38 ******/
CREATE NONCLUSTERED INDEX [IX_Sells_VehicleId] ON [dbo].[Sells]
(
	[VehicleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Vehicles_BrandId]    Script Date: 3/9/2024 13:08:38 ******/
CREATE NONCLUSTERED INDEX [IX_Vehicles_BrandId] ON [dbo].[Vehicles]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sells]  WITH CHECK ADD  CONSTRAINT [FK_Sells_Vehicles_VehicleId] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sells] CHECK CONSTRAINT [FK_Sells_Vehicles_VehicleId]
GO
ALTER TABLE [dbo].[Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_Vehicles_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vehicles] CHECK CONSTRAINT [FK_Vehicles_Brands_BrandId]
GO
USE [master]
GO
ALTER DATABASE [CARSSV] SET  READ_WRITE 
GO
