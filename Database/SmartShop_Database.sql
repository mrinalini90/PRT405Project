USE [master]
GO
/****** Object:  Database [SmartShop]    Script Date: 29/04/2017 7:13:46 PM ******/
CREATE DATABASE [SmartShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'S295076_MinhThuanTran', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\S295076_MinhThuanTran.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'S295076_MinhThuanTran_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\S295076_MinhThuanTran_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SmartShop] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SmartShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SmartShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartShop] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SmartShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SmartShop] SET  MULTI_USER 
GO
ALTER DATABASE [SmartShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SmartShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SmartShop] SET QUERY_STORE = OFF
GO
USE [SmartShop]
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
USE [SmartShop]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 29/04/2017 7:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 29/04/2017 7:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 29/04/2017 7:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 29/04/2017 7:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 29/04/2017 7:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 29/04/2017 7:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Address] [nvarchar](265) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 29/04/2017 7:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [nvarchar](128) NOT NULL,
	[ProductName] [nchar](100) NOT NULL,
	[ProductDescription] [text] NULL,
	[UoM] [nchar](50) NOT NULL,
	[Quanlity] [int] NOT NULL,
	[Price] [int] NULL,
	[Enable] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserBuyingProduct]    Script Date: 29/04/2017 7:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBuyingProduct](
	[UserID] [nvarchar](128) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Paid] [bit] NOT NULL,
 CONSTRAINT [PK_UserBuyingProduct] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201704180606569_InitialCreate', N'E_Corp.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3FC0F90F829E7A0EB2562E6717DBC06E913A494FD0CD05EB6CD1B780966847588952252A4D50F497F5E1FCA4F3173A942859BCE9622BB6532CB088C8E137C3E1901C0E87FEFF9FFF1B7FFF1C06D6134E523F2213FB6874685B98B891E793E5C4CEE8E2DD47FBFBEFFEF98FF185173E5B3F9774278C0E5A9274623F521A9F3A4EEA3EE210A5A3D07793288D1674E446A183BCC8393E3CFCD6393A723040D8806559E3CF19A17E88F30FF89C46C4C531CD50701D7938487939D4CC7254EB0685388D918B27F6C5C3344AE25141685B67818F4088190E16B685088928A220E2E99714CF681291E52C860214DCBFC418E81628483117FD7445DEB51787C7AC17CEAA6109E566298DC29E8047275C2D8EDC7C2DE5DA95DA407117A060FAC27A9D2B6F625F79382FFA1C05A00099E1E9344818F1C4BEAE589CA5F10DA6A3B2E1A880BC4C00EEB728F93AAA231E589DDB1D5466743C3A64FF0EAC6916D02CC11382339AA0E0C0BACBE681EFFE845FEEA3AF984C4E8EE68B938FEF3F20EFE4C37FF0C9FB7A4FA1AF40271440D15D12C53801D9F0A2EABF6D39623B476E5835ABB529B402B60433C2B6AED1F3274C96F411E6CAF147DBBAF49FB1579670E3FA427C9840D08826197CDE644180E601AEEA9D469EECFF06AEC7EF3F0CC2F5063DF9CB7CE825FE30711298579F7190D7A68F7E5C4C2F61BC1F38D9651285EC5BB4AFA2F661166589CB3A131949EE51B2C454946EECAC8CB7934933A8E1CDBA44DD7FD36692AAE6AD25651D5A6726942CB63D1B4A795F976F678B3B8B6318BCDCB498469A0C4ED8A74652C303EBE21DAB5E19CC51578321D091BFF3FA7711223F186001ECC005DC8E859F84B8EAE50F11981B22BD65BE43690AF3DFFB2F4A1F1B44873F07107D86DD2C01B39C5114C6AFCEEDEE3122F8260BE7CCDAB7C76BB0A1B9FF2DBA442E8D920BC25A6D8CF72972BF4619BD20DE39A2F80B754B40F679EF87DD010611E7CC75719A5E8231636F1A81575D025E117A72DC1B8EAD4DBB7640A601F243BD0722ADA20F25E9CA0BD153289E88814CE78D3489FA295AFAA49BA825A959D482A255544ED6575406D64D524E691634276895B3A01ACCBFCB476878072F87DD7F0F6FB3CDDBB416D4D438831512FF88094E6019F3EE10A53821AB11E8B26EECC259C8878F317DF5BD29E7F4330AB2A159AD351BF24560F8D990C3EEFF6CC8C584E227DF635E4987634F490CF09DE8F527AAF6392749B6EDE9207473DBCCB7B30698A6CB599A46AE9FCF024DC08B872B44F9C187B3DA6317456FE4F807740C0CDD675B1E9440DF6CD9A86EC9390E30C5D6995B0404A7287591A7AA113AE4F510ACDC513582ADE220A270FF567882A5E3843542EC1094C24CF50955A7854F5C3F4641AB96A4961DB730D6F78A875C738E634C18C3564D7461AE0F7B30012A3ED2A0B46968ECD42CAED9100D5EAB69CCDB5CD8D5B82BD188ADD8648BEF6CB04BEEBFBD8A61366B6C0BC6D9AC922E02184378BB30507E56E96A00F2C165DF0C543A31190C94BB545B315051633B305051256FCE408B236AD7F197CEABFB669EE24179FBDB7AA3BA76609B823EF6CC340BDF13DA50688113D53CCFE7AC123F53CDE10CE4E4E7B394BBBAB28930F019A662C866E5EF6AFD50A7194436A226C095A1B580F2CB3F054899503D842B63798DD2712FA2076C19776B84E56BBF045BB30115BB7E095A23345F95CAC6D9E9F451F5ACB206C5C83B1D166A381A8390172FB1E31D94628ACBAA8AE9E20BF7F1866B1DE383D1A0A016CFD5A0A4B233836BA934CD762DE91CB23E2ED9465A92DC278396CACE0CAE256EA3ED4AD238053DDC828D54246EE1034DB632D251ED3655DDD829D2A278C1D831E44F8DAF511CFB6459CBA7E225D6AC48A69ABE9BF54F350A0B0CC74D35194795B415271A256889A55A600D925EFA494ACF114573C4E23C532F54C8B47BAB61F92F59D6B74F7510CB7DA0A4667FF34B61E1CA5ED866553F8437BF84CE85CC99C923E89AA1D737B7586A1B0A50A209DA4FA3200B89D9B732B72EAEEEEAED8B121561EC48F22BBE93A228C5C315B5DE694CD4F9B0F9F8545ECBFA6364863069BAF439EBBA36F9A16694322C55473185AA76366626F7A5EB38C94E61FF616A45789DD9C43351EA00BCA827462D994101ABD5754715F34DEA98624D774429A9A40E2955F590B29E3A220859AF580BCFA0513D45770E6AB2481D5DADED8EAC491BA9436BAAD7C0D6C82CD77547D56496D48135D5DDB1576926F2FAB9C7FB95F1A8B2CE86551C6437DBB10C18AFB3180EB3E1D5EEEBEB40B5E29E58FC465E01E3E57B6948C6D3DC3A8654842E363324038679BD112EB9C5E5A6F166DE8C29DC5C0B4B7AD3CDBD19AF9FB9BEAA5128E73899A4E25E9DE7A473DB989FA1DA1FC72887AA82C4B64A35C276FE92521C8E18C168F66B300D7CCC16EF92E01A117F81535A646BD8C78747C7D2239BFD79F0E2A4A91768CEA0A6572FE2986D21F18A3CA1C47D44899A06B1C1A39015A81261BE221E7E9ED8BFE7AD4EF36005FB2B2F3EB0AED22FC4FF35838AFB24C3D61F6A5AE73049F2CDA7AA3D7DD2D05DAB57BF3C144D0FACDB0466CCA97528E9729D11161F3AF492A668BA81346B3F7F78BB134A7865A0459526C4FA8F0AE63E1DE4414129E537217AFE575FD1B48F063642D43C0C180A6F10159A12FFD7C13226FD7BF049F3A4FF7E9DD53F02584734E303009FF40793D3FFBB2F4365CB1D6E359AE3D03696A45CCFADE9D31BE552EE7A6F52B2AC379AE86A26750FB80DB2A5D7B08C3796683CD8EEA8C9231E0C7B97A6FDEAC9C3FB922FBCCAE4D86D9AF03633831BEE81FE5609C17B90C2A649C9D97DDAEFB66DCD14C2DDF3DCC97EC9BD7B666C3C516BF729BCDB3636539877CF8DAD57A2EE9ED9DAAEF6CF1D5B5AE72D74E769B76A0691E12A46170B6E4BAB2D02E770C29F476004854759BC86D4E77135E5A0B6305C9198999A13C864C6CAC451F82A14CD6CFBF5956FF88D9DE534CD6C0D69974DBCF9FADFC89BD334F3362433EE2221589B4EA84BD26E59C79AB29EDE5202B0D093967CF3369FB5F15EFD2DE5FB0EA21461F618EE88DF4E7AEF202A1972EAF448E755AF7B61EFACFD6222ECDFA9BF5C41B0DF4F24D81576CD8AE68A2CA272F396242A49A408CD35A6C8832DF52CA1FE02B914AA598C397FCE9DC7EDD84DC71C7B57E436A37146A1CB389C0742C08B39014DFCF39C6551E6F16D9CFF32C9105D00317D169BBF253F647EE055725F6A62420608E65DF0882E1B4BCA22BBCB970AE926221D81B8FA2AA7E81E87710060E92D99A127BC8E6C607E9FF012B92FAB08A009A47D2044B58FCF7DB44C5098728C557BF8041BF6C2E7EFFE0265E9E04E38540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'Buyer')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Seller')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2b8138eb-b3d6-492b-b836-97b0828a12d7', N'1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Address]) VALUES (N'2b8138eb-b3d6-492b-b836-97b0828a12d7', N'admin@smartshop.com', 0, N'ANuNo/iAX1uOwkbuQaeIfs/9omfIt2OrB0d9f/NbhVQ7OCRdIHqIC9suW/otSQGy8A==', N'1c1be1da-7c2b-43a5-8eec-97e7fcadc0aa', NULL, 0, 0, NULL, 1, 0, N'admin@smartshop.com', NULL)
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 29/04/2017 7:13:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 29/04/2017 7:13:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 29/04/2017 7:13:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 29/04/2017 7:13:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 29/04/2017 7:13:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 29/04/2017 7:13:47 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Quanlity]  DEFAULT ((0)) FOR [Quanlity]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Enable]  DEFAULT ((1)) FOR [Enable]
GO
ALTER TABLE [dbo].[UserBuyingProduct] ADD  CONSTRAINT [DF_UserBuyingProduct_Paid]  DEFAULT ((0)) FOR [Paid]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_AspNetUsers] FOREIGN KEY([SellerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_AspNetUsers]
GO
ALTER TABLE [dbo].[UserBuyingProduct]  WITH CHECK ADD  CONSTRAINT [FK_UserBuyingProduct_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserBuyingProduct] CHECK CONSTRAINT [FK_UserBuyingProduct_AspNetUsers]
GO
ALTER TABLE [dbo].[UserBuyingProduct]  WITH CHECK ADD  CONSTRAINT [FK_UserBuyingProduct_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[UserBuyingProduct] CHECK CONSTRAINT [FK_UserBuyingProduct_Products]
GO
/****** Object:  StoredProcedure [dbo].[Procedure]    Script Date: 29/04/2017 7:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Procedure]
	@userid nchar(128)
AS
SELECT    dbo.AspNetRoles.Id, dbo.AspNetRoles.Name
FROM         dbo.AspNetRoles INNER JOIN
             dbo.AspNetUserRoles ON dbo.AspNetRoles.Id = dbo.AspNetUserRoles.RoleId
WHERE        (dbo.AspNetUserRoles.UserId = @userid)

RETURN 0

GO
USE [master]
GO
ALTER DATABASE [SmartShop] SET  READ_WRITE 
GO
