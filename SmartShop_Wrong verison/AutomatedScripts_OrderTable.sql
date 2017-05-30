USE [SmartShop]
GO

/****** Object:  Table [dbo].[Order]    Script Date: 30/05/2017 04:03:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[UserID] [nvarchar](128) NULL,
	[ProductId] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[BuyerID] [nvarchar](128) NULL,
	[CartId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([CartId])
REFERENCES [dbo].[Cart] ([CartId])
GO


