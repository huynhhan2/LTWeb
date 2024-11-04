USE master;
CREATE DATABASE shopperfume;
GO
USE [shopperfume]
GO


CREATE TABLE [dbo].[cart](
    [cid] [int] IDENTITY(1,1) PRIMARY KEY,
    [bid] [int] NULL,
    [uid] [int] NULL,
    [perfumeName] [nvarchar](100) NULL,
    [author] [nvarchar](100) NULL,
    [price] [float] NULL,
    [total_price] [float] NULL
);
GO
CREATE TABLE [dbo].[perfume_dtls](
    [perfumeID] [int] IDENTITY(1,1) PRIMARY KEY,
    [perfumeName] [nvarchar](100) NULL,
    [author] [nvarchar](100) NULL,
    [price] [float] NULL,
    [perfumeCategory] [nvarchar](100) NULL,
    [status] [nvarchar](50) NULL,
    [photo] [nvarchar](255) NULL,
    [email] [nvarchar](100) NULL
);
GO
CREATE TABLE [dbo].[perfume_order](
    [id] [int] IDENTITY(1,1) PRIMARY KEY,
    [order_id] [nvarchar](255) NULL,
    [username] [nvarchar](100) NULL,
    [email] [nvarchar](100) NULL,
    [address] [nvarchar](255) NULL,
    [phone] [nvarchar](15) NULL,
    [perfume_name] [nvarchar](100) NULL,
    [author] [nvarchar](100) NULL,
    [price] [float] NULL,
    [payment] [nvarchar](50) NULL
);
GO
CREATE TABLE [dbo].[user](
    [id] [int] IDENTITY(1,1) PRIMARY KEY,
    [name] [nvarchar](100) NULL,
    [email] [nvarchar](100) NULL,
    [phno] [nvarchar](20) NULL,
    [password] [nvarchar](255) NULL,
    [address] [nvarchar](255) NULL,
    [landmark] [nvarchar](100) NULL,
    [city] [nvarchar](100) NULL,
    [state] [nvarchar](100) NULL
);
GO
CREATE TABLE [dbo].[perfume_sales](
    [id] [int] IDENTITY(1,1) PRIMARY KEY,
    [perfume_name] [nvarchar](100) NULL,
    [author] [nvarchar](100) NULL,
    [price] [float] NULL,
    [payment] [nvarchar](50) NULL,
    [date] [datetime] NULL
);

GO -- Add this GO statement to separate batches

CREATE VIEW dbo.AuthorSalesView
AS
SELECT
    author,
    COUNT(*) AS quantity,
    SUM(price) AS total_revenue,
    payment
FROM
    perfume_sales
GROUP BY
    author, payment;
GO -- Add this GO statement to separate batches

CREATE FUNCTION GetSalesSummary()
RETURNS TABLE
AS
RETURN
(
    SELECT
        [perfume_name],
        [author],
        [price],
        [payment],
        COUNT(*) AS [quantity]
    FROM
        [perfume_sales]
    GROUP BY
        [perfume_name],
        [author],
        [price],
        [payment]
);
GO -- Add this GO statement to separate batches

CREATE FUNCTION GetSalesSummaryInRange( @startDate DATETIME, @endDate DATETIME )
RETURNS TABLE
AS
RETURN
(
    SELECT
        [perfume_name],
        [author],
        [price],
        [payment],
        COUNT(*) AS [quantity]
    FROM
        [perfume_sales]
    WHERE
        [date] BETWEEN @startDate AND @endDate
    GROUP BY
        [perfume_name],
        [author],
        [price],
        [payment]
);