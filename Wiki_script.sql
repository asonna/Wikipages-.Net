USE [master]
GO
/****** Object:  Database [Wikipages]    Script Date: 2/6/2017 5:26:39 PM ******/
CREATE DATABASE [Wikipages]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wikipages', FILENAME = N'C:\Users\epicodus\Wikipages.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Wikipages_log', FILENAME = N'C:\Users\epicodus\Wikipages_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Wikipages] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wikipages].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wikipages] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wikipages] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wikipages] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wikipages] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wikipages] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wikipages] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Wikipages] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wikipages] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wikipages] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wikipages] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wikipages] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wikipages] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wikipages] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wikipages] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wikipages] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Wikipages] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wikipages] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wikipages] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wikipages] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wikipages] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wikipages] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wikipages] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wikipages] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Wikipages] SET  MULTI_USER 
GO
ALTER DATABASE [Wikipages] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wikipages] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wikipages] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wikipages] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Wikipages] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Wikipages] SET QUERY_STORE = OFF
GO
USE [Wikipages]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Wikipages]
GO
/****** Object:  Table [dbo].[Businesses]    Script Date: 2/6/2017 5:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Businesses](
	[BusinessId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Addresses] [nvarchar](max) NOT NULL,
	[Website] [nvarchar](max) NULL,
	[BusinessHour] [nvarchar](max) NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_Businesses] PRIMARY KEY CLUSTERED 
(
	[BusinessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 2/6/2017 5:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Businesses]  WITH CHECK ADD  CONSTRAINT [FK_Businesses_Types] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Types] ([TypeId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Businesses] CHECK CONSTRAINT [FK_Businesses_Types]
GO
USE [master]
GO
ALTER DATABASE [Wikipages] SET  READ_WRITE 
GO
