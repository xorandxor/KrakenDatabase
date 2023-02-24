USE [trade]
GO
/****** Object:  Table [dbo].[Predictions]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Predictions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[timestamp] [datetime] NULL,
	[Name] [nvarchar](50) NULL,
	[CurrentValue] [decimal](18, 0) NULL,
	[PredictedValue] [decimal](18, 0) NULL,
	[PercentChange] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Predictions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwAllPredictions]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAllPredictions]
AS
SELECT TOP (100) PERCENT id, timestamp, Name, CurrentValue, PredictedValue, PercentChange
FROM     dbo.Predictions
ORDER BY PercentChange DESC
GO
/****** Object:  Table [dbo].[AccountBalance]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountBalance](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[usd] [money] NULL,
	[btc] [numeric](18, 10) NULL,
	[ltc] [numeric](18, 10) NULL,
	[eth] [numeric](18, 10) NULL,
	[dge] [numeric](18, 10) NULL,
	[xmr] [numeric](18, 10) NULL,
	[dash] [numeric](18, 10) NULL,
	[zec] [numeric](18, 10) NULL,
	[rep] [numeric](18, 10) NULL,
 CONSTRAINT [PK_AccountBalance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetPairs]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetPairs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[basecurrency] [nvarchar](50) NULL,
	[assetpair] [nvarchar](50) NULL,
 CONSTRAINT [PK_AssetPairs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Longname] [nvarchar](255) NULL,
 CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[message] [nvarchar](255) NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OHLC]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OHLC](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[timestampdb] [datetime] NOT NULL,
	[timestampjson] [datetime] NULL,
	[assetpair] [nvarchar](50) NULL,
	[openprice] [money] NULL,
	[highprice] [money] NULL,
	[lowprice] [money] NULL,
	[closeprice] [money] NULL,
	[volweightedavgprice] [money] NULL,
	[vol] [decimal](18, 0) NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_OHLC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ohlcloadstatus]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ohlcloadstatus](
	[status] [nvarchar](50) NULL,
	[threads] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResponseTime]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResponseTime](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[url] [nvarchar](128) NOT NULL,
	[time] [bigint] NOT NULL,
 CONSTRAINT [PK_ResponseTime] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticker]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticker](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[timestampdb] [datetime] NULL,
	[assetpair] [nvarchar](50) NULL,
	[ask] [decimal](18, 5) NULL,
	[askwlvolume] [decimal](18, 5) NULL,
	[asklotvolume] [decimal](18, 5) NULL,
	[bid] [decimal](18, 5) NULL,
	[bidwlvolume] [decimal](18, 5) NULL,
	[bidlotvolume] [decimal](18, 5) NULL,
	[volumetoday] [decimal](18, 5) NULL,
	[volume24hrs] [decimal](18, 5) NULL,
	[volweightedavgpricetoday] [decimal](18, 5) NULL,
	[volweightedavgprice24hr] [decimal](18, 5) NULL,
	[numberoftradestoday] [decimal](18, 5) NULL,
	[numberoftrades24hrs] [decimal](18, 5) NULL,
	[lowtoday] [decimal](18, 5) NULL,
	[low24hr] [decimal](18, 5) NULL,
	[hightoday] [decimal](18, 5) NULL,
	[high24hr] [decimal](18, 5) NULL,
	[openprice] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Ticker] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tickerloadstatus]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tickerloadstatus](
	[status] [nvarchar](50) NULL,
	[threads] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF_Log_timestamp]  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[OHLC] ADD  CONSTRAINT [DF_OHLC_timestamp]  DEFAULT (getdate()) FOR [timestampdb]
GO
ALTER TABLE [dbo].[Predictions] ADD  CONSTRAINT [DF_Predictions_timestamp]  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[ResponseTime] ADD  CONSTRAINT [DF_ResponseTime_timestamp]  DEFAULT (getdate()) FOR [timestamp]
GO
ALTER TABLE [dbo].[Ticker] ADD  CONSTRAINT [DF_Ticker_timestampdb]  DEFAULT (getdate()) FOR [timestampdb]
GO
/****** Object:  StoredProcedure [dbo].[AccountBalance_DELETE_ALL]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--Update account balance
--paul 2/23/23

CREATE PROCEDURE [dbo].[AccountBalance_DELETE_ALL]
AS
BEGIN
delete from AccountBalance
end
GO
/****** Object:  StoredProcedure [dbo].[AccountBalance_INSERT]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--Update account balance
--paul 2/23/23

CREATE PROCEDURE [dbo].[AccountBalance_INSERT]
(
    @usd money,
	@btc numeric(18,5),
	@ltc numeric(18,5),
	@eth numeric(18,5),
	@xdg numeric(18,5),
	@xmr numeric(18,5),
	@dash numeric(18,5),
	@zec numeric(18,5),
	@rep numeric(18,5)
)
AS
BEGIN
INSERT INTO [dbo].[AccountBalance]
(
	[usd]
    ,[btc]
    ,[ltc]
    ,[eth]
    ,[dge]
    ,[xmr]
    ,[dash]
    ,[zec]
    ,[rep]
)
VALUES
(
	@usd,
	@btc,
	@ltc,
	@eth,
	@xdg,
	@xmr,
	@dash,
	@zec,
	@rep
)
END
GO
/****** Object:  StoredProcedure [dbo].[BALANCE_DELETE_ALL]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--clear out the balance table
--paul 2/21/23

create PROCEDURE [dbo].[BALANCE_DELETE_ALL]
AS
BEGIN
    DELETE FROM AccountBalance;
END
GO
/****** Object:  StoredProcedure [dbo].[Log_INSERT]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--insert record into the log table
--paul 2/4/23

Create PROCEDURE [dbo].[Log_INSERT]
(
           @message nvarchar(255)
)
AS
BEGIN
INSERT INTO [dbo].[Log]
           ([message])
     VALUES
           (@message)
END
GO
/****** Object:  StoredProcedure [dbo].[OHLC_DELETE_ALL]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--clear out the ohlc table
--paul 2/21/23

create PROCEDURE [dbo].[OHLC_DELETE_ALL]
AS
BEGIN
    DELETE FROM OHLC;
END
GO
/****** Object:  StoredProcedure [dbo].[OHLC_GET_STATUS]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--insert record into the log table
--paul 2/4/23

create PROCEDURE [dbo].[OHLC_GET_STATUS]
AS
BEGIN
select status from ohlcloadstatus
END
GO
/****** Object:  StoredProcedure [dbo].[OHLC_INSERT]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--insert record into the ohlc table
--paul 2/21/23



CREATE PROCEDURE [dbo].[OHLC_INSERT]
          (
		  @timestampjson datetime,
		  @assetpair nvarchar(50),
		  @openprice decimal(18,5),
		  @highprice decimal (18,5),
		  @lowprice decimal (18,5),
          @closeprice decimal(18,5),
		  @volweightedavgprice decimal (18,5),
		  @vol decimal(18,5),
		  @count int
		  )
AS
BEGIN
INSERT INTO [dbo].[OHLC]
          (
		  [timestampjson],
		  [assetpair],
		  [openprice],
		  [highprice],
		  [lowprice],
          [closeprice],
		  [volweightedavgprice],
		  [vol],
		  [count]
		  )
     VALUES
           (
		   @timestampjson,
		   @assetpair,
		   @openprice,
		   @highprice,
		   @lowprice,
		   @closeprice,
		   @volweightedavgprice,
		   @vol,
		   @count
		   )
END
GO
/****** Object:  StoredProcedure [dbo].[OHLC_SET_STATUS_LOADING]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--insert record into the log table
--paul 2/4/23

create PROCEDURE [dbo].[OHLC_SET_STATUS_LOADING]
AS
BEGIN
update ohlcloadstatus
set status = 'LOADING';
END
GO
/****** Object:  StoredProcedure [dbo].[OHLC_SET_STATUS_READY]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--insert record into the log table
--paul 2/4/23

create PROCEDURE [dbo].[OHLC_SET_STATUS_READY]
AS
BEGIN
update ohlcloadstatus
set status = 'READY';
END
GO
/****** Object:  StoredProcedure [dbo].[PREDICTIONS_DELETE_ALL]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--clear out the predictions table
--paul 2/23/23

create PROCEDURE [dbo].[PREDICTIONS_DELETE_ALL]
AS
BEGIN
    DELETE FROM Predictions;
END
GO
/****** Object:  StoredProcedure [dbo].[Predictions_INSERT]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--insert record into the predictions table
--paul 2/20/23

CREATE PROCEDURE [dbo].[Predictions_INSERT]
          ( 
		  @name nvarchar(50),
		  @currentval decimal(18,0),
		  @predictedval decimal (18,0),
		  @percentchange decimal (18,0)
          )
AS
BEGIN
INSERT INTO [dbo].[Predictions]
           (
		   [name],
		   [currentvalue],
		   [predictedvalue],
		   [percentchange]
		   )
     VALUES
           (
		   @name,
		   @currentval,
		   @predictedval,
		   @percentchange
		   )
END
GO
/****** Object:  StoredProcedure [dbo].[ResponseTime_INSERT]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--insert record into the responsetime table
--paul 7-3-22

CREATE PROCEDURE [dbo].[ResponseTime_INSERT]
(
           @url nvarchar(128),
           @time bigint
)
AS
BEGIN
INSERT INTO [dbo].[ResponseTime]
           ([url],
           [time])
     VALUES
           (@url,
           @time)
END
GO
/****** Object:  StoredProcedure [dbo].[TICKER_DELETE_ALL]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--clear out the ticker table
--paul 2/23/23

CREATE PROCEDURE [dbo].[TICKER_DELETE_ALL]
AS
BEGIN
    DELETE FROM Ticker;
END
GO
/****** Object:  StoredProcedure [dbo].[TICKER_GET_CurrentPrice]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

-- get current ticker price of an assetpair
-- from the database obviously
-- paul 2/24/23

create PROCEDURE [dbo].[TICKER_GET_CurrentPrice]
(
	@assetpair nvarchar(50)
)
AS
BEGIN
	select ask from Ticker where assetpair = @assetpair
END
GO
/****** Object:  StoredProcedure [dbo].[TICKER_GET_STATUS]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--insert record into the log table
--paul 2/4/23

create PROCEDURE [dbo].[TICKER_GET_STATUS]
AS
BEGIN
select status from tickerloadstatus
END
GO
/****** Object:  StoredProcedure [dbo].[TICKER_INSERT]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--insert record into the ticker table
--paul 2/21/23

CREATE PROCEDURE [dbo].[TICKER_INSERT]
          (
          @assetpair nvarchar(50),
          @ask decimal(18,5),
          @askwlvolume decimal(18,5),
          @asklotvolume decimal(18,5),
          @bid decimal(18,5),
          @bidwlvolume decimal(18,5),
          @bidlotvolume decimal(18,5),
          @volumetoday decimal(18,5),
          @volume24hrs decimal(18,5),
          @volweightedavgpricetoday decimal(18,5),
          @volweightedavgprice24hr decimal(18,5),
          @numberoftradestoday decimal(18,5),
          @numberoftrades24hrs decimal(18,5),
          @lowtoday decimal(18,5),
          @low24hr decimal(18,5),
          @hightoday decimal(18,5),
          @high24hr decimal(18,5),
		  @openprice decimal(18,5)
		  )
AS
BEGIN
INSERT INTO [dbo].[Ticker]
          (
		  [assetpair],
		  [ask],
		  [askwlvolume],
		  asklotvolume,
		  bid,
          bidwlvolume,
		  bidlotvolume,
		  volumetoday,
		  volume24hrs,
		  volweightedavgpricetoday,
		  volweightedavgprice24hr,
		  numberoftradestoday,
		  numberoftrades24hrs,
		  lowtoday,
		  low24hr,
		  hightoday,
		  high24hr,
		  openprice
		  )
     VALUES
          (
		  @assetpair,
          @ask,
          @askwlvolume,
          @asklotvolume,
          @bid,
          @bidwlvolume,
          @bidlotvolume,
          @volumetoday,
          @volume24hrs,
          @volweightedavgpricetoday,
          @volweightedavgprice24hr,
          @numberoftradestoday,
          @numberoftrades24hrs,
          @lowtoday,
          @low24hr,
          @hightoday,
          @high24hr,
		  @openprice
		  )
END
GO
/****** Object:  StoredProcedure [dbo].[TICKER_SET_STATUS_LOADING]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--set tickerstatus to loading 
-- this tells the app to wait until the status = ready
--paul 2/23/23

CREATE PROCEDURE [dbo].[TICKER_SET_STATUS_LOADING]
AS
BEGIN
update tickerloadstatus
set status = 'LOADING';
END
GO
/****** Object:  StoredProcedure [dbo].[TICKER_SET_STATUS_READY]    Script Date: 2/24/2023 10:52:17 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--set tickerstatus to loading 
-- this tells the app to wait until the status = ready
--paul 2/23/23

CREATE PROCEDURE [dbo].[TICKER_SET_STATUS_READY]
AS
BEGIN
update tickerloadstatus
set status = 'READY';
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Predictions"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 292
               Right = 338
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAllPredictions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAllPredictions'
GO
