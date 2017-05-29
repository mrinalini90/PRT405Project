USE [SmartShop]
GO

/****** Object:  Table [dbo].[Cart]    Script Date: 30/05/2017 04:03:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[UserID] [nvarchar](128) NULL,
	[ProductId] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[BuyerID] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK__Cart__ProductId__36B12243] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK__Cart__ProductId__36B12243]
GO

ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO


