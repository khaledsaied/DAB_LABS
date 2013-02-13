CREATE TABLE [dbo].[Vaerktoej]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Type] NCHAR(10) NOT NULL, 
    [TilhoererKasse] INT NOT NULL, 
    CONSTRAINT [FK_Vaerktoej_ToVaerktoejskasse] FOREIGN KEY ([TilhoererKasse]) REFERENCES [Vaerktoejskasse]([VKId])
)
