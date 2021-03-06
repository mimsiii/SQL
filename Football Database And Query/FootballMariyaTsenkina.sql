USE [master]
GO
/****** Object:  Database [FootballMariyaTsenkina]    Script Date: 27.9.2021 г. 0:43:19 ******/
CREATE DATABASE [FootballMariyaTsenkina]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FootballMariyaTsenkina', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FootballMariyaTsenkina.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FootballMariyaTsenkina_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FootballMariyaTsenkina_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FootballMariyaTsenkina] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FootballMariyaTsenkina].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FootballMariyaTsenkina] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET ARITHABORT OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET RECOVERY FULL 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET  MULTI_USER 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FootballMariyaTsenkina] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FootballMariyaTsenkina] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FootballMariyaTsenkina', N'ON'
GO
ALTER DATABASE [FootballMariyaTsenkina] SET QUERY_STORE = OFF
GO
USE [FootballMariyaTsenkina]
GO
/****** Object:  Table [dbo].[Footballer]    Script Date: 27.9.2021 г. 0:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footballer](
	[Player_id] [int] IDENTITY(1,1) NOT NULL,
	[Player_name] [nvarchar](50) NULL,
	[Team_id] [int] NULL,
 CONSTRAINT [PK_Footballer] PRIMARY KEY CLUSTERED 
(
	[Player_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 27.9.2021 г. 0:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Game_id] [int] IDENTITY(1,1) NOT NULL,
	[Hometeam_id] [int] NULL,
	[Awayteam_id] [int] NULL,
	[Judge_id] [int] NULL,
	[Hometeam_score] [int] NULL,
	[Awayteam_score] [int] NULL,
	[Game_date] [date] NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[Game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 27.9.2021 г. 0:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Group_id] [int] IDENTITY(1,1) NOT NULL,
	[Group_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Judges]    Script Date: 27.9.2021 г. 0:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Judges](
	[Judge_id] [int] IDENTITY(1,1) NOT NULL,
	[Judges_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Judges] PRIMARY KEY CLUSTERED 
(
	[Judge_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 27.9.2021 г. 0:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[Manager_id] [int] IDENTITY(1,1) NOT NULL,
	[Manager_name] [nvarchar](50) NULL,
	[Team_id] [int] NULL,
	[Contract_enddate] [date] NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[Manager_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 27.9.2021 г. 0:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Team_id] [int] IDENTITY(1,1) NOT NULL,
	[Team_name] [nvarchar](50) NULL,
	[Group_id] [int] NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Team_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Footballer] ON 

INSERT [dbo].[Footballer] ([Player_id], [Player_name], [Team_id]) VALUES (1, N'Eduardo', 1)
INSERT [dbo].[Footballer] ([Player_id], [Player_name], [Team_id]) VALUES (2, N'Pepe', 1)
INSERT [dbo].[Footballer] ([Player_id], [Player_name], [Team_id]) VALUES (3, N'Eder', 1)
INSERT [dbo].[Footballer] ([Player_id], [Player_name], [Team_id]) VALUES (4, N'Loic Remy', 3)
INSERT [dbo].[Footballer] ([Player_id], [Player_name], [Team_id]) VALUES (5, N'Christian Eriksen', 4)
INSERT [dbo].[Footballer] ([Player_id], [Player_name], [Team_id]) VALUES (6, N'Nicklas Bendtner', 4)
SET IDENTITY_INSERT [dbo].[Footballer] OFF
GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (1, 1, 2, 1, 1, 2, CAST(N'2020-08-12' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (2, 6, 3, 6, 1, 0, CAST(N'2019-10-25' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (3, 4, 5, 4, 0, 2, CAST(N'2015-07-05' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (4, 5, 1, 3, 2, 1, CAST(N'2018-04-18' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (5, 3, 4, 2, 1, 0, CAST(N'2016-09-29' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (6, 2, 6, 5, 1, 2, CAST(N'2017-06-16' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (7, 1, 3, 6, 2, 2, CAST(N'2021-05-01' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (8, 4, 1, 1, 2, 0, CAST(N'2020-11-09' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (9, 2, 3, 4, 0, 1, CAST(N'2016-07-20' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (10, 3, 5, 6, 0, 2, CAST(N'2015-09-19' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (11, 6, 4, 2, 1, 2, CAST(N'2018-06-14' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (12, 5, 6, 3, 1, 1, CAST(N'2017-10-10' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (13, 6, 1, 5, 2, 1, CAST(N'2019-08-13' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (14, 4, 2, 1, 1, 2, CAST(N'2021-04-29' AS Date))
INSERT [dbo].[Games] ([Game_id], [Hometeam_id], [Awayteam_id], [Judge_id], [Hometeam_score], [Awayteam_score], [Game_date]) VALUES (15, 5, 4, 2, 0, 1, CAST(N'2020-03-24' AS Date))
SET IDENTITY_INSERT [dbo].[Games] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Group_id], [Group_name]) VALUES (1, N'A Group')
INSERT [dbo].[Groups] ([Group_id], [Group_name]) VALUES (2, N'B Group')
INSERT [dbo].[Groups] ([Group_id], [Group_name]) VALUES (3, N'C Group')
INSERT [dbo].[Groups] ([Group_id], [Group_name]) VALUES (4, N'D Group')
INSERT [dbo].[Groups] ([Group_id], [Group_name]) VALUES (5, N'E Group')
INSERT [dbo].[Groups] ([Group_id], [Group_name]) VALUES (6, N'F Group')
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Judges] ON 

INSERT [dbo].[Judges] ([Judge_id], [Judges_name]) VALUES (1, N'Nestor Pitana')
INSERT [dbo].[Judges] ([Judge_id], [Judges_name]) VALUES (2, N'Joel Quiniou')
INSERT [dbo].[Judges] ([Judge_id], [Judges_name]) VALUES (3, N'Ali Bujsaim')
INSERT [dbo].[Judges] ([Judge_id], [Judges_name]) VALUES (4, N'Mark Geiger')
INSERT [dbo].[Judges] ([Judge_id], [Judges_name]) VALUES (5, N'Abraham Klein')
INSERT [dbo].[Judges] ([Judge_id], [Judges_name]) VALUES (6, N'Ravshan Irmatov')
SET IDENTITY_INSERT [dbo].[Judges] OFF
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([Manager_id], [Manager_name], [Team_id], [Contract_enddate]) VALUES (1, N'Fernando Santos', 1, CAST(N'2025-05-12' AS Date))
INSERT [dbo].[Manager] ([Manager_id], [Manager_name], [Team_id], [Contract_enddate]) VALUES (2, N'Kasper Hjulman', 4, CAST(N'2029-02-24' AS Date))
INSERT [dbo].[Manager] ([Manager_id], [Manager_name], [Team_id], [Contract_enddate]) VALUES (3, N'Jess Thorup', NULL, CAST(N'2018-11-18' AS Date))
INSERT [dbo].[Manager] ([Manager_id], [Manager_name], [Team_id], [Contract_enddate]) VALUES (4, N'Slavisa Jokanovic', 2, CAST(N'2026-12-01' AS Date))
INSERT [dbo].[Manager] ([Manager_id], [Manager_name], [Team_id], [Contract_enddate]) VALUES (5, N'Julian Nagelsmann', NULL, CAST(N'2020-08-30' AS Date))
INSERT [dbo].[Manager] ([Manager_id], [Manager_name], [Team_id], [Contract_enddate]) VALUES (6, N'Didier Deschamps', 3, CAST(N'2029-01-31' AS Date))
SET IDENTITY_INSERT [dbo].[Manager] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Team_id], [Team_name], [Group_id]) VALUES (1, N'Portugal', 1)
INSERT [dbo].[Teams] ([Team_id], [Team_name], [Group_id]) VALUES (2, N'Serbia', 1)
INSERT [dbo].[Teams] ([Team_id], [Team_name], [Group_id]) VALUES (3, N'France', 4)
INSERT [dbo].[Teams] ([Team_id], [Team_name], [Group_id]) VALUES (4, N'Denmark', 5)
INSERT [dbo].[Teams] ([Team_id], [Team_name], [Group_id]) VALUES (5, N'Scotland', 5)
INSERT [dbo].[Teams] ([Team_id], [Team_name], [Group_id]) VALUES (6, N'Israel', 5)
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
ALTER TABLE [dbo].[Footballer]  WITH CHECK ADD  CONSTRAINT [FK_Footballer_Teams] FOREIGN KEY([Player_id])
REFERENCES [dbo].[Teams] ([Team_id])
GO
ALTER TABLE [dbo].[Footballer] CHECK CONSTRAINT [FK_Footballer_Teams]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_Judges] FOREIGN KEY([Judge_id])
REFERENCES [dbo].[Judges] ([Judge_id])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_Judges]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_Teams] FOREIGN KEY([Hometeam_id])
REFERENCES [dbo].[Teams] ([Team_id])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_Teams]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_Teams1] FOREIGN KEY([Awayteam_id])
REFERENCES [dbo].[Teams] ([Team_id])
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_Teams1]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Groups] FOREIGN KEY([Team_id])
REFERENCES [dbo].[Groups] ([Group_id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Groups]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Manager] FOREIGN KEY([Team_id])
REFERENCES [dbo].[Manager] ([Manager_id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Manager]
GO
/****** Object:  StoredProcedure [dbo].[CalcPoints]    Script Date: 27.9.2021 г. 0:43:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalcPoints] (@Team_id AS INT)
AS 
SELECT t.Team_name AS Team, SUM(
CASE WHEN t.Team_id = g.Hometeam_id AND Hometeam_score > Awayteam_score OR t.Team_id = g.Awayteam_id AND Awayteam_score > Hometeam_score THEN 3  
WHEN t.Team_id = g.Hometeam_id AND Hometeam_score = Awayteam_score OR t.Team_id = g.Awayteam_id AND Awayteam_score = Hometeam_score THEN 1 ELSE 0 END) AS Pts,
	   g.Game_date
FROM Games AS g JOIN Teams as t
ON g.Hometeam_id = t.Team_id OR g.Awayteam_id = t.Team_id 
WHERE Team_id=@Team_id 
GROUP BY g.Game_date,t.Team_name;
GO
USE [master]
GO
ALTER DATABASE [FootballMariyaTsenkina] SET  READ_WRITE 
GO
