USE [BD]
GO
/****** Object:  Table [dbo].[Authorization]    Script Date: 26.05.2023 1:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorization](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Role] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Authorization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 26.05.2023 1:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nchar](10) NOT NULL,
	[ClassTeacher] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessions]    Script Date: 26.05.2023 1:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Lession] [nvarchar](max) NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[TeachersID] [int] NOT NULL,
	[WeekdayID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_Lessions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableWeekday]    Script Date: 26.05.2023 1:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableWeekday](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Weekday] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TableWeekday] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 26.05.2023 1:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[MiddleName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Teachers] FOREIGN KEY([ClassTeacher])
REFERENCES [dbo].[Teachers] ([ID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Teachers]
GO
ALTER TABLE [dbo].[Lessions]  WITH CHECK ADD  CONSTRAINT [FK_Lessions_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ID])
GO
ALTER TABLE [dbo].[Lessions] CHECK CONSTRAINT [FK_Lessions_Class]
GO
ALTER TABLE [dbo].[Lessions]  WITH CHECK ADD  CONSTRAINT [FK_Lessions_TableWeekday] FOREIGN KEY([WeekdayID])
REFERENCES [dbo].[TableWeekday] ([ID])
GO
ALTER TABLE [dbo].[Lessions] CHECK CONSTRAINT [FK_Lessions_TableWeekday]
GO
ALTER TABLE [dbo].[Lessions]  WITH CHECK ADD  CONSTRAINT [FK_Lessions_Teachers] FOREIGN KEY([TeachersID])
REFERENCES [dbo].[Teachers] ([ID])
GO
ALTER TABLE [dbo].[Lessions] CHECK CONSTRAINT [FK_Lessions_Teachers]
GO
