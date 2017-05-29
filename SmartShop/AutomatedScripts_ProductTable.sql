USE [SmartShop]
GO

/****** Object:  Table [dbo].[Product]    Script Date: 30/05/2017 04:03:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[ProductCategory] [nvarchar](50) NULL,
	[ProductDescription] [nvarchar](220) NULL,
	[ProductPrice] [decimal](10, 2) NULL,
	[ProductStatus] [nvarchar](50) NULL,
	[ProductQuantity] [int] NULL,
	[UserID] [nvarchar](128) NULL,
	[Sold] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__UserID__32E0915F] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__UserID__32E0915F]
GO


