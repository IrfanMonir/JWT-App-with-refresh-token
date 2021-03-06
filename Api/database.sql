USE [master]
GO
/****** Object:  Database [StudentRegistrationDb]    Script Date: 7/26/2021 11:05:21 AM ******/
CREATE DATABASE [StudentRegistrationDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentRegistrationDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentRegistrationDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentRegistrationDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentRegistrationDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentRegistrationDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentRegistrationDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentRegistrationDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentRegistrationDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentRegistrationDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentRegistrationDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentRegistrationDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentRegistrationDb] SET  MULTI_USER 
GO
ALTER DATABASE [StudentRegistrationDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentRegistrationDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentRegistrationDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentRegistrationDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentRegistrationDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentRegistrationDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentRegistrationDb', N'ON'
GO
ALTER DATABASE [StudentRegistrationDb] SET QUERY_STORE = OFF
GO
USE [StudentRegistrationDb]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 7/26/2021 11:05:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Credit] [int] NULL,
 CONSTRAINT [PK_Courses1] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 7/26/2021 11:05:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[StudentCourseId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK_StudentCourse] PRIMARY KEY CLUSTERED 
(
	[StudentCourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 7/26/2021 11:05:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[RegNo] [int] NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [varchar](50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tokens]    Script Date: 7/26/2021 11:05:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tokens](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [varchar](50) NOT NULL,
	[Value] [varchar](max) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[UserId] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[ExpiryTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Tokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/26/2021 11:05:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [Name], [Credit]) VALUES (1, N'C#', 3)
INSERT [dbo].[Courses] ([CourseId], [Name], [Credit]) VALUES (2, N'TypeScript', 3)
INSERT [dbo].[Courses] ([CourseId], [Name], [Credit]) VALUES (3, N'JavaScript', 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentCourse] ON 

INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (20, 15, 1)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (21, 15, 3)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (22, 16, 2)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (23, 16, 3)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (28, 19, 1)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (29, 19, 2)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (34, 22, 2)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (35, 22, 3)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (36, 23, 1)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (37, 23, 3)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (43, 24, 1)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (44, 24, 3)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (52, 25, 2)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (55, 26, 2)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (56, 26, 3)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (59, 27, 1)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (66, 28, 1)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (67, 28, 2)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (68, 28, 3)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (70, 29, 1)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (71, 29, 2)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (72, 29, 3)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (73, 30, 2)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (74, 30, 3)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (75, 18, 1)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (76, 18, 2)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (81, 31, 3)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (82, 14, 1)
INSERT [dbo].[StudentCourse] ([StudentCourseId], [StudentId], [CourseId]) VALUES (83, 14, 2)
SET IDENTITY_INSERT [dbo].[StudentCourse] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (14, N'Zakaria updated ', 1234, CAST(N'2021-07-16' AS Date), N'male')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (15, N'Bijoy', 5678, CAST(N'2021-07-16' AS Date), N'male')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (16, N'masud', 4367, CAST(N'2021-07-31' AS Date), N'male')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (18, N'nicky updated 1', 123876, CAST(N'2021-07-29' AS Date), N'male')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (19, N'touhid bhai', 446899, CAST(N'2021-07-29' AS Date), N'male')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (22, N'a', 231241241, CAST(N'2021-07-28' AS Date), N'female')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (23, N'abc', 64322, CAST(N'2021-07-21' AS Date), N'female')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (24, N'sdsadd update', 123231, CAST(N'2021-07-28' AS Date), N'female')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (25, N'monir', 34324, CAST(N'2021-07-19' AS Date), N'female')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (26, N'sdas1', 12334, CAST(N'2021-07-22' AS Date), N'male')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (27, N'arunav', 197422, CAST(N'2021-07-12' AS Date), N'male')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (28, N'student 1 updated', 56342112, CAST(N'2021-07-24' AS Date), N'male')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (29, N'test updated', 902711356, CAST(N'2021-07-27' AS Date), N'male')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (30, N'dasd', 12343431, CAST(N'2021-07-23' AS Date), N'female')
INSERT [dbo].[Students] ([StudentId], [Name], [RegNo], [DateOfBirth], [Gender]) VALUES (31, N'test muba', 82363121, CAST(N'2021-07-22' AS Date), N'female')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Tokens] ON 

INSERT [dbo].[Tokens] ([Id], [ClientId], [Value], [CreatedDate], [UserId], [LastModifiedDate], [ExpiryTime]) VALUES (7, N'StudentRegistraton-REFRESH-TOKEN', N'3e6b6b4297404dc09f9030c8218cffcf', CAST(N'2021-07-26' AS Date), 1, CAST(N'2021-07-26T10:59:02.307' AS DateTime), CAST(N'2021-07-26T12:29:02.297' AS DateTime))
INSERT [dbo].[Tokens] ([Id], [ClientId], [Value], [CreatedDate], [UserId], [LastModifiedDate], [ExpiryTime]) VALUES (8, N'StudentRegistraton-REFRESH-TOKEN', N'be9b16fe28514d37904c6a8f904d4e0f', CAST(N'2021-07-26' AS Date), 1, CAST(N'2021-07-26T11:01:57.670' AS DateTime), CAST(N'2021-07-26T12:31:57.667' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tokens] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Name], [PasswordHash], [PasswordSalt]) VALUES (1, N'bijoy', 0x7E663E02262B083B76B382F668D017DF784C005DFCE37528E33E9D8286430ACBD7D87EA28D0497BB203ADF2D31D28041E132DB9C017258A80F1984E89DC98A53, 0xE31E053275E78FB4343F31CAD64913ECCA3C7FDE066F86B70CF3073BB8444004B7FFCF09D7A4922039C029B29DBD37EAB3B98D7288DA239CC70968A48CB53067DA1912A90CB4EB69A57BC3C791DA2284C393E1660F9277468A9D6A052078CBCFE00E73E6FABE130FC74D6249449FB458AAFF80E2DC4C9AC1F67DCDE2642CB348)
INSERT [dbo].[Users] ([UserId], [Name], [PasswordHash], [PasswordSalt]) VALUES (2, N'zb', 0x4E7F7B026A753ADE6A006B6FD545C6A198C8D1B193C45E0436A84CCEA0A672386A1CA376D7BEB1524FEA9CB46FC8B32124727D072EF4CEA6AE7D4A27D0804D97, 0x6427F39F9EF4130FC41F880F616F85D7743895F832C0C33AB076CCE070D41E05ABD7F04A2472F6CADF957D78942B1206C791116F68BB32D7ED3B1AF0131A2CEC1954B9EDA64FB084943FD4E67AEA3EBA984F361AB86D9D358A9DBF997DD85D22C8209484F11E30DEE25C3044355D8DD50A0F56E458B2762777FBDA98D01F7B66)
INSERT [dbo].[Users] ([UserId], [Name], [PasswordHash], [PasswordSalt]) VALUES (3, N'zb', 0xDF3ED1A6F1259C5BF72DA54E249AAAC1BFBCC7974DCBEE5E95D032E05C9AEB28E33862C9226E3D3A24B9E918605819CDCA13D70CAD45D4820F6E33DA52F7882A, 0x67C98359990BCD82FEF57316D79EF0D5D4C9BB469F8D33D073A5D3394E0CD613039FCA709F16E767DF2F9116167E655FC81BA42946998585F11E8D85C2D0EB4DC91C922EFE4D157623C000C42AC15E1FC6A394F9A003E9F9D5B1D8368AFD4F174C59775B1E3B6A112CA5661EE1B3C9C3890F20E3C4CC8D11D2E4E88EE81D2AD4)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Students]    Script Date: 7/26/2021 11:05:22 AM ******/
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [IX_Students] UNIQUE NONCLUSTERED 
(
	[RegNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Courses]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Students]
GO
ALTER TABLE [dbo].[Tokens]  WITH CHECK ADD  CONSTRAINT [FK_Tokens_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Tokens] CHECK CONSTRAINT [FK_Tokens_Users]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetALLCourse]    Script Date: 7/26/2021 11:05:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GetALLCourse]
                AS 
                BEGIN 
                    SELECT *
                    FROM Courses
                END
GO
USE [master]
GO
ALTER DATABASE [StudentRegistrationDb] SET  READ_WRITE 
GO
