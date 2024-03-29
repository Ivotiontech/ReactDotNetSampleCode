USE [Store]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 02/05/2024 18:38:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([Id], [Name], [StartTime], [EndTime]) VALUES (1, N'Pharmacy', CAST(N'05:00:00' AS Time), CAST(N'13:30:00' AS Time))
INSERT [dbo].[Locations] ([Id], [Name], [StartTime], [EndTime]) VALUES (2, N'Test Com', CAST(N'09:30:00' AS Time), CAST(N'18:30:00' AS Time))
INSERT [dbo].[Locations] ([Id], [Name], [StartTime], [EndTime]) VALUES (3, N'Nirma Limited', CAST(N'05:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[Locations] ([Id], [Name], [StartTime], [EndTime]) VALUES (4, N'Cadila Healthcare Ltd.', CAST(N'07:00:00' AS Time), CAST(N'21:00:00' AS Time))
INSERT [dbo].[Locations] ([Id], [Name], [StartTime], [EndTime]) VALUES (5, N'Biocon Ltd.', CAST(N'09:00:00' AS Time), CAST(N'21:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_GetLocationByTime]    Script Date: 02/05/2024 18:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetLocationByTime]
(
@fromTime varchar(50)=null,
@endTime varchar(50)=null
)
AS
Begin
SELECT Id, Name, CAST(StartTime AS varchar(8)) AS StartTime, CAST(EndTime AS varchar(8)) AS EndTime FROM locations 
where CAST(StartTime AS time(7)) = CAST(@fromTime AS time(7)) and CAST(EndTime AS time(7)) = CAST(@endTime AS time(7))
--select 1
End
GO
/****** Object:  StoredProcedure [dbo].[sp_StoreLocation]    Script Date: 02/05/2024 18:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_StoreLocation]
AS
Begin
SELECT Id, Name, CAST(StartTime AS VARCHAR(8)) AS StartTime, CAST(EndTime AS VARCHAR(8)) AS EndTime FROM locations 
End
GO
