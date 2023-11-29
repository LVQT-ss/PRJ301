USE [master]
GO

CREATE DATABASE [StudentManagement]
GO
USE [StudentManagement]
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


CREATE TABLE [dbo].[tblStudents](
	[id] [char](5) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[major] [nvarchar](500) NOT NULL,
	[yearOfBirth] [int] NOT NULL,
)
INSERT [dbo].[tblStudents] ([id], [name], [major], [yearOfBirth]) VALUES (N'FA001', N'Tuan Anh Ngu', N'SE', 2003)
INSERT [dbo].[tblStudents] ([id], [name], [major], [yearOfBirth]) VALUES (N'FA002', N'Tuan Anh ne', N'AI', 2003)