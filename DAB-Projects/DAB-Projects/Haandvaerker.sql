CREATE TABLE [dbo].[Haandvaerker]
(
	[HaandvaerkerId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Fornavn] NVARCHAR(50) NOT NULL,
    [Efternavn] NVARCHAR(50) NOT NULL 
)
