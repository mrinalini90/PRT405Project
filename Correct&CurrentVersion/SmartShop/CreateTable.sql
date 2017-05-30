CREATE TABLE [dbo].[Product] (
    [ProductId]       INT IDENTITY(1,1)            NOT NULL,
    [ProductName]     VARCHAR (50)    NULL,
    [ProductCategory] NVARCHAR (50)   NULL,
	[ProductDescription] NVARCHAR (220)   NULL,
    PRIMARY KEY CLUSTERED ([ProductId] ASC),
	UserID nvarchar(128) FOREIGN KEY REFERENCES AspNetUsers(Id)
);