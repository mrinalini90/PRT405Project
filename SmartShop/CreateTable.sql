CREATE TABLE [dbo].[Product] (
    [ProductId]       INT IDENTITY(1,1)            NOT NULL,
    [ProductName]     VARCHAR (50)    NULL,
    [ProductCategory] NVARCHAR (50)   NULL,
	[ProductDescription] NVARCHAR (220)   NULL,
    [ProductPrice]    DECIMAL (10, 2) NULL,
	[ProductStatus]    NVARCHAR (50) NULL,
	[ProductQuantity]    INT NULL,
    PRIMARY KEY CLUSTERED ([ProductId] ASC),
	UserID nvarchar(128) FOREIGN KEY REFERENCES AspNetUsers(Id)
);

CREATE TABLE [dbo].[Cart] (
    [CartId]       INT IDENTITY(1,1)    NOT NULL,
    [Quantity]     INT    NULL,
    [TotalAmount]    DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([CartId] ASC),
	UserID nvarchar(128) FOREIGN KEY REFERENCES AspNetUsers(Id),
	ProductId INT FOREIGN KEY REFERENCES Product(ProductId)
);