ALTER DATABASE [pagecache5] ADD FILEGROUP [area0]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [area1]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [area2]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [area3]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [area4]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [area5]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [area6]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [area7]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [area8]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [area9]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [areaa]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [areab]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [areac]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [aread]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [areae]
GO
ALTER DATABASE [pagecache5] ADD FILEGROUP [areaf]
GO








ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache50',
FILENAME = N'D:\DataBases\Data\pagecache50.ndf')
TO FILEGROUP [area0]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache51',
FILENAME = N'D:\DataBases\Data\pagecache51.ndf')
TO FILEGROUP [area1]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache52',
FILENAME = N'D:\DataBases\Data\pagecache52.ndf')
TO FILEGROUP [area2]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache53',
FILENAME = N'D:\DataBases\Data\pagecache53.ndf')
TO FILEGROUP [area3]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache54',
FILENAME = N'D:\DataBases\Data\pagecache54.ndf')
TO FILEGROUP [area4]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache55',
FILENAME = N'D:\DataBases\Data\pagecache55.ndf')
TO FILEGROUP [area5]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache56',
FILENAME = N'D:\DataBases\Data\pagecache56.ndf')
TO FILEGROUP [area6]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache57',
FILENAME = N'D:\DataBases\Data\pagecache57.ndf')
TO FILEGROUP [area7]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache58',
FILENAME = N'D:\DataBases\Data\pagecache58.ndf')
TO FILEGROUP [area8]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache59',
FILENAME = N'D:\DataBases\Data\pagecache59.ndf')
TO FILEGROUP [area9]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache5a',
FILENAME = N'D:\DataBases\Data\pagecache5a.ndf')
TO FILEGROUP [areaa]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache5b',
FILENAME = N'D:\DataBases\Data\pagecache5b.ndf')
TO FILEGROUP [areab]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache5c',
FILENAME = N'D:\DataBases\Data\pagecache5c.ndf')
TO FILEGROUP [areac]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache5d',
FILENAME = N'D:\DataBases\Data\pagecache5d.ndf')
TO FILEGROUP [aread]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache5e',
FILENAME = N'D:\DataBases\Data\pagecache5e.ndf')
TO FILEGROUP [areae]
GO
ALTER DATABASE [pagecache5] ADD FILE
(NAME = N'pagecache5f',
FILENAME = N'D:\DataBases\Data\pagecache5f.ndf')
TO FILEGROUP [areaf]
GO








CREATE TABLE [data_00](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_00] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_01](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_01] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_02](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_02] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_03](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_03] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_04](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_04] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_05](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_05] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_06](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_06] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_07](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_07] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_08](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_08] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_09](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_09] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_0a](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_0a] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_0b](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_0b] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_0c](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_0c] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_0d](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_0d] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_0e](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_0e] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_0f](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_0f] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area0]
	
) TEXTIMAGE_ON [area0]
go 
CREATE TABLE [data_10](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_10] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_11](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_11] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_12](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_12] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_13](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_13] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_14](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_14] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_15](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_15] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_16](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_16] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_17](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_17] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_18](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_18] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_19](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_19] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_1a](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_1a] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_1b](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_1b] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_1c](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_1c] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_1d](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_1d] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_1e](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_1e] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_1f](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_1f] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area1]
	
) TEXTIMAGE_ON [area1]
go 
CREATE TABLE [data_20](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_20] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_21](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_21] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_22](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_22] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_23](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_23] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_24](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_24] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_25](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_25] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_26](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_26] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_27](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_27] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_28](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_28] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_29](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_29] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_2a](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_2a] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_2b](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_2b] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_2c](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_2c] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_2d](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_2d] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_2e](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_2e] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_2f](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_2f] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area2]
	
) TEXTIMAGE_ON [area2]
go 
CREATE TABLE [data_30](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_30] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_31](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_31] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_32](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_32] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_33](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_33] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_34](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_34] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_35](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_35] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_36](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_36] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_37](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_37] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_38](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_38] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_39](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_39] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_3a](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_3a] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_3b](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_3b] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_3c](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_3c] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_3d](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_3d] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_3e](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_3e] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_3f](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_3f] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area3]
	
) TEXTIMAGE_ON [area3]
go 
CREATE TABLE [data_40](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_40] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_41](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_41] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_42](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_42] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_43](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_43] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_44](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_44] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_45](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_45] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_46](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_46] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_47](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_47] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_48](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_48] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_49](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_49] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_4a](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_4a] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_4b](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_4b] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_4c](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_4c] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_4d](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_4d] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_4e](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_4e] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_4f](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_4f] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area4]
	
) TEXTIMAGE_ON [area4]
go 
CREATE TABLE [data_50](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_50] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_51](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_51] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_52](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_52] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_53](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_53] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_54](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_54] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_55](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_55] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_56](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_56] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_57](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_57] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_58](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_58] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_59](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_59] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_5a](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_5a] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_5b](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_5b] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_5c](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_5c] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_5d](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_5d] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_5e](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_5e] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_5f](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_5f] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area5]
	
) TEXTIMAGE_ON [area5]
go 
CREATE TABLE [data_60](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_60] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_61](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_61] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_62](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_62] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_63](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_63] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_64](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_64] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_65](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_65] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_66](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_66] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_67](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_67] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_68](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_68] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_69](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_69] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_6a](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_6a] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_6b](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_6b] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_6c](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_6c] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_6d](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_6d] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_6e](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_6e] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_6f](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_6f] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area6]
	
) TEXTIMAGE_ON [area6]
go 
CREATE TABLE [data_70](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_70] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_71](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_71] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_72](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_72] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_73](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_73] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_74](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_74] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_75](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_75] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_76](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_76] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_77](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_77] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_78](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_78] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_79](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_79] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_7a](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_7a] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_7b](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_7b] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_7c](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_7c] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_7d](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_7d] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_7e](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_7e] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_7f](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_7f] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area7]
	
) TEXTIMAGE_ON [area7]
go 
CREATE TABLE [data_80](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_80] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_81](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_81] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_82](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_82] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_83](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_83] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_84](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_84] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_85](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_85] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_86](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_86] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_87](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_87] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_88](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_88] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_89](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_89] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_8a](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_8a] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_8b](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_8b] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_8c](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_8c] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_8d](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_8d] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_8e](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_8e] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_8f](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_8f] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area8]
	
) TEXTIMAGE_ON [area8]
go 
CREATE TABLE [data_90](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_90] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_91](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_91] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_92](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_92] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_93](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_93] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_94](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_94] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_95](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_95] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_96](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_96] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_97](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_97] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_98](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_98] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_99](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_99] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_9a](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_9a] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_9b](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_9b] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_9c](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_9c] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_9d](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_9d] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_9e](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_9e] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_9f](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_9f] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [area9]
	
) TEXTIMAGE_ON [area9]
go 
CREATE TABLE [data_a0](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_a0] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_a1](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_a1] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_a2](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_a2] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_a3](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_a3] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_a4](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_a4] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_a5](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_a5] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_a6](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_a6] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_a7](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_a7] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_a8](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_a8] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_a9](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_a9] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_aa](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_aa] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_ab](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_ab] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_ac](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_ac] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_ad](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_ad] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_ae](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_ae] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_af](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_af] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaa]
	
) TEXTIMAGE_ON [areaa]
go 
CREATE TABLE [data_b0](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_b0] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_b1](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_b1] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_b2](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_b2] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_b3](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_b3] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_b4](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_b4] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_b5](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_b5] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_b6](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_b6] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_b7](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_b7] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_b8](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_b8] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_b9](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_b9] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_ba](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_ba] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_bb](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_bb] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_bc](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_bc] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_bd](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_bd] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_be](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_be] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_bf](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_bf] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areab]
	
) TEXTIMAGE_ON [areab]
go 
CREATE TABLE [data_c0](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_c0] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_c1](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_c1] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_c2](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_c2] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_c3](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_c3] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_c4](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_c4] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_c5](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_c5] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_c6](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_c6] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_c7](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_c7] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_c8](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_c8] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_c9](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_c9] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_ca](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_ca] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_cb](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_cb] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_cc](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_cc] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_cd](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_cd] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_ce](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_ce] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_cf](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_cf] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areac]
	
) TEXTIMAGE_ON [areac]
go 
CREATE TABLE [data_d0](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_d0] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_d1](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_d1] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_d2](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_d2] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_d3](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_d3] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_d4](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_d4] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_d5](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_d5] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_d6](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_d6] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_d7](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_d7] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_d8](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_d8] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_d9](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_d9] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_da](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_da] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_db](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_db] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_dc](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_dc] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_dd](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_dd] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_de](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_de] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_df](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_df] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [aread]
	
) TEXTIMAGE_ON [aread]
go 
CREATE TABLE [data_e0](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_e0] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_e1](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_e1] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_e2](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_e2] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_e3](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_e3] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_e4](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_e4] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_e5](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_e5] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_e6](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_e6] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_e7](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_e7] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_e8](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_e8] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_e9](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_e9] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_ea](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_ea] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_eb](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_eb] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_ec](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_ec] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_ed](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_ed] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_ee](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_ee] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_ef](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_ef] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areae]
	
) TEXTIMAGE_ON [areae]
go 
CREATE TABLE [data_f0](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_f0] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_f1](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_f1] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_f2](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_f2] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_f3](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_f3] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_f4](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_f4] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_f5](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_f5] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_f6](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_f6] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_f7](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_f7] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_f8](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_f8] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_f9](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_f9] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_fa](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_fa] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_fb](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_fb] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_fc](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_fc] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_fd](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_fd] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_fe](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_fe] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 
CREATE TABLE [data_ff](
	[KEY] [char](32) NOT NULL,
	[Type] [varchar](30) NOT NULL,
	
	[HeadersData] [varbinary](MAX) NOT NULL,
	[BodyData] [varbinary](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiresAbsolute] [datetime] NOT NULL,
	[Seconds] [int] NOT NULL DEFAULT ((0)),
	
	 CONSTRAINT [PK_data_ff] PRIMARY KEY CLUSTERED 
	(
		[KEY] ASC,
		[Type] ASC
	)	
	WITH (PAD_INDEX  = OFF,  IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = OFF) ON [areaf]
	
) TEXTIMAGE_ON [areaf]
go 










