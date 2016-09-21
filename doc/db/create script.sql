USE [master]
GO

/****** Object:  Database [BlueHr]    Script Date: 09/22/2016 05:51:37 ******/
CREATE DATABASE [BlueHr] ON  PRIMARY 
( NAME = N'BlueHr', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER20082\MSSQL\DATA\BlueHr.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BlueHr_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER20082\MSSQL\DATA\BlueHr_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [BlueHr] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlueHr].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [BlueHr] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [BlueHr] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [BlueHr] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [BlueHr] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [BlueHr] SET ARITHABORT OFF 
GO

ALTER DATABASE [BlueHr] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [BlueHr] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [BlueHr] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [BlueHr] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [BlueHr] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [BlueHr] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [BlueHr] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [BlueHr] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [BlueHr] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [BlueHr] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [BlueHr] SET  DISABLE_BROKER 
GO

ALTER DATABASE [BlueHr] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [BlueHr] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [BlueHr] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [BlueHr] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [BlueHr] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [BlueHr] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [BlueHr] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [BlueHr] SET  READ_WRITE 
GO

ALTER DATABASE [BlueHr] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [BlueHr] SET  MULTI_USER 
GO

ALTER DATABASE [BlueHr] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [BlueHr] SET DB_CHAINING OFF 
GO


