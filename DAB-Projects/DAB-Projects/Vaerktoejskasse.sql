CREATE TABLE [dbo].[Vaerktoejskasse]
(
	[VKId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Type] NVARCHAR(30) NOT NULL, 
	[Ejer] INT NOT NULL, 
    CONSTRAINT [FK_Vaerktoejskasse_ToHaandvaerker] FOREIGN KEY ([Ejer]) REFERENCES [Haandvaerker]([HaandvaerkerId]) 
)
