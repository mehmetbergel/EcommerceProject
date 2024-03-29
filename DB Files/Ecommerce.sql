USE [master]
GO
/****** Object:  Database [EcommerceDB]    Script Date: 24.01.2021 19:09:46 ******/
CREATE DATABASE [EcommerceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EcommerceDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\EcommerceDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EcommerceDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\EcommerceDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EcommerceDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EcommerceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EcommerceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EcommerceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EcommerceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EcommerceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EcommerceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EcommerceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EcommerceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EcommerceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EcommerceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EcommerceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EcommerceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EcommerceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EcommerceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EcommerceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EcommerceDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EcommerceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EcommerceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EcommerceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EcommerceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EcommerceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EcommerceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EcommerceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EcommerceDB] SET RECOVERY FULL 
GO
ALTER DATABASE [EcommerceDB] SET  MULTI_USER 
GO
ALTER DATABASE [EcommerceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EcommerceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EcommerceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EcommerceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EcommerceDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EcommerceDB', N'ON'
GO
ALTER DATABASE [EcommerceDB] SET QUERY_STORE = OFF
GO
USE [EcommerceDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [EcommerceDB]
GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 24.01.2021 19:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[MethodName] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[InnerException] [nvarchar](max) NULL,
	[LogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ErrorLogs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 24.01.2021 19:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockImage]    Script Date: 24.01.2021 19:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockImage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Barcode] [nvarchar](50) NULL,
	[Source] [nvarchar](max) NULL,
 CONSTRAINT [PK_StockImage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockInfo]    Script Date: 24.01.2021 19:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Barcode] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Quantity] [float] NOT NULL,
 CONSTRAINT [PK_StockInfo] PRIMARY KEY CLUSTERED 
(
	[Barcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 24.01.2021 19:09:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ErrorLogs] ON 

INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (3, N'StockModel', N'AddStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000001).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T15:21:41.777' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (4, N'StockModel', N'AddStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000001).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T16:12:51.800' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (5, N'StockModel', N'AddStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000001).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T16:13:17.080' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (6, N'StockModel', N'AddStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000001).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T16:13:55.977' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (7, N'StockModel', N'DeleteStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000004).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T16:15:46.763' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (8, N'StockModel', N'DeleteStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000004).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T16:15:59.627' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (9, N'StockModel', N'DeleteStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000004).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T16:17:13.223' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (10, N'StockModel', N'AddStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000004).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T16:18:11.223' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (11, N'StockModel', N'AddStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000004).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T16:18:53.420' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (12, N'StockModel', N'DeleteStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000004).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T16:19:18.227' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (13, N'StockModel', N'AddStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000002).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T16:20:41.083' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (14, N'StockModel', N'AddStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000001).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T16:23:31.710' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (15, N'StockModel', N'AddStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000001).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T16:32:33.447' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (16, N'StockModel', N'AddStock', N'An error occurred while updating the entries. See the inner exception for details.', N'System.Data.Entity.Core.UpdateException: An error occurred while updating the entries. See the inner exception for details. ---> System.Data.SqlClient.SqlException: Violation of PRIMARY KEY constraint ''PK_StockInfo''. Cannot insert duplicate key in object ''dbo.StockInfo''. The duplicate key value is (0000003).
The statement has been terminated.
   konum: System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   konum: System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   konum: System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   konum: System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   konum: System.Data.SqlClient.SqlDataReader.get_MetaData()
   konum: System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   konum: System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   konum: System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.<>c.<Reader>b__6_0(DbCommand t, DbCommandInterceptionContext`1 c)
   konum: System.Data.Entity.Infrastructure.Interception.InternalDispatcher`1.Dispatch[TTarget,TInterceptionContext,TResult](TTarget target, Func`3 operation, TInterceptionContext interceptionContext, Action`3 executing, Action`3 executed)
   konum: System.Data.Entity.Infrastructure.Interception.DbCommandDispatcher.Reader(DbCommand command, DbCommandInterceptionContext interceptionContext)
   konum: System.Data.Entity.Internal.InterceptableDbCommand.ExecuteDbDataReader(CommandBehavior behavior)
   konum: System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.DynamicUpdateCommand.Execute(Dictionary`2 identifierValues, List`1 generatedValues)
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   --- İç özel durum yığını izlemesinin sonu ---
   konum: System.Data.Entity.Core.Mapping.Update.Internal.UpdateTranslator.Update()
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.<>c.<Update>b__21_0(UpdateTranslator ut)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update[T](T noChangesResult, Func`2 updateFunction)
   konum: System.Data.Entity.Core.EntityClient.Internal.EntityAdapter.Update()
   konum: System.Data.Entity.Core.Objects.ObjectContext.<SaveChangesToStore>b__153_0()
   konum: System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesToStore(SaveOptions options, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.<>c__DisplayClass148_0.<SaveChangesInternal>b__0()
   konum: System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChangesInternal(SaveOptions options, Boolean executeInExistingTransaction)
   konum: System.Data.Entity.Core.Objects.ObjectContext.SaveChanges(SaveOptions options)
   konum: System.Data.Entity.Internal.InternalContext.SaveChanges()', CAST(N'2021-01-24T16:35:55.280' AS DateTime))
INSERT [dbo].[ErrorLogs] ([ID], [ClassName], [MethodName], [Message], [InnerException], [LogDate]) VALUES (17, N'StockModel', N'EditStock', N'Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.', NULL, CAST(N'2021-01-24T18:43:17.023' AS DateTime))
SET IDENTITY_INSERT [dbo].[ErrorLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([ID], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[StockImage] ON 

INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (18, N'NB000001', N'/Content/images/acer1.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (19, N'MN000001', N'/Content/images/dell1.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (20, N'MN000001', N'/Content/images/dell2.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (22, N'NB000002', N'/Content/images/hp1.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (23, N'NB000003', N'/Content/images/huawei1.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (24, N'MP000001', N'/Content/images/iphone111.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (25, N'MP000001', N'/Content/images/iphone112.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (26, N'MP000001', N'/Content/images/iphone113.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (27, N'MP000002', N'/Content/images/iphone121.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (28, N'MP000002', N'/Content/images/iphone122.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (29, N'NB000004', N'/Content/images/lenovo1.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (30, N'NB000004', N'/Content/images/lenovo2.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (31, N'NB000004', N'/Content/images/lenovo3.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (34, N'NB000005', N'/Content/images/macbook1.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (35, N'NB000005', N'/Content/images/macbook2.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (36, N'MS000001', N'/Content/images/logitech1.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (37, N'MS000001', N'/Content/images/logitech2.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (38, N'AP000001', N'/Content/images/airpods1.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (39, N'AP000001', N'/Content/images/airpods2.jpg')
INSERT [dbo].[StockImage] ([ID], [Barcode], [Source]) VALUES (40, N'AP000001', N'/Content/images/airpods3.jpg')
SET IDENTITY_INSERT [dbo].[StockImage] OFF
GO
SET IDENTITY_INSERT [dbo].[StockInfo] ON 

INSERT [dbo].[StockInfo] ([ID], [Barcode], [Name], [Price], [Description], [Quantity]) VALUES (86, N'0000001', N'test stok adı', CAST(12.00 AS Decimal(18, 2)), N'test stok açıklama', 30)
INSERT [dbo].[StockInfo] ([ID], [Barcode], [Name], [Price], [Description], [Quantity]) VALUES (82, N'AP000001', N'Airpods', CAST(1248.99 AS Decimal(18, 2)), N'Apple AirPods 2. Nesil Bluetooth Kulaklık MV7N2TU/A (Apple Türkiye Garantili)', 8)
INSERT [dbo].[StockInfo] ([ID], [Barcode], [Name], [Price], [Description], [Quantity]) VALUES (72, N'MN000001', N'Dell Monitör', CAST(1250.22 AS Decimal(18, 2)), N'Dell SE2416H 23.8" 6ms (Analog+HDMI) Full HD IPS Monitör', 4)
INSERT [dbo].[StockInfo] ([ID], [Barcode], [Name], [Price], [Description], [Quantity]) VALUES (76, N'MP000001', N'Iphone 11', CAST(7399.90 AS Decimal(18, 2)), N'iPhone 11 64 GB', 14)
INSERT [dbo].[StockInfo] ([ID], [Barcode], [Name], [Price], [Description], [Quantity]) VALUES (77, N'MP000002', N'Iphone 12', CAST(11499.00 AS Decimal(18, 2)), N'iPhone 12 128 GB', 19)
INSERT [dbo].[StockInfo] ([ID], [Barcode], [Name], [Price], [Description], [Quantity]) VALUES (81, N'MS000001', N'Logitech Mouse', CAST(99.00 AS Decimal(18, 2)), N'Logitech M170 Kablosuz Mouse', 16)
INSERT [dbo].[StockInfo] ([ID], [Barcode], [Name], [Price], [Description], [Quantity]) VALUES (71, N'NB000001', N'Acer Notebook', CAST(6500.00 AS Decimal(18, 2)), N'Acer Aspire 3 A315-57G Intel Core i5 1035G1 8GB 512GB SSD MX330 Linux 15.6" FHD Taşınabilir Bilgisayar NX.HZREY.009', 10)
INSERT [dbo].[StockInfo] ([ID], [Barcode], [Name], [Price], [Description], [Quantity]) VALUES (74, N'NB000002', N'HP Notebook', CAST(7850.00 AS Decimal(18, 2)), N'Hp Probook 450 G7 Intel Core i5 10210U 8GB 512GB SSD MX250 Freedos 15.6" FHD Taşınabilir Bilgisayar 9TV50EA', 2)
INSERT [dbo].[StockInfo] ([ID], [Barcode], [Name], [Price], [Description], [Quantity]) VALUES (75, N'NB000003', N'Huawei Notebook', CAST(9450.00 AS Decimal(18, 2)), N'Huawei Matebook D 14 AMD Ryzen 5 3500U 8GB 256GB SSD Windows 10 Home 14" FHD Taşınabilir Bilgisayar', 7)
INSERT [dbo].[StockInfo] ([ID], [Barcode], [Name], [Price], [Description], [Quantity]) VALUES (78, N'NB000004', N'Lenovo Notebook', CAST(8529.00 AS Decimal(18, 2)), N'Lenovo IdeaPad Intel Core i5 10300H 8GB 512GB SSD GTX1650Ti Freedos 15.6" FHD Taşınabilir Bilgisayar 81Y400D9TX', 11)
INSERT [dbo].[StockInfo] ([ID], [Barcode], [Name], [Price], [Description], [Quantity]) VALUES (80, N'NB000005', N'Macbook Notebook', CAST(9632.70 AS Decimal(18, 2)), N'Apple MacBook Air Intel Core i3 8GB 256GB SSD macOS 13.3" Taşınabilir Bilgisayar MWTK2TU/A', 5)
SET IDENTITY_INSERT [dbo].[StockInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([ID], [UserName], [Password], [Name], [Surname], [RoleId]) VALUES (1, N'admin', N'123.,!', N'Mehmet', N'Bergel', 1)
INSERT [dbo].[UserInfo] ([ID], [UserName], [Password], [Name], [Surname], [RoleId]) VALUES (2, N'user', N'123', N'User', N'Surname', 2)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_Roles]
GO
USE [master]
GO
ALTER DATABASE [EcommerceDB] SET  READ_WRITE 
GO
