USE [MVCTutorial]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 4/28/2021 5:52:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/28/2021 5:52:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[DepartmentId] [int] NULL,
	[Address] [varchar](150) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sites]    Script Date: 4/28/2021 5:52:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sites](
	[SiteId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NULL,
	[SiteName] [nvarchar](150) NULL,
 CONSTRAINT [PK_Sites] PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (1, N'IT')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (2, N'QA')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (3, N'Development ')
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName]) VALUES (4, N'Marketing')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeId], [Name], [DepartmentId], [Address]) VALUES (1, N'Ashish', 1, N'India')
INSERT [dbo].[Employee] ([EmployeeId], [Name], [DepartmentId], [Address]) VALUES (2, N'John', 2, N'London')
INSERT [dbo].[Employee] ([EmployeeId], [Name], [DepartmentId], [Address]) VALUES (3, N'Methew', 3, N'NewYork')
INSERT [dbo].[Employee] ([EmployeeId], [Name], [DepartmentId], [Address]) VALUES (4, N'Brano', 4, N'France')
INSERT [dbo].[Employee] ([EmployeeId], [Name], [DepartmentId], [Address]) VALUES (5, N'Smith', 1, N'London')
INSERT [dbo].[Employee] ([EmployeeId], [Name], [DepartmentId], [Address]) VALUES (6, N'Sara', 4, N'New york')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Sites] ON 

INSERT [dbo].[Sites] ([SiteId], [EmployeeId], [SiteName]) VALUES (1, 1005, N'google.com')
INSERT [dbo].[Sites] ([SiteId], [EmployeeId], [SiteName]) VALUES (2, 1006, N'www.technotips.com')
SET IDENTITY_INSERT [dbo].[Sites] OFF
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
