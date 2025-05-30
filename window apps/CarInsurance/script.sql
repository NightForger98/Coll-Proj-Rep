USE [master]
GO
/****** Object:  Database [companydb]    Script Date: 4/29/2024 7:29:08 PM ******/
CREATE DATABASE [companydb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'companydb', FILENAME = N'C:\Data\companydb.mdf' , SIZE = 3072KB , MAXSIZE = 102400KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'companydb_log', FILENAME = N'C:\Data\companydb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [companydb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [companydb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [companydb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [companydb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [companydb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [companydb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [companydb] SET ARITHABORT OFF 
GO
ALTER DATABASE [companydb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [companydb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [companydb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [companydb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [companydb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [companydb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [companydb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [companydb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [companydb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [companydb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [companydb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [companydb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [companydb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [companydb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [companydb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [companydb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [companydb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [companydb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [companydb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [companydb] SET  MULTI_USER 
GO
ALTER DATABASE [companydb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [companydb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [companydb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [companydb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [companydb]
GO
/****** Object:  Table [dbo].[DEPARTMENT]    Script Date: 4/29/2024 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEPARTMENT](
	[Dname] [varchar](15) NOT NULL,
	[Dnumber] [int] NOT NULL,
	[Mgr_ssn] [char](9) NOT NULL,
	[Mgr_start_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Dnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DEPENDENT]    Script Date: 4/29/2024 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEPENDENT](
	[Essn] [char](9) NOT NULL,
	[Dependent_name] [varchar](15) NOT NULL,
	[Sex] [char](1) NULL,
	[Bdate] [date] NULL,
	[Relationship] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[Essn] ASC,
	[Dependent_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DEPT_LOCATIONS]    Script Date: 4/29/2024 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEPT_LOCATIONS](
	[Dnumber] [int] NOT NULL,
	[Dlocation] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Dnumber] ASC,
	[Dlocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 4/29/2024 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[Fname] [varchar](10) NOT NULL,
	[Minit] [char](1) NULL,
	[Lname] [varchar](20) NOT NULL,
	[Ssn] [char](9) NOT NULL,
	[Bdate] [date] NULL,
	[Address] [varchar](30) NULL,
	[Sex] [char](1) NULL,
	[Salary] [decimal](5, 0) NULL,
	[Super_ssn] [char](9) NULL,
	[Dno] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROJECT]    Script Date: 4/29/2024 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROJECT](
	[Pname] [varchar](15) NOT NULL,
	[Pnumber] [int] NOT NULL,
	[Plocation] [varchar](15) NULL,
	[Dnum] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Pnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WORKS_ON]    Script Date: 4/29/2024 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WORKS_ON](
	[Essn] [char](9) NOT NULL,
	[Pno] [int] NOT NULL,
	[Hours] [decimal](3, 1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Essn] ASC,
	[Pno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vw_employees]    Script Date: 4/29/2024 7:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_employees] as 
SELECT   [Ssn],[Fname]+' '+[Minit]+' '+[Lname] FullName     
  FROM [companydb].[dbo].[EMPLOYEE]
union 
select '-1','None'
 




GO
INSERT [dbo].[DEPARTMENT] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'infotech', 0, N'123456789', CAST(0xBC460B00 AS Date))
INSERT [dbo].[DEPARTMENT] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'Headquarters', 1, N'888665555', CAST(0x95090B00 AS Date))
INSERT [dbo].[DEPARTMENT] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'Administration', 4, N'987654321', CAST(0xE51C0B00 AS Date))
INSERT [dbo].[DEPARTMENT] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'Research', 5, N'333445555', CAST(0x76130B00 AS Date))
INSERT [dbo].[DEPARTMENT] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'test', 22, N'123456789', CAST(0xBC460B00 AS Date))
INSERT [dbo].[DEPARTMENT] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'43', 54, N'123456789', CAST(0xBC460B00 AS Date))
INSERT [dbo].[DEPARTMENT] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'newdep2', 958, N'123456789', CAST(0xBC460B00 AS Date))
INSERT [dbo].[DEPARTMENT] ([Dname], [Dnumber], [Mgr_ssn], [Mgr_start_date]) VALUES (N'newdep', 5000, N'123456789', CAST(0xBC460B00 AS Date))
INSERT [dbo].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'123456789', N'Alice', N'F', CAST(0x54140B00 AS Date), N'Daughter')
INSERT [dbo].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'123456789', N'Elizabeth', N'F', CAST(0x6EF50A00 AS Date), N'Spouse')
INSERT [dbo].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'123456789', N'Michael', N'M', CAST(0xEB120B00 AS Date), N'Son')
INSERT [dbo].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'333445555', N'Alice', N'F', CAST(0x6B100B00 AS Date), N'Daughter')
INSERT [dbo].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'333445555', N'Joy', N'F', CAST(0x95E80A00 AS Date), N'Spouse')
INSERT [dbo].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'333445555', N'Theodore', N'M', CAST(0xEF0C0B00 AS Date), N'Son')
INSERT [dbo].[DEPENDENT] ([Essn], [Dependent_name], [Sex], [Bdate], [Relationship]) VALUES (N'987654321', N'Abner', N'M', CAST(0x81D10A00 AS Date), N'Spouse')
INSERT [dbo].[DEPT_LOCATIONS] ([Dnumber], [Dlocation]) VALUES (1, N'Houston')
INSERT [dbo].[DEPT_LOCATIONS] ([Dnumber], [Dlocation]) VALUES (4, N'Stafford')
INSERT [dbo].[DEPT_LOCATIONS] ([Dnumber], [Dlocation]) VALUES (5, N'Bellaire')
INSERT [dbo].[DEPT_LOCATIONS] ([Dnumber], [Dlocation]) VALUES (5, N'Houston')
INSERT [dbo].[DEPT_LOCATIONS] ([Dnumber], [Dlocation]) VALUES (5, N'Sugarland')
INSERT [dbo].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'John', N'B', N'Smith', N'123456789', CAST(0x20F20A00 AS Date), N'731 Fondren, Houston TX', N'M', CAST(30000 AS Decimal(5, 0)), N'333445555', 5)
INSERT [dbo].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Franklin', N'T', N'Wong', N'333445555', CAST(0x6DF30A00 AS Date), N'638 Voss, Houston TX', N'M', CAST(40000 AS Decimal(5, 0)), N'888665555', 5)
INSERT [dbo].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Joyce', N'A', N'English', N'453453453', CAST(0xE8FC0A00 AS Date), N'5631 Rice, Houston TX', N'F', CAST(25000 AS Decimal(5, 0)), N'333445555', 5)
INSERT [dbo].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Ramesh', N'K', N'Narayan', N'666884444', CAST(0xD1EE0A00 AS Date), N'975 Fire Oak, Humble TX', N'M', CAST(38000 AS Decimal(5, 0)), N'333445555', 5)
INSERT [dbo].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'hadi', N'M', N'Cheikh2', N'877-87-87', CAST(0xB5460B00 AS Date), N'', N'M', CAST(213 AS Decimal(5, 0)), N'123456789', 1)
INSERT [dbo].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'James', N'E', N'Borg', N'888665555', CAST(0x5ECB0A00 AS Date), N'450 Stone, Houston TX', N'M', CAST(55000 AS Decimal(5, 0)), NULL, 1)
INSERT [dbo].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Jennifer', N'S', N'Wallace', N'987654321', CAST(0xB2240B00 AS Date), N'291 Berry, Bellaire TX', N'F', CAST(43000 AS Decimal(5, 0)), N'888665555', 4)
INSERT [dbo].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Ahmad', N'V', N'Jabbar', N'987987987', CAST(0x24F80A00 AS Date), N'980 Dallas, Houston TX', N'M', CAST(25000 AS Decimal(5, 0)), N'987654321', 4)
INSERT [dbo].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'Alicia', N'J', N'Zelaya', N'999887777', CAST(0x71F60A00 AS Date), N'3321 Castle, Spring TX', N'F', CAST(25000 AS Decimal(5, 0)), N'987654321', 4)
INSERT [dbo].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'dfsdf', N'f', N'987654321', N'fsdfdsf  ', CAST(0xA9460B00 AS Date), N'fdfsdfsd', N'M', CAST(13 AS Decimal(5, 0)), N'gfdgfd   ', 1)
INSERT [dbo].[EMPLOYEE] ([Fname], [Minit], [Lname], [Ssn], [Bdate], [Address], [Sex], [Salary], [Super_ssn], [Dno]) VALUES (N'gfd', N'd', N'123456456', N'gfdgfd   ', CAST(0x27240B00 AS Date), N'salim', N'M', CAST(32132 AS Decimal(5, 0)), N'123456789', 1)
INSERT [dbo].[PROJECT] ([Pname], [Pnumber], [Plocation], [Dnum]) VALUES (N'ProductX', 1, N'Bellaire', 5)
INSERT [dbo].[PROJECT] ([Pname], [Pnumber], [Plocation], [Dnum]) VALUES (N'ProductY', 2, N'Sugarland', 5)
INSERT [dbo].[PROJECT] ([Pname], [Pnumber], [Plocation], [Dnum]) VALUES (N'ProductZ', 3, N'Houston', 5)
INSERT [dbo].[PROJECT] ([Pname], [Pnumber], [Plocation], [Dnum]) VALUES (N'Computerization', 10, N'Stafford', 4)
INSERT [dbo].[PROJECT] ([Pname], [Pnumber], [Plocation], [Dnum]) VALUES (N'Reorganization', 20, N'Houston', 1)
INSERT [dbo].[PROJECT] ([Pname], [Pnumber], [Plocation], [Dnum]) VALUES (N'Newbenefits', 30, N'Stafford', 4)
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'123456789', 1, CAST(32.5 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'123456789', 2, CAST(7.5 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'333445555', 2, CAST(10.0 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'333445555', 3, CAST(10.0 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'333445555', 10, CAST(10.0 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'333445555', 20, CAST(10.0 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'453453453', 1, CAST(20.0 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'453453453', 2, CAST(20.0 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'666884444', 3, CAST(40.0 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'888665555', 20, CAST(16.0 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'987654321', 20, CAST(15.0 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'987654321', 30, CAST(20.0 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'987987987', 10, CAST(35.0 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'987987987', 30, CAST(5.0 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'999887777', 10, CAST(10.0 AS Decimal(3, 1)))
INSERT [dbo].[WORKS_ON] ([Essn], [Pno], [Hours]) VALUES (N'999887777', 30, CAST(30.0 AS Decimal(3, 1)))
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__DEPARTME__83BFD8490635CECF]    Script Date: 4/29/2024 7:29:08 PM ******/
ALTER TABLE [dbo].[DEPARTMENT] ADD UNIQUE NONCLUSTERED 
(
	[Dname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__PROJECT__173BB01C681657AA]    Script Date: 4/29/2024 7:29:08 PM ******/
ALTER TABLE [dbo].[PROJECT] ADD UNIQUE NONCLUSTERED 
(
	[Pname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DEPARTMENT]  WITH CHECK ADD  CONSTRAINT [Dep_emp] FOREIGN KEY([Mgr_ssn])
REFERENCES [dbo].[EMPLOYEE] ([Ssn])
GO
ALTER TABLE [dbo].[DEPARTMENT] CHECK CONSTRAINT [Dep_emp]
GO
ALTER TABLE [dbo].[DEPARTMENT]  WITH CHECK ADD FOREIGN KEY([Mgr_ssn])
REFERENCES [dbo].[EMPLOYEE] ([Ssn])
GO
ALTER TABLE [dbo].[DEPENDENT]  WITH CHECK ADD FOREIGN KEY([Essn])
REFERENCES [dbo].[EMPLOYEE] ([Ssn])
GO
ALTER TABLE [dbo].[DEPT_LOCATIONS]  WITH CHECK ADD FOREIGN KEY([Dnumber])
REFERENCES [dbo].[DEPARTMENT] ([Dnumber])
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [Emp_dno] FOREIGN KEY([Dno])
REFERENCES [dbo].[DEPARTMENT] ([Dnumber])
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [Emp_dno]
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [Emp_emp] FOREIGN KEY([Super_ssn])
REFERENCES [dbo].[EMPLOYEE] ([Ssn])
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [Emp_emp]
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [Emp_super] FOREIGN KEY([Super_ssn])
REFERENCES [dbo].[EMPLOYEE] ([Ssn])
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [Emp_super]
GO
ALTER TABLE [dbo].[PROJECT]  WITH CHECK ADD FOREIGN KEY([Dnum])
REFERENCES [dbo].[DEPARTMENT] ([Dnumber])
GO
ALTER TABLE [dbo].[WORKS_ON]  WITH CHECK ADD FOREIGN KEY([Essn])
REFERENCES [dbo].[EMPLOYEE] ([Ssn])
GO
ALTER TABLE [dbo].[WORKS_ON]  WITH CHECK ADD FOREIGN KEY([Pno])
REFERENCES [dbo].[PROJECT] ([Pnumber])
GO
USE [master]
GO
ALTER DATABASE [companydb] SET  READ_WRITE 
GO
