USE [master]
GO

CREATE DATABASE [Airplane]
GO
USE [Airplane]
GO

CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'thulvm', N'Thu Le', N'1', N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE170443', N'LE MINH KHOA', N'1', N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [status]) VALUES (N'SE170969', N'Nguyen Gia Tin', N'123', N'US', 1)
GO
Drop table  [dbo].[tblAirplanes]
CREATE TABLE [dbo].[tblAirplanes](
	[id] [char](5) NOT NULL,
	[destination] [nvarchar](50) NOT NULL,
	[departureTime] [nvarchar](50) NOT NULL,
	[isDelay] bit NOT NULL,
 CONSTRAINT [PK_tblAirplanes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

INSERT [dbo].[tblAirplanes] ([id], [destination], [departureTime],[isDelay]) VALUES (N'A001', N'VN', N'2023-10-18T16:53',0)
INSERT [dbo].[tblAirplanes] ([id], [destination],[departureTime],[isDelay])VALUES (N'A002', N'Korea', N'2023-10-20T16:53',0)
