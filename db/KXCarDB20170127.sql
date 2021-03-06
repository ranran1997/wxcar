USE [KXCarDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2017/2/15 12:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Mobile] [varchar](20) NOT NULL,
	[Pwd] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 2017/2/15 12:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Driver](
	[DriverID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[CarLiscence] [varchar](20) NOT NULL,
	[Mobile] [varchar](20) NOT NULL,
	[Pwd] [varchar](255) NOT NULL,
	[Remark] [nvarchar](255) NULL,
	[DriverType] [int] NULL CONSTRAINT [DF_Driver_DriverType]  DEFAULT ((0)),
	[DriverStatus] [int] NULL DEFAULT ((1)),
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2017/2/15 12:27:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[DriverName] [nvarchar](20) NOT NULL,
	[CustomerMobile] [varchar](20) NOT NULL,
	[DriverMobile] [varchar](20) NOT NULL,
	[UseTime] [datetime] NOT NULL,
	[Remark] [nvarchar](100) NULL,
	[ProductType] [nvarchar](20) NOT NULL,
	[VehicleLevel] [nvarchar](10) NOT NULL,
	[Price] [float] NOT NULL,
	[DepartLocation] [nvarchar](100) NOT NULL,
	[ArriveLocation] [nvarchar](100) NOT NULL,
	[AddressDetail] [nvarchar](255) NOT NULL,
	[CarLiscence] [varchar](20) NOT NULL,
	[OrderStatus] [varchar](20) NOT NULL CONSTRAINT [DF_Order_OrderStatus]  DEFAULT ('submitted'),
	[DataChange_CreateTime] [datetime] NULL CONSTRAINT [DF_Order_DataChange_CreateTime]  DEFAULT (getdate()),
	[DataChange_LastTime] [datetime] NULL CONSTRAINT [DF_Order_DataChange_LastTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'司机姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Driver', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'汽车牌照' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Driver', @level2type=N'COLUMN',@level2name=N'CarLiscence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Driver', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Driver', @level2type=N'COLUMN',@level2name=N'Pwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'司机类型,1-直营司机 2-外围司机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Driver', @level2type=N'COLUMN',@level2name=N'DriverType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'司机状态
0-无效
1-有效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Driver', @level2type=N'COLUMN',@level2name=N'DriverStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'司机信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Driver'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'司机姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'DriverName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'乘客手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'CustomerMobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'司机手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'DriverMobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用车时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'UseTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品描述，比如"[机票特权]上海-专车接机服务（经济型）"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品类型,如国内接机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'ProductType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车型等级，如经济型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'VehicleLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出发地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'DepartLocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'到达地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'ArriveLocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'到达详细地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'AddressDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'汽车牌照' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'CarLiscence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单状态,submitted,cancelled,completed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'OrderStatus'
GO
