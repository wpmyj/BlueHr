USE [master]
GO
/****** Object:  Database [BlueHr]    Script Date: 09/12/2016 18:57:20 ******/
CREATE DATABASE [BlueHr] ON  PRIMARY 
( NAME = N'BlueHr', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER2008R\MSSQL\DATA\BlueHr.mdf' , SIZE = 772096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BlueHr_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER2008R\MSSQL\DATA\BlueHr_log.ldf' , SIZE = 241216KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
USE [BlueHr]
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shift](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[startAt] [time](7) NOT NULL,
	[endAt] [time](7) NOT NULL,
	[shiftType] [int] NOT NULL,
	[remark] [varchar](255) NULL,
 CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResignType]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResignType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[remark] [varchar](255) NULL,
 CONSTRAINT [PK_ResignType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuartzJob]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuartzJob](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cronSchedule] [text] NULL,
	[params] [text] NULL,
	[jobType] [int] NULL,
 CONSTRAINT [PK_QuartzJob] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[pwd] [varchar](255) NOT NULL,
	[isLocked] [bit] NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaskRound]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskRound](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskStatus] [int] NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[taskType] [int] NOT NULL,
	[finishAt] [datetime] NULL,
	[result] [text] NULL,
	[uuid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TaskRound] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemSetting]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemSetting](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[daysBeforeAlertStaffGoFull] [float] NULL,
	[goFullAlertMails] [text] NULL,
	[unCertifacteAlertMails] [text] NULL,
	[attendanceExceptionAlertMails] [text] NULL,
	[repeatAttendanceRecordTime] [float] NULL,
	[validAttendanceRecordTime] [float] NULL,
	[lateExceptionTime] [float] NULL,
	[earlyLeaveExceptionTime] [float] NULL,
	[systemHost] [varchar](50) NULL,
	[emaiSMTPHost] [varchar](50) NULL,
	[emailUser] [varchar](50) NULL,
	[emailPwd] [varchar](50) NULL,
	[emailAddress] [varchar](50) NULL,
 CONSTRAINT [PK_SystemSetting] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StaffType]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaffType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[remark] [varchar](255) NULL,
 CONSTRAINT [PK_StaffType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DegreeType]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DegreeType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[remark] [varchar](255) NULL,
 CONSTRAINT [PK_DegreeType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[remark] [varchar](255) NULL,
	[address] [text] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CertificateType]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CertificateType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[remark] [varchar](255) NULL,
	[isSystem] [bit] NOT NULL,
	[isNecessary] [bit] NOT NULL,
	[systemCode] [int] NULL,
 CONSTRAINT [PK_CertificateType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InsureType]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InsureType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[remark] [varchar](255) NULL,
 CONSTRAINT [PK_InsureType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MessageRecord]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MessageRecord](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[staffNr] [varchar](200) NULL,
	[operatorId] [int] NULL,
	[messageType] [int] NULL,
	[createdAt] [datetime] NULL,
	[text] [text] NULL,
	[isRead] [bit] NULL,
	[isHandled] [bit] NULL,
	[uniqString] [varchar](255) NULL,
	[messageCategory] [int] NULL,
 CONSTRAINT [PK_MessageRecord] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobTitle]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobTitle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[remark] [varchar](255) NULL,
 CONSTRAINT [PK_JobTitle] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AbsenceType]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AbsenceType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[remark] [varchar](255) NULL,
 CONSTRAINT [PK_AbsenceType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExtraWorkType]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExtraWorkType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[remark] [varchar](255) NULL,
 CONSTRAINT [PK_ExtraWorkType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[remark] [varchar](255) NULL,
	[companyId] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobCertificate]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobCertificate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[jobTitleId] [int] NOT NULL,
	[certificateTypeId] [int] NOT NULL,
 CONSTRAINT [PK_JobCertificate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[nr] [varchar](200) NOT NULL,
	[name] [varchar](50) NULL,
	[sex] [varchar](10) NULL,
	[birthday] [datetime] NULL,
	[ethnic] [varchar](50) NULL,
	[firstCompanyEmployAt] [datetime] NULL,
	[totalCompanySeniority] [float] NULL,
	[companyEmployAt] [datetime] NULL,
	[companySeniority] [float] NULL,
	[workStatus] [int] NOT NULL,
	[isOnTrial] [bit] NOT NULL,
	[trialOverAt] [datetime] NULL,
	[companyId] [int] NULL,
	[departmentId] [int] NULL,
	[jobTitleId] [int] NULL,
	[photo] [text] NULL,
	[staffTypeId] [int] NULL,
	[degreeTypeId] [int] NULL,
	[speciality] [varchar](200) NULL,
	[residenceAddress] [varchar](200) NULL,
	[address] [varchar](200) NULL,
	[id] [varchar](200) NOT NULL,
	[isIdChecked] [bit] NOT NULL,
	[phone] [varchar](50) NULL,
	[contactName] [varchar](50) NULL,
	[contactPhone] [varchar](50) NULL,
	[contactFamilyMemberType] [varchar](50) NULL,
	[domicile] [varchar](50) NULL,
	[residenceType] [int] NULL,
	[insureTypeId] [int] NULL,
	[isPayCPF] [bit] NOT NULL,
	[contractExpireAt] [date] NULL,
	[contractCount] [int] NULL,
	[totalSeniority] [float] NULL,
	[remark] [text] NULL,
	[workingYearsAt] [datetime] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[nr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FullMemberRecord]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FullMemberRecord](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[staffNr] [varchar](200) NOT NULL,
	[isPassCheck] [bit] NOT NULL,
	[beFullAt] [datetime] NULL,
	[checkAt] [datetime] NULL,
	[beFullChecker] [varchar](50) NULL,
	[checkScore] [float] NULL,
	[remark] [text] NULL,
 CONSTRAINT [PK_FullMemberRecord] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FamilyMemeber]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FamilyMemeber](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[memberName] [varchar](50) NOT NULL,
	[familyMemberType] [varchar](50) NULL,
	[birthday] [datetime] NULL,
	[staffNr] [varchar](200) NULL,
 CONSTRAINT [PK_FamilyMemeber] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExtraWorkRecord]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExtraWorkRecord](
	[id] [int] NOT NULL,
	[extraWorkTypeId] [int] NOT NULL,
	[staffNr] [varchar](200) NOT NULL,
	[duration] [float] NOT NULL,
	[durationType] [int] NOT NULL,
	[otReason] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AbsenceRecrod]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AbsenceRecrod](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[absenceTypeId] [int] NOT NULL,
	[staffNr] [varchar](200) NOT NULL,
	[duration] [float] NOT NULL,
	[durationType] [int] NOT NULL,
	[remark] [varchar](255) NULL,
	[absenceDate] [datetime] NULL,
 CONSTRAINT [PK_AbsenceRecrod] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AttendanceRecordCal]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttendanceRecordCal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[staffNr] [varchar](200) NOT NULL,
	[oriWorkingHour] [float] NOT NULL,
	[attendanceDate] [datetime] NOT NULL,
	[actWorkingHour] [float] NOT NULL,
	[remark] [text] NULL,
	[createdAt] [datetime] NOT NULL,
	[isManualCal] [bit] NOT NULL,
	[isException] [bit] NOT NULL,
	[exceptionCodes] [text] NULL,
	[isExceptionHandled] [bit] NULL,
 CONSTRAINT [PK_AttendanceRecordCal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [NONCLUSTERED_KEY_StaffNrAsc_AttendanceDateDesc] ON [dbo].[AttendanceRecordCal] 
(
	[staffNr] ASC,
	[attendanceDate] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttendanceRecordDetail]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttendanceRecordDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[staffNr] [varchar](200) NOT NULL,
	[recordAt] [datetime] NOT NULL,
	[createdAt] [datetime] NULL,
	[soureType] [varchar](200) NOT NULL,
	[isCalculated] [bit] NOT NULL,
	[device] [varchar](50) NULL,
 CONSTRAINT [PK_AttendanceRecordDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [NONCLUSTERED_KEY_StaffNrAsc_RecrodAtDesc] ON [dbo].[AttendanceRecordDetail] 
(
	[staffNr] ASC,
	[recordAt] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Certificate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[staffNr] [varchar](200) NOT NULL,
	[certificateTypeId] [int] NOT NULL,
	[certiLevel] [varchar](50) NULL,
	[effectiveFrom] [datetime] NULL,
	[effectiveEnd] [datetime] NULL,
	[institution] [varchar](200) NULL,
	[remark] [text] NULL,
 CONSTRAINT [PK_Certificate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankCard]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankCard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nr] [varchar](50) NOT NULL,
	[bank] [varchar](50) NULL,
	[bankAddress] [varchar](50) NULL,
	[remark] [varchar](255) NULL,
	[isDefault] [bit] NOT NULL,
	[staffNr] [varchar](200) NOT NULL,
 CONSTRAINT [PK_BankCard] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShiftSchedule]    Script Date: 09/12/2016 18:57:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShiftSchedule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[shiftId] [int] NOT NULL,
	[staffNr] [varchar](200) NOT NULL,
	[scheduleAt] [date] NOT NULL,
 CONSTRAINT [PK_ShiftSchedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [NONCLUSTERED_KEY_ScheduleAtAsc] ON [dbo].[ShiftSchedule] 
(
	[scheduleAt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MessageRecordView]    Script Date: 09/12/2016 18:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MessageRecordView]
AS
SELECT     dbo.MessageRecord.id, dbo.MessageRecord.staffNr, dbo.MessageRecord.operatorId, dbo.MessageRecord.messageType, dbo.MessageRecord.createdAt, 
                      dbo.MessageRecord.text, dbo.MessageRecord.isRead, dbo.MessageRecord.isHandled, dbo.MessageRecord.messageCategory, dbo.MessageRecord.uniqString, 
                      dbo.[User].name AS operatorName, dbo.[User].email AS operatorEmail, dbo.Staff.name AS staffName
FROM         dbo.MessageRecord LEFT OUTER JOIN
                      dbo.[User] ON dbo.MessageRecord.operatorId = dbo.[User].id LEFT OUTER JOIN
                      dbo.Staff ON dbo.MessageRecord.staffNr = dbo.Staff.nr
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[43] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MessageRecord"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 305
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 102
               Left = 235
               Bottom = 221
               Right = 377
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Staff"
            Begin Extent = 
               Top = 6
               Left = 415
               Bottom = 361
               Right = 632
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4230
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MessageRecordView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'MessageRecordView'
GO
/****** Object:  Table [dbo].[ResignRecord]    Script Date: 09/12/2016 18:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResignRecord](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[resignTypeId] [int] NOT NULL,
	[staffNr] [varchar](200) NOT NULL,
	[resignAt] [datetime] NOT NULL,
	[resignChecker] [varchar](50) NULL,
	[remark] [text] NULL,
 CONSTRAINT [PK_ResignRecord] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ShiftScheduleView]    Script Date: 09/12/2016 18:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ShiftScheduleView]
AS
SELECT     dbo.ShiftSchedule.id, dbo.ShiftSchedule.staffNr, dbo.ShiftSchedule.scheduleAt, dbo.ShiftSchedule.shiftId, dbo.Shift.code, dbo.Shift.name, dbo.Shift.startAt, 
                      dbo.Shift.endAt, dbo.Shift.shiftType, dbo.Shift.remark, CONVERT(DATETIME, dbo.ShiftSchedule.scheduleAt) + CONVERT(DATETIME, dbo.Shift.startAt) AS fullStartAt, 
                      CONVERT(DATETIME, dbo.ShiftSchedule.scheduleAt) + (CASE dbo.Shift.shiftType WHEN 100 THEN 0 WHEN 200 THEN 1 END) + CONVERT(DATETIME, dbo.Shift.endAt) 
                      AS fullEndAt
FROM         dbo.Shift INNER JOIN
                      dbo.ShiftSchedule ON dbo.Shift.id = dbo.ShiftSchedule.shiftId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[37] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Shift"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 201
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShiftSchedule"
            Begin Extent = 
               Top = 6
               Left = 218
               Bottom = 254
               Right = 412
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2370
         Table = 3000
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ShiftScheduleView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ShiftScheduleView'
GO
/****** Object:  View [dbo].[AttendanceRecordDetailView]    Script Date: 09/12/2016 18:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AttendanceRecordDetailView]
AS
SELECT     dbo.AttendanceRecordDetail.id, dbo.AttendanceRecordDetail.staffNr, dbo.AttendanceRecordDetail.recordAt, dbo.AttendanceRecordDetail.createdAt, 
                      dbo.AttendanceRecordDetail.soureType, dbo.AttendanceRecordDetail.isCalculated, dbo.Staff.name, dbo.Staff.sex, dbo.Staff.birthday, dbo.Staff.ethnic, 
                      dbo.Staff.firstCompanyEmployAt, dbo.Staff.totalCompanySeniority, dbo.Staff.companyEmployAt, dbo.Staff.companySeniority, dbo.Staff.workStatus, dbo.Staff.isOnTrial, 
                      dbo.Staff.trialOverAt, dbo.Staff.companyId, dbo.Staff.departmentId, dbo.Staff.jobTitleId, dbo.Staff.photo, dbo.Staff.staffTypeId, dbo.Staff.degreeTypeId, 
                      dbo.Staff.speciality, dbo.Staff.residenceAddress, dbo.Staff.address, dbo.Staff.id AS staffId, dbo.Staff.isIdChecked, dbo.Staff.phone, dbo.Staff.contactName, 
                      dbo.Staff.contactPhone, dbo.Staff.contactFamilyMemberType, dbo.Staff.domicile, dbo.Staff.residenceType, dbo.Staff.insureTypeId, dbo.Staff.isPayCPF, 
                      dbo.Staff.contractExpireAt, dbo.Staff.contractCount, dbo.Staff.totalSeniority, dbo.Staff.remark AS staffRemark, dbo.AttendanceRecordDetail.device, 
                      dbo.Department.name AS departmentName
FROM         dbo.AttendanceRecordDetail INNER JOIN
                      dbo.Staff ON dbo.AttendanceRecordDetail.staffNr = dbo.Staff.nr INNER JOIN
                      dbo.Department ON dbo.Staff.departmentId = dbo.Department.id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[29] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -576
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AttendanceRecordDetail"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 205
               Right = 184
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Staff"
            Begin Extent = 
               Top = 5
               Left = 349
               Bottom = 215
               Right = 566
            End
            DisplayFlags = 280
            TopColumn = 25
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 6
               Left = 604
               Bottom = 142
               Right = 831
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1830
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AttendanceRecordDetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AttendanceRecordDetailView'
GO
/****** Object:  View [dbo].[AttendanceRecordCalView]    Script Date: 09/12/2016 18:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AttendanceRecordCalView]
AS
SELECT     dbo.AttendanceRecordCal.id, dbo.AttendanceRecordCal.staffNr, dbo.AttendanceRecordCal.oriWorkingHour, dbo.AttendanceRecordCal.attendanceDate, 
                      dbo.AttendanceRecordCal.actWorkingHour, dbo.AttendanceRecordCal.remark, dbo.AttendanceRecordCal.createdAt, dbo.AttendanceRecordCal.isManualCal, 
                      dbo.AttendanceRecordCal.isException, dbo.AttendanceRecordCal.exceptionCodes, dbo.Staff.name, dbo.Staff.nr, dbo.Staff.sex, dbo.Staff.birthday, dbo.Staff.ethnic, 
                      dbo.Staff.firstCompanyEmployAt, dbo.Staff.totalCompanySeniority, dbo.Staff.companyEmployAt, dbo.Staff.companySeniority, dbo.Staff.workStatus, dbo.Staff.isOnTrial, 
                      dbo.Staff.trialOverAt, dbo.Staff.companyId, dbo.Staff.departmentId, dbo.Staff.jobTitleId, dbo.Staff.photo, dbo.Staff.staffTypeId, dbo.Staff.degreeTypeId, 
                      dbo.Staff.speciality, dbo.Staff.residenceAddress, dbo.Staff.address, dbo.Staff.id AS staffid, dbo.Staff.isIdChecked, dbo.Staff.phone, dbo.Staff.contactName, 
                      dbo.Staff.contactPhone, dbo.Staff.contactFamilyMemberType, dbo.Staff.domicile, dbo.Staff.residenceType, dbo.Staff.insureTypeId, dbo.Staff.isPayCPF, 
                      dbo.Staff.contractExpireAt, dbo.Staff.contractCount, dbo.Staff.totalSeniority, dbo.Department.name AS departmentName, dbo.Staff.remark AS staffRemark, 
                      dbo.AttendanceRecordCal.isExceptionHandled
FROM         dbo.AttendanceRecordCal INNER JOIN
                      dbo.Staff ON dbo.AttendanceRecordCal.staffNr = dbo.Staff.nr INNER JOIN
                      dbo.Department ON dbo.Staff.departmentId = dbo.Department.id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[31] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AttendanceRecordCal"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 234
               Right = 199
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Staff"
            Begin Extent = 
               Top = 26
               Left = 677
               Bottom = 304
               Right = 894
            End
            DisplayFlags = 280
            TopColumn = 21
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 136
               Left = 260
               Bottom = 255
               Right = 402
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1905
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AttendanceRecordCalView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AttendanceRecordCalView'
GO
/****** Object:  View [dbo].[AttendanceRecordCalExceptionView]    Script Date: 09/12/2016 18:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AttendanceRecordCalExceptionView]
AS
SELECT     attendanceDate, isExceptionHandled, COUNT(isExceptionHandled) AS isExceptionHandledCount
FROM         dbo.AttendanceRecordCal
GROUP BY attendanceDate, isExceptionHandled
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AttendanceRecordCal"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 301
               Right = 310
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AttendanceRecordCalExceptionView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AttendanceRecordCalExceptionView'
GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 09/12/2016 18:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Attachment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[attachmentType] [int] NOT NULL,
	[path] [varchar](200) NULL,
	[attachmentAbleId] [int] NULL,
	[attachmentAbleType] [varchar](50) NULL,
	[certificateId] [int] NULL,
 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_User_isLocked]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isLocked]  DEFAULT ((0)) FOR [isLocked]
GO
/****** Object:  Default [DF_CertificateType_isSystem]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[CertificateType] ADD  CONSTRAINT [DF_CertificateType_isSystem]  DEFAULT ((0)) FOR [isSystem]
GO
/****** Object:  Default [DF_CertificateType_isNecessary]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[CertificateType] ADD  CONSTRAINT [DF_CertificateType_isNecessary]  DEFAULT ((0)) FOR [isNecessary]
GO
/****** Object:  Default [DF_MessageRecord_isRead]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[MessageRecord] ADD  CONSTRAINT [DF_MessageRecord_isRead]  DEFAULT ((0)) FOR [isRead]
GO
/****** Object:  Default [DF_MessageRecord_isHandled]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[MessageRecord] ADD  CONSTRAINT [DF_MessageRecord_isHandled]  DEFAULT ((0)) FOR [isHandled]
GO
/****** Object:  Default [DF_Staff_isOnTrial]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF_Staff_isOnTrial]  DEFAULT ((0)) FOR [isOnTrial]
GO
/****** Object:  Default [DF_Staff_isIdChecked]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF_Staff_isIdChecked]  DEFAULT ((0)) FOR [isIdChecked]
GO
/****** Object:  Default [DF_Staff_isPayCFP]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [DF_Staff_isPayCFP]  DEFAULT ((0)) FOR [isPayCPF]
GO
/****** Object:  Default [DF_FullMemberRecord_isPassCheck]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[FullMemberRecord] ADD  CONSTRAINT [DF_FullMemberRecord_isPassCheck]  DEFAULT ((0)) FOR [isPassCheck]
GO
/****** Object:  Default [DF_AttendanceRecordCal_isManualCal]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[AttendanceRecordCal] ADD  CONSTRAINT [DF_AttendanceRecordCal_isManualCal]  DEFAULT ((0)) FOR [isManualCal]
GO
/****** Object:  Default [DF_AttendanceRecordCal_isException]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[AttendanceRecordCal] ADD  CONSTRAINT [DF_AttendanceRecordCal_isException]  DEFAULT ((0)) FOR [isException]
GO
/****** Object:  Default [DF_AttendanceRecordCal_isExceptionHandled]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[AttendanceRecordCal] ADD  CONSTRAINT [DF_AttendanceRecordCal_isExceptionHandled]  DEFAULT ((1)) FOR [isExceptionHandled]
GO
/****** Object:  Default [DF_AttendanceRecordDetail_isCalculated]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[AttendanceRecordDetail] ADD  CONSTRAINT [DF_AttendanceRecordDetail_isCalculated]  DEFAULT ((0)) FOR [isCalculated]
GO
/****** Object:  Default [DF_BankCard_isDefault]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[BankCard] ADD  CONSTRAINT [DF_BankCard_isDefault]  DEFAULT ((0)) FOR [isDefault]
GO
/****** Object:  ForeignKey [FK_Department_Company]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Company] FOREIGN KEY([companyId])
REFERENCES [dbo].[Company] ([id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Company]
GO
/****** Object:  ForeignKey [FK_JobCertificate_CertificateType]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[JobCertificate]  WITH CHECK ADD  CONSTRAINT [FK_JobCertificate_CertificateType] FOREIGN KEY([certificateTypeId])
REFERENCES [dbo].[CertificateType] ([id])
GO
ALTER TABLE [dbo].[JobCertificate] CHECK CONSTRAINT [FK_JobCertificate_CertificateType]
GO
/****** Object:  ForeignKey [FK_JobCertificate_JobTitle]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[JobCertificate]  WITH CHECK ADD  CONSTRAINT [FK_JobCertificate_JobTitle] FOREIGN KEY([jobTitleId])
REFERENCES [dbo].[JobTitle] ([id])
GO
ALTER TABLE [dbo].[JobCertificate] CHECK CONSTRAINT [FK_JobCertificate_JobTitle]
GO
/****** Object:  ForeignKey [FK_Staff_Company]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Company] FOREIGN KEY([companyId])
REFERENCES [dbo].[Company] ([id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Company]
GO
/****** Object:  ForeignKey [FK_Staff_DegreeType]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_DegreeType] FOREIGN KEY([degreeTypeId])
REFERENCES [dbo].[DegreeType] ([id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_DegreeType]
GO
/****** Object:  ForeignKey [FK_Staff_Department]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Department] FOREIGN KEY([departmentId])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Department]
GO
/****** Object:  ForeignKey [FK_Staff_InsureType]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_InsureType] FOREIGN KEY([insureTypeId])
REFERENCES [dbo].[InsureType] ([id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_InsureType]
GO
/****** Object:  ForeignKey [FK_Staff_JobTitle]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_JobTitle] FOREIGN KEY([jobTitleId])
REFERENCES [dbo].[JobTitle] ([id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_JobTitle]
GO
/****** Object:  ForeignKey [FK_Staff_StaffType]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_StaffType] FOREIGN KEY([staffTypeId])
REFERENCES [dbo].[StaffType] ([id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_StaffType]
GO
/****** Object:  ForeignKey [FK_FullMemberRecord_Staff]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[FullMemberRecord]  WITH CHECK ADD  CONSTRAINT [FK_FullMemberRecord_Staff] FOREIGN KEY([staffNr])
REFERENCES [dbo].[Staff] ([nr])
GO
ALTER TABLE [dbo].[FullMemberRecord] CHECK CONSTRAINT [FK_FullMemberRecord_Staff]
GO
/****** Object:  ForeignKey [FK_FamilyMemeber_Staff]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[FamilyMemeber]  WITH CHECK ADD  CONSTRAINT [FK_FamilyMemeber_Staff] FOREIGN KEY([staffNr])
REFERENCES [dbo].[Staff] ([nr])
GO
ALTER TABLE [dbo].[FamilyMemeber] CHECK CONSTRAINT [FK_FamilyMemeber_Staff]
GO
/****** Object:  ForeignKey [FK_ExtraWorkRecord_ExtraWorkType]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[ExtraWorkRecord]  WITH CHECK ADD  CONSTRAINT [FK_ExtraWorkRecord_ExtraWorkType] FOREIGN KEY([extraWorkTypeId])
REFERENCES [dbo].[ExtraWorkType] ([id])
GO
ALTER TABLE [dbo].[ExtraWorkRecord] CHECK CONSTRAINT [FK_ExtraWorkRecord_ExtraWorkType]
GO
/****** Object:  ForeignKey [FK_ExtraWorkRecord_Staff]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[ExtraWorkRecord]  WITH CHECK ADD  CONSTRAINT [FK_ExtraWorkRecord_Staff] FOREIGN KEY([staffNr])
REFERENCES [dbo].[Staff] ([nr])
GO
ALTER TABLE [dbo].[ExtraWorkRecord] CHECK CONSTRAINT [FK_ExtraWorkRecord_Staff]
GO
/****** Object:  ForeignKey [FK_AbsenceRecrod_AbsenceType]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[AbsenceRecrod]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceRecrod_AbsenceType] FOREIGN KEY([absenceTypeId])
REFERENCES [dbo].[AbsenceType] ([id])
GO
ALTER TABLE [dbo].[AbsenceRecrod] CHECK CONSTRAINT [FK_AbsenceRecrod_AbsenceType]
GO
/****** Object:  ForeignKey [FK_AbsenceRecrod_Staff]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[AbsenceRecrod]  WITH CHECK ADD  CONSTRAINT [FK_AbsenceRecrod_Staff] FOREIGN KEY([staffNr])
REFERENCES [dbo].[Staff] ([nr])
GO
ALTER TABLE [dbo].[AbsenceRecrod] CHECK CONSTRAINT [FK_AbsenceRecrod_Staff]
GO
/****** Object:  ForeignKey [FK_AttendanceRecordCal_Staff]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[AttendanceRecordCal]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceRecordCal_Staff] FOREIGN KEY([staffNr])
REFERENCES [dbo].[Staff] ([nr])
GO
ALTER TABLE [dbo].[AttendanceRecordCal] CHECK CONSTRAINT [FK_AttendanceRecordCal_Staff]
GO
/****** Object:  ForeignKey [FK_AttendanceRecordDetail_Staff]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[AttendanceRecordDetail]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceRecordDetail_Staff] FOREIGN KEY([staffNr])
REFERENCES [dbo].[Staff] ([nr])
GO
ALTER TABLE [dbo].[AttendanceRecordDetail] CHECK CONSTRAINT [FK_AttendanceRecordDetail_Staff]
GO
/****** Object:  ForeignKey [FK_Certificate_CertificateType]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_CertificateType] FOREIGN KEY([certificateTypeId])
REFERENCES [dbo].[CertificateType] ([id])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Certificate_CertificateType]
GO
/****** Object:  ForeignKey [FK_Certificate_Staff]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_Staff] FOREIGN KEY([staffNr])
REFERENCES [dbo].[Staff] ([nr])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Certificate_Staff]
GO
/****** Object:  ForeignKey [FK_BankCard_Staff]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[BankCard]  WITH CHECK ADD  CONSTRAINT [FK_BankCard_Staff] FOREIGN KEY([staffNr])
REFERENCES [dbo].[Staff] ([nr])
GO
ALTER TABLE [dbo].[BankCard] CHECK CONSTRAINT [FK_BankCard_Staff]
GO
/****** Object:  ForeignKey [FK_ShiftSchedule_Shift]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[ShiftSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ShiftSchedule_Shift] FOREIGN KEY([shiftId])
REFERENCES [dbo].[Shift] ([id])
GO
ALTER TABLE [dbo].[ShiftSchedule] CHECK CONSTRAINT [FK_ShiftSchedule_Shift]
GO
/****** Object:  ForeignKey [FK_ShiftSchedule_Staff]    Script Date: 09/12/2016 18:57:22 ******/
ALTER TABLE [dbo].[ShiftSchedule]  WITH CHECK ADD  CONSTRAINT [FK_ShiftSchedule_Staff] FOREIGN KEY([staffNr])
REFERENCES [dbo].[Staff] ([nr])
GO
ALTER TABLE [dbo].[ShiftSchedule] CHECK CONSTRAINT [FK_ShiftSchedule_Staff]
GO
/****** Object:  ForeignKey [FK_ResignRecord_ResignType]    Script Date: 09/12/2016 18:57:23 ******/
ALTER TABLE [dbo].[ResignRecord]  WITH CHECK ADD  CONSTRAINT [FK_ResignRecord_ResignType] FOREIGN KEY([resignTypeId])
REFERENCES [dbo].[ResignType] ([id])
GO
ALTER TABLE [dbo].[ResignRecord] CHECK CONSTRAINT [FK_ResignRecord_ResignType]
GO
/****** Object:  ForeignKey [FK_ResignRecord_Staff]    Script Date: 09/12/2016 18:57:23 ******/
ALTER TABLE [dbo].[ResignRecord]  WITH CHECK ADD  CONSTRAINT [FK_ResignRecord_Staff] FOREIGN KEY([staffNr])
REFERENCES [dbo].[Staff] ([nr])
GO
ALTER TABLE [dbo].[ResignRecord] CHECK CONSTRAINT [FK_ResignRecord_Staff]
GO
/****** Object:  ForeignKey [FK_Attachment_Certificate]    Script Date: 09/12/2016 18:57:23 ******/
ALTER TABLE [dbo].[Attachment]  WITH CHECK ADD  CONSTRAINT [FK_Attachment_Certificate] FOREIGN KEY([certificateId])
REFERENCES [dbo].[Certificate] ([id])
GO
ALTER TABLE [dbo].[Attachment] CHECK CONSTRAINT [FK_Attachment_Certificate]
GO
