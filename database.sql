USE [master]
GO
/****** Object:  Database [database]    Script Date: 1/11/2558 21:39:37 ******/
CREATE DATABASE [database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'database_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\database.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'database_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\database.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [database] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [database] SET ARITHABORT OFF 
GO
ALTER DATABASE [database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [database] SET  MULTI_USER 
GO
ALTER DATABASE [database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [database] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [database] SET DELAYED_DURABILITY = DISABLED 
GO
USE [database]
GO
/****** Object:  Table [dbo].[person]    Script Date: 1/11/2558 21:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[PersID] [nvarchar](10) NOT NULL,
	[Title] [nvarchar](10) NOT NULL,
	[Fname] [nvarchar](50) NOT NULL,
	[Lname] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Phone] [nchar](15) NOT NULL,
	[Email] [nchar](30) NOT NULL,
	[typeOfPers] [int] NOT NULL,
	[salt] [nvarchar](50) NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[PersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[project]    Script Date: 1/11/2558 21:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project](
	[ProjID] [nvarchar](50) NOT NULL,
	[ProjName_TH] [nvarchar](100) NULL,
	[ProjName_ENG] [nvarchar](100) NULL,
	[Member] [int] NOT NULL,
	[Scope] [ntext] NULL,
	[Date] [date] NULL,
	[Status_ID] [int] NULL,
	[State] [int] NULL,
 CONSTRAINT [PK_projects] PRIMARY KEY CLUSTERED 
(
	[ProjID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectOperations]    Script Date: 1/11/2558 21:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectOperations](
	[ProjOperatID] [int] IDENTITY(1,1) NOT NULL,
	[ProjID] [nvarchar](50) NULL,
	[Date] [nvarchar](max) NULL,
	[Subject] [ntext] NULL,
	[Progress] [ntext] NULL,
	[Note] [ntext] NULL,
	[ApproveDate] [datetime] NULL,
 CONSTRAINT [PK__ProjectO__BEF9F40D78DC4B92] PRIMARY KEY CLUSTERED 
(
	[ProjOperatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Relation]    Script Date: 1/11/2558 21:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relation](
	[ProjID] [nvarchar](50) NOT NULL,
	[PersID] [nvarchar](10) NOT NULL,
	[Status_ID] [int] NOT NULL,
 CONSTRAINT [PK__Relation__57F208C92AC43341] PRIMARY KEY CLUSTERED 
(
	[PersID] ASC,
	[ProjID] ASC,
	[Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 1/11/2558 21:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[ReqID] [int] NOT NULL,
	[Request] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request_Title]    Script Date: 1/11/2558 21:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_Title](
	[Req_TitleiD] [int] IDENTITY(1,1) NOT NULL,
	[ReqID] [int] NULL,
	[ProjID] [int] NULL,
	[ApplicantID] [nvarchar](10) NULL,
	[AcceptanceID] [nvarchar](10) NULL,
	[Date] [nvarchar](max) NULL,
 CONSTRAINT [PK__Request___864CAC8B57FB2197] PRIMARY KEY CLUSTERED 
(
	[Req_TitleiD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StatusOfPerson]    Script Date: 1/11/2558 21:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusOfPerson](
	[Status_ID] [int] NOT NULL,
	[Status] [nchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StatusOfProject]    Script Date: 1/11/2558 21:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusOfProject](
	[Status_ID] [int] NOT NULL,
	[Status] [nchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[project]  WITH CHECK ADD  CONSTRAINT [FK_project_StatusOfProject] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[StatusOfProject] ([Status_ID])
GO
ALTER TABLE [dbo].[project] CHECK CONSTRAINT [FK_project_StatusOfProject]
GO
ALTER TABLE [dbo].[ProjectOperations]  WITH CHECK ADD  CONSTRAINT [FK_ProjectOperations_project] FOREIGN KEY([ProjID])
REFERENCES [dbo].[project] ([ProjID])
GO
ALTER TABLE [dbo].[ProjectOperations] CHECK CONSTRAINT [FK_ProjectOperations_project]
GO
ALTER TABLE [dbo].[Relation]  WITH CHECK ADD  CONSTRAINT [FK_Relation_person] FOREIGN KEY([PersID])
REFERENCES [dbo].[person] ([PersID])
GO
ALTER TABLE [dbo].[Relation] CHECK CONSTRAINT [FK_Relation_person]
GO
ALTER TABLE [dbo].[Relation]  WITH CHECK ADD  CONSTRAINT [FK_Relation_project] FOREIGN KEY([ProjID])
REFERENCES [dbo].[project] ([ProjID])
GO
ALTER TABLE [dbo].[Relation] CHECK CONSTRAINT [FK_Relation_project]
GO
ALTER TABLE [dbo].[Relation]  WITH CHECK ADD  CONSTRAINT [FK_Relation_StatusOfPerson] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[StatusOfPerson] ([Status_ID])
GO
ALTER TABLE [dbo].[Relation] CHECK CONSTRAINT [FK_Relation_StatusOfPerson]
GO
ALTER TABLE [dbo].[Request_Title]  WITH CHECK ADD  CONSTRAINT [FK_Request_Title_person] FOREIGN KEY([ApplicantID])
REFERENCES [dbo].[person] ([PersID])
GO
ALTER TABLE [dbo].[Request_Title] CHECK CONSTRAINT [FK_Request_Title_person]
GO
ALTER TABLE [dbo].[Request_Title]  WITH CHECK ADD  CONSTRAINT [FK_Request_Title_person1] FOREIGN KEY([AcceptanceID])
REFERENCES [dbo].[person] ([PersID])
GO
ALTER TABLE [dbo].[Request_Title] CHECK CONSTRAINT [FK_Request_Title_person1]
GO
ALTER TABLE [dbo].[Request_Title]  WITH CHECK ADD  CONSTRAINT [FK_Request_Title_Request] FOREIGN KEY([ReqID])
REFERENCES [dbo].[Request] ([ReqID])
GO
ALTER TABLE [dbo].[Request_Title] CHECK CONSTRAINT [FK_Request_Title_Request]
GO
USE [master]
GO
ALTER DATABASE [database] SET  READ_WRITE 
GO
