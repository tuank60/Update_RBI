USE [master]
GO
/****** Object:  Database [rbi]    Script Date: 10/29/2019 10:24:50 AM ******/
CREATE DATABASE [rbi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rbi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\rbi.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'rbi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\rbi_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [rbi] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rbi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rbi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rbi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rbi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rbi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rbi] SET ARITHABORT OFF 
GO
ALTER DATABASE [rbi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [rbi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rbi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rbi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rbi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rbi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rbi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rbi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rbi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rbi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [rbi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rbi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rbi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rbi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rbi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rbi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rbi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rbi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [rbi] SET  MULTI_USER 
GO
ALTER DATABASE [rbi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rbi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rbi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rbi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [rbi] SET DELAYED_DURABILITY = DISABLED 
GO
USE [rbi]
GO
/****** Object:  Table [dbo].[API_COMPONENT_TYPE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_COMPONENT_TYPE](
	[APIComponentTypeID] [int] NOT NULL,
	[APIComponentTypeName] [nvarchar](50) NOT NULL,
	[AliasAPIComponentType] [nvarchar](50) NULL,
	[GFFSmall] [float] NULL,
	[GFFMedium] [float] NULL,
	[GFFLarge] [float] NULL,
	[GFFRupture] [float] NULL,
	[GFFTotal] [float] NULL,
	[HoleCostSmall] [float] NULL,
	[HoleCostMedium] [float] NULL,
	[HoleCostLarge] [float] NULL,
	[HoleCostRupture] [float] NULL,
	[OutageSmall] [float] NULL,
	[OutageMedium] [float] NULL,
	[OutageLarge] [float] NULL,
	[OutageRupture] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_F4676DD1_API_COMPONENT_TYPE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_F4676DD1_API_COMPONENT_TYPE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_API_COMPONENT_TYPE] PRIMARY KEY CLUSTERED 
(
	[APIComponentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COF_FLUID]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COF_FLUID](
	[COFFluidID] [int] IDENTITY(1,1) NOT NULL,
	[COFFluid] [nvarchar](100) NULL,
	[AliasName] [nvarchar](50) NULL,
	[ExamplesOfApplicable] [nvarchar](200) NULL,
	[FluidType] [int] NOT NULL,
	[MW] [float] NULL,
	[NBP] [float] NULL,
	[Density] [float] NULL,
	[HeatEquation] [int] NULL,
	[IdealConstantA] [float] NULL,
	[IdealConstantB] [float] NULL,
	[IdealConstantC] [float] NULL,
	[IdealConstantD] [float] NULL,
	[IdealConstantE] [float] NULL,
	[AmbientState] [int] NOT NULL,
	[AutoIgnitionTemperature] [int] NULL,
	[K] [float] NULL,
	[Flammable] [bit] NOT NULL,
	[Toxic] [bit] NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_75A8642D_COF_FLUID_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_75A8642D_COF_FLUID_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_COF_FLUID] PRIMARY KEY CLUSTERED 
(
	[COFFluidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMPONENT_DETAIL]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPONENT_DETAIL](
	[ComponentID] [int] NOT NULL,
	[MaterialID] [int] NULL,
	[StreamID] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_COMPONENT_DETAIL] PRIMARY KEY CLUSTERED 
(
	[ComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMPONENT_MASTER]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPONENT_MASTER](
	[ComponentID] [int] IDENTITY(1,1) NOT NULL,
	[ComponentNumber] [nvarchar](100) NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[ComponentTypeID] [int] NOT NULL,
	[ComponentName] [nvarchar](150) NULL,
	[ComponentDesc] [nvarchar](250) NULL,
	[IsEquipment] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_MASTER_IsEquipment]  DEFAULT ((0)),
	[IsEquipmentLinked] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_MASTER_IsEquipmentLinked]  DEFAULT ((0)),
	[APIComponentTypeID] [int] NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_FBB73A00_COMPONENT_MASTER_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_FBB73A00_COMPONENT_MASTER_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_COMPONENT_MASTER] PRIMARY KEY CLUSTERED 
(
	[ComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMPONENT_MODELLING]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPONENT_MODELLING](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ComponentID] [int] NOT NULL,
	[ObjectName] [nvarchar](max) NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_COMPONENT_MODELLING] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMPONENT_TYPE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COMPONENT_TYPE](
	[ComponentTypeID] [int] NOT NULL,
	[ComponentTypeName] [nvarchar](50) NOT NULL,
	[ComponentTypeCode] [nvarchar](50) NOT NULL,
	[Shape] [varchar](50) NULL,
	[ShapeFactor] [float] NOT NULL CONSTRAINT [DF_D4E2C9E6_COMPONENT_TYPE_ShapeFactor]  DEFAULT ((0)),
	[Created] [datetime] NULL CONSTRAINT [DF_D4E2C9E6_COMPONENT_TYPE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_D4E2C9E6_COMPONENT_TYPE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_COMPONENT_TYPE] PRIMARY KEY CLUSTERED 
(
	[ComponentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DESIGN_CODE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DESIGN_CODE](
	[DesignCodeID] [int] IDENTITY(1,1) NOT NULL,
	[DesignCode] [nvarchar](100) NOT NULL,
	[DesignCodeApp] [nvarchar](100) NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_5EF56B98_DESIGN_CODE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_5EF56B98_DESIGN_CODE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_DESIGN_CODES_1] PRIMARY KEY CLUSTERED 
(
	[DesignCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DM_CATEGORY]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DM_CATEGORY](
	[DMCategoryID] [int] NOT NULL,
	[DMCategoryName] [nvarchar](100) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_3D582FB0_DM_CATEGORY_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_3D582FB0_DM_CATEGORY_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_DM_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[DMCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DM_EXPECTED_TYPE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DM_EXPECTED_TYPE](
	[ExpectedTypeID] [int] NOT NULL,
	[ExpectedTypeName] [nvarchar](100) NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DM_EXPECTED_TYPE] PRIMARY KEY CLUSTERED 
(
	[ExpectedTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DM_ITEMS]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DM_ITEMS](
	[DMItemID] [int] NOT NULL,
	[DMDescription] [nvarchar](100) NOT NULL,
	[DMSeq] [int] NOT NULL,
	[DMCategoryID] [int] NOT NULL,
	[DMCode] [nvarchar](50) NOT NULL,
	[HasDF] [bit] NULL,
	[HasRule] [bit] NULL,
	[FailureMode] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_BCE4C1B0_DM_ITEMS_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_BCE4C1B0_DM_ITEMS_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_DM_ITEMS] PRIMARY KEY CLUSTERED 
(
	[DMItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EQUIPMENT_EXTRA_FIELDS]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPMENT_EXTRA_FIELDS](
	[EquipmentID] [int] NOT NULL,
	[ObjectField001] [nvarchar](max) NULL,
	[ObjectField002] [nvarchar](max) NULL,
	[ObjectField003] [nvarchar](max) NULL,
	[ObjectField004] [nvarchar](max) NULL,
	[ObjectField005] [nvarchar](max) NULL,
	[ObjectField006] [nvarchar](max) NULL,
	[ObjectField007] [nvarchar](max) NULL,
	[ObjectField008] [nvarchar](max) NULL,
	[ObjectField009] [nvarchar](max) NULL,
	[ObjectField010] [nvarchar](max) NULL,
	[ObjectField011] [nvarchar](max) NULL,
	[ObjectField012] [nvarchar](max) NULL,
	[ObjectField013] [nvarchar](max) NULL,
	[ObjectField014] [nvarchar](max) NULL,
	[ObjectField015] [nvarchar](max) NULL,
	[ObjectField016] [nvarchar](max) NULL,
	[ObjectField017] [nvarchar](max) NULL,
	[ObjectField018] [nvarchar](max) NULL,
	[ObjectField019] [nvarchar](max) NULL,
	[ObjectField020] [nvarchar](max) NULL,
	[ObjectField021] [nvarchar](max) NULL,
	[ObjectField022] [nvarchar](max) NULL,
	[ObjectField023] [nvarchar](max) NULL,
	[ObjectField024] [nvarchar](max) NULL,
	[ObjectField025] [nvarchar](max) NULL,
	[ObjectField026] [nvarchar](max) NULL,
	[ObjectField027] [nvarchar](max) NULL,
	[ObjectField028] [nvarchar](max) NULL,
	[ObjectField029] [nvarchar](max) NULL,
	[ObjectField030] [nvarchar](max) NULL,
	[ObjectField031] [nvarchar](max) NULL,
	[ObjectField032] [nvarchar](max) NULL,
	[ObjectField033] [nvarchar](max) NULL,
	[ObjectField034] [nvarchar](max) NULL,
	[ObjectField035] [nvarchar](max) NULL,
	[ObjectField036] [nvarchar](max) NULL,
	[ObjectField037] [nvarchar](max) NULL,
	[ObjectField038] [nvarchar](max) NULL,
	[ObjectField039] [nvarchar](max) NULL,
	[ObjectField040] [nvarchar](max) NULL,
	[ObjectField041] [nvarchar](max) NULL,
	[ObjectField042] [nvarchar](max) NULL,
	[ObjectField043] [nvarchar](max) NULL,
	[ObjectField044] [nvarchar](max) NULL,
	[ObjectField045] [nvarchar](max) NULL,
	[ObjectField046] [nvarchar](max) NULL,
	[ObjectField047] [nvarchar](max) NULL,
	[ObjectField048] [nvarchar](max) NULL,
	[ObjectField049] [nvarchar](max) NULL,
	[ObjectField050] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EQUIPMENT_EXTRA_FIELDS] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EQUIPMENT_MASTER]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPMENT_MASTER](
	[EquipmentID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentNumber] [nvarchar](100) NOT NULL,
	[EquipmentTypeID] [int] NOT NULL,
	[EquipmentName] [nvarchar](150) NULL,
	[CommissionDate] [datetime] NOT NULL,
	[DesignCodeID] [int] NOT NULL,
	[SiteID] [int] NOT NULL,
	[FacilityID] [int] NOT NULL,
	[ManufacturerID] [int] NOT NULL,
	[PFDNo] [nvarchar](100) NULL,
	[ProcessDescription] [nvarchar](250) NULL,
	[EquipmentDesc] [nvarchar](250) NULL,
	[IsArchived] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_MASTER_IsArchived]  DEFAULT ((0)),
	[Archived] [datetime] NULL,
	[ArchivedBy] [nvarchar](50) NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_65A01428_EQUIPMENT_MASTER_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_65A01428_EQUIPMENT_MASTER_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_EQUIPMENT_MASTER] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EQUIPMENT_REVISION]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPMENT_REVISION](
	[RevisionID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[RevisionXML] [nvarchar](max) NOT NULL,
	[RevisionNo] [int] NOT NULL,
	[IssuedBy] [nvarchar](100) NULL,
	[IssuedDate] [datetime] NULL,
	[ReviewedBy] [nvarchar](100) NULL,
	[ReviewedDate] [datetime] NULL,
	[IsReviewed] [bit] NOT NULL,
	[ApprovedBy] [nvarchar](100) NULL,
	[ApprovedDate] [datetime] NULL,
	[IsApproved] [bit] NOT NULL,
	[EndorsedBy] [nvarchar](100) NULL,
	[EndorsedDate] [datetime] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EQUIPMENT_REVISION] PRIMARY KEY CLUSTERED 
(
	[RevisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EQUIPMENT_REVISION_INSPECTION]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION](
	[RevisionID] [int] NOT NULL,
	[CoverageDetailID] [int] NOT NULL,
	[ComponentNumber] [nvarchar](100) NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[DMItemID] [int] NOT NULL,
	[IMTypeID] [int] NOT NULL,
	[InspectionDate] [datetime] NOT NULL,
	[EffectivenessCode] [nvarchar](50) NOT NULL,
	[CarriedOut] [bit] NOT NULL,
	[CarriedOutDate] [datetime] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EQUIPMENT_REVISION_INSPECTION] PRIMARY KEY CLUSTERED 
(
	[RevisionID] ASC,
	[CoverageDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE](
	[RevisionID] [int] NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[InspPlanName] [nvarchar](150) NOT NULL,
	[InspPlanDate] [datetime] NULL,
	[CoverageName] [nvarchar](150) NOT NULL,
	[CoverageDate] [datetime] NULL,
	[Remarks] [nvarchar](250) NULL,
	[Findings] [nvarchar](max) NULL,
	[FindingRTF] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EQUIPMENT_REVISION_INSPECTION_COVERAGE] PRIMARY KEY CLUSTERED 
(
	[RevisionID] ASC,
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EQUIPMENT_TYPE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EQUIPMENT_TYPE](
	[EquipmentTypeID] [int] NOT NULL,
	[EquipmentTypeCode] [nvarchar](50) NOT NULL,
	[EquipmentTypeName] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_4FA96E1E_EQUIPMENT_TYPE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_4FA96E1E_EQUIPMENT_TYPE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_EQUIPMENT_TYPE] PRIMARY KEY CLUSTERED 
(
	[EquipmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EXTRA_FIELDS_LOOKUP]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXTRA_FIELDS_LOOKUP](
	[LookupID] [int] IDENTITY(1,1) NOT NULL,
	[ExtraFieldID] [int] NOT NULL,
	[LookupText] [nvarchar](50) NULL,
	[LookupValue] [nvarchar](50) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EXTRA_FIELDS_LOOKUP] PRIMARY KEY CLUSTERED 
(
	[LookupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT](
	[LookupID] [int] IDENTITY(1,1) NOT NULL,
	[ExtraFieldID] [int] NOT NULL,
	[LookupText] [nvarchar](50) NULL,
	[LookupValue] [nvarchar](50) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_EXTRA_FIELDS_LOOKUP_COMPONENT] PRIMARY KEY CLUSTERED 
(
	[LookupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EXTRA_FIELDS_SETTING]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXTRA_FIELDS_SETTING](
	[ExtraFieldID] [int] NOT NULL,
	[FieldID] [nvarchar](15) NULL,
	[FieldName] [nvarchar](50) NULL,
	[FieldDescription] [nvarchar](100) NULL,
	[SeqNo] [int] NULL,
	[FieldType] [nvarchar](50) NULL,
	[FieldSize] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsCreated] [bit] NOT NULL CONSTRAINT [DF_EXTRA_FIELDS_SETTING_IsCreated]  DEFAULT ((0)),
	[Created] [datetime] NULL CONSTRAINT [DF_FF633810_EXTRA_FIELDS_SETTING_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_FF633810_EXTRA_FIELDS_SETTING_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_EXTRA_FIELDS_SETTING] PRIMARY KEY CLUSTERED 
(
	[ExtraFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EXTRA_FIELDS_SETTING_COMPONENT]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXTRA_FIELDS_SETTING_COMPONENT](
	[ExtraFieldID] [int] NOT NULL,
	[FieldID] [nvarchar](15) NULL,
	[FieldName] [nvarchar](50) NULL,
	[FieldDescription] [nvarchar](100) NULL,
	[SeqNo] [int] NULL,
	[FieldType] [nvarchar](50) NULL,
	[FieldSize] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_EXTRA_FIELDS_SETTING_COMPONENT_IsActive]  DEFAULT ((0)),
	[IsCreated] [bit] NOT NULL CONSTRAINT [DF_EXTRA_FIELDS_SETTING_COMPONENT_IsCreated]  DEFAULT ((0)),
	[Created] [datetime] NULL CONSTRAINT [DF_B0D0A01F_EXTRA_FIELDS_SETTING_COMPONENT_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_B0D0A01F_EXTRA_FIELDS_SETTING_COMPONENT_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_EXTRA_FIELDS_SETTING_COMPONENT] PRIMARY KEY CLUSTERED 
(
	[ExtraFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FACILITY]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACILITY](
	[FacilityID] [int] IDENTITY(1,1) NOT NULL,
	[SiteID] [int] NULL,
	[FacilityName] [nvarchar](100) NOT NULL,
	[ManagementFactor] [float] NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_E3A6D5C7_FACILITY_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_E3A6D5C7_FACILITY_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_FACILITY] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FACILITY_RISK_TARGET]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACILITY_RISK_TARGET](
	[FacilityID] [int] NOT NULL,
	[RiskTarget_A] [float] NULL,
	[RiskTarget_B] [float] NULL,
	[RiskTarget_C] [float] NULL,
	[RiskTarget_D] [float] NULL,
	[RiskTarget_E] [float] NULL,
	[RiskTarget_CA] [float] NULL,
	[RiskTarget_FC] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_859350EE_FACILITY_RISK_TARGET_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_859350EE_FACILITY_RISK_TARGET_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_FACILITY_RISK_TARGET] PRIMARY KEY CLUSTERED 
(
	[FacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FILE_COMPONENT]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FILE_COMPONENT](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[ComponentID] [int] NOT NULL,
	[FileDocName] [nvarchar](100) NOT NULL,
	[FileType] [int] NOT NULL,
	[FileDescription] [nvarchar](500) NULL,
	[OriFileName] [nvarchar](100) NOT NULL,
	[FileBinary] [varbinary](max) NOT NULL,
	[FileSize] [nvarchar](50) NOT NULL,
	[FileExt] [nvarchar](50) NOT NULL,
	[DateUploaded] [datetime] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FILE_COMPONENT] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FILE_EQUIPMENT]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FILE_EQUIPMENT](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[FileDocName] [nvarchar](100) NOT NULL,
	[FileType] [int] NOT NULL,
	[FileDescription] [nvarchar](500) NULL,
	[OriFileName] [nvarchar](100) NOT NULL,
	[FileBinary] [varbinary](max) NOT NULL,
	[FileSize] [nvarchar](50) NOT NULL,
	[FileExt] [nvarchar](50) NOT NULL,
	[DateUploaded] [datetime] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FILE_EQUIPMENT] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FILE_FACILITY]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FILE_FACILITY](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[FacilityID] [int] NOT NULL,
	[FileDocName] [nvarchar](100) NOT NULL,
	[FileType] [int] NOT NULL,
	[FileDescription] [nvarchar](500) NULL,
	[OriFileName] [nvarchar](100) NOT NULL,
	[FileBinary] [varbinary](max) NOT NULL,
	[FileSize] [nvarchar](50) NOT NULL,
	[FileExt] [nvarchar](50) NOT NULL,
	[DateUploaded] [datetime] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FILE_FACILITY] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GENERIC_FLUID]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GENERIC_FLUID](
	[GenericFluidID] [int] IDENTITY(1,1) NOT NULL,
	[GenericFluid] [nvarchar](100) NOT NULL,
	[ExamplesOfApplicable] [nvarchar](200) NULL,
	[FluidType] [int] NOT NULL,
	[MW] [float] NULL,
	[NBP] [float] NULL,
	[Density] [float] NULL,
	[AmbientState] [int] NOT NULL,
	[AutoIgnitionTemperature] [int] NULL,
	[ChemicalFactor] [int] NULL,
	[HealthDegree] [int] NULL,
	[Flammability] [int] NULL,
	[Reactivity] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GENERIC_FLUID] PRIMARY KEY CLUSTERED 
(
	[GenericFluidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GENERIC_MATERIAL]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GENERIC_MATERIAL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](100) NOT NULL,
	[DesignPressure] [float] NULL,
	[DesignTemperature] [float] NULL,
	[MinDesignTemperature] [float] NULL,
	[CorrosionAllowance] [float] NULL,
	[SigmaPhase] [float] NULL,
	[SulfurContent] [nvarchar](50) NULL,
	[HeatTreatment] [nvarchar](50) NULL,
	[ReferenceTemperature] [float] NULL,
	[PTAMaterialCode] [nvarchar](70) NULL,
	[HTHAMaterialCode] [nvarchar](50) NULL,
	[IsPTA] [bit] NOT NULL,
	[IsHTHA] [bit] NOT NULL,
	[Austenitic] [bit] NOT NULL,
	[Temper] [bit] NOT NULL,
	[CarbonLowAlloy] [bit] NOT NULL,
	[NickelBased] [bit] NOT NULL,
	[ChromeMoreEqual12] [bit] NOT NULL,
	[CostFactor] [float] NULL,
	[YieldStrength] [float] NULL,
	[TensileStrength] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GENERIC_MATERIAL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IM_ITEMS]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IM_ITEMS](
	[IMItemID] [int] NOT NULL,
	[IMDescription] [nvarchar](100) NOT NULL,
	[IMCode] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_C907A950_IM_ITEMS_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_C907A950_IM_ITEMS_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_IM_ITEMS] PRIMARY KEY CLUSTERED 
(
	[IMItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IM_TYPE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IM_TYPE](
	[IMTypeID] [int] NOT NULL,
	[IMTypeName] [nvarchar](100) NOT NULL,
	[IMTypeCode] [nvarchar](50) NOT NULL,
	[IMItemID] [int] NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_DCBF0E90_IM_TYPE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_DCBF0E90_IM_TYPE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_IM_TYPE] PRIMARY KEY CLUSTERED 
(
	[IMTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IMAGE_COMPONENT]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGE_COMPONENT](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ComponentID] [int] NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[ImageDescription] [nvarchar](500) NULL,
	[ImageBinary] [image] NOT NULL,
	[ImageBinarySmall] [image] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_IMAGE_COMPONENT] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IMAGE_EQUIPMENT]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGE_EQUIPMENT](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[ImageDescription] [nvarchar](500) NULL,
	[ImageBinary] [image] NOT NULL,
	[ImageBinarySmall] [image] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_IMAGE_EQUIPMENT] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IMAGE_FACILITY]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGE_FACILITY](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[FacilityID] [int] NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[ImageDescription] [nvarchar](500) NULL,
	[ImageBinary] [image] NOT NULL,
	[ImageBinarySmall] [image] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_IMAGE_FACILITY] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INSPECTION_COVERAGE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSPECTION_COVERAGE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PlanID] [int] NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[ComponentID] [int] NOT NULL,
	[Remarks] [nvarchar](250) NULL,
	[Findings] [nvarchar](max) NULL,
	[FindingRTF] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_INSPECTION_COVERAGE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INSPECTION_COVERAGE_DETAIL]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[INSPECTION_COVERAGE_DETAIL](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CoverageID] [int] NOT NULL,
	[DMItemID] [int] NOT NULL,
	[InspectionDate] [datetime] NOT NULL,
	[EffectivenessCode] [nvarchar](50) NULL,
	[InspectionSummary] [varchar](500) NULL,
	[IsCarriedOut] [bit] NULL,
	[CarriedOutDate] [datetime] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_INSPECTION_COVERAGE_DETAIL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[INSPECTION_DETAIL_TECHNIQUE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSPECTION_DETAIL_TECHNIQUE](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CoverageID] [int] NOT NULL,
	[IMItemID] [int] NULL,
	[IMTypeID] [int] NULL,
	[InspectionType] [int] NULL,
	[Coverage] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_INSPECTION_DETAIL_TECHNIQUE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INSPECTION_DM_RULE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSPECTION_DM_RULE](
	[DMItemID] [int] NOT NULL,
	[IMItemID] [int] NOT NULL,
	[IMTypeID] [int] NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_1F6384BC_INSPECTION_DM_RULE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_1F6384BC_INSPECTION_DM_RULE_AuditingID]  DEFAULT (newid())
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INSPECTION_PLAN]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSPECTION_PLAN](
	[PlanID] [int] IDENTITY(1,1) NOT NULL,
	[InspPlanName] [nvarchar](150) NOT NULL,
	[InspPlanDate] [datetime] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_INSPECTION_PLAN] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ITEM_LIST_CONFIG]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITEM_LIST_CONFIG](
	[ItemListConfigID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](100) NOT NULL,
	[TreeNode] [nvarchar](100) NOT NULL,
	[NodeSeq] [int] NOT NULL,
	[ParentID] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ITEM_LIST_CONFIG] PRIMARY KEY CLUSTERED 
(
	[ItemListConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MANUFACTURER]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MANUFACTURER](
	[ManufacturerID] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](100) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_2E8184B5_MANUFACTURER_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_2E8184B5_MANUFACTURER_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_MANUFACTURER] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POINTS]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POINTS](
	[PointID] [int] IDENTITY(1,1) NOT NULL,
	[PointName] [nvarchar](50) NOT NULL,
	[ComponentID] [int] NOT NULL,
	[CorrosionRate] [float] NULL,
	[NominalThickness] [float] NULL,
	[MinReqThickness] [float] NULL,
	[ThicknessCurrent] [float] NULL,
	[ThicknessPrevious] [float] NULL,
	[DateCurrent] [datetime] NULL,
	[DatePrevious] [datetime] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_POINTS] PRIMARY KEY CLUSTERED 
(
	[PointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRD_COMPONENT_MASTER]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRD_COMPONENT_MASTER](
	[ComponentID] [int] NOT NULL,
	[PRDTypeID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PRD_COMPONENT_MASTER_1] PRIMARY KEY CLUSTERED 
(
	[ComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRD_DF_CLASSES]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRD_DF_CLASSES](
	[ID] [int] NOT NULL,
	[DFClass] [nvarchar](250) NOT NULL,
	[DFValue] [int] NOT NULL,
	[Desciption] [nvarchar](500) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_7FDF40EC_PRD_DF_CLASSES_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_7FDF40EC_PRD_DF_CLASSES_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_PRD_DF_CLASSES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRD_DISCHARGE_LOCATION]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRD_DISCHARGE_LOCATION](
	[ID] [int] NOT NULL,
	[DischargeLocation] [nvarchar](50) NOT NULL,
	[WeibullAdjustmentFactor] [float] NULL,
	[RecoveryFactor] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_705025B8_PRD_DISCHARGE_LOCATION_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_705025B8_PRD_DISCHARGE_LOCATION_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_PRD_DISCHARGE_LOCATION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRD_FAILURE_MODE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRD_FAILURE_MODE](
	[ID] [int] NOT NULL,
	[FailureMode] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_FC50B418_PRD_FAILURE_MODE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_FC50B418_PRD_FAILURE_MODE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_PRD_FAILURE_MODE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRD_INSPECTION_CONFIDENCE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRD_INSPECTION_CONFIDENCE](
	[ID] [int] NOT NULL,
	[EffectivenessID] [int] NOT NULL,
	[InspectionResultID] [int] NOT NULL,
	[FactorValue] [float] NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_B8EB4712_PRD_INSPECTION_CONFIDENCE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_B8EB4712_PRD_INSPECTION_CONFIDENCE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_PRD_INSPECTION_CONFIDENCE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRD_INSPECTION_EFFECTIVENESS]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRD_INSPECTION_EFFECTIVENESS](
	[ID] [int] NOT NULL,
	[Effectiveness] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_DF695450_PRD_INSPECTION_EFFECTIVENESS_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_DF695450_PRD_INSPECTION_EFFECTIVENESS_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_PRD_INSPECTION_EFFECTIVENESS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRD_INSPECTION_RESULT]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRD_INSPECTION_RESULT](
	[ID] [int] NOT NULL,
	[InspectionResult] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_A9FA1FFF_PRD_INSPECTION_RESULT_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_A9FA1FFF_PRD_INSPECTION_RESULT_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_PRD_INSPECTION_RESULT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRD_OVERPRESSURE_DEMAND]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRD_OVERPRESSURE_DEMAND](
	[ID] [int] NOT NULL,
	[DemandCase] [nvarchar](250) NOT NULL,
	[EventFrequency] [nvarchar](50) NOT NULL,
	[EF] [float] NOT NULL,
	[DRRF] [float] NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_FFEDB46B_PRD_OVERPRESSURE_DEMAND_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_FFEDB46B_PRD_OVERPRESSURE_DEMAND_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_PRD_OVERPRESSURE_DEMAND] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRD_SERVICE_SEVERITY]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRD_SERVICE_SEVERITY](
	[ID] [int] NOT NULL,
	[ServiceSeverity] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_595A3142_PRD_SERVICE_SEVERITY_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_595A3142_PRD_SERVICE_SEVERITY_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_PRD_SERVICE_SEVERITY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRD_TYPE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRD_TYPE](
	[ID] [int] NOT NULL,
	[PRDTypeName] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_EB031748_PRD_TYPE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_EB031748_PRD_TYPE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_PRD_TYPE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRD_WEIBULL_PARAMETER]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRD_WEIBULL_PARAMETER](
	[ID] [int] NOT NULL,
	[PRDTypeID] [int] NOT NULL,
	[ServiceSeverityID] [int] NOT NULL,
	[FalureModeID] [int] NOT NULL,
	[Eta] [float] NOT NULL,
	[Beta] [float] NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_78F3F8B7_PRD_WEIBULL_PARAMETER_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_78F3F8B7_PRD_WEIBULL_PARAMETER_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_PRD_WEIBULL_PARAMETER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[REPORT_TEMPLATE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REPORT_TEMPLATE](
	[TemplateID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](50) NULL,
	[TemplateDescription] [nvarchar](200) NULL,
	[OriginalFile] [nvarchar](150) NULL,
	[ReportIdentifier] [nvarchar](50) NULL,
	[ReportID] [nvarchar](50) NULL,
	[ReportType] [nvarchar](50) NULL,
	[ReportVersion] [nvarchar](50) NULL,
	[Predefined] [bit] NOT NULL CONSTRAINT [DF_REPORT_TEMPLATE_Predefined]  DEFAULT ((0)),
	[TemplateBinary] [varbinary](max) NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_2C65B66D_REPORT_TEMPLATE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_2C65B66D_REPORT_TEMPLATE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_REPORT_TEMPLATE] PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPORT_TEMPLATE_ASSESSMENT]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT](
	[ID] [int] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_REPORT_TEMPLATE_ASSESSMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT](
	[EquipmentID] [int] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_REPORT_TEMPLATE_COMPONENT_DEFAULT] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[REPORT_TEMPLATE_EQUIPMENT]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT](
	[EquipmentID] [int] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_REPORT_EQUIPMENT] PRIMARY KEY CLUSTERED 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_ASSESSMENT]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_ASSESSMENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[ComponentID] [int] NOT NULL,
	[AssessmentDate] [datetime] NULL,
	[AssessmentMethod] [int] NULL,
	[RiskAnalysisPeriod] [int] NULL,
	[IsEquipmentLinked] [bit] NOT NULL CONSTRAINT [DF_RW_ASSESSMENT_IsEquipmentLinked]  DEFAULT ((0)),
	[RecordType] [nvarchar](2) NULL,
	[ProposalNo] [int] NULL,
	[RevisionNo] [int] NULL,
	[IsRecommend] [bit] NOT NULL CONSTRAINT [DF_RW_ASSESSMENT_IsRecommend]  DEFAULT ((0)),
	[ProposalOrRevision] [nvarchar](2) NULL,
	[AdoptedBy] [nvarchar](50) NULL,
	[AdoptedDate] [datetime] NULL,
	[RecommendedBy] [nvarchar](50) NULL,
	[RecommendedDate] [datetime] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_DCAE204E_RW_ASSESSMENT_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_DCAE204E_RW_ASSESSMENT_AuditingID]  DEFAULT (newid()),
	[ProposalName] [nvarchar](max) NULL,
	[AddByExcel] [bit] NULL,
 CONSTRAINT [PK_RW_ASSESSMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_CF_MASTER]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_CF_MASTER](
	[ID] [int] NOT NULL,
	[CF1] [float] NULL,
	[CF2] [float] NULL,
	[CF3] [float] NULL,
	[CF4] [float] NULL,
	[CF5] [float] NULL,
	[CF6] [float] NULL,
	[CF7] [float] NULL,
	[CF8] [float] NULL,
	[CF9] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CF_MASTER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_COATING]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_COATING](
	[ID] [int] NOT NULL,
	[ExternalCoating] [bit] NOT NULL CONSTRAINT [DF_RW_GEOMETRIES_ExternalCoating]  DEFAULT ((0)),
	[ExternalInsulation] [bit] NOT NULL CONSTRAINT [DF_RW_GEOMETRIES_ExternalInsulation]  DEFAULT ((0)),
	[InternalCladding] [bit] NOT NULL CONSTRAINT [DF_RW_GEOMETRIES_InternalCladding]  DEFAULT ((0)),
	[InternalCoating] [bit] NOT NULL CONSTRAINT [DF_RW_GEOMETRIES_InternalCoating]  DEFAULT ((0)),
	[InternalLining] [bit] NOT NULL CONSTRAINT [DF_RW_GEOMETRIES_InternalLining]  DEFAULT ((0)),
	[ExternalCoatingDate] [datetime] NULL,
	[ExternalCoatingQuality] [nvarchar](50) NULL,
	[ExternalInsulationType] [nvarchar](50) NULL,
	[InsulationCondition] [nvarchar](50) NULL,
	[InsulationContainsChloride] [bit] NOT NULL CONSTRAINT [DF_RW_GEOMETRIES_InsulationContainsChloride]  DEFAULT ((0)),
	[InternalLinerCondition] [nvarchar](50) NULL,
	[InternalLinerType] [nvarchar](50) NULL,
	[CladdingThickness] [float] NULL,
	[CladdingCorrosionRate] [float] NULL,
	[SupportConfigNotAllowCoatingMaint] [bit] NOT NULL CONSTRAINT [DF_RW_COATING_SupportConfigNotAllowCoatingMaint]  DEFAULT ((0)),
	[Created] [datetime] NULL CONSTRAINT [DF_363BB8AC_RW_COATING_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_363BB8AC_RW_COATING_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_GEOMETRIES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_COMPONENT]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_COMPONENT](
	[ID] [int] NOT NULL,
	[NominalDiameter] [float] NULL,
	[NominalThickness] [float] NULL,
	[CurrentThickness] [float] NULL,
	[MinReqThickness] [float] NULL,
	[CurrentCorrosionRate] [float] NULL,
	[BranchDiameter] [nvarchar](50) NULL,
	[BranchJointType] [nvarchar](50) NULL,
	[BrinnelHardness] [nvarchar](50) NULL,
	[ChemicalInjection] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_PROPERTIES_ChemicalInjection]  DEFAULT ((0)),
	[HighlyInjectionInsp] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_PROPERTIES_HighlyInjectionInsp]  DEFAULT ((0)),
	[ComplexityProtrusion] [nvarchar](50) NULL,
	[CorrectiveAction] [nvarchar](50) NULL,
	[CracksPresent] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_PROPERTIES_CracksPresent]  DEFAULT ((0)),
	[CyclicLoadingWitin15_25m] [nvarchar](50) NULL,
	[DamageFoundInspection] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_PROPERTIES_DamageFoundInspection]  DEFAULT ((0)),
	[DeltaFATT] [float] NULL,
	[NumberPipeFittings] [nvarchar](50) NULL,
	[PipeCondition] [nvarchar](50) NULL,
	[PreviousFailures] [nvarchar](50) NULL,
	[ShakingAmount] [nvarchar](50) NULL,
	[ShakingDetected] [bit] NOT NULL CONSTRAINT [DF_COMPONENT_PROPERTIES_ShakingDetected]  DEFAULT ((0)),
	[ShakingTime] [nvarchar](50) NULL,
	[SeverityOfVibration] [nvarchar](50) NULL,
	[ReleasePreventionBarrier] [bit] NOT NULL CONSTRAINT [DF_RW_COMPONENT_ReleasePreventionBarrier]  DEFAULT ((0)),
	[ConcreteFoundation] [bit] NOT NULL CONSTRAINT [DF_RW_COMPONENT_ConcreteFoundation]  DEFAULT ((0)),
	[ShellHeight] [float] NULL,
	[AllowableStress] [float] NULL,
	[WeldJointEfficiency] [float] NULL,
	[ComponentVolume] [float] NULL,
	[ConfidenceCorrosionRate] [nvarchar](50) NULL,
	[MinimumStructuralThicknessGoverns] [bit] NOT NULL CONSTRAINT [DF_RW_COMPONENT_MinimumStructuralThicknessGoverns]  DEFAULT ((0)),
	[StructuralThickness] [float] NULL,
	[CracksCurrentCondition] [nvarchar](50) NULL,
	[FabricatedSteel] [bit] NOT NULL CONSTRAINT [DF_RW_COMPONENT_FabricatedSteel]  DEFAULT ((0)),
	[EquipmentSatisfied] [bit] NOT NULL CONSTRAINT [DF_RW_COMPONENT_EquipmentSatisfied]  DEFAULT ((0)),
	[NominalOperatingConditions] [bit] NOT NULL CONSTRAINT [DF_RW_COMPONENT_NominalOperatingConditions]  DEFAULT ((0)),
	[CETGreaterOrEqual] [bit] NOT NULL CONSTRAINT [DF_RW_COMPONENT_CETGreaterOrEqual]  DEFAULT ((0)),
	[CyclicServiceFatigueVibration] [bit] NOT NULL CONSTRAINT [DF_RW_COMPONENT_CyclicServiceFatigueVibration]  DEFAULT ((0)),
	[EquipmentCircuitShock] [bit] NOT NULL CONSTRAINT [DF_RW_COMPONENT_EquipmentCircuitShock]  DEFAULT ((0)),
	[HTHADamageObserved] [bit] NOT NULL CONSTRAINT [DF_RW_COMPONENT_HTHADamageObserved]  DEFAULT ((0)),
	[BrittleFractureThickness] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_1A28FCEA_RW_COMPONENT_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_1A28FCEA_RW_COMPONENT_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_COMPONENT_PROPERTIES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_CORROSION_RATE_TANK]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_CORROSION_RATE_TANK](
	[ID] [int] NOT NULL,
	[CorrosionID] [int] IDENTITY(1,1) NOT NULL,
	[SoilSideCorrosionRate] [float] NULL,
	[ProductSideCorrosionRate] [float] NULL,
	[PotentialCorrosion] [nvarchar](100) NULL,
	[TankPadMaterial] [nvarchar](100) NULL,
	[TankDrainageType] [nvarchar](100) NULL,
	[CathodicProtectionType] [nvarchar](100) NULL,
	[TankBottomType] [nvarchar](100) NULL,
	[SoilSideTemperature] [nvarchar](100) NULL,
	[ProductCondition] [nvarchar](100) NULL,
	[ProductSideTemp] [nvarchar](100) NULL,
	[SteamCoil] [nvarchar](50) NULL,
	[WaterDrawOff] [nvarchar](50) NULL,
	[ProductSideBottom] [nvarchar](100) NULL,
	[ModifiedSoilSideCorrosionRate] [float] NULL,
	[ModifiedProductSideCorrosionRate] [float] NULL,
	[FinalEstimatedCorrosionRate] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_715B05F7_RW_CORROSION_RATE_TANK_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_715B05F7_RW_CORROSION_RATE_TANK_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_RW_CORROSION_RATE_TANK] PRIMARY KEY CLUSTERED 
(
	[CorrosionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_DAMAGE_MECHANISM]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_DAMAGE_MECHANISM](
	[ID] [int] NOT NULL,
	[DMItemID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_RW_DAMAGE_MECHANISM_IsActive]  DEFAULT ((0)),
	[Notes] [nvarchar](255) NULL,
	[ExpectedTypeID] [int] NULL,
	[IsEL] [bit] NOT NULL CONSTRAINT [DF_RW_DAMAGE_MECHANISM_IsEL]  DEFAULT ((0)),
	[ELValue] [float] NULL,
	[IsDF] [bit] NOT NULL CONSTRAINT [DF_RW_DAMAGE_MECHANISM_IsDF]  DEFAULT ((0)),
	[IsUserDisabled] [bit] NOT NULL CONSTRAINT [DF_RW_DAMAGE_MECHANISM_IsUserDisabled]  DEFAULT ((0)),
	[DF1] [float] NULL,
	[DF2] [float] NULL,
	[DF3] [float] NULL,
	[DFBase] [float] NULL,
	[RLI] [float] NULL,
	[HighestInspectionEffectiveness] [nvarchar](50) NULL,
	[SecondInspectionEffectiveness] [nvarchar](50) NULL,
	[NumberOfInspections] [int] NULL,
	[LastInspDate] [datetime] NULL,
	[InspDueDate] [datetime] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_DB30996F_RW_DAMAGE_MECHANISM_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_DB30996F_RW_DAMAGE_MECHANISM_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_RW_DAMAGE_MECHANISM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[DMItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_EQUIPMENT]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_EQUIPMENT](
	[ID] [int] NOT NULL,
	[CommissionDate] [datetime] NOT NULL,
	[AdminUpsetManagement] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_AdminUpsetManagement]  DEFAULT ((0)),
	[ContainsDeadlegs] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_ContainsDeadlegs]  DEFAULT ((0)),
	[CyclicOperation] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_CyclicOperation]  DEFAULT ((0)),
	[HighlyDeadlegInsp] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_HighlyDeadlegInsp]  DEFAULT ((0)),
	[DowntimeProtectionUsed] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_DowntimeProtectionUsed]  DEFAULT ((0)),
	[ExternalEnvironment] [nvarchar](50) NULL,
	[HeatTraced] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_HeatTraced]  DEFAULT ((0)),
	[InterfaceSoilWater] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_InterfaceSoilWater]  DEFAULT ((0)),
	[LinerOnlineMonitoring] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_LinerOnlineMonitoring]  DEFAULT ((0)),
	[MaterialExposedToClExt] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_MaterialExposedToClExt]  DEFAULT ((0)),
	[MinReqTemperaturePressurisation] [float] NULL,
	[OnlineMonitoring] [nvarchar](100) NULL,
	[PresenceSulphidesO2] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_PresenceSulphidesO2]  DEFAULT ((0)),
	[PresenceSulphidesO2Shutdown] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_PresenceSulphidesO2Shutdown]  DEFAULT ((0)),
	[PressurisationControlled] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_PressurisationControlled]  DEFAULT ((0)),
	[PWHT] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_PWHT]  DEFAULT ((0)),
	[SteamOutWaterFlush] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_SteamedOut]  DEFAULT ((0)),
	[ManagementFactor] [float] NULL,
	[ThermalHistory] [nvarchar](50) NULL,
	[YearLowestExpTemp] [bit] NOT NULL CONSTRAINT [DF_EQUIPMENT_PROPERTIES_YearLowestExpTemp]  DEFAULT ((0)),
	[Volume] [float] NULL,
	[TypeOfSoil] [nvarchar](50) NULL,
	[EnvironmentSensitivity] [nvarchar](50) NULL,
	[DistanceToGroundWater] [float] NULL,
	[AdjustmentSettle] [nvarchar](100) NULL,
	[ComponentIsWelded] [bit] NOT NULL CONSTRAINT [DF_RW_EQUIPMENT_ComponentIsWelded]  DEFAULT ((0)),
	[TankIsMaintained] [bit] NOT NULL CONSTRAINT [DF_RW_EQUIPMENT_TankIsMaintained]  DEFAULT ((0)),
	[Created] [datetime] NULL CONSTRAINT [DF_D4198DA6_RW_EQUIPMENT_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_D4198DA6_RW_EQUIPMENT_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_EQUIPMENT_PROPERTIES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_EXTCOR_TEMPERATURE]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_EXTCOR_TEMPERATURE](
	[ID] [int] NOT NULL,
	[Minus12ToMinus8] [float] NULL,
	[Minus8ToPlus6] [float] NULL,
	[Plus6ToPlus32] [float] NULL,
	[Plus32ToPlus71] [float] NULL,
	[Plus71ToPlus107] [float] NULL,
	[Plus107ToPlus121] [float] NULL,
	[Plus121ToPlus135] [float] NULL,
	[Plus135ToPlus162] [float] NULL,
	[Plus162ToPlus176] [float] NULL,
	[MoreThanPlus176] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_FF3B9BFE_RW_EXTCOR_TEMPERATURE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_FF3B9BFE_RW_EXTCOR_TEMPERATURE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_RW_EXTCOR_TEMPERATURE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_EXTRA_FIELDS]    Script Date: 10/29/2019 10:24:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_EXTRA_FIELDS](
	[ID] [int] NOT NULL,
	[ObjectField001] [nvarchar](max) NULL,
	[ObjectField002] [nvarchar](max) NULL,
	[ObjectField003] [nvarchar](max) NULL,
	[ObjectField004] [nvarchar](max) NULL,
	[ObjectField005] [nvarchar](max) NULL,
	[ObjectField006] [nvarchar](max) NULL,
	[ObjectField007] [nvarchar](max) NULL,
	[ObjectField008] [nvarchar](max) NULL,
	[ObjectField009] [nvarchar](max) NULL,
	[ObjectField010] [nvarchar](max) NULL,
	[ObjectField011] [nvarchar](max) NULL,
	[ObjectField012] [nvarchar](max) NULL,
	[ObjectField013] [nvarchar](max) NULL,
	[ObjectField014] [nvarchar](max) NULL,
	[ObjectField015] [nvarchar](max) NULL,
	[ObjectField016] [nvarchar](max) NULL,
	[ObjectField017] [nvarchar](max) NULL,
	[ObjectField018] [nvarchar](max) NULL,
	[ObjectField019] [nvarchar](max) NULL,
	[ObjectField020] [nvarchar](max) NULL,
	[ObjectField021] [nvarchar](max) NULL,
	[ObjectField022] [nvarchar](max) NULL,
	[ObjectField023] [nvarchar](max) NULL,
	[ObjectField024] [nvarchar](max) NULL,
	[ObjectField025] [nvarchar](max) NULL,
	[ObjectField026] [nvarchar](max) NULL,
	[ObjectField027] [nvarchar](max) NULL,
	[ObjectField028] [nvarchar](max) NULL,
	[ObjectField029] [nvarchar](max) NULL,
	[ObjectField030] [nvarchar](max) NULL,
	[ObjectField031] [nvarchar](max) NULL,
	[ObjectField032] [nvarchar](max) NULL,
	[ObjectField033] [nvarchar](max) NULL,
	[ObjectField034] [nvarchar](max) NULL,
	[ObjectField035] [nvarchar](max) NULL,
	[ObjectField036] [nvarchar](max) NULL,
	[ObjectField037] [nvarchar](max) NULL,
	[ObjectField038] [nvarchar](max) NULL,
	[ObjectField039] [nvarchar](max) NULL,
	[ObjectField040] [nvarchar](max) NULL,
	[ObjectField041] [nvarchar](max) NULL,
	[ObjectField042] [nvarchar](max) NULL,
	[ObjectField043] [nvarchar](max) NULL,
	[ObjectField044] [nvarchar](max) NULL,
	[ObjectField045] [nvarchar](max) NULL,
	[ObjectField046] [nvarchar](max) NULL,
	[ObjectField047] [nvarchar](max) NULL,
	[ObjectField048] [nvarchar](max) NULL,
	[ObjectField049] [nvarchar](max) NULL,
	[ObjectField050] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_EXTRA_FIELDS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_FULL_COF]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_FULL_COF](
	[ID] [int] NOT NULL,
	[CoFValue] [float] NULL,
	[CoFCategory] [nvarchar](50) NULL,
	[CoFMatrixValue] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FULLY_COF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_FULL_COF_FLUID]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RW_FULL_COF_FLUID](
	[ID] [int] NOT NULL,
	[Cp] [float] NULL,
	[k] [float] NULL,
	[GFFTotal] [float] NULL,
	[Kv_n] [float] NULL,
	[ReleasePhase] [varchar](15) NULL,
	[Cd] [float] NULL,
	[Ptrans] [float] NULL,
	[NBP] [float] NULL,
	[Density] [float] NULL,
	[MW] [float] NULL,
	[R] [float] NULL,
	[Ps] [float] NULL,
	[Ts] [float] NULL,
	[Patm] [float] NULL,
	[fact_di] [float] NULL,
	[fact_mit] [float] NULL,
	[fact_AIT] [float] NULL,
	[g] [float] NULL,
	[h] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FULLY_COF_FLUID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RW_FULL_COF_HOLE_SIZE]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RW_FULL_COF_HOLE_SIZE](
	[ID] [int] NOT NULL,
	[GFF_n] [varchar](15) NOT NULL,
	[An] [float] NULL,
	[Wn] [float] NULL,
	[t_n] [float] NULL,
	[ld_max_n] [float] NULL,
	[mass_add_n] [float] NULL,
	[mass_avail_n] [float] NULL,
	[rate_n] [float] NULL,
	[ld_n] [float] NULL,
	[mass_n] [float] NULL,
	[eneff_n] [float] NULL,
	[factIC_n] [float] NULL,
	[ReleaseType_n] [varchar](15) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FULLY_COF_HOLE_SIZE_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[GFF_n] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RW_FULL_COF_INPUT]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_FULL_COF_INPUT](
	[ID] [int] NOT NULL,
	[Mitigation] [nvarchar](50) NULL,
	[DetectionType] [nvarchar](50) NULL,
	[IsolationType] [nvarchar](50) NULL,
	[mass_comp] [float] NULL,
	[mass_inv] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FULLY_COF_INPUT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_FULL_COF_TANK]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_FULL_COF_TANK](
	[ID] [int] NOT NULL,
	[CoFValue] [float] NULL,
	[CoFCategory] [nvarchar](50) NULL,
	[ProdCost] [float] NULL,
	[EquipOutageMultiplier] [float] NULL,
	[equipcost] [float] NULL,
	[popdens] [float] NULL,
	[injcost] [float] NULL,
	[CoFMatrixValue] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_FULL_COF_TANK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_FULL_FCOF]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_FULL_FCOF](
	[ID] [int] NOT NULL,
	[FCoFValue] [float] NULL,
	[FCoFCategory] [nvarchar](50) NULL,
	[AIL] [bit] NOT NULL,
	[EquipOutageMultiplier] [float] NULL,
	[envcost] [float] NULL,
	[equipcost] [float] NULL,
	[prodcost] [float] NULL,
	[popdens] [float] NULL,
	[injcost] [float] NULL,
	[FCoFMatrixValue] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FULLY_FCOF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_FULL_POF]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_FULL_POF](
	[ID] [int] NOT NULL,
	[ThinningAP1] [float] NULL,
	[ThinningAP2] [float] NULL,
	[ThinningAP3] [float] NULL,
	[SCCAP1] [float] NULL,
	[SCCAP2] [float] NULL,
	[SCCAP3] [float] NULL,
	[ExternalAP1] [float] NULL,
	[ExternalAP2] [float] NULL,
	[ExternalAP3] [float] NULL,
	[BrittleAP1] [float] NULL,
	[BrittleAP2] [float] NULL,
	[BrittleAP3] [float] NULL,
	[HTHA_AP1] [float] NULL,
	[HTHA_AP2] [float] NULL,
	[HTHA_AP3] [float] NULL,
	[FatigueAP1] [float] NULL,
	[FatigueAP2] [float] NULL,
	[FatigueAP3] [float] NULL,
	[FMS] [float] NULL,
	[ThinningType] [nvarchar](7) NULL,
	[GFFTotal] [float] NULL,
	[ThinningLocalAP1] [float] NULL,
	[ThinningLocalAP2] [float] NULL,
	[ThinningLocalAP3] [float] NULL,
	[ThinningGeneralAP1] [float] NULL,
	[ThinningGeneralAP2] [float] NULL,
	[ThinningGeneralAP3] [float] NULL,
	[TotalDFAP1] [float] NULL,
	[TotalDFAP2] [float] NULL,
	[TotalDFAP3] [float] NULL,
	[PoFAP1] [float] NULL,
	[PoFAP2] [float] NULL,
	[PoFAP3] [float] NULL,
	[MatrixPoFAP1] [float] NULL,
	[MatrixPoFAP2] [float] NULL,
	[MatrixPoFAP3] [float] NULL,
	[RLI] [float] NULL,
	[SemiAP1] [float] NULL,
	[SemiAP2] [float] NULL,
	[SemiAP3] [float] NULL,
	[PoFAP1Category] [nvarchar](50) NULL,
	[PoFAP2Category] [nvarchar](50) NULL,
	[PoFAP3Category] [nvarchar](50) NULL,
	[CoFValue] [float] NULL,
	[CoFCategory] [nvarchar](2) NULL,
	[CoFMatrixValue] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_0AD829CC_RW_FULL_POF_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_0AD829CC_RW_FULL_POF_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_FULLY_POF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_INSPECTION_DETAIL]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RW_INSPECTION_DETAIL](
	[ID] [int] NOT NULL,
	[DetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[ComponentID] [int] NOT NULL,
	[Coverage_DetailID] [bigint] NULL,
	[InspPlanName] [nvarchar](150) NULL,
	[InspectionDate] [datetime] NULL,
	[DMItemID] [int] NOT NULL,
	[EffectivenessCode] [nvarchar](50) NULL,
	[InspectionSummary] [varchar](500) NULL,
	[IsCarriedOut] [bit] NULL,
	[CarriedOutDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_INSPECTION_DETAIL] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RW_INSPECTION_HISTORY]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_INSPECTION_HISTORY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InspectionPlanName] [nvarchar](max) NULL,
	[InspectionCoverageName] [nvarchar](max) NULL,
	[EquipmentNumber] [nvarchar](50) NULL,
	[ComponentNumber] [nvarchar](50) NULL,
	[DM] [nvarchar](max) NULL,
	[InspectionType] [nvarchar](max) NULL,
	[InspectionDate] [datetime] NULL,
	[InspectionEffective] [nvarchar](1) NULL,
 CONSTRAINT [PK_RW_INSPECTION_HISTORY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_LF_DETAIL]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_LF_DETAIL](
	[ID] [int] NOT NULL,
	[DMItemID] [int] NOT NULL,
	[LF2AP1] [float] NULL,
	[LF2AP2] [float] NULL,
	[LF2AP3] [float] NULL,
	[LF2FactorAP1] [float] NULL,
	[LF2FactorAP2] [float] NULL,
	[LF2FactorAP3] [float] NULL,
	[LF3] [float] NULL,
	[LF3Factor] [float] NULL,
	[LCF] [float] NULL,
	[LHAP1Category] [nvarchar](2) NULL,
	[LHAP2Category] [nvarchar](2) NULL,
	[LHAP3Category] [nvarchar](2) NULL,
	[LHAP1Value] [float] NULL,
	[LHAP2Value] [float] NULL,
	[LHAP3Value] [float] NULL,
	[CoFValue] [float] NULL,
	[CoFCategory] [nvarchar](2) NULL,
	[RLI] [float] NULL,
	[IsEL] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_LF_DETAIL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[DMItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_LF_MASTER]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_LF_MASTER](
	[ID] [int] NOT NULL,
	[LF1Factor] [float] NULL,
	[LF4Factor] [float] NULL,
	[LF5Factor] [float] NULL,
	[LF6Factor] [float] NULL,
	[LF7Factor] [float] NULL,
	[LF1] [float] NULL,
	[LF4] [float] NULL,
	[LF5] [float] NULL,
	[LF6] [float] NULL,
	[LF7] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_LF_MASTER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_MATERIAL]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_MATERIAL](
	[ID] [int] NOT NULL,
	[MaterialName] [nvarchar](100) NULL,
	[DesignPressure] [float] NULL,
	[DesignTemperature] [float] NULL,
	[MinDesignTemperature] [float] NULL,
	[BrittleFractureThickness] [float] NULL,
	[CorrosionAllowance] [float] NULL,
	[SigmaPhase] [float] NULL,
	[SulfurContent] [nvarchar](50) NULL,
	[HeatTreatment] [nvarchar](50) NULL,
	[SteelProductForm] [nvarchar](50) NULL,
	[ReferenceTemperature] [float] NULL,
	[PTAMaterialCode] [nvarchar](70) NULL,
	[HTHAMaterialCode] [nvarchar](50) NULL,
	[IsPTA] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_IsPTA]  DEFAULT ((0)),
	[IsHTHA] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_IsHTHA]  DEFAULT ((0)),
	[Austenitic] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_Austenitic]  DEFAULT ((0)),
	[Temper] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_Temper]  DEFAULT ((0)),
	[CarbonLowAlloy] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_CarbonLowAlloy]  DEFAULT ((0)),
	[NickelBased] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_NickelBased]  DEFAULT ((0)),
	[ChromeMoreEqual12] [bit] NOT NULL CONSTRAINT [DF_RW_MATERIAL_ChromeLess12]  DEFAULT ((0)),
	[YieldStrength] [float] NULL,
	[TensileStrength] [float] NULL,
	[CostFactor] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_4634F597_RW_MATERIAL_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_4634F597_RW_MATERIAL_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_MATERIALS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_POINTS]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_POINTS](
	[ID] [int] NOT NULL,
	[PointID] [int] IDENTITY(1,1) NOT NULL,
	[PointName] [nvarchar](100) NULL,
	[GaugePoint] [nvarchar](100) NULL,
	[PointLocation] [nvarchar](100) NULL,
	[PIDNo] [nvarchar](100) NULL,
	[FittingDesc] [nvarchar](100) NULL,
	[Specification] [nvarchar](100) NULL,
	[Size] [nvarchar](50) NULL,
	[MinReqThickness] [float] NULL,
	[ThicknessReading] [float] NULL,
	[ThicknessDate] [datetime] NULL,
	[NominalThickness] [float] NULL,
	[EstimatedCorrosionRate] [float] NULL,
	[CalculatedCorrosionRate] [float] NULL,
	[CalculatedRemainingLife] [float] NULL,
	[k] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_POINTS_1] PRIMARY KEY CLUSTERED 
(
	[PointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_PRD_COF_INPUT]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_PRD_COF_INPUT](
	[ID] [int] NOT NULL,
	[Mitigation] [nvarchar](50) NULL,
	[DetectionType] [nvarchar](50) NULL,
	[IsolationType] [nvarchar](50) NULL,
	[ModelFluidID] [int] NULL,
	[ToxicFluidID] [int] NULL,
	[LiquidLevel] [float] NULL,
	[ReleaseFluidPercentToxic] [float] NULL,
	[StoragePhase] [nvarchar](50) NULL,
	[mass_inv] [float] NULL,
	[NominalDiameter] [float] NULL,
	[MaterialCostFactor] [float] NULL,
	[FluidCost] [float] NULL,
	[ComponentVolume] [float] NULL,
	[equipcost] [float] NULL,
	[prodcost] [float] NULL,
	[ShutDownDays] [float] NULL,
	[popdens] [float] NULL,
	[injcost] [float] NULL,
	[envcostLoss] [float] NULL,
	[envcostLeak] [float] NULL,
	[EquipOutageMultiplier] [float] NULL,
	[LeakingReliefDevice] [bit] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_PRD_COF_INPUT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_PRD_COMPONENT]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_PRD_COMPONENT](
	[ID] [int] NOT NULL,
	[CommisionDate] [datetime] NULL,
	[InstallationDate] [datetime] NULL,
	[FailServiceSeverityID] [int] NULL,
	[LeakServiceSeverityID] [int] NULL,
	[DischargeLocationID] [int] NULL,
	[SoftSeat] [bit] NOT NULL,
	[PipingVibration] [bit] NOT NULL,
	[ExcessiveActuation] [bit] NOT NULL,
	[Chatter] [bit] NOT NULL,
	[PulsatingCyclical] [bit] NOT NULL,
	[OperatingSet] [float] NULL,
	[MaxOpPressure] [float] NULL,
	[MAWP] [float] NULL,
	[OperatingTemperature] [float] NULL,
	[FlowCapacity] [float] NULL,
	[InletSize] [float] NULL,
	[OrificeArea] [float] NULL,
	[ManagementFactor] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_PRD_COMPONENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_PRD_COMPONENT_LINKED]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_PRD_COMPONENT_LINKED](
	[ID] [int] NOT NULL,
	[ComponentLinkedID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_PRD_COMPONENT_LINKED] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[ComponentLinkedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_PRD_INSPECTION]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_PRD_INSPECTION](
	[ID] [int] NOT NULL,
	[InspectionID] [bigint] IDENTITY(1,1) NOT NULL,
	[InspectionDate] [datetime] NULL,
	[InspectionResultID] [int] NULL,
	[InspectionEffectivenessID] [int] NULL,
	[Overhaul] [bit] NOT NULL,
	[IsPipingPlugged] [bit] NOT NULL,
	[Findings] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_PRD_INSPECTION] PRIMARY KEY CLUSTERED 
(
	[InspectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_PRD_OVERPRESSURE_DEMAND]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_PRD_OVERPRESSURE_DEMAND](
	[ID] [int] NOT NULL,
	[DemandCaseID] [int] NOT NULL,
	[PotentialOverpressure] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_PRD_OVERPRESSURE_DEMAND_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[DemandCaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_PRD_PROTECTED_COMPONENT]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_PRD_PROTECTED_COMPONENT](
	[ID] [int] NOT NULL,
	[EquipmentRiskAvailable] [bit] NOT NULL,
	[UseComponentDF] [bit] NOT NULL,
	[DFClassID] [int] NULL,
	[ComponentID] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_PRD_PROTECTED_COMPONENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_PRD_RISK]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RW_PRD_RISK](
	[ID] [int] NOT NULL,
	[RiskID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](250) NULL,
	[PoFValue] [float] NULL,
	[PoFCategory] [nvarchar](2) NULL,
	[CoFValue] [float] NULL,
	[CoFCategory] [nvarchar](2) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_PRD_RISK_1] PRIMARY KEY CLUSTERED 
(
	[RiskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RW_PRIMARY_FLUID]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_PRIMARY_FLUID](
	[ID] [int] NOT NULL,
	[FluidName] [nvarchar](100) NULL,
	[NBP] [float] NULL,
	[MW] [float] NULL,
	[Density] [float] NULL,
	[ChemicalFactor] [int] NULL,
	[HealthDegree] [int] NULL,
	[Flammability] [int] NULL,
	[Reactivity] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_PRIMARY_FLUID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_REVISION_INSPECTION]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_REVISION_INSPECTION](
	[ID] [int] NOT NULL,
	[CoverageDetailID] [int] NOT NULL,
	[InspPlanName] [nvarchar](150) NOT NULL,
	[CoverageName] [nvarchar](150) NOT NULL,
	[DMItemID] [int] NOT NULL,
	[IMTypeID] [int] NOT NULL,
	[InspectionDate] [datetime] NOT NULL,
	[EffectivenessCode] [nvarchar](50) NOT NULL,
	[Findings] [nvarchar](max) NULL,
	[FindingRTF] [nvarchar](max) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_REVISION_INSPECTION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[CoverageDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_RISK_TARGET]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_RISK_TARGET](
	[ID] [int] NOT NULL,
	[RiskTarget_A] [float] NULL,
	[RiskTarget_B] [float] NULL,
	[RiskTarget_C] [float] NULL,
	[RiskTarget_D] [float] NULL,
	[RiskTarget_E] [float] NULL,
	[RiskTarget_CA] [float] NULL,
	[RiskTarget_FC] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_RISK_TARGET] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_SAFETY_FACTOR]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_SAFETY_FACTOR](
	[ID] [int] NOT NULL,
	[SafetyFactorScheme] [nvarchar](50) NULL,
	[A] [float] NULL,
	[B] [float] NULL,
	[C] [float] NULL,
	[D] [float] NULL,
	[E] [float] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_SAFETY_FACTOR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_SECONDARY_FLUID]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_SECONDARY_FLUID](
	[ID] [int] NOT NULL,
	[FluidName] [nvarchar](100) NULL,
	[NBP] [float] NULL,
	[MW] [float] NULL,
	[Density] [float] NULL,
	[ChemicalFactor] [int] NULL,
	[HealthDegree] [int] NULL,
	[Flammability] [int] NULL,
	[Reactivity] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_SECONDARY_FLUID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_SETTINGS]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_SETTINGS](
	[ID] [int] NOT NULL,
	[DefaultAssessmentMethod] [int] NOT NULL,
	[SchemaVersion] [nvarchar](50) NULL,
	[UnlockCode] [nvarchar](max) NULL,
	[CompanyName] [nvarchar](250) NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_84D4695A_rw_settings_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_84D4695A_rw_settings_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_RW_SETTINGS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_STREAM]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_STREAM](
	[ID] [int] NOT NULL,
	[AmineSolution] [nvarchar](50) NULL,
	[AqueousOperation] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_AqueousOperation]  DEFAULT ((0)),
	[AqueousShutdown] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_AqueousShutdown]  DEFAULT ((0)),
	[ToxicConstituent] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_ToxicConstituent]  DEFAULT ((0)),
	[Caustic] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_Caustic]  DEFAULT ((0)),
	[Chloride] [float] NULL,
	[CO3Concentration] [float] NULL,
	[Cyanide] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_Cyanide]  DEFAULT ((0)),
	[ExposedToGasAmine] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_ExposedToGasAmine]  DEFAULT ((0)),
	[ExposedToSulphur] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_ExposedToSulphur]  DEFAULT ((0)),
	[ExposureToAmine] [nvarchar](50) NULL,
	[FlammableFluidID] [int] NULL,
	[FlowRate] [float] NULL,
	[H2S] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_H2S]  DEFAULT ((0)),
	[H2SInWater] [float] NULL,
	[Hydrogen] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_Hydrogen]  DEFAULT ((0)),
	[H2SPartialPressure] [float] NULL,
	[Hydrofluoric] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_Hydrofluoric]  DEFAULT ((0)),
	[MaterialExposedToClInt] [bit] NOT NULL CONSTRAINT [DF_RW_STREAM_MaterialExposedToClInt]  DEFAULT ((0)),
	[MaxOperatingPressure] [float] NULL,
	[MaxOperatingTemperature] [float] NULL,
	[MinOperatingPressure] [float] NULL,
	[MinOperatingTemperature] [float] NULL,
	[CriticalExposureTemperature] [float] NULL,
	[ModelFluidID] [int] NULL,
	[NaOHConcentration] [float] NULL,
	[NonFlameToxicFluidID] [int] NULL,
	[LiquidLevel] [float] NULL,
	[ReleaseFluidPercentToxic] [float] NULL,
	[StoragePhase] [nvarchar](50) NULL,
	[ToxicFluidID] [int] NULL,
	[WaterpH] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_5CD0A346_RW_STREAM_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_5CD0A346_RW_STREAM_AuditingID]  DEFAULT (newid()),
	[TankFluidName] [nvarchar](50) NULL,
	[TankToxicFluidName] [nvarchar](50) NULL,
	[FluidHeight] [float] NULL,
	[FluidLeaveDikePercent] [float] NULL,
	[FluidLeaveDikeRemainOnSitePercent] [float] NULL,
	[FluidGoOffSitePercent] [float] NULL,
 CONSTRAINT [PK_RW_STREAM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_THICKNESS]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_THICKNESS](
	[ID] [int] NOT NULL,
	[PointID] [int] NOT NULL,
	[ThicknessID] [int] IDENTITY(1,1) NOT NULL,
	[ThicknessDate] [datetime] NULL,
	[MinReading] [float] NULL,
	[MaxReading] [float] NULL,
	[Orientation] [nvarchar](50) NULL,
	[InspectionComment] [nvarchar](100) NULL,
	[AnalysisComment] [nvarchar](100) NULL,
	[ValidReading] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RW_THICKNESS_1] PRIMARY KEY CLUSTERED 
(
	[ThicknessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SAFETY_FACTORS]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAFETY_FACTORS](
	[SafetyFactorID] [int] NOT NULL,
	[SafetyFactorName] [nvarchar](50) NOT NULL,
	[A] [float] NOT NULL,
	[B] [float] NOT NULL,
	[C] [float] NOT NULL,
	[D] [float] NOT NULL,
	[E] [float] NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_B5F38ED2_SAFETY_FACTORS_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_B5F38ED2_SAFETY_FACTORS_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_Safety_Factors] PRIMARY KEY CLUSTERED 
(
	[SafetyFactorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SITES]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SITES](
	[SiteID] [int] IDENTITY(1,1) NOT NULL,
	[SiteName] [nvarchar](100) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_529B8E6A_SITES_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_529B8E6A_SITES_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_SITES] PRIMARY KEY CLUSTERED 
(
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_204_DM_NOT_PWHT]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_204_DM_NOT_PWHT](
	[CET-Tref] [float] NULL,
	[6.4] [float] NULL,
	[12.7] [float] NULL,
	[25.4] [float] NULL,
	[38.1] [float] NULL,
	[50.8] [float] NULL,
	[63.5] [float] NULL,
	[76.2] [float] NULL,
	[88.9] [float] NULL,
	[101.6] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_205_DM_PWHT]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_205_DM_PWHT](
	[CET-Tref] [float] NULL,
	[6.4] [float] NULL,
	[12.7] [float] NULL,
	[25.4] [float] NULL,
	[38.1] [float] NULL,
	[50.8] [float] NULL,
	[63.5] [float] NULL,
	[76.2] [float] NULL,
	[88.9] [float] NULL,
	[101.6] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_45_DM_THIN]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_45_DM_THIN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumberOrder] [int] NULL,
	[LevelConfidence] [nvarchar](50) NULL,
	[PriorProbability] [float] NULL,
 CONSTRAINT [PK_TBL45_DMThinning] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_46_DM_THIN]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_46_DM_THIN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumberOrder] [int] NULL,
	[EffectivenessCode] [nvarchar](50) NULL,
	[ConditionalProbability] [float] NULL,
 CONSTRAINT [PK_TBL46DM_THIN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_47_DM_THIN_TANK]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_47_DM_THIN_TANK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Art] [float] NULL,
	[E] [float] NULL,
	[Insp] [int] NULL,
	[D] [float] NULL,
	[C] [float] NULL,
	[B] [float] NULL,
	[A] [float] NULL,
 CONSTRAINT [PK_TBL_47_DM_THIN_TANK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_54_DM_LINNING_INORGANIC]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_54_DM_LINNING_INORGANIC](
	[YearsSinceLastInspection] [int] NULL,
	[Strip lined alloy] [float] NULL,
	[Castable refractory] [float] NULL,
	[Castable refractory severe condition] [float] NULL,
	[Glass lined] [float] NULL,
	[Acid Brick] [float] NULL,
	[Fibreglass] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_55_DM_LINNING_ORGANIC]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_55_DM_LINNING_ORGANIC](
	[YearInService] [int] NULL,
	[LowQuality] [float] NULL,
	[MediumQuality] [float] NULL,
	[HighQuality] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_63_SCC_DM_PWHT]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_63_SCC_DM_PWHT](
	[SVI] [int] NULL,
	[E] [int] NULL,
	[1D] [int] NULL,
	[1C] [int] NULL,
	[1B] [int] NULL,
	[1A] [int] NULL,
	[2D] [int] NULL,
	[2C] [int] NULL,
	[2B] [int] NULL,
	[2A] [int] NULL,
	[3D] [int] NULL,
	[3C] [int] NULL,
	[3B] [int] NULL,
	[3A] [int] NULL,
	[4D] [int] NULL,
	[4C] [int] NULL,
	[4B] [int] NULL,
	[4A] [int] NULL,
	[5D] [int] NULL,
	[5C] [int] NULL,
	[5B] [int] NULL,
	[5A] [int] NULL,
	[6D] [int] NULL,
	[6C] [int] NULL,
	[6B] [int] NULL,
	[6A] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THICKNESS_READING]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THICKNESS_READING](
	[ThicknessID] [int] IDENTITY(1,1) NOT NULL,
	[PointID] [int] NOT NULL,
	[ThicknessDate] [datetime] NULL,
	[Orientation] [nvarchar](50) NULL,
	[MaxReading] [float] NULL,
	[ThicknessReading] [float] NULL,
	[CorrosionRate] [float] NULL,
	[ValidReading] [bit] NOT NULL,
	[Comment] [nvarchar](100) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_THICKNESS_READING] PRIMARY KEY CLUSTERED 
(
	[ThicknessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UNIT_DESCRIPTOR]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UNIT_DESCRIPTOR](
	[UnitDescriptorID] [int] NOT NULL,
	[UnitCode] [nvarchar](20) NOT NULL,
	[UnitDescriptor] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_C8FBE8AD_UNIT_DESCRIPTOR_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_C8FBE8AD_UNIT_DESCRIPTOR_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_UNIT_DESCRIPTOR] PRIMARY KEY CLUSTERED 
(
	[UnitCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UNITS]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UNITS](
	[UnitID] [int] NOT NULL,
	[UnitName] [nvarchar](50) NOT NULL,
	[SelectedUnit] [nvarchar](20) NOT NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_82E97375_UNITS_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_82E97375_UNITS_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_UNITS] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER_GROUPS]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_GROUPS](
	[UserGroupID] [int] IDENTITY(1,1) NOT NULL,
	[UserGroup] [nvarchar](50) NOT NULL,
	[SysGroup] [bit] NOT NULL,
	[Disabled] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_USER_GROUP] PRIMARY KEY CLUSTERED 
(
	[UserGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER_PERMISSION_LIST]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_PERMISSION_LIST](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Permission] [nvarchar](50) NOT NULL,
	[Container] [nvarchar](50) NULL,
	[Object] [nvarchar](50) NULL,
	[ObjectType] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
	[SortOrder] [decimal](5, 3) NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_PERMISSIONS] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER_PERMISSIONS]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_PERMISSIONS](
	[UserPermissionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[Permission] [nvarchar](50) NULL,
	[Allowed] [bit] NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_USER_PERMISSIONS] PRIMARY KEY CLUSTERED 
(
	[UserPermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USERS]    Script Date: 10/29/2019 10:24:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[UserID] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[JobTitle] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[UserGroupName] [nvarchar](50) NULL,
	[ADAuthentication] [bit] NOT NULL CONSTRAINT [DF_USERS_ADAuthentication]  DEFAULT ((0)),
	[SysUser] [bit] NOT NULL CONSTRAINT [DF_USERS_SysUser]  DEFAULT ((0)),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_USERS_IsActive]  DEFAULT ((0)),
	[LicenseKey] [nvarchar](100) NULL,
	[Password] [nvarchar](500) NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_7423B8AA_USERS_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_7423B8AA_USERS_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'COLBTM', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 10000, 25000, 50000, 100000, 2, 4, 5, 21, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'bda3c86c-08f4-438d-b85a-164eb9282d37')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'COLMID', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 10000, 25000, 50000, 100000, 2, 4, 5, 21, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'ecb5d7e0-b655-4be9-b3f0-e3e5ee302961')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'COLTOP', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 10000, 25000, 50000, 100000, 2, 4, 5, 21, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'5c18ade5-26ee-47ba-a572-6778d0c73863')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'COMPC', NULL, 8E-06, 2E-05, 2E-06, 0, 3E-05, 10000, 20000, 100000, 300000, 2, 3, 7, 14, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'17b77f52-9405-46fc-bb29-8486f375c47b')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'COMPR', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5000, 10000, 50000, 100000, 2, 3, 7, 14, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'f7658866-3475-4f02-ad95-493ad1f44612')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'COURSE-1', NULL, 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'4f0a6ef8-78d3-4875-9348-1872307fb3f6')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'COURSE-10', NULL, 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'df202d54-5a3a-4bb9-888a-02050bd4f4d7')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'COURSE-2', NULL, 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'ba3ec37e-f1e3-432b-86ea-78b1be5a9d19')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'COURSE-3', NULL, 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'61f6cbc1-da9c-46dc-b2a3-83ce4e801bf3')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'COURSE-4', NULL, 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'415664b6-d51f-4826-a5bb-84ab49bd083a')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'COURSE-5', NULL, 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'5ec67372-2332-4888-9b4a-a54f08a8c91e')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'COURSE-6', NULL, 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'5420d1f2-efdc-4469-bbb2-aa085aeb3cee')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'COURSE-7', NULL, 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'b383adf0-1f9b-40a4-9c63-2a596b927e6a')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'COURSE-8', NULL, 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'd2beb86e-8fd5-4b81-8991-13e1cec6869b')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'COURSE-9', NULL, 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'9981f31c-0f56-4386-808a-0ca6f8db99e4')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'DRUM', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'57d91619-87c0-4384-bac4-e104fe2a986f')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'FILTER', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2000, 4000, 10000, 0, 1, 1, 1, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'fb87ae07-db48-4348-8581-5813583dc4a2')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'FINFAN', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2000, 20000, 60000, 0, 0, 0, 0, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'aa20a333-eccc-4c63-bdb8-33be64a10308')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'HEXSS', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2000, 20000, 60000, 0, 0, 0, 0, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'f0f35f4c-0490-4ef3-b500-051a91ff3b00')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'HEXTS', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2000, 20000, 60000, 0, 0, 0, 0, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'ce20dab0-8e69-49ae-bfb9-0a0ccdab71e2')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, N'HEXTUBE', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2000, 20000, 60000, 0, 0, 0, 0, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'09db3330-1907-4c62-836a-463d59f439b7')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'KODRUM', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'c4862dad-02c1-4f27-b2cb-28fb69181b2d')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'PIPE-1', NULL, 2.8E-05, 0, 0, 2.6E-06, 3.06E-05, 5, 0, 0, 20, 0, 0, 0, 1, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'9d7d3419-43a7-41d3-9f1a-a24869079e8e')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'PIPE-10', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5, 40, 80, 240, 0, 2, 3, 4, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'c8ce5e5d-de6a-4e91-8280-7196f15b18f8')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'PIPE-12', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5, 60, 120, 360, 0, 3, 4, 4, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'892c896d-2b99-47fc-b446-03de889b6acc')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'PIPE-16', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5, 80, 160, 500, 0, 3, 4, 5, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'ae3d0f5c-0fdf-4674-9787-56ccc574fac4')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (27, N'PIPE-2', NULL, 2.8E-05, 0, 0, 2.6E-06, 3.06E-05, 5, 0, 0, 40, 0, 0, 0, 1, CAST(N'2019-06-28 16:50:34.467' AS DateTime), NULL, NULL, NULL, N'5ef6b492-be4b-45c8-8abb-f34000fd86d9')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (28, N'PIPE-4', NULL, 8E-06, 2E-05, 0, 2.6E-06, 3.06E-05, 5, 10, 0, 60, 0, 1, 0, 2, CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'd3c156af-833e-4d87-a148-2f0da4b624ad')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (29, N'PIPE-6', NULL, 8E-06, 2E-05, 0, 2.6E-06, 3.06E-05, 5, 20, 0, 120, 0, 1, 2, 3, CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'32677d26-285c-4238-ba59-278262b8a521')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (30, N'PIPE-8', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 5, 30, 60, 180, 0, 2, 3, 3, CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'f44bfc07-5e96-4ebc-b2eb-5fe1a836342e')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (31, N'PIPEGT16', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 10, 120, 240, 700, 1, 4, 5, 7, CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'c10245cb-1d22-4149-bc82-801f90c6e02a')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, N'PUMP1S', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2500, 5000, 5000, 0, 0, 0, 0, CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'b372e5f7-20eb-4f6b-88bc-7ec7f12bfbe4')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (33, N'PUMP2S', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2500, 5000, 5000, 0, 0, 0, 0, CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'7cb50a85-1d95-4b60-8ab5-079e25761430')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, N'PUMPR', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 1000, 2500, 5000, 10000, 0, 0, 0, 0, CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'61229cd6-ce50-4f11-bfee-b051a463d763')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (35, N'REACTOR', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 10000, 24000, 40000, 80000, 4, 6, 6, 14, CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'3276b14c-9d1a-463e-8bf1-ca294b49edbf')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (36, N'TANKBOTTOM', NULL, 0.00072, 0, 0, 2E-06, 0.000722, 5000, 0, 0, 120000, 5, 0, 0, 50, CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'2dbaa18e-999f-46ba-8998-005c77a2ed68')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (37, N'OTHER', NULL, 8E-06, 2E-05, 2E-06, 6E-07, 3.06E-05, 10000, 25000, 50000, 100000, 2, 4, 5, 21, CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'25e9c4c3-39ca-493b-a012-dfada410b59b')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (38, N'TANKROOFFIXED', NULL, 7E-05, 2.5E-05, 5E-06, 1E-07, 0.0001, 5000, 12000, 20000, 40000, 2, 3, 3, 7, CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'95075846-2618-497f-95d4-e1c4dee8d3c7')
INSERT [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID], [APIComponentTypeName], [AliasAPIComponentType], [GFFSmall], [GFFMedium], [GFFLarge], [GFFRupture], [GFFTotal], [HoleCostSmall], [HoleCostMedium], [HoleCostLarge], [HoleCostRupture], [OutageSmall], [OutageMedium], [OutageLarge], [OutageRupture], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (39, N'TANKROOFFLOAT', NULL, 0.00072, 0, 0, 2E-06, 0.000722, 5000, 0, 0, 120000, 5, 0, 0, 50, CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'325b6d5f-abdb-4a3e-8a5a-ebca67c580e4')
SET IDENTITY_INSERT [dbo].[COF_FLUID] ON 

INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'C1-C2', N'C1_To_C2', N'Methane, Ethane, Ethylene, LNG, Fluid Gas', 0, 23, -125, 250.512, 1, 12.3, 0.115, -2.87E-05, -1.3E-09, 0, 0, 558, 0, 1, 0, CAST(N'2019-06-28 16:50:34.447' AS DateTime), NULL, NULL, NULL, N'1e47431b-c66e-4313-bcb2-afa6fd5665be')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'C3-C4', N'C3_To_C4', N'Propane, Butane, Isobutane, LPG', 0, 51, -21, 538.379, 1, 2.632, 0.3188, -0.000135, 1.47E-08, 0, 0, 369, 0, 1, 0, CAST(N'2019-06-28 16:50:34.450' AS DateTime), NULL, NULL, NULL, N'5eb05714-a712-4ad8-b5f6-f17c3f8e9396')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'C5', N'C5', N'Pentane', 0, 72, 36, 625.199, 1, -3.626, 0.4873, -0.00026, 5.3E-08, 0, 1, 284, 0, 1, 0, CAST(N'2019-06-28 16:50:34.450' AS DateTime), NULL, NULL, NULL, N'6bdcae81-1d66-489f-a693-de6c7bdca6da')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'C6-C8', N'C6_To_C8', N'Gasoline, Naphtha, Light Straight Run, Heptane', 0, 100, 99, 684.018, 1, -5.146, 0.676, -0.000365, 7.66E-08, 0, 1, 223, 0, 1, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'3ac76b64-eb04-4898-b349-dee2e4472a86')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'C9-C12', N'C9_To_C12', N'Diesel, Kerosene', 0, 149, 184, 734.012, 1, -8.5, 1.01, -0.000556, 1.18E-07, 0, 1, 208, 0, 1, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'2d5f497e-f8fd-443d-b331-5fbe212aa5d0')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'C13-C-16', N'C13_To_C16', N'Jet Fuel, Kerosene, Atmosphere Gas Oil', 0, 205, 261, 764.527, 1, -11.7, 1.39, -0.000772, 1.67E-07, 0, 1, 202, 0, 1, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'cac6772e-cc20-4644-9081-723f656ace7f')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'C17-C25', N'C17_To_C25', N'Gas Oil, Typical Crude', 0, 280, 344, 775.019, 1, -22.4, 1.94, -0.00112, -2.53E-07, 0, 1, 202, 0, 1, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'78b19dcc-c8a5-455f-afab-2511115bcc92')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'C25+', N'C25_And_Above', N'Residium, Heavy Crude, Lube Oil, Seal Oil', 0, 422, 527, 900.026, 1, -22.4, 1.94, -0.00112, -2.53E-07, 0, 1, 202, 0, 1, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'd3643735-cc13-4c76-afcb-8739806329e8')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Water', N'Water', N'Water', 3, 18, 100, 997.947, 3, 276000, -2090, 8.125, -0.0141, 9.37E-06, 1, NULL, 0, 0, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'2b8aa6d5-2942-4522-99d7-a36709196afe')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'Steam', N'Steam', N'Steam', 3, 18, 100, 997.947, 3, 33400, 26800, 2610, 8900, 1170, 0, NULL, 0, 0, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'6d2eec7c-c3c0-43d2-a631-2e165f359c20')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'Acid', N'Acid', N'Acid', 3, 18, 100, 997.947, 3, 276000, -2090, 8.125, -0.0141, 9.37E-06, 1, NULL, 0, 0, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'4eb8bc5e-634b-4bb2-a504-2c8c68ac9104')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'Caustic', N'Caustic', N'Caustic', 3, 18, 100, 997.947, 3, 276000, -2090, 8.125, -0.0141, 9.37E-06, 1, NULL, 0, 0, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'a54f0e66-f76b-41f3-853e-dcd921d5225d')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'H2', N'H2', N'Hydrogen', 0, 2, -253, 71.01, 1, 27.1, 0.00927, -1.38E-05, 7.65E-09, 0, 0, 400, 0, 1, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'2d5b0fd8-99c2-483d-9ad9-7a946f9b9b56')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'H2S', N'H2S', N'Hydrogen Sulfide', 2, 34, -59, 993.029, 1, 31.9, 0.00144, 2.43E-05, -1.18E-08, 0, 0, 260, 0, 1, 1, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'4e9e24a0-de1f-42c2-ba52-d52e0e92cebd')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'HFAcid', N'HFAcid', N'Hydrogen Fluoride', 1, 20, 20, 967.031, 1, 29.1, 0.000661, -2.03E-06, 2.5E-09, 0, 0, 17760, 0, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'803769d6-154b-4c3e-acc8-178ca467bb95')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'CO', N'CO', N'Carbon Monoxide', 2, 28, -191, 800.92, 2, 29100, 8770, 3090, 0.00846, 1540, 0, 609, 0, 1, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'5db01dd0-bd4d-4321-ad32-da3b72a56651')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'DEE', N'DEE', N'Diethyl Ether', 0, 74, 35, 720.828, 2, 86200, 255000, 1540, 144000, -689, 1, 160, 0, 1, 0, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'77f1c193-1d71-460b-bc42-fce7a0a7efc6')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'HCL', N'HCL', N'Hydrogen Chloride', 1, 36, -85, 1185.362, 5, 0, 0, 0, 0, 0, 0, NULL, 1.41, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'97d51097-4aa7-4411-9640-27ae577222fc')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'Nitric Acid', N'NitricAcid', N'Nitric Acid', 1, 63, 121, 1521.749, 4, 0, 0, 0, 0, 0, 1, NULL, 1.5, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'017ef316-4d16-4ed6-9f97-a10f88cbb40c')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'ALCL3', N'ALCL3', N'Alumunium Chloride', 1, 133.5, 194, 2434.798, 1, 43400, 39700, 417, 24000, 0, 2, 558, 0, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'7fe89b05-0444-404b-8c1f-762122f6b28c')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, N'NO2', N'NO2', N'Nitrogen Dioxide', 1, 90, 135, 929.068, 4, 0, 0, 0, 0, 0, 1, NULL, 1.5, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'00fd99bc-ea0d-4d4e-bd27-fcb14b52a4b2')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'Phosgene', N'Phosgene', N'Phosgene', 1, 99, 83, 1377.583, 4, 0, 0, 0, 0, 0, 1, NULL, 1.5, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'b6d66c66-16e7-42b8-be2e-c08a42187994')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'TDI', N'TDI', N'Toluene Diisocyanate', 1, 174, 251, 1217.399, 4, 0, 0, 0, 0, 0, 1, 620, 1.5, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'efe28c1f-356f-4195-bfed-371cb0ef9d7f')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'Methanol', N'Methanol', N'Methanol', 0, 32, 65, 800.92, 2, 39300, 87900, 1920, 53700, 897, 1, 464, 0, 1, 0, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'715de2b5-fb61-4508-b8b0-93e97a794c1f')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'PO', N'PO', N'Propylene Oxide', 2, 58, 34, 832.957, 2, 49500, 174000, 1560, 115000, 702, 1, 449, 0, 1, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'46c44a01-3295-461f-8f2a-fa0d49f5f756')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'Aromatics', N'Aromatics', N'Benzene, Toluene, Xylene, Cuemene', 0, 104, 145, 683.986, 2, 89300, 215000, 772, 99900, 2440, 1, 490, 0, 1, 0, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'55c4b597-cd71-4fbf-bdb6-3e0189745e12')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (27, N'Styrene', N'Styrene', N'Styrene', 0, 104, 145, 683.986, 2, 89300, 215000, 772, 99900, 2440, 1, 490, 0, 1, 0, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'9ab935e7-28a8-4299-8964-ee66ca1745da')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (28, N'EEA', N'EEA', N'Ethylene Glycol Monoethyl Ether Acetate', 0, 132, 156, 977.123, 2, 106000, 240000, 659, 150000, 1970, 1, 379, 0, 1, 0, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'867101ec-4043-42a2-9e81-bfa1d3d29312')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (29, N'EE', N'EE', N'Ethylene Glycol Monoethyl Ether', 2, 90, 135, 929.068, 2, 32500, 300000, 1170, 208000, 473, 1, 235, 0, 1, 1, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'e6ba6bf5-1041-47e2-975c-a8c08136b616')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (30, N'EG', N'EG', N'Ethylene Glycol', 0, 62, 197, 1105.27, 2, 63000, 146000, 1670, 97300, 774, 1, 396, 0, 1, 0, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'7ffe273f-c948-4686-9b7e-728cd088c721')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (31, N'EO', N'EO', N'Ethylene Oxide', 2, 44, 11, 881.013, 2, 33500, 121000, 1610, 82400, 737, 0, 429, 0, 1, 1, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'2b5518ed-d3e2-4349-b60f-94b609f65089')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, N'Pyrophoric', N'Pyrophoric', N'Pyrophoric Materials', 2, 149, 184, 734.012, 1, -8.5, 1.01, -0.000556, 1.18E-07, 0, 1, 54, 0, 1, 1, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'9ee4410e-f40c-46ba-bdc7-c07e4f98fe2b')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (33, N'Ammonia', N'Ammonia', N'Ammonia', 1, 17, -33, 681.9, 6, 0, 0, 0, 0, 0, 0, 651, 1.32, 0, 1, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'696665b8-1437-4b07-a4c9-d2fd939a734d')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, N'Chlorine', N'Chlorine', N'Chlorine', 1, 71, -34, 1562.5, 7, 0, 0, 0, 0, 0, 0, NULL, 1.33, 0, 1, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'9ab35449-f76c-4f15-a1c7-a30820f92dcb')
SET IDENTITY_INSERT [dbo].[COF_FLUID] OFF
SET IDENTITY_INSERT [dbo].[COMPONENT_MASTER] ON 

INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'2', 1, 4, N'chuot', N'', 0, 1, 3, CAST(N'2019-07-30 11:31:41.430' AS DateTime), N'hai', NULL, NULL, N'14de332d-e66c-488e-9bd5-f00bca42d69c')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'12', 3, 12, N'', N'', 0, 0, 36, CAST(N'2019-08-20 21:38:04.583' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'74de2ab0-4610-4ee6-8e18-da21f51edc78')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'aas', 1, 12, N'', N'', 0, 0, 36, CAST(N'2019-08-21 15:24:22.373' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'5c2d079b-aed0-4c4e-8be6-89da4851ff65')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'1111', 3, 9, N'', N'', 0, 0, 1, CAST(N'2019-08-21 18:48:27.907' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'a18b71ad-e77e-4ce0-b62b-9366d87bca77')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'CTEST', 4, 6, N'CTEST', N'', 0, 1, 6, CAST(N'2019-08-27 10:48:01.067' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'd68d0792-9124-4661-8a91-0a453bb23ec0')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'123', 5, 12, N'123', N'', 0, 0, 6, CAST(N'2019-08-27 11:08:55.007' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'483ed94c-f95c-4735-a2e1-fb2a82cb0604')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'PIPING', 6, 3, N'', N'', 0, 0, 4, CAST(N'2019-08-29 14:35:09.487' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'74b926ce-36a1-4238-8415-308fdd56951d')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'Tank', 6, 12, N'', N'', 0, 0, 36, CAST(N'2019-09-25 11:18:05.677' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'877102f9-9099-4d90-a70c-82db064fcab9')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Tanktest', 7, 12, N'', N'', 0, 1, 36, CAST(N'2019-09-25 11:20:00.777' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'd62ff9f6-ce4b-4963-adab-f305820b4589')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'CC01', 8, 6, N'CC01', N'', 0, 0, 4, CAST(N'2019-10-17 11:59:50.580' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'0fef130a-2f15-4eef-9f5d-eb510e7dad2f')
SET IDENTITY_INSERT [dbo].[COMPONENT_MASTER] OFF
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Cylindrical Section', N'CylindricalSection', N'Cylindrical', 2, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'122149fe-d2b6-4d5c-8dad-91d5165106ac')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Elliptical Head', N'EllipticalHead', N'Head', 1.13, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'5eb45115-99e9-4568-988a-cabe0439c03c')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Torispherical Head', N'TorisphericalHead', N'Head', 1.13, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'ddaa11c2-dd61-4200-a374-ef6ae49c7e01')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'Bend / Elbow', N'Elbow', N'Cylindrical', 2, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'ec95ab16-f0b7-466d-8fc3-ac21f07ce0f5')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'Cylindrical Shell', N'CylindricalShell', N'Cylindrical', 2, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'2aea6e98-e0c6-4b76-8c56-1ead9343527e')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'Nozzle', N'Nozzle', N'Cylindrical', 2, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'32987cf3-9828-4340-988d-12b46133496a')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Spherical Shell', N'SphericalShell', N'Spherical', 4, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'1f93ff5b-c3ee-4a16-885e-12fad764fdfe')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'Hemispherical Head', N'HemisphericalHead', N'Head', 1.13, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'0da3179f-99b3-4453-8e44-440b4d699e06')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'Reducer', N'Reducer', N'Cylindrical', 2, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'7f0eb207-fe90-4822-af51-a195fb53454b')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'Tank Bottom', N'TankBottom', NULL, 0, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'51d9a21b-92e3-4373-aa3d-2ac0dca572bd')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'Shell', N'Shell', NULL, 0, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'317a9484-4aaf-4ec8-984a-71bcd2a9375a')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'Fixed Roof', N'TANKROOFFIXED', NULL, 0, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'6bf02f86-1f34-4f9f-8b49-620695784a15')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'Floating Roof', N'TANKROOFFLOAT', NULL, 0, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'e984c0b5-ecaf-465a-998c-c25dd3c96e9b')
INSERT [dbo].[COMPONENT_TYPE] ([ComponentTypeID], [ComponentTypeName], [ComponentTypeCode], [Shape], [ShapeFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'Pressure Relief Device', N'PressureReliefDevice', NULL, 0, CAST(N'2019-06-28 16:50:34.463' AS DateTime), NULL, NULL, NULL, N'a4eb3d25-b96a-44ac-b1b6-ec582f740fe9')
SET IDENTITY_INSERT [dbo].[DESIGN_CODE] ON 

INSERT [dbo].[DESIGN_CODE] ([DesignCodeID], [DesignCode], [DesignCodeApp], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'CONGTYCUAhAI', N'', CAST(N'2019-07-30 11:29:58.650' AS DateTime), NULL, NULL, NULL, N'14448dc7-2c37-45ed-a11a-e2a4a4aa2542')
INSERT [dbo].[DESIGN_CODE] ([DesignCodeID], [DesignCode], [DesignCodeApp], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'TEST', N'', CAST(N'2019-08-27 10:41:59.253' AS DateTime), NULL, NULL, NULL, N'f7c64540-f4af-4f8b-9306-7c1290cdad6d')
INSERT [dbo].[DESIGN_CODE] ([DesignCodeID], [DesignCode], [DesignCodeApp], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Design Code', N'', CAST(N'2019-10-17 11:59:41.320' AS DateTime), NULL, CAST(N'2019-10-23 13:40:40.000' AS DateTime), NULL, N'791afe22-6426-4aba-85e5-4b1a3e6dcbe5')
INSERT [dbo].[DESIGN_CODE] ([DesignCodeID], [DesignCode], [DesignCodeApp], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'tt', N'', CAST(N'2019-10-29 10:03:59.520' AS DateTime), NULL, NULL, NULL, N'5ec62842-833a-44b1-8ce0-c92296f6b0c0')
SET IDENTITY_INSERT [dbo].[DESIGN_CODE] OFF
INSERT [dbo].[DM_CATEGORY] ([DMCategoryID], [DMCategoryName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'1. Mechanical and Metallurgical Mechanisms', CAST(N'2019-06-28 16:50:34.447' AS DateTime), NULL, NULL, NULL, N'b0b5092a-495c-4b3e-a09e-556a7637115e')
INSERT [dbo].[DM_CATEGORY] ([DMCategoryID], [DMCategoryName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'2. Uniform or Localized Metal Loss', CAST(N'2019-06-28 16:50:34.447' AS DateTime), NULL, NULL, NULL, N'747d19cb-b927-4ec8-bea9-ee34e2ba4092')
INSERT [dbo].[DM_CATEGORY] ([DMCategoryID], [DMCategoryName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'3. High Temperature Corrosion', CAST(N'2019-06-28 16:50:34.447' AS DateTime), NULL, NULL, NULL, N'f23fcf65-e96a-472c-8944-2f88248a4722')
INSERT [dbo].[DM_CATEGORY] ([DMCategoryID], [DMCategoryName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'4. Environmental-Assisted Mechanisms', CAST(N'2019-06-28 16:50:34.447' AS DateTime), NULL, NULL, NULL, N'd2200f2e-6111-4d99-b7e7-d8e8387e3724')
INSERT [dbo].[DM_CATEGORY] ([DMCategoryID], [DMCategoryName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'5. Others', CAST(N'2019-06-28 16:50:34.447' AS DateTime), NULL, NULL, NULL, N'e849f877-a09b-4028-8ed5-dfa0155f5305')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'885F Embrittlement', 1, 1, N'dm885F', 1, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.503' AS DateTime), NULL, NULL, NULL, N'dcf4e819-5530-4ea2-b79e-9338ff34fcd2')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Brittle Fracture', 2, 1, N'dmBrittleFracture', 1, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.503' AS DateTime), NULL, NULL, NULL, N'43d50724-524c-43f8-ab51-2c8212f02682')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Cavitation', 3, 1, N'dmCavitation', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.503' AS DateTime), NULL, NULL, NULL, N'566cae87-5972-4b50-98f3-8bc0e9c5f0f0')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Creep Rupture', 4, 1, N'dmCreepRupture', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.503' AS DateTime), NULL, NULL, NULL, N'b207ba23-ab51-488d-88c2-a8fcdb46d352')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'Dissimilar Metal Weld Cracking', 5, 1, N'dmDissimilarMetalWeldCracking', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.503' AS DateTime), NULL, NULL, NULL, N'538eddd0-add9-40a9-8c40-6abe065a4935')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'Erosion/Erosion-Corrosion', 6, 1, N'dmErosionCorrosion', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.503' AS DateTime), NULL, NULL, NULL, N'691fb94b-4623-4cd1-9575-189df1160ebd')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'Graphitisation', 7, 1, N'dmGraphitisation', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.503' AS DateTime), NULL, NULL, NULL, N'3b2ecb47-1622-48db-8ec4-57d416f20a25')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'Internal Thinning', 1, 2, N'dmInternalThinning', 1, 1, N'Mixed', CAST(N'2019-06-28 16:50:34.503' AS DateTime), NULL, NULL, NULL, N'bc88bc72-15a4-4213-a6c2-a177e7ca02b1')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Internal Lining Degradation', 2, 2, N'dmInternalLiningDegradation', 1, 1, N'Mixed', CAST(N'2019-06-28 16:50:34.503' AS DateTime), NULL, NULL, NULL, N'1b8ecfed-eb09-4d07-8aea-ec78505308f6')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'Vibration-Induced Mechanical Fatigue', 10, 1, N'dmPipingMechanicalFatigue', 1, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'dd3ee2c2-0920-4e92-80e5-b28b54e1725a')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'Refractory Degradation', 11, 1, N'dmRefractoryDegradation', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'f8050141-29bd-4759-a52a-fc48f2399a5a')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'Reheat Cracking', 12, 1, N'dmReheatCracking', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'1434fd09-7a21-4ae8-88ef-16c83139d88d')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'Short Term Overheating', 13, 1, N'dmShortTermOverheating', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'bd32c35a-1b47-4c80-8db3-f59d054b1457')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'Sigma Phase Embrittlement', 14, 1, N'dmSigmaPhaseEmbrittlement', 1, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'a3110207-ebcf-4d64-9cf9-ab2cc249b790')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'Spheroidisation (Softening)', 15, 1, N'dmSpheroidisation', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'4a0ce7a5-514d-44db-a2a9-8f19fc3f2ed7')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'Steam Blanketing', 16, 1, N'dmSteamBlanketing', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'e48ae7da-ceb9-45af-b3a2-bc2966007eac')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'Strain Aging', 17, 1, N'dmStrainAging', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'9e738b0f-d99e-42db-ad1d-04ebbbcd95cd')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'Temper Embrittlement', 18, 1, N'dmTemperEmbrittlement', 1, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'c4ce369c-aa7c-4dcc-b569-778ce68c362a')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'Thermal Fatigue', 19, 1, N'dmThermalFatigue', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'6f63f9e0-a97f-4edd-9653-6f5f2b93de16')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'Thermal Shock', 20, 1, N'dmThermalShock', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'1537cb9b-b28f-4e43-810e-728ad38b7573')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'Other Mechanical or Metallurgical', 22, 1, N'dmMechanicalMetallurgical', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'961906d8-2df6-4803-98d4-a04bafdbaffb')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'Amine Corrosion', 23, 2, N'dmAmineCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'fa212bfc-0eae-4096-860a-4fcf50af912b')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'Ammonium Bisulphide Corrosion', 24, 2, N'dmAmmoniumBisulphideCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'b6d612ca-d9d8-47bb-b1b6-98bab566bf3b')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'Ammonium Chloride Corrosion', 25, 2, N'dmAmmoniumChlorideCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.507' AS DateTime), NULL, NULL, NULL, N'0fe24b83-112d-403b-ae07-f9aceebbdde2')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'Atmospheric Corrosion', 26, 2, N'dmAtmosphericCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'37f42ec9-509c-447b-bb9f-6466abc3af36')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (27, N'Boiler Water Condensate Corrosion', 27, 2, N'dmBoilerWaterCondensateCorrosion', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'5cd3d5de-a9e3-4e21-b1d7-984dc4c2f99a')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (28, N'Caustic Corrosion', 28, 2, N'dmCausticCorrosion', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'6ffdf0b7-8bef-468f-91f8-661dc39654da')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (29, N'Chloride Stress Corrosion Under Insulation', 29, 2, N'dmChlorideStressCorrosionUnderInsulation', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'376caca8-7126-4c73-93ba-5b99389db1fa')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (30, N'CO2 Corrosion', 30, 2, N'dmCO2Corrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'e895e220-e1de-49c4-95ee-09c5d3eeeb01')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (31, N'Cooling Water Corrosion', 31, 2, N'dmCoolingWaterCorrosion', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'2ec9fd5a-f814-4bb7-8e51-6d7c0b2f7585')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, N'Corrosion Under Insulation', 32, 2, N'dmCorrosionUnderInsulation', 1, 1, N'Leakage', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'a337c0e2-251e-4288-beaa-20c79318312c')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (33, N'Dealloying', 33, 2, N'dmDealloying', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'093f0178-d172-41df-9e23-31f03786f8c2')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, N'External Corrosion', 34, 2, N'dmExternalDamageFerriticComponent', 1, 1, N'Mixed', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'4b125d54-5fbf-4bfc-8a3a-ef3f3babcf3b')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (35, N'Flue Gas Dew Point Corrosion', 35, 2, N'dmFlueGasDewPointCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'4309dab8-f793-4c05-a3f6-6f1a082d3b01')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (36, N'Galvanic Corrosion', 36, 2, N'dmGalvanicCorrosion', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'9045446c-bec5-474b-855e-b43660210577')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (37, N'Graphite Corrosion', 37, 2, N'dmGraphiteCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'838521c7-1a78-4e36-b323-5e289e2548f7')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (38, N'High Temperature H2/H2S Corrosion', 38, 2, N'dmHighTemperatureH2_H2SCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'9e6fa8d7-fd99-4cf5-bcd3-c7b3724b0915')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (39, N'Hydrochloric Acid Corrosion', 39, 2, N'dmHydrochloricAcidCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'b9f21a35-b492-4b70-a047-55a9b82ff573')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (40, N'Hydrofluoric Acid Corrosion', 40, 2, N'dmHydrofluoricAcidCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'c8b96eb1-f6b9-411a-8570-9ed66d9db554')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (41, N'Microbiologically-Induced Corrosion', 41, 2, N'dmMicrobiologicallyInducedCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'f87d2ebb-89d4-4eb8-ac33-ef522d11c546')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (42, N'Naphthenic Acid Corrosion', 42, 2, N'dmNaphthenicAcidCorrosion', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'91437b5a-ca86-48b7-ab83-da1d9da7f375')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (43, N'Phenol (Carbonic Acid) Corrosion', 43, 2, N'dmPhenolCarbonicAcidCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'0cdae3c2-2356-4ac8-9373-4221caf6d57c')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (44, N'Soil Corrosion', 44, 2, N'dmSoilCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'34a24e23-a6b6-443f-bcb0-fe96e04fa7da')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (45, N'Sour Water Corrosion', 45, 2, N'dmSourWaterCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.510' AS DateTime), NULL, NULL, NULL, N'932b7548-25da-4fdc-a036-0c4613a40fe7')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (46, N'Sulphuric Acid Corrosion', 46, 2, N'dmSulphuricAcidCorrosion', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'8cdd46b3-017e-42fb-9383-31519e6cc48b')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (47, N'Titanium Hydriding', 47, 2, N'dmTitaniumHydriding', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'b8ab9f6a-78d2-4a1b-9c0b-c2381263b023')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (48, N'Other, Metal Loss', 48, 2, N'dmOtherMetalLoss', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'11a65d7d-e92c-4486-bf1a-3a024bbf3c80')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (49, N'Carburisation', 49, 3, N'dmCarburisation', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'de928dd4-140a-43f3-93f6-2dd8eaffa213')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (50, N'Decarburisation', 50, 3, N'dmDecarburisation', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'4d20fc0f-9ef4-4fd0-a495-51162aed8f0b')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (51, N'Fuel Ash Corrosion', 51, 3, N'dmFuelAshCorrosion', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'8c6c1f7f-7754-410e-b29c-14be9695a352')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (52, N'Metal Dusting', 52, 3, N'dmMetalDusting', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'39c3ef1e-1f68-4fcf-8a72-4af5a1175901')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (53, N'Nitriding', 53, 3, N'dmNitriding', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'86ca707d-c5fc-499e-9df3-3ff1585988ed')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (54, N'Oxidation', 54, 3, N'dmOxidation', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'7f890af2-9f98-4a94-abac-e25c672e7ee9')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (55, N'Sulphidation', 55, 3, N'dmSulphidation', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'0a1c400d-4fed-4841-8dd6-5c43c81cdc73')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (56, N'Other High Temperature Corrosion', 56, 3, N'dmOtherHighTemperatureCorrosion', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'f24ebbdb-8b07-4d68-974d-bde7976214e5')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, N'Amine Stress Corrosion Cracking', 57, 4, N'dmAmineStressCorrosionCracking', 1, 1, N'Leakage', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'ee6fa3ee-5fc9-435f-af88-50d9bf42976d')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (58, N'Ammonia Stress Corrosion Cracking', 58, 4, N'dmAmmoniaStressCorrosionCracking', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'c1e04c80-a64f-4dda-87fe-9e387f0bc225')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (59, N'Blistering', 59, 4, N'dmBlistering', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'dc89750c-33c3-4186-a555-df635074122d')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, N'Carbonate Stress Corrosion Cracking', 60, 4, N'dmCarbonateStressCorrosionCracking', 1, 1, N'Leakage', CAST(N'2019-06-28 16:50:34.513' AS DateTime), NULL, NULL, NULL, N'2841a825-2bb0-41be-b5ff-6b14eccb95d4')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, N'Caustic Stress Corrosion Cracking', 61, 4, N'dmCausticStressCorrosionCracking', 1, 1, N'Leakage', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'9a424f86-dc93-4cf2-b945-1bcd035b1f0e')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, N'Chloride Stress Corrosion Cracking', 62, 4, N'dmChlorideStressCorrosionCracking', 1, 1, N'Leakage', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'0a9bf03a-f699-49e7-8e8f-be3081fa68e6')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, N'Chloride Stress Corrosion Cracking Under Insulation', 63, 4, N'dmChlorideStressCorrosionCrackingUnderInsulation', 1, 1, N'Leakage', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'd56ce4ea-04d4-4c34-9197-38b90b8e8ee1')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (64, N'Corrosion Fatigue', 64, 4, N'dmCorrosionFatigue', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'ea1d4189-785c-4458-ad73-df626f33b990')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (65, N'Deaerator Cracking', 65, 4, N'dmDeaeratorCracking', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'fcca9a00-9984-44bb-8ba4-6985777e2938')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, N'External Chloride Stress Corrosion Cracking', 66, 4, N'dmExternalChlorideStressCorrosionCracking', 1, 1, N'Leakage', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'3b7003a8-e6c4-4fbb-a27e-2beddff7f406')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, N'HF Produced HIC/SOHIC', 67, 4, N'dmHFProducedHIC_SOHIC', 1, 1, N'Leakage', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'9733cd6c-eb39-4de7-a223-59287dd7e311')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (68, N'High Temperature Hydrogen Attack', 68, 4, N'dmHighTemperatureHydrogenAttack', 1, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'2d255c67-1d7e-43f7-9f77-56d4bf072e96')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, N'HIC/SOHIC-H2S', 70, 4, N'dmHIC_SOHIC_H2S', 1, 1, N'Rupture', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'ced05fa7-1fff-48b8-b78a-9ee386494d2b')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, N'Hydrogen Stress Cracking (HF)', 71, 4, N'dmHydrogenStressCrackingHSCHF', 1, 1, N'Rupture', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'd6f48f9f-b25b-45ad-9fe9-f59a355ca6e1')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (71, N'Liquid Metal Embrittlement', 72, 4, N'dmLiquidMetalEmbrittlement', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'7c4d69cf-396b-485a-89f9-fc44dc90b7c0')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, N'Polythionic Acid Stress Corrosion Cracking', 73, 4, N'dmPolythionicAcidStressCorrosionCracking', 1, 1, N'Leakage', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'3f69a1dc-5517-4c8a-9afc-db00ff2ad18e')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, N'Sulphide Stress Corrosion Cracking (H2S)', 74, 4, N'dmSulphideStressCorrosionCrackingH2S', 1, 1, N'Rupture', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'df855a0e-ddcd-4cb4-8816-e63e85728335')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (74, N'Other Environment-Assisted', 75, 4, N'dmOtherEnvironmentAssisted', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'c71ec5bb-22a6-4e86-a031-44d136355808')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (75, N'Aluminium Chloride (General + Localised Corrosion)', 76, 5, N'dmAluminiumChloride', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.517' AS DateTime), NULL, NULL, NULL, N'ecc3b805-b653-436f-8d94-61904709d981')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (76, N'Ammonia (General + Localised Corrosion)', 77, 5, N'dmAmmonia', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'2e6fb361-c513-48d6-b1d9-999ea0f426f4')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (77, N'Cladding Disbondment', 78, 5, N'dmCladdingDisbondment', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'0ced5b13-6597-493d-b3a8-1010eba9b215')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (78, N'Cyanides (General + Localised Corrosion)', 79, 5, N'dmCyanides', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'111f1b4c-6b8a-4aa2-a61e-3dc4e1f65238')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (79, N'Formic Acid (General + Localised Corrosion)', 80, 5, N'dmFormicAcid', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'7439bbab-8fd7-4574-813e-453742f4bd72')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (80, N'Hydrogen Sulphide (General + Localised Corrosion)', 81, 5, N'dmHydrogenSulphide', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'36f71f33-58e4-409b-93f0-7a4c741f9e8d')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (81, N'Localised Corrosion of Stainless Steel', 82, 5, N'dmLocalisedCorrosionStainlessSteel', 0, 0, N'Leakage', CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'76001642-c945-4c0f-9f4b-a9f3b1ed58ff')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (82, N'Oxygen (General + Localised Corrosion)', 83, 5, N'dmOxygen', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'ea327e86-cfd5-415f-bb63-2967ba74302a')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (83, N'Polythionic Acid (General + Localised Corrosion)', 84, 5, N'dmPolythionicAcid', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'a9d3ca27-b605-4001-bd98-1a02c6117206')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (84, N'Under Deposit Attack (Metal Thinning)', 85, 5, N'dmUnderDepositAttackMetalThinning', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'dec55539-c019-4cb8-9829-eb4f5e4d649e')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (85, N'Water (General + Localised Corrosion)', 86, 5, N'dmWater', 0, 0, N'Mixed', CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'aa726148-009e-4a13-92af-3583afde87d8')
INSERT [dbo].[DM_ITEMS] ([DMItemID], [DMDescription], [DMSeq], [DMCategoryID], [DMCode], [HasDF], [HasRule], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (86, N'Hydrogen Embrittlement', 69, 3, N'dmHydrogenEmbrittlement', 0, 0, N'Rupture', CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'18bcfe1b-29c6-4999-bc78-663b29087eeb')
SET IDENTITY_INSERT [dbo].[EQUIPMENT_MASTER] ON 

INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'3434', 3, N'maytinh', CAST(N'2019-07-28 00:00:00.000' AS DateTime), 1, 1, 1, 1, N'', N'', N'', 1, CAST(N'2019-07-30 11:31:18.000' AS DateTime), N'', CAST(N'2019-07-30 11:31:18.850' AS DateTime), NULL, NULL, NULL, N'677b28ac-1254-4597-a059-fd90435f4c78')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'sf', 6, N's', CAST(N'2019-07-30 00:00:00.000' AS DateTime), 1, 1, 1, 1, N'', N'', N'', 1, CAST(N'2019-08-01 10:13:56.000' AS DateTime), N'', CAST(N'2019-08-01 10:13:56.260' AS DateTime), NULL, NULL, NULL, N'9cc6eb39-f5d1-41fd-b7ae-2f87e5728f27')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'12212', 3, N'', CAST(N'2019-08-07 00:00:00.000' AS DateTime), 1, 1, 1, 1, N'', N'', N'', 1, CAST(N'2019-08-20 21:37:43.000' AS DateTime), N'', CAST(N'2019-08-20 21:37:43.753' AS DateTime), NULL, NULL, NULL, N'489544e6-1f4a-4d6f-9b7f-68ac37aa7329')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'997', 14, N'EQTEST', CAST(N'2019-08-27 00:00:00.000' AS DateTime), 2, 2, 2, 2, N'', N'', N'', 1, CAST(N'2019-08-27 10:43:30.000' AS DateTime), N'', CAST(N'2019-08-27 10:43:30.550' AS DateTime), NULL, NULL, NULL, N'209342e3-8695-4655-9671-5f8643163442')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'TEST2', 11, N'123', CAST(N'2019-05-14 00:00:00.000' AS DateTime), 2, 2, 2, 2, N'', N'', N'', 1, CAST(N'2019-08-27 11:08:10.000' AS DateTime), N'', CAST(N'2019-08-27 11:08:10.563' AS DateTime), NULL, NULL, NULL, N'd9c07e87-8814-41db-a214-b0293892a93f')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'PIPING', 7, N'PIPING', CAST(N'2019-12-29 00:00:00.000' AS DateTime), 1, 2, 2, 1, N'', N'', N'', 1, CAST(N'2019-08-29 14:34:39.000' AS DateTime), N'', CAST(N'2019-08-29 14:34:39.747' AS DateTime), NULL, NULL, NULL, N'c6fbad66-a46b-4faf-9a00-948163a0f6ef')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'TAnk', 11, N'', CAST(N'2019-09-04 00:00:00.000' AS DateTime), 1, 2, 3, 2, N'', N'', N'', 1, CAST(N'2019-09-25 11:19:26.000' AS DateTime), N'', CAST(N'2019-09-25 11:19:26.683' AS DateTime), NULL, NULL, NULL, N'683046c5-addf-4be8-a450-072a0ea4ee6d')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'EE01', 8, N'EE01', CAST(N'2019-10-13 00:00:00.000' AS DateTime), 3, 3, 4, 3, N'', N'', N'', 1, CAST(N'2019-10-23 13:40:40.000' AS DateTime), N'', CAST(N'2019-10-17 11:59:45.150' AS DateTime), NULL, NULL, NULL, N'4a7f4f00-0a35-466e-bc81-bcbf38389c96')
SET IDENTITY_INSERT [dbo].[EQUIPMENT_MASTER] OFF
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'ACCUM', N'Accumulator', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'cf98ab00-3c42-4c31-9879-fb4207585501')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'AIRCO', N'Air Cooler', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'bba5e2dc-6a09-4e04-b1ba-c2c6b17af1cf')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'COLUM', N'Column', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'0c8c1735-c8b7-4b42-9fb5-44d87ce35ad6')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'VEVES', N'Vertical Vessel', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'b663409a-6a57-4293-a363-050db49e2db0')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'SPVES', N'Spherical Vessel', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'f5140988-9418-4c69-9eb5-0c2160654f4a')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'FIHEA', N'Fired Heater', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'd78451e8-e183-4ef0-83ab-5114d20500c3')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'PIPIN', N'Piping', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'c137f04b-52cb-4d03-a6c8-d76245c93573')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'PUMP', N'Pump', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'b73615f7-2fee-41e2-9a14-9da65ee8a54a')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'PLEXC', N'Plate Exchanger', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'29625d53-eac0-4588-a6e6-87bf4321ba59')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'STEXC', N'Shell and Tube Exchanger', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'1135aff9-72e4-4661-8e87-edee9044701f')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'TANK', N'Tank', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'd6cf1d3a-f165-4e63-8de3-588e53f6ad7d')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'HOVES', N'Horizontal Vessel', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'0b4d4a3e-2f52-412a-ae7b-d265d13e9d09')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'REVAL', N'Relief Valve', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'cfda8e32-5940-4e14-911f-a5e1b3e5369f')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'TOWER', N'Tower', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'37bda42f-1c3f-45b4-9bde-c520b6685c0a')
INSERT [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID], [EquipmentTypeCode], [EquipmentTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'FILTE', N'Filter', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'fc3c450a-dc4d-4462-9c73-b27d4f278e24')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'ObjectField001', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'b88116fa-1190-4b0d-815e-ee16c22928e3')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'ObjectField002', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'703ca29c-f8e8-4912-a972-b815bd5aa52f')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'ObjectField003', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'f53f544d-d0aa-496c-9a95-0ca3c5a334d0')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'ObjectField004', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'b4296595-f49b-4ff1-9ff6-0dfbcd4f0874')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'ObjectField005', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'4b1da771-9828-4089-8d33-4b78dd85ec4b')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'ObjectField006', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'8fcb6b2b-05d2-4cc9-903a-fc878427c7fb')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'ObjectField007', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'f9f6a95f-a8ee-47c3-b189-f74350857abc')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'ObjectField008', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'88453fbc-d7f2-4ed0-a202-872d21a03f09')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'ObjectField009', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'18986e87-6c95-4051-b05b-0668f747bfbc')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'ObjectField010', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'1e2ba5cc-eb37-420c-af51-b20fe211185f')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'ObjectField011', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'cc4006a8-68e7-4b3b-bc6d-35dc68a81973')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'ObjectField012', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'b3390aac-1777-42f8-977f-207c3bd67276')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'ObjectField013', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'8d33bab3-df63-41e2-87dc-23b4a58735de')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'ObjectField014', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'f9cee7a5-8ace-4ed8-817f-360a3440ec58')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'ObjectField015', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'7f2ed476-c184-4dda-a396-bcebbe310d06')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'ObjectField016', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'9ae718a6-7bd8-4df7-ba8c-adb0c91290a8')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'ObjectField017', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'e5fc0487-9298-49a1-8181-63e839972e76')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'ObjectField018', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'919c2ab0-3b24-4a5d-a3f5-3a0ef987ad62')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'ObjectField019', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'f0b8b96d-37a8-48a7-a3da-a45aa78fc2ed')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'ObjectField020', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'b0e397ad-41c5-43a5-a0f1-565705226eb4')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, N'ObjectField021', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'1289be15-3ba6-4f35-b5f0-a673e6eeca49')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'ObjectField022', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'ff1e1d91-ba7d-4c60-86fc-4adc92bf24a8')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'ObjectField023', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'307d4068-19e9-4a64-b8d8-fc9c08834a98')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'ObjectField024', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'7985f69b-8345-4ea5-a7c6-58c38421d871')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'ObjectField025', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'1008a357-f2e1-4f02-ad90-6dca671fe57e')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'ObjectField026', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.600' AS DateTime), NULL, NULL, NULL, N'503f520e-da6d-4ad1-adcc-e887a25b39a4')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (27, N'ObjectField027', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'ae904a81-f3cb-411d-9376-e0de99c24f8d')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (28, N'ObjectField028', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'5a94964e-c6a2-43c9-803a-4857db221b9f')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (29, N'ObjectField029', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'f57613fe-4c42-44b2-a482-0a0d7538b1c9')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (30, N'ObjectField030', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'ad22299d-09d5-45fc-8f5d-02320319aee3')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (31, N'ObjectField031', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'd75760bf-3b7d-428c-b38e-54b2c03bf99a')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, N'ObjectField032', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'876d9114-6ca9-4105-a21c-bc2cc65a73a8')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (33, N'ObjectField033', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'f4a375bf-d29c-4cc0-ba14-5cb9a10f617b')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, N'ObjectField034', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'd6d61827-c4f6-4737-9e4f-229f3015c831')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (35, N'ObjectField035', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'd747fd9b-1368-45c1-8a2d-6767b689a7d1')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (36, N'ObjectField036', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'8d84efe3-bd56-4df4-9dc6-0edde5944714')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (37, N'ObjectField037', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'55f6b6e6-b947-4fbc-aacf-3332c0668bda')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (38, N'ObjectField038', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'68950e51-5fd4-41d2-825e-303c5b47de9b')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (39, N'ObjectField039', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'374d609d-0fbd-4dea-930e-1bc2c69e86b6')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (40, N'ObjectField040', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'3bd5cb1b-2ffa-4748-ad1e-8085ef549b07')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (41, N'ObjectField041', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'62ecb320-33fb-49a9-8273-3872d63be268')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (42, N'ObjectField042', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'fb0d6591-b000-474f-ad7b-91f90b1c07d0')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (43, N'ObjectField043', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.603' AS DateTime), NULL, NULL, NULL, N'36f86b8e-513d-487d-807e-4a39c2edd79a')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (44, N'ObjectField044', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.607' AS DateTime), NULL, NULL, NULL, N'c754b8dd-391b-4d9e-a899-f832304bbe07')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (45, N'ObjectField045', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.607' AS DateTime), NULL, NULL, NULL, N'2fe152f6-8f50-4376-a0dc-bc6790331206')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (46, N'ObjectField046', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.607' AS DateTime), NULL, NULL, NULL, N'a08092f5-951a-4b41-b0a3-a4a6ab6f2724')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (47, N'ObjectField047', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.607' AS DateTime), NULL, NULL, NULL, N'd22b97e0-e93b-4b03-ad63-9926c220864d')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (48, N'ObjectField048', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.607' AS DateTime), NULL, NULL, NULL, N'96afcede-8ac9-4412-ac39-289d653205b5')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (49, N'ObjectField049', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.607' AS DateTime), NULL, NULL, NULL, N'37508bc4-b51f-45bd-839a-ef6302233015')
INSERT [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (50, N'ObjectField050', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.607' AS DateTime), NULL, NULL, NULL, N'e274e6d4-7d43-4978-9948-b370d2d097b0')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'ObjectField001', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'9fe90229-e9a5-47df-83a9-4833135a12cf')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'ObjectField002', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'd72e011b-0df5-454e-8af4-424bf9456b13')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'ObjectField003', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'3988b4d3-7f53-4a66-968f-29366cb78f46')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'ObjectField004', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'f83a31af-4cf1-4420-b733-8c90cc56d851')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'ObjectField005', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'04c21626-951c-43ee-ba4b-643dd69895c7')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'ObjectField006', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'0d988bde-6b90-4bde-a169-49997788f70a')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'ObjectField007', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'9c011078-4c5f-4c92-90fd-795445c8f7c2')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'ObjectField008', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'6e784d86-0d28-4353-b957-568122083981')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'ObjectField009', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'cb4290b2-f984-49a6-8d7f-79a6c887e3dc')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'ObjectField010', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'5b42b0b3-1c0b-46f9-b498-14150360875d')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'ObjectField011', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'77f25cf0-6d76-41ca-98fd-44d2da09b65f')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'ObjectField012', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'8b8fd0ae-92fd-465e-a946-43a40bf5b3a6')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'ObjectField013', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'01dedf7f-dbdb-4513-a419-99c5c109bd3c')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'ObjectField014', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'8db0903d-7252-4f8d-a9c4-17fde071c0cb')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'ObjectField015', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'6bd3c8c7-a07a-4490-b828-deadeea25eee')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'ObjectField016', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'6a933f6b-a184-49e1-b04b-5ecf2b5d57c3')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'ObjectField017', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'eb7156c4-1916-4a6f-92ef-14779e64107e')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'ObjectField018', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'ce0d2108-7c1a-4586-9949-6a90ed3c7e20')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'ObjectField019', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'92c3a34a-a429-4adb-9ec1-a4e8a4a40109')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'ObjectField020', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'a0b74261-4bcc-4dca-aa56-c8cb2ba6d401')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, N'ObjectField021', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.590' AS DateTime), NULL, NULL, NULL, N'1cb59d89-836c-4982-a287-ffff838bc2d1')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'ObjectField022', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'df6a10c7-39d2-41b7-aebc-123e4613e7d8')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'ObjectField023', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'ed835f63-df39-493a-9d02-5f69401c6a32')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'ObjectField024', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'75a4fa0c-6f83-4e73-a80f-ccbe01a17cd9')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'ObjectField025', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'9671c635-7493-460f-b8e4-3e4747f134bc')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'ObjectField026', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'504f70d1-7182-4cf2-85ce-3c9a099f20dd')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (27, N'ObjectField027', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'4abb4cad-bfbb-4cfb-ac02-cea166c31a79')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (28, N'ObjectField028', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'b4560daa-3cc6-4b8d-a745-0430fe0b0792')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (29, N'ObjectField029', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'0624e082-22f2-4810-96c4-9b1d965117d4')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (30, N'ObjectField030', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'10cbeaa4-0c49-4b39-ac7a-8d7a06728ba7')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (31, N'ObjectField031', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'b8ce946e-4649-4043-a2b2-7e760891d05d')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, N'ObjectField032', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'54bba4cc-494e-4819-bf93-4e813ca63917')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (33, N'ObjectField033', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'b8fc4b95-90ed-46cb-8958-4f1eea934188')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, N'ObjectField034', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'81ebd858-401e-4715-a9f6-225c12c832fa')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (35, N'ObjectField035', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'e15f04b5-f222-4d64-9101-a5b6e1a3212b')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (36, N'ObjectField036', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'aef20553-3160-48c8-9a6e-7a9ae14c1424')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (37, N'ObjectField037', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'0611ec53-d86a-4314-9de3-f173ecf79b07')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (38, N'ObjectField038', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.593' AS DateTime), NULL, NULL, NULL, N'c0ba597e-5129-4743-b92d-40d022493d35')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (39, N'ObjectField039', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'08c65aaa-ed65-4af0-8cbe-cf27bf43d615')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (40, N'ObjectField040', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'23b9a9bf-b38b-47ab-8906-41fa3ba65ca1')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (41, N'ObjectField041', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'e110ae0f-90ee-4aba-ad90-dbdb8ebd7832')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (42, N'ObjectField042', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'f46ba556-c3fb-43e6-939b-748e01c12f4c')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (43, N'ObjectField043', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'734ad6f3-b4da-4410-89e9-49040a611bb9')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (44, N'ObjectField044', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'dde8c889-7171-46ab-b3e5-6c3ccf65ebd6')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (45, N'ObjectField045', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'0f943b1d-437a-4290-afae-4abd5831bb4a')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (46, N'ObjectField046', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'189e1c1c-a16d-4f23-b1ea-7bafc572408e')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (47, N'ObjectField047', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'07690785-0eea-488e-8021-dc0a9ac33d9f')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (48, N'ObjectField048', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'f5c128cc-84c4-4678-8f96-f5fe63e17e75')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (49, N'ObjectField049', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'78479e48-ea1b-4577-a36f-237fc4898b5f')
INSERT [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID], [FieldID], [FieldName], [FieldDescription], [SeqNo], [FieldType], [FieldSize], [IsActive], [IsCreated], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (50, N'ObjectField050', NULL, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2019-06-28 16:50:34.597' AS DateTime), NULL, NULL, NULL, N'f6228372-ff62-4adf-acb5-4b937699400b')
SET IDENTITY_INSERT [dbo].[FACILITY] ON 

INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 1, N'hAIPROVIP123', 0.16, CAST(N'2019-07-30 11:29:31.293' AS DateTime), NULL, NULL, NULL, N'43653233-8676-471e-a8a1-f68d8bd641f2')
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, 2, N'FTEST', 0.1, CAST(N'2019-08-27 10:40:00.160' AS DateTime), NULL, NULL, NULL, N'38e9df5c-d5ef-473d-8631-72ef85b08bac')
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 2, N'TESTTANK', 0.1, CAST(N'2019-09-25 11:19:04.607' AS DateTime), NULL, NULL, NULL, N'f158d9e5-d7db-4deb-a897-c6f6d110a447')
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 3, N'FF01', 0.1, CAST(N'2019-10-17 11:59:33.140' AS DateTime), NULL, NULL, NULL, N'ca688a07-061e-40c0-811e-dfa22638e5d6')
SET IDENTITY_INSERT [dbo].[FACILITY] OFF
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 1, 1, 1, 1, 1, 123, 1234, CAST(N'2019-07-30 11:29:31.337' AS DateTime), NULL, NULL, NULL, N'd3f47e0c-ea42-4aa3-b6fc-7e328b212f28')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, 1, 1, 1, 1, 1, 1000, 10000, CAST(N'2019-08-27 10:40:00.200' AS DateTime), NULL, NULL, NULL, N'e20c8bb6-5a0f-4e03-bea6-8396464bac1e')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 1, 1, 1, 1, 1, 21233, 3232, CAST(N'2019-09-25 11:19:04.667' AS DateTime), NULL, NULL, NULL, N'0b74a0a3-22f4-4b33-8750-ee4e79371f54')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-10-17 11:59:33.207' AS DateTime), NULL, NULL, NULL, N'd90ecd29-90e3-4a92-ab1f-9b5f3bd36ad8')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Visual', N'imVisual', CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'fb8a9809-70da-49f6-864a-a4a16e3ba8ed')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Magnetic', N'imMagnetic', CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'ed904f94-0c1a-4d68-83ce-cff61dcf4012')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Penetrant', N'imPenetrant', CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'a5cecec5-69bd-4609-8174-7ec87205036a')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Radiography', N'imRadiography', CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'af8baec1-258d-44b4-a5e0-76eeee579fbf')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'Ultrasonic', N'imUltrasonic', CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'cbfa8ae9-3105-4283-8b39-76a99dc62115')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'Eddy Current', N'imEddyCurrent', CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'f93ef9aa-b6a1-4928-b6f2-f03128e502e9')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'Thermography', N'imThermography', CAST(N'2019-06-28 16:50:34.470' AS DateTime), NULL, NULL, NULL, N'7fd31350-3a7f-426b-9ffd-01a1ea14ca27')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'Acoustic Emission', N'imAcoustic', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'7e76e093-4d3e-4a69-bce1-4670340ab866')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Metallurgical', N'imMetallurgical', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'e48f008f-c554-43f0-a5d8-102e4a9ed99e')
INSERT [dbo].[IM_ITEMS] ([IMItemID], [IMDescription], [IMCode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'Monitoring', N'imMonitoring', CAST(N'2019-06-28 16:50:34.473' AS DateTime), NULL, NULL, NULL, N'448302c3-f5c1-43d5-b8ba-7f28bd70116e')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Endoscopy', N'itEndoscopy', 1, CAST(N'2019-06-28 16:50:34.490' AS DateTime), NULL, NULL, NULL, N'72cf2887-ab85-47a3-947c-29f2fe21cbe6')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Hydrotesting', N'itHydrotesting', 1, CAST(N'2019-06-28 16:50:34.490' AS DateTime), NULL, NULL, NULL, N'0c6dbb0a-6c5c-48a6-aa09-062d8f4e259e')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Naked Eye', N'itNakedEye', 1, CAST(N'2019-06-28 16:50:34.490' AS DateTime), NULL, NULL, NULL, N'3c7045bc-80fa-4f6c-919c-ea52ecb850e3')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Video', N'itVideo', 1, CAST(N'2019-06-28 16:50:34.490' AS DateTime), NULL, NULL, NULL, N'38034d64-7c57-42bd-806b-1a8d18b3ea3e')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'Magnetic Fluorescent Inspection', N'itFluorescent', 2, CAST(N'2019-06-28 16:50:34.490' AS DateTime), NULL, NULL, NULL, N'87efdeff-15b9-451f-8978-046cc88ec5b7')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'Magnetic Flux Leakage', N'itFluxLeakage', 2, CAST(N'2019-06-28 16:50:34.493' AS DateTime), NULL, NULL, NULL, N'7cfa4162-f449-4aab-ae6e-75e0eb15b269')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'Magnetic Particle Inspection', N'itParticle', 2, CAST(N'2019-06-28 16:50:34.493' AS DateTime), NULL, NULL, NULL, N'd7ee317f-f229-41ff-b66d-437fdb7424de')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'Liquid Penetrant Inspection', N'itLiquidPenetrant', 3, CAST(N'2019-06-28 16:50:34.493' AS DateTime), NULL, NULL, NULL, N'94d360cd-90b5-432c-8eba-075c7703ed5b')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Penetrant Leak Detection', N'itLeakDetectPetn', 3, CAST(N'2019-06-28 16:50:34.493' AS DateTime), NULL, NULL, NULL, N'538f9c41-f02c-4199-b822-f9159406d463')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'Compton Scatter', N'itCompton', 4, CAST(N'2019-06-28 16:50:34.493' AS DateTime), NULL, NULL, NULL, N'd024363a-41fb-4c73-b702-b65d7492258a')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'Gamma Radiography', N'itGamma', 4, CAST(N'2019-06-28 16:50:34.493' AS DateTime), NULL, NULL, NULL, N'1523b6a4-8a5f-49e0-84d1-ed6446d7b964')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'Real-time Radiography', N'itRealTimeRadio', 4, CAST(N'2019-06-28 16:50:34.497' AS DateTime), NULL, NULL, NULL, N'46b8b89d-a995-43bd-986a-712367bf9015')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'X-Radiography', N'itXRadio', 4, CAST(N'2019-06-28 16:50:34.497' AS DateTime), NULL, NULL, NULL, N'01704593-b11d-4b3e-a073-12ff4c337adc')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'Angled Compression Wave', N'itCompWave', 5, CAST(N'2019-06-28 16:50:34.497' AS DateTime), NULL, NULL, NULL, N'a39167ed-e436-4d50-8126-f040e85664b3')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'Angled Shear Wave', N'itShearWave', 5, CAST(N'2019-06-28 16:50:34.497' AS DateTime), NULL, NULL, NULL, N'f501a373-36a2-46d5-8341-8f76ff82fa39')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'A-scan Thickness Survey', N'itAScan', 5, CAST(N'2019-06-28 16:50:34.497' AS DateTime), NULL, NULL, NULL, N'96634a79-d786-485a-8bb3-61ca403f66f9')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'B-scan', N'itBScan', 5, CAST(N'2019-06-28 16:50:34.497' AS DateTime), NULL, NULL, NULL, N'd7c8b28b-bc81-4665-a750-0ff08f2ae46f')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'Chime', N'itChime', 5, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'41fb8cd7-718c-4f82-bcca-268de3a18622')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'C-scan', N'itCScan', 5, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'8328de6f-657a-4618-ac60-a21dca065f14')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'Digital Ultrasonic Thickness Gauge', N'itDUTG', 5, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'0736e667-2ffa-4278-9a71-6c0c3c820fed')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, N'Lorus', N'itLorus', 5, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'96197734-f272-4194-883c-0c3cf7fcbddd')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'Surface Waves', N'itSurfaceWave', 5, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'2d459c32-eb0c-4108-8754-70a2bc3e537a')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'Teletest', N'itTeletest', 5, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'd24cbbc0-4bd8-411e-a698-94076f34e1ff')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'TOFD', N'itTOFD', 5, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'7c2ec87d-ff7c-4beb-809f-8b576e07755d')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'ACFM', N'itACFM', 6, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'950b7b0e-1280-4c1e-82e6-7bae88f1bee8')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'Low frequency', N'itLowFreq', 6, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'0e10e27f-b460-4972-9301-4f8a021f2d19')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (27, N'Pulsed', N'itPulsed', 6, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'f4cb3d23-eb1e-4a36-b242-b7b31af49f1b')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (28, N'Remote field', N'itRemoteField', 6, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'6d84df26-75cf-47b2-a88b-3c46b2197ba4')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (29, N'Standard (flat coil)', N'itFlatCoil', 6, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'ac66eada-34bc-4120-b530-558c8d1a6843')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (30, N'Passive Thermography', N'itPassiveThermo', 7, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'bdead0d0-e317-42e3-8d75-4d31b88cadef')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (31, N'Transient Thermography', N'itTransientThermo', 7, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'6c82a602-f29f-47b0-accd-197e1226cb9c')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, N'Crack Detection', N'itCrackDetect', 8, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'b9ae7cc3-5ab9-486d-a06c-bbf484a2550f')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (33, N'Leak Detection', N'itLeakDetect', 8, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'89b1eab7-aee0-457d-98bb-deb5d78b2dcb')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, N'Hardness Surveys', N'itHardSurvey', 9, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'8f3020ad-9667-452d-849c-eb18ecf9f10e')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (35, N'Microstructure Replication', N'itMicroReplicate', 9, CAST(N'2019-06-28 16:50:34.500' AS DateTime), NULL, NULL, NULL, N'3857d96d-078f-4e6f-ae96-11ada634d640')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (36, N'On-line Monitoring', N'itOnlineMon', 10, CAST(N'2019-06-28 16:50:34.503' AS DateTime), NULL, NULL, NULL, N'd3cdd7cd-6ee9-4d2c-9a02-a647d5ad9b43')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (37, N'Holiday Test', N'itHoliday', 1, CAST(N'2019-06-28 16:50:34.503' AS DateTime), NULL, NULL, NULL, N'c07f4518-9606-4387-9e1b-c5cc37be3284')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (38, N'Advanced Ultrasonic Backscatter Technique', N'itAUBT', 5, CAST(N'2019-06-28 16:50:34.503' AS DateTime), NULL, NULL, NULL, N'6304b564-3ba5-49ac-a9d1-6752f93e37e0')
INSERT [dbo].[IM_TYPE] ([IMTypeID], [IMTypeName], [IMTypeCode], [IMItemID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (39, N'Internal Rotational Inspection System', N'itIRIS', 5, CAST(N'2019-06-28 16:50:34.503' AS DateTime), NULL, NULL, NULL, N'19f6d451-9a0a-4062-98ed-774c0fe0fd5f')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 1, 1, CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'e84b8332-b5d9-4588-b2c0-59da2a9699c1')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 1, 2, CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'9694250d-bcc2-4c5c-a897-418f93478a8c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 1, 3, CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'23661988-5e37-40e8-8db6-f6955d363b14')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 1, 4, CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'5515a4a4-708f-40c3-8bfb-2ea770cb8a9f')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 1, 37, CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'bf45a8cf-d21a-40ac-8a6f-4a92ceedd4c6')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 4, 10, CAST(N'2019-06-28 16:50:34.520' AS DateTime), NULL, NULL, NULL, N'9e20916c-c331-4192-adc8-cdd71e60277e')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 4, 11, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'd9a55e36-df65-4ed7-9987-792d73a5d15b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 4, 12, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'3dfe547b-af04-4d10-ab7f-301d33a3736b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 4, 13, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'63dfe52d-7a10-4e54-ab39-5083c2fa7ec8')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 5, 14, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'4af0c393-7886-437a-9cdd-fe934e9b5879')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 5, 15, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'6c347d10-28be-40c3-b85e-23845d366d68')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 5, 16, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'149a7d13-4219-4d6e-b971-63c69ee193ea')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 5, 17, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'775cc3b4-9ad4-4fbf-8ff8-32f5380ee476')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 5, 18, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'00de678c-cf1a-4559-9242-f3b817c0afaa')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 5, 19, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'f4002258-67b6-4a83-accc-7a0740ba94b4')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 5, 20, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'54e79829-afaa-4bc6-af3c-ed03633c447d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 5, 21, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'824004a1-f182-4478-9672-ffa75b71db8c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 5, 22, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'e86e6992-b783-4a81-9e16-0adefff60b68')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 5, 23, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'9b92cb41-d1ed-4e0f-8c3f-0e53c4e58122')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 5, 24, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'5940ffb7-37d0-4579-a8cb-5e642eeacc8b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 5, 38, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'e71ad86e-d161-4dc1-aea4-dca20f6f79e5')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 5, 39, CAST(N'2019-06-28 16:50:34.523' AS DateTime), NULL, NULL, NULL, N'17088401-39b7-4ace-93c2-1d02a0db76bd')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 1, 1, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'6f5ecbdd-d57d-403c-908b-35da7cffa55c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 1, 2, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'5f887262-6ccf-4270-a4fb-57d7f549024b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 1, 3, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'458f43da-07e4-4962-85f0-8a2b0f3ec40f')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 1, 4, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'ac0e2505-6fe8-4ed1-a87b-9e115bb309d6')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 1, 37, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'9337c80b-6f7b-406f-834b-4b86833d92ae')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 2, 5, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'9531afa1-710b-4ef0-8bff-a02b1e6f4342')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 2, 6, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'415c3ae9-a8f8-420e-9ef3-dc3ea071369e')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 2, 7, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'1802c173-e0fe-4c52-b9cf-19740c3aac01')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 5, 14, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'd9b18118-1370-4ecf-9fd5-42c9df377a0c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 5, 15, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'6935402d-a38c-4fab-a354-2a58de2822f1')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 5, 16, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'9e2b4095-9357-495e-823f-d8fb2cb31301')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 5, 17, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'608cbf57-a709-441f-825a-92df7aaa6c95')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 5, 18, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'475fcdff-30d4-4a5a-94e5-f67ccff9f87e')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 5, 19, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'460b4dcb-a1ea-42b0-8786-65a6a0db306d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 5, 20, CAST(N'2019-06-28 16:50:34.527' AS DateTime), NULL, NULL, NULL, N'e6bb2b57-f9bf-45f7-b93d-4941ad7fa728')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 5, 21, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'c407cf13-d712-49b8-b71e-dbef8d55af5c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 5, 22, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'ab9c89ab-9416-4338-949c-b0d3bacdcb01')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 5, 23, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'beeef502-0081-4207-bf91-b6ee98e6b081')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 5, 24, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'ecf341b0-113c-4044-90ff-873e40a08951')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 5, 38, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'c0705926-615f-4346-9626-fb917c27a0e1')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 5, 39, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'529e34ca-1678-4b87-a681-263963706e7b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 2, 5, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'c4d92e83-dd1b-4634-9871-2bb34d2eb107')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 4, 10, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'd34eabec-6f74-40c2-894c-9ae4098a1970')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 4, 11, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'e2448b62-0dec-4f0a-9a5b-a14bc18a331f')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 4, 12, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'29d7b36d-c503-4517-b283-197ba8ecb172')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 4, 13, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'9df60e37-fb22-41fd-892d-2d46be3e2b90')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 5, 14, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'd41e2117-2007-4198-bbc3-a50e26276d82')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 5, 15, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'88617f14-e466-4711-9ac6-7e347c43a43e')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 5, 16, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'829e1903-ee4c-40f3-9884-e92b24150cd0')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 5, 17, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'08b5196f-8c37-466b-89e5-f71f203fd4c2')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 5, 18, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'f0c18a23-1287-4889-8eee-ec646ccbbea7')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 5, 19, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'aa1ce62c-b62d-4e3b-90e3-7d0917c5efca')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 5, 20, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'2c15bf70-cb52-4528-965a-83bf7fb35a78')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 5, 21, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'72c4e7f4-6be8-448e-a56f-24c111f3bca4')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 5, 22, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'8f232867-4c9f-49e4-b00c-17b5486f7de7')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 5, 23, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'06d81907-08da-46de-9d28-bc091e6e1cfa')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 5, 24, CAST(N'2019-06-28 16:50:34.530' AS DateTime), NULL, NULL, NULL, N'91893094-0c49-4157-a374-9b653aead0cc')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 5, 38, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'33a3296d-72ac-4190-81e8-a15614ed5896')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 5, 39, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'5fdd6eda-14ad-4ac4-acae-30716b757f16')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 6, 25, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'9162a2a7-2ced-4650-a0cc-9c1de1bc5910')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 8, 32, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'2f8eab39-2538-47df-bf2a-321abf21f003')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (61, 8, 33, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'8a6c84d8-34ae-4e05-823a-a9a24e08b1d9')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 2, 5, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'e81f2fc0-7e98-4c05-812e-056aa6f1d979')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 4, 10, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'7e3a63d1-2b64-4c05-8734-8ac9edd61a0a')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 4, 11, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'7af2ac8c-92b6-48ca-af13-8ab28319414c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 4, 12, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'eb7b0d81-9dd7-424c-b93c-b69d7dc638c5')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 4, 13, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'145a745b-a4e5-42c7-aad1-bf79e7cb3fcd')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 5, 14, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'd12f742d-546e-4a55-ab82-546b110922f5')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 5, 15, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'f2ab9262-eaef-475f-8199-992510d1e13f')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 5, 16, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'69fa2f73-1e1c-4d76-9d89-4f48ad503d3d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 5, 17, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'80be1e5b-678c-4c63-865d-1a65f6cce740')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 5, 18, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'9e523da7-ee3d-48f5-9838-cb904dd674d4')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 5, 19, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'b8096002-c26d-4cc5-ab74-31a2613aacc3')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 5, 20, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'0fb5c1d5-72ad-4ad1-b300-6533c261a288')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 5, 21, CAST(N'2019-06-28 16:50:34.533' AS DateTime), NULL, NULL, NULL, N'5ead267f-df9f-41bd-9bac-f880bad6feaa')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 5, 22, CAST(N'2019-06-28 16:50:34.537' AS DateTime), NULL, NULL, NULL, N'af1b0955-f9a1-41cb-b885-1ea84060ddc1')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 5, 23, CAST(N'2019-06-28 16:50:34.537' AS DateTime), NULL, NULL, NULL, N'a755d5ad-3760-48f2-8043-ae3277e53b5c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 5, 24, CAST(N'2019-06-28 16:50:34.537' AS DateTime), NULL, NULL, NULL, N'9f191f4f-e517-4f65-98e0-a4759c01ab5c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 5, 38, CAST(N'2019-06-28 16:50:34.537' AS DateTime), NULL, NULL, NULL, N'51300df0-07bc-4038-8ccc-5940db5e671e')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 5, 39, CAST(N'2019-06-28 16:50:34.537' AS DateTime), NULL, NULL, NULL, N'dc86bb2f-ed20-4501-9ff9-b3a12086c43e')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 6, 25, CAST(N'2019-06-28 16:50:34.537' AS DateTime), NULL, NULL, NULL, N'02041db0-c28a-4802-83c4-b9479526ec78')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 8, 32, CAST(N'2019-06-28 16:50:34.537' AS DateTime), NULL, NULL, NULL, N'69fd2656-903b-4612-a096-38cf825c8f1a')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (57, 8, 33, CAST(N'2019-06-28 16:50:34.537' AS DateTime), NULL, NULL, NULL, N'6f54fbea-c749-4a81-b07e-ed71ca4b6ff3')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 1, 1, CAST(N'2019-06-28 16:50:34.537' AS DateTime), NULL, NULL, NULL, N'5c2ed54c-7ed6-4f1c-b958-8e8205d6c036')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 1, 2, CAST(N'2019-06-28 16:50:34.537' AS DateTime), NULL, NULL, NULL, N'3ad0575a-d3d8-4088-81d4-d6adfbe15923')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 1, 3, CAST(N'2019-06-28 16:50:34.537' AS DateTime), NULL, NULL, NULL, N'5dbf12a8-50b7-4bb7-bbb9-04997c49d00b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 1, 4, CAST(N'2019-06-28 16:50:34.537' AS DateTime), NULL, NULL, NULL, N'a368ef88-a096-47f1-86ad-ed10d3bcf1b6')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 1, 37, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'9998566c-b8d9-493a-80ca-3e90bfaeda1b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 5, 14, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'b7ccec89-8c6a-4697-9a36-66bd72721054')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 5, 15, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'dbe0b87c-5aad-4ec7-920a-72a53ae05f4c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 5, 16, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'3cbe8c57-4769-4a98-b19e-9511aa37f6b3')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 5, 17, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'6ec9b246-83db-4a23-bb7c-cb915bb160e0')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 5, 18, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'9a97915a-6130-4dec-b17e-5a999174c56a')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 5, 19, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'f91b1dc4-c91b-4844-8313-d8579882fdc0')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 5, 20, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'7fd78783-5396-4ba5-bc8e-d3bc72363eb3')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 5, 21, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'e99d74b8-62fd-44fd-8b0d-791d7163cc39')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 5, 22, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'569f0681-6a86-4ed6-b5dc-5845234be133')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 5, 23, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'b76479dc-b67b-4e1d-8cc2-b5aad12a3ded')
GO
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 5, 24, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'227dc555-6828-44b3-b275-99d0f511f44f')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 5, 38, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'a45dcb9b-6d98-48d1-bca7-fdcd03dee89c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (67, 5, 39, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'26ed43c8-dd96-4112-a1f2-6d2c70b71aa4')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 1, 1, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'45fa4ce2-9e62-4444-bfa6-4bcae8b5638b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 1, 2, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'c869cd29-66ca-4482-ac1b-c70f5e929bca')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 1, 3, CAST(N'2019-06-28 16:50:34.540' AS DateTime), NULL, NULL, NULL, N'61195cd6-2ee1-4456-be35-06290af46cf4')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 1, 4, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'b92b121a-c5cb-4bf5-899d-8e94fd2c1fcc')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 1, 37, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'1f133ea2-e434-4a8d-b3b5-3294703c0cd1')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 4, 10, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'df8a4f5c-3144-476f-b11d-ec2a9567dd07')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 4, 11, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'6ce4aa4d-8567-4acf-96fb-ef7ec29653cb')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 4, 12, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'742ea010-34f3-4f91-b0cf-0206af1b0fac')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 4, 13, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'9ac4b263-d5bd-4167-a6c8-866e1ab7acdf')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 5, 14, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'b219e7af-4d61-423a-8193-4b1ce10868c3')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 5, 15, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'77cc537e-ae80-4f5f-a1b0-412651ec92e8')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 5, 16, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'5605432b-989d-4d87-a11d-7cc6054fd353')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 5, 17, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'6be5dbf7-b8f7-48a4-babe-ddbb93231371')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 5, 18, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'9b64e0af-0764-4c39-952f-f0d7d5ffadf5')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 5, 19, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'20b5f417-b9de-48ef-bb24-8c8b00aeb1db')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 5, 20, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'80c1e3ad-9ce1-45ab-aff8-c4dc6d1d2f5f')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 5, 21, CAST(N'2019-06-28 16:50:34.543' AS DateTime), NULL, NULL, NULL, N'1dbcdd86-5b75-42a5-a31d-d5967ab09e75')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 5, 22, CAST(N'2019-06-28 16:50:34.547' AS DateTime), NULL, NULL, NULL, N'c8c2a0a4-bcec-4102-beff-3ad803f68c15')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 5, 23, CAST(N'2019-06-28 16:50:34.547' AS DateTime), NULL, NULL, NULL, N'd69f28ee-8fbf-4bd9-af70-e188e58f9bc4')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 5, 24, CAST(N'2019-06-28 16:50:34.547' AS DateTime), NULL, NULL, NULL, N'932e914e-4d8c-4950-8f59-de81d39dba28')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 5, 38, CAST(N'2019-06-28 16:50:34.547' AS DateTime), NULL, NULL, NULL, N'778f0fc6-9972-4b89-9774-8064c55227db')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, 5, 39, CAST(N'2019-06-28 16:50:34.547' AS DateTime), NULL, NULL, NULL, N'1fc517cc-4af8-4201-a8a0-2f4b358b5a72')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 1, 1, CAST(N'2019-06-28 16:50:34.547' AS DateTime), NULL, NULL, NULL, N'f7a20e03-3f55-47c9-8e17-21edefea141c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 1, 2, CAST(N'2019-06-28 16:50:34.547' AS DateTime), NULL, NULL, NULL, N'4d271f57-b052-4093-bb59-78dbdc543ad7')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 1, 3, CAST(N'2019-06-28 16:50:34.547' AS DateTime), NULL, NULL, NULL, N'59537b05-a3da-4c32-a3b6-50183e641f90')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 1, 4, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'ff8ab9fb-c317-44a8-9a56-04b153ba6228')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 1, 37, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'ed8ddb89-8b37-43b8-90b6-2c773abb4a2d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 4, 10, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'7913d345-c943-4d75-a2bc-6f37e20d0d4a')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 4, 11, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'3369de05-6ad2-489a-b46e-4845bec50753')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 4, 12, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'04268a73-674e-4411-8a0c-1ea1569704b2')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 4, 13, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'dff304fb-ae2d-4920-b7c2-94609cd6f4ed')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 5, 14, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'b28e104d-4816-495a-8d36-411f75e7a12e')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 5, 15, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'1a047738-b3db-47d4-bf30-86160a7ba965')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 5, 16, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'0ef2157a-292b-4ffb-beaa-aa9029309e5e')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 5, 17, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'b0c5ec91-ad1d-4f14-a64f-bd6280ebd8e5')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 5, 18, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'a75d2104-fd01-4dc2-956e-a3c46c2f4719')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 5, 19, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'f680d887-570e-479f-8914-3bea594e354e')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 5, 20, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'cb06a178-ae72-4237-8bb4-0968a88c7b55')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 5, 21, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'bb4bec80-16eb-4d87-a21a-033f2538a6b0')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 5, 22, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'93d313ff-eae5-464a-aa27-0383788f85b5')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 5, 23, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'4d27b92c-caf8-44ac-a71f-dbd109aef44c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 5, 24, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'19b1c6bc-2572-49e5-b8f8-987c7f779cd1')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 5, 38, CAST(N'2019-06-28 16:50:34.550' AS DateTime), NULL, NULL, NULL, N'c35f0c10-7421-469d-82ed-9df10ee8dd99')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, 5, 39, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'c548807c-3a5a-4896-b41a-d72eaa0a6c0e')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 3, 8, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'243fbf6e-a691-4b21-b55c-e8f0748b5018')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 3, 9, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'8868f709-c31c-4add-8bdc-acb016658105')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 5, 14, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'27cb6df7-f14e-41b6-a943-a5db9fc451fd')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 5, 15, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'0758f38b-a3d2-4b23-bd2c-209feb01f7b6')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 5, 16, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'40556e45-bc8c-44cf-8ae7-a08d542fdcdf')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 5, 17, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'087b97f9-cb25-4902-830c-de457fde80bd')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 5, 18, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'd092278a-8f3b-4688-a807-c1e8f2989517')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 5, 19, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'80f252ea-b4f7-4b99-b157-910f703ad820')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 5, 20, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'4babbd56-8e6f-4497-aae0-0070932d6cbd')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 5, 21, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'6fb5c90c-966b-4b07-8193-c7a52d4c5cca')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 5, 22, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'9f3653d8-21f0-44f6-8976-71833e14080a')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 5, 23, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'2ba306f2-643e-4dd6-8673-e761f153ece7')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 5, 24, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'96efb6c9-a5f7-4139-ae9b-d6906134e6ed')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 5, 38, CAST(N'2019-06-28 16:50:34.553' AS DateTime), NULL, NULL, NULL, N'b925020a-3056-4372-909f-7e68fc6c7cce')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 5, 39, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'4e863e2f-4ce8-42f1-aa9d-5c4e23f94043')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 6, 25, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'6e66c824-7371-49bb-b97f-a145abb160a7')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 6, 26, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'89870d2a-444f-42c3-af5c-28646f12a458')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 6, 27, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'0b395c41-5de1-45cc-8507-3b547be2fae5')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 6, 28, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'0dab0796-d706-49e5-9ea8-662fd9151f0d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (66, 6, 29, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'473e40f0-c8f0-442d-9c1c-cae7a91ba26f')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 1, 1, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'baee1d60-b975-4648-a26e-6a8603f2b16c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 1, 2, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'6e1e809a-4111-4046-804c-f2757fb884cd')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 1, 3, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'546e5a91-4a85-4f13-9079-def2f05fada0')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 1, 4, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'25c9a01b-b8ea-4eb1-9a9f-e20ea3d15a16')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 1, 37, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'1d605f6b-8b8a-4ec3-9ec3-8aa778a9f1bf')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 3, 8, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'4682d45e-ec46-4047-9e1b-9ea789edc301')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 3, 9, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'0597bab1-da2e-4d52-93b3-2dd6ee9429bb')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 5, 14, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'8704a1a2-7da1-4f2e-8861-911872051174')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 5, 15, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'987ad4b1-927d-40e9-a3eb-9834e6132657')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 5, 16, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'b62b222e-4bef-4a70-b8fc-cce6d4a5b8c9')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 5, 17, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'8c1938ba-e8d3-4cae-80ed-f67e54201445')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 5, 18, CAST(N'2019-06-28 16:50:34.557' AS DateTime), NULL, NULL, NULL, N'f1e6984d-c316-4cd9-b78b-6c8c4716149c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 5, 19, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'1ee941aa-14b9-4b2f-89c3-c4f5021b1c3a')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 5, 20, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'0874ec45-e7fb-4b2e-aed8-67fa660201ba')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 5, 21, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'c923835c-ac4c-4765-bd79-f0616f73ea93')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 5, 22, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'e259bcb6-5634-4dd4-b10f-c9d71f08f82b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 5, 23, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'209796a5-9998-4538-a41b-f5134c8c8a4a')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 5, 24, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'219d0bca-bec9-4fff-84e2-fa43b67f9c57')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 5, 38, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'78cd4cb9-0bd2-4cc3-b44e-a94bbabdc55b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 5, 39, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'1795ca7d-5c4c-4945-b3e1-20f98f4db4c1')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 6, 25, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'743da310-64b7-460a-94b3-33c1bd055ee1')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 6, 26, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'21348364-8ba7-496f-a309-e677d185181c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 6, 27, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'963d9221-5860-4644-b2ff-5d1dec14a92b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 6, 28, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'f18351d4-84bb-47ae-818b-76eda650f2b3')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (63, 6, 29, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'9e7b3cbd-f16e-4695-95a5-bf947d86620d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 1, 1, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'd87cf2c8-ec22-4838-a2a1-18336a4a24e9')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 1, 2, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'4b8cca2a-5ddf-4bb8-9720-ed6dca5fda1a')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 1, 3, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'3cba4540-b935-4c22-966f-e1ce76a05ee8')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 1, 4, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'2864f48e-997f-43f3-a11f-34c02262bfbf')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 1, 37, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'73996c01-2e30-4667-a098-30978f9cd0e7')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 5, 14, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'87772f57-a173-41d6-b2b8-e8260de23a02')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 5, 15, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'90ba8241-072a-41a3-869e-a635077a304b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 5, 16, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'adaa3aee-877a-4708-a275-897c8ac502ca')
GO
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 5, 17, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'0b5b89b4-b3cb-4c7f-8593-99b03c203030')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 5, 18, CAST(N'2019-06-28 16:50:34.560' AS DateTime), NULL, NULL, NULL, N'a17ce72b-5ce5-4ca5-b9e3-142401fbe8ae')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 5, 19, CAST(N'2019-06-28 16:50:34.563' AS DateTime), NULL, NULL, NULL, N'056bb61e-4249-4350-a2c6-7c73d1221ff6')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 5, 20, CAST(N'2019-06-28 16:50:34.563' AS DateTime), NULL, NULL, NULL, N'9721074b-ae11-4b80-b7a9-a659ba2fb8bf')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 5, 21, CAST(N'2019-06-28 16:50:34.563' AS DateTime), NULL, NULL, NULL, N'62453e00-bfb4-4faa-9190-27be7b775d7c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 5, 22, CAST(N'2019-06-28 16:50:34.563' AS DateTime), NULL, NULL, NULL, N'6956a6e7-56e0-48a6-8004-a6847bb3a57d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 5, 23, CAST(N'2019-06-28 16:50:34.563' AS DateTime), NULL, NULL, NULL, N'd8fba0c1-abed-4aae-b5e7-43d534c0c94e')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 5, 24, CAST(N'2019-06-28 16:50:34.563' AS DateTime), NULL, NULL, NULL, N'04d46c32-1f8b-4b5e-820c-c9fdad761313')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 5, 38, CAST(N'2019-06-28 16:50:34.563' AS DateTime), NULL, NULL, NULL, N'318d5b52-f2e1-449a-851f-d1b20c7c41ca')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (69, 5, 39, CAST(N'2019-06-28 16:50:34.563' AS DateTime), NULL, NULL, NULL, N'03b204b2-4484-462a-b760-c54a1464940d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 2, 5, CAST(N'2019-06-28 16:50:34.563' AS DateTime), NULL, NULL, NULL, N'f2280a25-232f-4311-8609-0c070c8f0a55')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 4, 10, CAST(N'2019-06-28 16:50:34.563' AS DateTime), NULL, NULL, NULL, N'c629bdcd-be1d-4f88-84c4-4b4163dc1020')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 4, 11, CAST(N'2019-06-28 16:50:34.563' AS DateTime), NULL, NULL, NULL, N'45f1b670-b66f-4b46-949c-5e17161e855c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 4, 12, CAST(N'2019-06-28 16:50:34.563' AS DateTime), NULL, NULL, NULL, N'3c4131b2-e426-42db-b43d-6f51c9307e7c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 4, 13, CAST(N'2019-06-28 16:50:34.563' AS DateTime), NULL, NULL, NULL, N'738fcb6a-74c4-4a71-b774-0dbe9e23291d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 5, 14, CAST(N'2019-06-28 16:50:34.567' AS DateTime), NULL, NULL, NULL, N'28c3b389-359e-4ff3-ad39-7dbf5b323932')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 5, 15, CAST(N'2019-06-28 16:50:34.567' AS DateTime), NULL, NULL, NULL, N'302efbab-2035-4495-87d2-7fadfcabbb59')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 5, 16, CAST(N'2019-06-28 16:50:34.567' AS DateTime), NULL, NULL, NULL, N'4d1359a6-0578-4349-b830-3ceb433f0ca2')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 5, 17, CAST(N'2019-06-28 16:50:34.567' AS DateTime), NULL, NULL, NULL, N'5a934e3d-b918-428b-801f-fe525b61de14')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 5, 18, CAST(N'2019-06-28 16:50:34.567' AS DateTime), NULL, NULL, NULL, N'efd2d0d5-fba5-4bfa-adfc-1498b53013eb')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 5, 19, CAST(N'2019-06-28 16:50:34.567' AS DateTime), NULL, NULL, NULL, N'5f389dd0-fcc4-415d-88b0-75b2c54200b7')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 5, 20, CAST(N'2019-06-28 16:50:34.567' AS DateTime), NULL, NULL, NULL, N'0e0960d0-04f6-4310-b00d-7eb3bb5f5b09')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 5, 21, CAST(N'2019-06-28 16:50:34.567' AS DateTime), NULL, NULL, NULL, N'fb846641-ce5d-4a5a-9310-8284fcf24b9d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 5, 22, CAST(N'2019-06-28 16:50:34.567' AS DateTime), NULL, NULL, NULL, N'985fb01d-a47a-486f-96cc-f4dba72183aa')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 5, 23, CAST(N'2019-06-28 16:50:34.567' AS DateTime), NULL, NULL, NULL, N'c3931179-b10b-4f4d-93a5-4cbb08da933d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 5, 24, CAST(N'2019-06-28 16:50:34.567' AS DateTime), NULL, NULL, NULL, N'aa05dc6a-1fcc-43ae-b6cc-b9932196e015')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 5, 38, CAST(N'2019-06-28 16:50:34.567' AS DateTime), NULL, NULL, NULL, N'431d09ed-7a58-4a5d-a87e-226a28c85e22')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 5, 39, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'fcae1f55-a5b3-4f1c-8143-9861a3e11a25')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 6, 25, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'5a3a379d-783a-4ffb-9633-1d3019c9c0ed')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 8, 32, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'3900c927-8861-4f5f-98d5-da37addc8697')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60, 8, 33, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'139a4486-59bd-4f6f-a467-04e3cf9579e7')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 3, 8, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'3e55697d-a46f-4873-887f-5dd661ece5f0')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 3, 9, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'eaf0b30d-37d8-41e8-87df-bcdb06f427b6')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 4, 10, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'47a487c8-f935-46c7-b758-d18c5bc84764')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 4, 11, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'358168f3-db86-471f-8bf1-8224cdf56159')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 4, 12, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'ffe88791-6f54-4d61-a8f8-3a196044527a')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 4, 13, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'7f3114d4-ff02-48c3-b08f-d8cd4f12a51b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 5, 14, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'b6b8cd20-97f4-4ef2-98b2-e3bda158f8a3')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 5, 15, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'b0aae731-dfea-4939-a40d-16942f1fa371')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 5, 16, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'988f04a3-2072-49a2-84b9-189fe1810e2a')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 5, 17, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'c4ff7162-0ef1-4055-b92b-14402af7c9aa')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 5, 18, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'8a12a16e-f0b8-44c9-aa3d-53787887f2e4')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 5, 19, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'f5bc6077-55e8-4ccb-8f32-fe24a51ae616')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 5, 20, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'ae96d6e3-f39d-43ba-b860-f52dc9bc0a1b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 5, 21, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'6f8f8757-6be4-492e-86c8-302e842ce6f9')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 5, 22, CAST(N'2019-06-28 16:50:34.570' AS DateTime), NULL, NULL, NULL, N'8f6c3b6e-bd04-4451-b11a-ca0bbe294d69')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 5, 23, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'd9b463a3-4a89-46d1-aae7-af859538af52')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 5, 24, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'bf2fa477-536a-4396-b6b7-44d6e60ca26a')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 5, 38, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'ff7d194a-9f66-44ec-ab2c-887edd5cca2a')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 5, 39, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'1d77ab4e-d8b6-4697-9742-848635c79390')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 6, 25, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'8a1bc167-1b53-45a0-bde0-3c3f8f17b284')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 6, 26, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'bffa9176-7156-40a4-ae9e-543b6c718f9d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 6, 27, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'ab03dc05-97e3-4805-9c5d-6e6f8a05dccf')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 6, 28, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'4956afb9-872e-47a1-a26f-5591ae1ec3c9')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 6, 29, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'4421bce7-fc82-4949-b79d-00a9f2b74d95')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 8, 32, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'6e152e64-c36d-4d83-9010-abed71bdd743')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (72, 8, 33, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'be1f846f-189c-4a22-8290-bf80b49f82f8')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 3, 8, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'31b7192e-e233-4774-b780-c03e53d8d015')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 3, 9, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'c39f2932-f48a-4763-8107-19aa98e5cfc2')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 4, 10, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'12c5666d-7ed1-4059-bf68-1928cae5b52c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 4, 11, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'1dee1aed-f9e3-4d31-9b8a-06c89c0ba577')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 4, 12, CAST(N'2019-06-28 16:50:34.573' AS DateTime), NULL, NULL, NULL, N'8a73328b-9067-42c0-ac97-7bb59bf5fb73')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 4, 13, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'4260dc92-edee-4d7b-ab01-96d518ccc633')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 5, 14, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'8c51b19d-bcbf-4388-92de-a4bf2e295362')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 5, 15, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'9467ddc8-6845-47bf-8340-87cba0a2636f')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 5, 16, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'feb9c348-2ef4-4259-a468-62c3350b5f13')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 5, 17, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'd4369793-c0e6-4c4f-8d77-4a0dc3900bff')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 5, 18, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'a8079751-7df1-48ca-b9f5-247b14577c59')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 5, 19, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'c7b5eafb-86f4-4333-9002-b2a440e168d5')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 5, 20, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'00461c00-862a-40c5-a517-1fa9fbb0886c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 5, 21, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'3b89a3a1-e1e6-4d2b-a444-f492671eac81')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 5, 22, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'6735024c-7916-451f-8474-26d91e5d808b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 5, 23, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'da2536d5-824d-4bdf-bce2-98a0de68bc00')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 5, 24, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'fca2fd7e-7020-429a-8df2-b53a5c5555c2')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 5, 38, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'1095ce80-6078-4a52-a2b6-adaf62e33362')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 5, 39, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'451b5b5a-ab37-4e7f-87af-10408f0bf171')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 6, 25, CAST(N'2019-06-28 16:50:34.577' AS DateTime), NULL, NULL, NULL, N'8ebe86ea-9e5a-49be-9124-2f4ee4d50e94')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 6, 26, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'd6b0e6d6-15ec-4df4-a43f-c5284516c6b9')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 6, 27, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'e1cb464c-07a0-432d-b60e-ba800b159559')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 6, 28, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'9d1ba90f-5fde-4986-bea4-ccfafebc5eeb')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 6, 29, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'612c751b-faaf-450c-a6bb-e7e8a1404217')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 8, 32, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'5d399dc5-e7ff-4ec8-aede-88cda7f4d800')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (62, 8, 33, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'836657ee-2040-41e6-96bf-467d33326d58')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 2, 5, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'bcb5b4c7-2ca1-4441-953e-1dd37e62f1a1')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 4, 10, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'9979b2ef-fdbf-410a-89cb-f97bdc303223')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 4, 11, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'0d2d03bd-9406-4654-83b5-f29d4ba910d1')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 4, 12, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'9b007dac-0cdc-45a8-a9af-c2bf06e41d7e')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 4, 13, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'be12f873-b286-4881-80ac-5af0ebc56ac0')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 5, 14, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'd3ccbefd-265e-425b-8a23-55f1151a89a5')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 5, 15, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'f26ee3af-0432-49a9-8d50-970b3868244b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 5, 16, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'c73ca308-5d13-4600-9027-3c81b4759ea7')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 5, 17, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'9238d50f-b1fd-4b34-b4a0-d4eaf9902955')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 5, 18, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'aa1d29ed-580b-4caa-b13d-3ec725c89b10')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 5, 19, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'10353359-2273-4873-b03d-6065e86a296f')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 5, 20, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'3704b1e4-c55a-41c3-a896-aaf3162e78ef')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 5, 21, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'81caafa8-b5a3-47f0-9917-9a835605d486')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 5, 22, CAST(N'2019-06-28 16:50:34.580' AS DateTime), NULL, NULL, NULL, N'02cf19e6-3ced-4e44-9784-a470705f46af')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 5, 23, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'029fa132-c205-46d7-9dc4-a760fb4684c1')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 5, 24, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'eb986133-c64f-41f7-9c0d-2c43abb3e5db')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 2, 5, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'3d4066ec-67ef-433f-908f-dd702175bfa1')
GO
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 4, 10, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'e74f9eae-2a60-49c6-8a84-9ee0884ccfe8')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 4, 11, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'eff543db-c2a8-4449-8cf9-7b9cf291ca5d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 4, 12, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'313ceb3b-ca2c-4b7e-9c61-2bca1d5e2222')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 4, 13, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'd822001f-b094-4015-817a-cf6036681513')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 5, 14, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'08e1031a-a491-4f1b-bc7a-00929f94e24c')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 5, 15, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'29cd2251-df70-4404-93c1-2eb6fc023e80')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 5, 16, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'd08cf633-6824-4f5a-9f95-4581b7944518')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 5, 17, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'9f493b0b-d0d4-4778-9e3f-e82cf25fe91d')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 5, 18, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'7115681d-93ff-4bb8-8666-d7170aa68f8b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 5, 19, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'323f9329-215c-4b76-ba49-44f0ac67253f')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 5, 20, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'cb504ae2-c956-4f24-a0de-06aef86d9822')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 5, 21, CAST(N'2019-06-28 16:50:34.583' AS DateTime), NULL, NULL, NULL, N'85fb86b5-fe40-4a3e-9205-d8a81c2d0f67')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 5, 22, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'2bb30296-8600-4d84-9f99-b012352e1611')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 5, 23, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'486fa422-2cac-4106-aac8-1c2646524a6b')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 5, 24, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'2a6e3eca-cbef-4636-aaaf-5d95581f21ce')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 5, 38, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'57c8474d-f8d7-4990-bbc4-83f2e70f7742')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 5, 39, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'c2108e49-6aa0-4b53-8f82-48fd68938391')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 6, 25, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'f3f1895f-9036-43d7-8d9a-2c949a301ab3')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 8, 32, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'580424a6-3a50-4dae-9f9f-6e03c1a58731')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (73, 8, 33, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'216951c2-eb81-431b-8e5d-c94049536059')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 5, 38, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'0622b47a-27c2-49b6-b22f-1650a3724a00')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 5, 39, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'b5a8726b-ff75-4c25-b4e1-ebbd403b20d5')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 6, 25, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'95e79305-3eb4-4c06-8553-b15dd999fe0f')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 8, 32, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'59569418-0b57-47cc-9043-1021dc58dc97')
INSERT [dbo].[INSPECTION_DM_RULE] ([DMItemID], [IMItemID], [IMTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (70, 8, 33, CAST(N'2019-06-28 16:50:34.587' AS DateTime), NULL, NULL, NULL, N'b346a162-d4fa-4ac3-ab75-f7f9324b04c5')
SET IDENTITY_INSERT [dbo].[MANUFACTURER] ON 

INSERT [dbo].[MANUFACTURER] ([ManufacturerID], [ManufacturerName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'nhamay', CAST(N'2019-07-30 11:30:15.683' AS DateTime), NULL, NULL, NULL, N'cbe14fb2-6fe2-4cc6-810d-1aabac592d0c')
INSERT [dbo].[MANUFACTURER] ([ManufacturerID], [ManufacturerName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'TEST', CAST(N'2019-08-27 10:42:46.230' AS DateTime), NULL, NULL, NULL, N'a58e7e97-bbe5-4841-95af-f74f561f77e4')
INSERT [dbo].[MANUFACTURER] ([ManufacturerID], [ManufacturerName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Manufacturer', CAST(N'2019-10-17 11:59:37.277' AS DateTime), NULL, NULL, NULL, N'634df055-ad73-4741-9a80-bfb4c40eda99')
SET IDENTITY_INSERT [dbo].[MANUFACTURER] OFF
INSERT [dbo].[PRD_DF_CLASSES] ([ID], [DFClass], [DFValue], [Desciption], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'None', 1, N'New vessel or inspection shows little if any damage.', CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'5f644810-09d1-4d89-8ab1-cbccc5f179b9')
INSERT [dbo].[PRD_DF_CLASSES] ([ID], [DFClass], [DFValue], [Desciption], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Minimal', 20, N'Equipment has been in service for a reasonable amount of time and inspection shows evidence of minor damage. Damage mechanisms have been identified and inspection data is available.', CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'033ca7b1-e443-4a9e-a6eb-15b23e096ce8')
INSERT [dbo].[PRD_DF_CLASSES] ([ID], [DFClass], [DFValue], [Desciption], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Minor', 200, N'One or more damage mechanisms have been identified, limited inspection data available and fairly moderate evidence of damage. Single damage mechanism identified, recent inspection indicates moderate evidence of damage.', CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'9baa4cb7-507b-4529-9442-fc4954a9e930')
INSERT [dbo].[PRD_DF_CLASSES] ([ID], [DFClass], [DFValue], [Desciption], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Moderate', 750, N'Moderate damage found during recent inspection. Low susceptible to one or more damage mechanisms, and limited inspection exists.', CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'10ced1d9-210d-4ad0-b5f4-f6ace9af5a74')
INSERT [dbo].[PRD_DF_CLASSES] ([ID], [DFClass], [DFValue], [Desciption], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'Severe', 2000, N'One or more active damage mechanisms present without any recent inspection history. Limited inspection indicating high damage susceptibility.', CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'de92c3ea-cf12-4af5-a9fa-064fa83f0d62')
INSERT [dbo].[PRD_DISCHARGE_LOCATION] ([ID], [DischargeLocation], [WeibullAdjustmentFactor], [RecoveryFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Flare with Recovery System', 0.75, 0.5, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'0fdd2c44-1d86-4ee2-8149-e8e122108757')
INSERT [dbo].[PRD_DISCHARGE_LOCATION] ([ID], [DischargeLocation], [WeibullAdjustmentFactor], [RecoveryFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Flare without Recovery System', 0.75, 1, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'8cb1961b-05a0-44e0-a137-8eadc3d27537')
INSERT [dbo].[PRD_DISCHARGE_LOCATION] ([ID], [DischargeLocation], [WeibullAdjustmentFactor], [RecoveryFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Closed System', 0.75, 0, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'e1f223be-714a-4abb-8057-2f05a554e9d9')
INSERT [dbo].[PRD_DISCHARGE_LOCATION] ([ID], [DischargeLocation], [WeibullAdjustmentFactor], [RecoveryFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Atmosphere', 1, 1, CAST(N'2019-06-28 16:50:34.633' AS DateTime), NULL, NULL, NULL, N'37548913-809e-40a6-87ca-459037d593a2')
INSERT [dbo].[PRD_FAILURE_MODE] ([ID], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Fail to Open', CAST(N'2019-06-28 16:50:34.623' AS DateTime), NULL, NULL, NULL, N'd782b4f3-fe1c-4fbe-be19-6bed08f50692')
INSERT [dbo].[PRD_FAILURE_MODE] ([ID], [FailureMode], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Leakage', CAST(N'2019-06-28 16:50:34.623' AS DateTime), NULL, NULL, NULL, N'e83a2425-4728-4bf7-98ff-a593a24a6197')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 1, 1, 0.9, CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'387ab2f6-7651-483e-a179-a67f994de17c')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, 1, 2, 0.95, CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'7354aad3-b7f1-4e5c-9a62-37ca0024f135')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 1, 3, 0.9, CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'8241b158-58e9-4367-b34b-5083d074aa6a')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 1, 4, 0.95, CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'a4495c38-1e6e-4884-9b8c-d98700f1d089')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 2, 1, 0.7, CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'f25b4f62-6fdc-47f8-a293-9bdd8655744d')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 2, 2, 0.95, CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'2c576c59-9197-405b-a0a3-02bb8534cd74')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, 2, 3, 0.7, CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'67f108fc-f458-4c92-9407-c1ebf88069b2')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 2, 4, 0.95, CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'44d3b8ed-2a0b-4e71-85f3-55d09c7e4201')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 3, 1, 0.5, CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'1fa45562-5047-4b9d-aae1-d5e1d550cb7d')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 3, 2, 0.7, CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'8f3003b8-515a-48e9-84bb-b94d825dc063')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 3, 3, 0.5, CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'280f479a-2ec2-4558-a061-93981d4f28ad')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 3, 4, 0.7, CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'c83f03c8-1600-4f77-8838-91de38c3ada8')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, 4, 1, 1, CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'5697dc28-20ef-4446-b2a9-c9ffd5994ad8')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, 4, 2, 1, CAST(N'2019-06-28 16:50:34.613' AS DateTime), NULL, NULL, NULL, N'343cdd6d-5d8b-48c3-98a6-d11a2a8de0cf')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 4, 3, 1, CAST(N'2019-06-28 16:50:34.613' AS DateTime), NULL, NULL, NULL, N'758a6cba-a764-4c42-b77d-1542c11fe9b1')
INSERT [dbo].[PRD_INSPECTION_CONFIDENCE] ([ID], [EffectivenessID], [InspectionResultID], [FactorValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, 4, 4, 1, CAST(N'2019-06-28 16:50:34.613' AS DateTime), NULL, NULL, NULL, N'258d7229-dedf-4120-87c8-5540b8f1eb23')
INSERT [dbo].[PRD_INSPECTION_EFFECTIVENESS] ([ID], [Effectiveness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Highly Effective', CAST(N'2019-06-28 16:50:34.607' AS DateTime), NULL, NULL, NULL, N'5a0ae4f3-9a9d-4d59-89f0-c95f65750ca0')
INSERT [dbo].[PRD_INSPECTION_EFFECTIVENESS] ([ID], [Effectiveness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Usually Effective', CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'50c6357c-2489-4075-a049-13bc7f9c3eb0')
INSERT [dbo].[PRD_INSPECTION_EFFECTIVENESS] ([ID], [Effectiveness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Fairly Effective', CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'c6550862-6126-4f84-8781-fac490d44c9e')
INSERT [dbo].[PRD_INSPECTION_EFFECTIVENESS] ([ID], [Effectiveness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Ineffective', CAST(N'2019-06-28 16:50:34.610' AS DateTime), NULL, NULL, NULL, N'ecd946b1-8d74-454e-bb48-e217164034d8')
INSERT [dbo].[PRD_INSPECTION_RESULT] ([ID], [InspectionResult], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Pass', CAST(N'2019-06-28 16:50:34.607' AS DateTime), NULL, NULL, NULL, N'796509e7-b088-4c07-965f-9bbacc64232f')
INSERT [dbo].[PRD_INSPECTION_RESULT] ([ID], [InspectionResult], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Failed to Open', CAST(N'2019-06-28 16:50:34.607' AS DateTime), NULL, NULL, NULL, N'e94ca9d0-8f7f-4f81-9e77-de07003e36de')
INSERT [dbo].[PRD_INSPECTION_RESULT] ([ID], [InspectionResult], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Leaking', CAST(N'2019-06-28 16:50:34.607' AS DateTime), NULL, NULL, NULL, N'4f05570e-e7a1-4320-b1a5-81c897ca4538')
INSERT [dbo].[PRD_INSPECTION_RESULT] ([ID], [InspectionResult], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Failed to Open and Leaking', CAST(N'2019-06-28 16:50:34.607' AS DateTime), NULL, NULL, NULL, N'b8890547-02ab-48d9-a05b-40e6ea77ff2e')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Fire', N'1 per 250 years', 0.004, 0.1, CAST(N'2019-06-28 16:50:34.633' AS DateTime), NULL, NULL, NULL, N'91d11b94-4668-46a8-af26-a55044a4189c')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Loss of cooling water utility', N'1 per 10 years', 0.1, 1, CAST(N'2019-06-28 16:50:34.633' AS DateTime), NULL, NULL, NULL, N'84e198f5-9977-49c0-a525-768be7fdfa54')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Electrical power supply failure', N'1 per 12.5 years', 0.08, 1, CAST(N'2019-06-28 16:50:34.633' AS DateTime), NULL, NULL, NULL, N'7e388d33-f4e7-44d7-a770-ac94841c47e6')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Blocked discharge with administrative controls in place', N'1 per 100 years', 0.01, 1, CAST(N'2019-06-28 16:50:34.633' AS DateTime), NULL, NULL, NULL, N'0c9172c1-e52f-425f-a99e-5f7cb4acd032')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'Blocked discharge without administrative controls', N'1 per 10 years', 0.1, 1, CAST(N'2019-06-28 16:50:34.633' AS DateTime), NULL, NULL, NULL, N'197acdc2-78dd-48c9-905d-5e3548be086c')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'Control valve failure, initiating event is same direction as control valve normal fail position', N'1 per 10 years', 0.1, 1, CAST(N'2019-06-28 16:50:34.633' AS DateTime), NULL, NULL, NULL, N'106f7891-a634-4ffa-bef5-f3fdfc955b12')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'Control valve failure, initiating event is opposite direction as control valve normal fail position', N'1 per 50 years', 0.02, 1, CAST(N'2019-06-28 16:50:34.633' AS DateTime), NULL, NULL, NULL, N'ffaa7db7-7afa-4935-9f57-e9574f6c35ab')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'Runaway chemical reaction', N'1 per year', 1, 1, CAST(N'2019-06-28 16:50:34.633' AS DateTime), NULL, NULL, NULL, N'c10c3a59-9e53-4b53-931c-ff1ee3be25ce')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Heat exchanger tube rupture', N'1 per 1000 years', 0.001, 1, CAST(N'2019-06-28 16:50:34.633' AS DateTime), NULL, NULL, NULL, N'806e6f58-3633-4296-ae53-ca853351b023')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'Tower P/A or reflux pump failures', N'1 per 5 years', 0.2, 1, CAST(N'2019-06-28 16:50:34.637' AS DateTime), NULL, NULL, NULL, N'2e6657cb-897f-4001-86ad-cfbba3c9c300')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'Thermal relief with administrative controls in place', N'1 per 100 years', 0.01, 1, CAST(N'2019-06-28 16:50:34.637' AS DateTime), NULL, NULL, NULL, N'c1881ad9-ebe2-402b-98af-0d3d27afa535')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'Thermal relief without administrative controls', N'1 per 10 years', 0.1, 1, CAST(N'2019-06-28 16:50:34.637' AS DateTime), NULL, NULL, NULL, N'f314ab13-ab70-4e4b-b392-91e1e9aa466c')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'Liquid overfitting with administrative controls in place', N'1 per 100 years', 0.01, 0.1, CAST(N'2019-06-28 16:50:34.637' AS DateTime), NULL, NULL, NULL, N'58712c83-dcc6-42c3-adc5-d7665ab3e26d')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'Liquid overfitting without administrative controls', N'1 per 10 years', 0.1, 0.1, CAST(N'2019-06-28 16:50:34.637' AS DateTime), NULL, NULL, NULL, N'1e88a9f0-4175-43eb-9db7-4d842b620b29')
INSERT [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID], [DemandCase], [EventFrequency], [EF], [DRRF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'Leakage', N'1', 1, 1, CAST(N'2019-06-28 16:50:34.637' AS DateTime), NULL, NULL, NULL, N'1e827dbb-62bf-45af-bfab-6802475a7dc6')
INSERT [dbo].[PRD_SERVICE_SEVERITY] ([ID], [ServiceSeverity], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Mild', CAST(N'2019-06-28 16:50:34.613' AS DateTime), NULL, NULL, NULL, N'00b57909-ca93-440f-8ac3-f1623418b408')
INSERT [dbo].[PRD_SERVICE_SEVERITY] ([ID], [ServiceSeverity], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Moderate', CAST(N'2019-06-28 16:50:34.620' AS DateTime), NULL, NULL, NULL, N'f95551a7-e12c-49b9-b26b-00de12906878')
INSERT [dbo].[PRD_SERVICE_SEVERITY] ([ID], [ServiceSeverity], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Severe', CAST(N'2019-06-28 16:50:34.623' AS DateTime), NULL, NULL, NULL, N'd20dc573-71d1-4554-9d5b-4c01dca04a47')
INSERT [dbo].[PRD_TYPE] ([ID], [PRDTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Conventional Spring Loaded PRV', CAST(N'2019-06-28 16:50:34.613' AS DateTime), NULL, NULL, NULL, N'590e442d-6135-4161-bbc8-9ba1169327f9')
INSERT [dbo].[PRD_TYPE] ([ID], [PRDTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Balanced Bellows PRV', CAST(N'2019-06-28 16:50:34.613' AS DateTime), NULL, NULL, NULL, N'c28fd2f4-6000-47bb-8593-325fa038416a')
INSERT [dbo].[PRD_TYPE] ([ID], [PRDTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Pilot-Operated PRV', CAST(N'2019-06-28 16:50:34.613' AS DateTime), NULL, NULL, NULL, N'0071588a-dcef-4fae-b57b-7b22c65231b0')
INSERT [dbo].[PRD_TYPE] ([ID], [PRDTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'PRV with Rupture Disk', CAST(N'2019-06-28 16:50:34.613' AS DateTime), NULL, NULL, NULL, N'3436fae6-b893-4097-bfdc-cc4a0c57fd95')
INSERT [dbo].[PRD_TYPE] ([ID], [PRDTypeName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'Rupture Disk only', CAST(N'2019-06-28 16:50:34.613' AS DateTime), NULL, NULL, NULL, N'04c03222-ce26-4864-a264-37c645c764da')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 1, 1, 1, 50.5, 1.8, CAST(N'2019-06-28 16:50:34.623' AS DateTime), NULL, NULL, NULL, N'4fb27248-3f2f-4484-bbe2-cd2ee93f40fa')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, 1, 2, 1, 23.9, 1.8, CAST(N'2019-06-28 16:50:34.623' AS DateTime), NULL, NULL, NULL, N'81316349-ff38-4b0c-953c-986aaded8144')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 1, 3, 1, 17.6, 1.8, CAST(N'2019-06-28 16:50:34.623' AS DateTime), NULL, NULL, NULL, N'b81d0851-1846-4a20-9fae-b0866a323689')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 2, 1, 1, 50.5, 1.8, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'da883c98-1481-4e15-810e-0fb66d451fe7')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 2, 2, 1, 23.9, 1.8, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'a1903879-f1e4-4fb8-a3b9-7f71d2bf7444')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 2, 3, 1, 17.6, 1.8, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'ac9dfa0a-75e9-4644-9579-cb1db3ae030e')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, 3, 1, 1, 33.7, 1.8, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'9259142e-96dd-4b45-be86-645538c76b96')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, 3, 2, 1, 8, 1.8, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'4c480aae-74cc-4519-a590-ff46076c5869')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 3, 3, 1, 3.5, 1.8, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'00cb2cfc-92de-49db-b554-ef415048994e')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 4, 1, 1, 50.5, 1.8, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'54624082-e3c7-427f-b4de-b29b241a7316')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 4, 2, 1, 50.5, 1.8, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'3f307d30-cd2a-4706-9ac2-d22dcce972f3')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 4, 3, 1, 50.5, 1.8, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'fc51b2e7-11ac-4a07-a96d-8b65db01cd1c')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, 5, 1, 1, 50.5, 1.8, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'e130c2d1-61dd-4d83-9300-9dac591ee234')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, 5, 2, 1, 50.5, 1.8, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'b751458f-653a-4b9c-80eb-4efa9474d152')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 5, 3, 1, 50.5, 1.8, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'2037f690-0893-4614-9fe9-46e5013572d0')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, 1, 1, 2, 17.5, 1.6, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'1add5dad-9798-4b7c-8b5f-7ae361551ad1')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 1, 2, 2, 15.5, 1.6, CAST(N'2019-06-28 16:50:34.627' AS DateTime), NULL, NULL, NULL, N'457b9a98-5fb0-4631-867f-9e9c2c60c7db')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 1, 3, 2, 13.1, 1.6, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'067a0b0d-f9ae-432c-9f2f-be38f626d552')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 2, 1, 2, 16, 1.6, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'4b908686-b627-4aa2-b86f-0347e855b8b2')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 2, 2, 2, 14, 1.6, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'8633e339-3df7-4423-9d49-a1a4050500f2')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 2, 3, 2, 11.5, 1.6, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'81c3b627-f881-4909-82c4-47abc10ad08f')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 3, 1, 2, 17.5, 1.6, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'81809d2b-8013-4d27-a522-9104b29d6162')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, 3, 2, 2, 15.5, 1.6, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'6e03d82a-403b-4b40-a5d2-a9bef7989d71')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, 3, 3, 2, 13.1, 1.6, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'fe5b9e30-93cf-44b9-8886-855f4940286c')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, 4, 1, 2, 17.5, 1.6, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'39ae1389-2025-4662-a1b8-e6ba5b4e8082')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, 4, 2, 2, 17.5, 1.6, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'9ee5052a-a268-4083-9022-2caec2dec198')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (27, 4, 3, 2, 17.5, 1.6, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'05352e90-162b-4144-b265-b642b0f55c07')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (28, 5, 1, 2, 17.5, 1.6, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'32ce48bf-0750-4307-9f7e-f632f1d00a67')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (29, 5, 2, 2, 17.5, 1.6, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'0c47afa9-2048-4bd2-be7e-1fa24b75317d')
INSERT [dbo].[PRD_WEIBULL_PARAMETER] ([ID], [PRDTypeID], [ServiceSeverityID], [FalureModeID], [Eta], [Beta], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (30, 5, 3, 2, 17.5, 1.6, CAST(N'2019-06-28 16:50:34.630' AS DateTime), NULL, NULL, NULL, N'2673f016-ad3d-4dc5-9204-9d90e41ffd08')
SET IDENTITY_INSERT [dbo].[REPORT_TEMPLATE] ON 

INSERT [dbo].[REPORT_TEMPLATE] ([TemplateID], [TemplateName], [TemplateDescription], [OriginalFile], [ReportIdentifier], [ReportID], [ReportType], [ReportVersion], [Predefined], [TemplateBinary], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Standard Equipment', N'Standard RiskWISE Equipment Report', N'NIL', NULL, N'NIL', N'Equipment', N'NIL', 1, NULL, CAST(N'2019-06-28 16:50:34.490' AS DateTime), NULL, NULL, NULL, N'7ec2196e-756d-4e3b-9c0f-89b7ea20025e')
INSERT [dbo].[REPORT_TEMPLATE] ([TemplateID], [TemplateName], [TemplateDescription], [OriginalFile], [ReportIdentifier], [ReportID], [ReportType], [ReportVersion], [Predefined], [TemplateBinary], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Standard Component', N'Standard RiskWISE Component Report', N'NIL', NULL, N'NIL', N'Component', N'NIL', 1, NULL, CAST(N'2019-06-28 16:50:34.490' AS DateTime), NULL, NULL, NULL, N'30542d5b-7b53-4eab-9de2-6f35422e770a')
SET IDENTITY_INSERT [dbo].[REPORT_TEMPLATE] OFF
SET IDENTITY_INSERT [dbo].[RW_ASSESSMENT] ON 

INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (1, 1, 1, CAST(N'2019-07-30 11:31:50.000' AS DateTime), -1, 36, 1, N'', 0, 0, 0, N'', N'', CAST(N'2019-10-28 15:46:19.000' AS DateTime), N'', CAST(N'2019-10-28 15:46:19.000' AS DateTime), CAST(N'2019-07-30 11:31:50.953' AS DateTime), NULL, NULL, NULL, N'f816e6f0-f863-42c5-abc9-4274f029c2d0', N'New Proposal 1', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (2, 3, 2, CAST(N'2019-08-20 21:38:10.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2019-08-20 21:38:10.000' AS DateTime), N'', CAST(N'2019-08-20 21:38:10.000' AS DateTime), CAST(N'2019-08-20 21:38:10.540' AS DateTime), NULL, NULL, NULL, N'8f238dab-f227-4ce0-bbf1-d26a8b6a95f0', N'New Proposal 2', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (3, 3, 2, CAST(N'2019-08-21 15:24:56.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2019-08-21 15:24:56.000' AS DateTime), N'', CAST(N'2019-08-21 15:24:56.000' AS DateTime), CAST(N'2019-08-21 15:24:56.197' AS DateTime), NULL, NULL, NULL, N'240278ac-1e88-4f1c-80c6-965ce6d25876', N'New Proposal 3', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (4, 1, 3, CAST(N'2019-08-21 15:25:46.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2019-08-21 15:25:46.000' AS DateTime), N'', CAST(N'2019-08-21 15:25:46.000' AS DateTime), CAST(N'2019-08-21 15:25:47.007' AS DateTime), NULL, NULL, NULL, N'c9e33044-3f08-4547-aabc-ebaef7b353cd', N'New Proposal 4', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (5, 3, 4, CAST(N'2019-08-21 18:48:36.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2019-08-21 18:48:36.000' AS DateTime), N'', CAST(N'2019-08-21 18:48:36.000' AS DateTime), CAST(N'2019-08-21 18:48:36.423' AS DateTime), NULL, NULL, NULL, N'aa0f958e-2104-456a-9c16-b275b72b4d27', N'New Proposal 5', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (6, 4, 5, CAST(N'2019-08-27 10:49:03.000' AS DateTime), -1, 36, 1, N'', 0, 0, 0, N'', N'', CAST(N'2019-08-27 11:02:39.000' AS DateTime), N'', CAST(N'2019-08-27 11:02:39.000' AS DateTime), CAST(N'2019-08-27 10:49:03.657' AS DateTime), NULL, NULL, NULL, N'07b686bd-0090-4c39-8aaa-75cd28f36a4c', N'New Proposal 6', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (7, 5, 6, CAST(N'2019-08-27 11:09:07.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2019-08-27 11:09:07.000' AS DateTime), N'', CAST(N'2019-08-27 11:09:07.000' AS DateTime), CAST(N'2019-08-27 11:09:07.500' AS DateTime), NULL, NULL, NULL, N'b2504e8e-ff6b-49b2-943e-cb36802c74f1', N'New Proposal 7', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (9, 1, 1, CAST(N'2019-08-27 11:18:57.000' AS DateTime), -1, 36, 1, N'', 0, 0, 0, N'', N'', CAST(N'2019-09-25 10:33:43.000' AS DateTime), N'', CAST(N'2019-09-25 10:33:43.000' AS DateTime), CAST(N'2019-08-27 11:18:57.333' AS DateTime), NULL, NULL, NULL, N'3593c357-d878-4fcf-892d-74ab90172212', N'New Proposal 8', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (10, 6, 7, CAST(N'2019-08-29 14:35:14.000' AS DateTime), -1, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2019-08-29 15:07:15.000' AS DateTime), N'', CAST(N'2019-08-29 15:07:15.000' AS DateTime), CAST(N'2019-08-29 14:35:14.803' AS DateTime), NULL, NULL, NULL, N'781b3b35-36e0-454a-af72-c2a7be954edd', N'New Proposal 9', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (11, 6, 8, CAST(N'2019-09-25 11:18:17.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2019-09-25 11:18:17.000' AS DateTime), N'', CAST(N'2019-09-25 11:18:17.000' AS DateTime), CAST(N'2019-09-25 11:18:17.930' AS DateTime), NULL, NULL, NULL, N'1ce1622e-0fa9-42e1-bbaa-9490de85f75b', N'New Proposal 10', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (12, 7, 9, CAST(N'2019-09-25 11:20:06.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2019-09-25 11:20:06.000' AS DateTime), N'', CAST(N'2019-09-25 11:20:06.000' AS DateTime), CAST(N'2019-09-25 11:20:06.377' AS DateTime), NULL, NULL, NULL, N'193e46f8-98e0-4993-91f3-f43f2d38cd0f', N'New Proposal 11', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (15, 8, 17, CAST(N'2019-01-02 00:00:00.000' AS DateTime), -1, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2019-10-23 13:50:44.000' AS DateTime), N'', CAST(N'2019-10-23 13:50:44.000' AS DateTime), CAST(N'2019-10-17 21:12:36.120' AS DateTime), NULL, NULL, NULL, N'ba1d531c-4319-404b-a570-a36e5f47a970', N'New Proposal 2', 1)
SET IDENTITY_INSERT [dbo].[RW_ASSESSMENT] OFF
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 0, 0, 0, 0, 0, CAST(N'2019-07-30 11:31:50.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2019-07-30 11:31:51.040' AS DateTime), NULL, NULL, NULL, N'dc9651d0-8015-4402-b25f-b8357f98ec31')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, 0, 0, 0, 0, 0, CAST(N'2019-08-20 21:38:10.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2019-08-20 21:38:10.770' AS DateTime), NULL, NULL, NULL, N'a3225b30-4f40-4da4-8de0-560c43b93893')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 0, 0, 0, 0, 0, CAST(N'2019-08-21 15:24:56.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2019-08-21 15:24:56.347' AS DateTime), NULL, NULL, NULL, N'1f4b560a-169a-4862-b318-ac2f8bfff9db')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 0, 0, 0, 0, 0, CAST(N'2019-08-21 15:25:47.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2019-08-21 15:25:47.040' AS DateTime), NULL, NULL, NULL, N'f41dbbad-26d5-4fc0-b9cd-1a036d2b3885')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 0, 0, 0, 0, 0, CAST(N'2019-08-21 18:48:36.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2019-08-21 18:48:36.603' AS DateTime), NULL, NULL, NULL, N'9b0455c6-fc0c-4305-bbea-29cbc3b1411e')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 0, 0, 0, 0, 0, CAST(N'2019-08-27 10:49:03.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2019-08-27 10:49:03.770' AS DateTime), NULL, NULL, NULL, N'3cdc7f97-f806-4899-a1df-f24fbcb89b44')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, 0, 0, 0, 0, 0, CAST(N'2019-08-27 11:09:07.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2019-08-27 11:09:07.503' AS DateTime), NULL, NULL, NULL, N'dbbe0c0c-8093-4315-a983-a06ad80b4ff1')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 0, 0, 0, 0, 0, CAST(N'2019-08-27 11:18:57.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2019-08-27 11:18:57.360' AS DateTime), NULL, NULL, NULL, N'e6af7251-90b5-411b-9026-338e653c07d9')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 0, 0, 0, 0, 0, CAST(N'2019-08-29 14:35:14.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2019-08-29 14:35:14.953' AS DateTime), NULL, NULL, NULL, N'5a515c05-809b-4152-b582-cdc48164cb40')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 0, 0, 0, 0, 0, CAST(N'2019-09-25 11:18:17.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2019-09-25 11:18:18.023' AS DateTime), NULL, NULL, NULL, N'9760df38-c845-4b8e-bac0-f5845ff24618')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 0, 0, 0, 0, 0, CAST(N'2019-09-25 11:20:06.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2019-09-25 11:20:06.453' AS DateTime), NULL, NULL, NULL, N'3e9545dd-2fb8-4538-9a47-19372f8ede1d')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 12, 1212, 331, 11, 12, N'', N'', N'Between 200 and 237', 0, 0, N'', N'', 1, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 2, 1, 21, N'Medium', 0, 445, N'', 0, 0, 1, 1, 0, 1, 0, 34, CAST(N'2019-07-30 11:31:51.017' AS DateTime), NULL, NULL, NULL, N'dfd35175-63b7-420a-8962-edf9e5c800d1')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-20 21:38:10.757' AS DateTime), NULL, NULL, NULL, N'3ccb2c05-bb2e-4f88-b5c6-9dc4c8f782c4')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-21 15:24:56.340' AS DateTime), NULL, NULL, NULL, N'3918e73f-5a25-4819-a799-6ad93869d02e')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-21 15:25:47.030' AS DateTime), NULL, NULL, NULL, N'4ecd8ef7-2aea-4e32-a906-cc470b855821')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-21 18:48:36.587' AS DateTime), NULL, NULL, NULL, N'b0c3be8b-b5fb-45ad-9a65-d36199805607')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-27 10:49:03.760' AS DateTime), NULL, NULL, NULL, N'5848e00c-7d2f-4201-a657-ed071ebc254f')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-27 11:09:07.503' AS DateTime), NULL, NULL, NULL, N'65439b5c-9a39-48c1-a866-f6ed3a20b578')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 0, 0, 0, 0, 0, N'', N'', N'Greater than 237', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-27 11:18:57.357' AS DateTime), NULL, NULL, NULL, N'22a762bd-31bf-4da9-bc5b-bed23023d019')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 0, 0, 0, 0, 0, N'All branches greater than 2" Nominal OD', N'Threaded, socket welded, or saddle on', N'', 0, 0, N'', N'Experience', 0, N'PRV chatter', 0, 0, N'6 to 10', N'Good condition', N'One', N'Moderate', 1, N'2 to 13 weeks', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-29 14:35:14.947' AS DateTime), NULL, NULL, NULL, N'bf053f36-39c8-49f2-b03a-d827de52d10f')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-09-25 11:18:18.000' AS DateTime), NULL, NULL, NULL, N'12e97661-f6a5-432e-bf14-4346c38941bb')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-09-25 11:20:06.433' AS DateTime), NULL, NULL, NULL, N'b9b6a563-309f-40a0-964e-150b1b103cb7')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 32, 43, 34, 12, 4, N'All branches greater than 2" Nominal OD', N'Saddle in fittings', N'Below 200', 0, 0, N'Average', N'Experience', 1, N'PRV chatter', 0, 32, N'6 to 10', N'Good condition', N'None', N'Moderate', 1, N'2 to 13 weeks', N'', 0, 0, 0, 21, 21, 0, N'Medium', 1, 12, N'', 1, 1, 1, 1, 1, 0, 1, 23, CAST(N'2019-10-17 21:12:39.920' AS DateTime), NULL, NULL, NULL, N'd5b05607-3548-4ab6-950b-b185756f99fa')
SET IDENTITY_INSERT [dbo].[RW_CORROSION_RATE_TANK] ON 

INSERT [dbo].[RW_CORROSION_RATE_TANK] ([ID], [CorrosionID], [SoilSideCorrosionRate], [ProductSideCorrosionRate], [PotentialCorrosion], [TankPadMaterial], [TankDrainageType], [CathodicProtectionType], [TankBottomType], [SoilSideTemperature], [ProductCondition], [ProductSideTemp], [SteamCoil], [WaterDrawOff], [ProductSideBottom], [ModifiedSoilSideCorrosionRate], [ModifiedProductSideCorrosionRate], [FinalEstimatedCorrosionRate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 7, 123, 123, N'Very Corrosive (<500  Ω-cm)', N'Continuous Asphalt', N'Storm Water Collects At Tank Base', N'Yes Per API 651', N'RPB Not Per API 650', N'24< Temp ≤ 66', N'Wet', N'66 < Temp ≤ 93', N'Yes', N'No', N'Widespread', 187.5258, 257439, 4449648, CAST(N'2019-08-22 11:31:29.920' AS DateTime), NULL, NULL, NULL, N'3f542f22-ecbc-4880-b3c2-2cf3f009b197')
INSERT [dbo].[RW_CORROSION_RATE_TANK] ([ID], [CorrosionID], [SoilSideCorrosionRate], [ProductSideCorrosionRate], [PotentialCorrosion], [TankPadMaterial], [TankDrainageType], [CathodicProtectionType], [TankBottomType], [SoilSideTemperature], [ProductCondition], [ProductSideTemp], [SteamCoil], [WaterDrawOff], [ProductSideBottom], [ModifiedSoilSideCorrosionRate], [ModifiedProductSideCorrosionRate], [FinalEstimatedCorrosionRate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 11, 144, 134, N'Corrosive (500-1000  Ω-cm)', N'Crushed Limestone', N'Storm Water Collects At Tank Base', N'Yes Per API 651', N'RPB Not Per API 650', N'66 < Temp ≤ 93', N'Dry', N'93 < Temp ≤ 121', N'Yes', N'Yes', N'Localised', 302.7024, 151.018, 302.7024, CAST(N'2019-08-23 10:58:24.107' AS DateTime), NULL, NULL, NULL, N'f81ebbc1-c470-4fb2-b512-54e02fa8a692')
INSERT [dbo].[RW_CORROSION_RATE_TANK] ([ID], [CorrosionID], [SoilSideCorrosionRate], [ProductSideCorrosionRate], [PotentialCorrosion], [TankPadMaterial], [TankDrainageType], [CathodicProtectionType], [TankBottomType], [SoilSideTemperature], [ProductCondition], [ProductSideTemp], [SteamCoil], [WaterDrawOff], [ProductSideBottom], [ModifiedSoilSideCorrosionRate], [ModifiedProductSideCorrosionRate], [FinalEstimatedCorrosionRate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 15, 0, 0, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, 0, 0, CAST(N'2019-10-23 14:29:23.953' AS DateTime), NULL, NULL, NULL, N'8bed9b87-f77c-4e81-a144-94b20d9373fd')
INSERT [dbo].[RW_CORROSION_RATE_TANK] ([ID], [CorrosionID], [SoilSideCorrosionRate], [ProductSideCorrosionRate], [PotentialCorrosion], [TankPadMaterial], [TankDrainageType], [CathodicProtectionType], [TankBottomType], [SoilSideTemperature], [ProductCondition], [ProductSideTemp], [SteamCoil], [WaterDrawOff], [ProductSideBottom], [ModifiedSoilSideCorrosionRate], [ModifiedProductSideCorrosionRate], [FinalEstimatedCorrosionRate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 16, 0, 0, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, 0, 0, CAST(N'2019-10-23 14:48:50.623' AS DateTime), NULL, NULL, NULL, N'f6ffd8cc-c64a-4589-93e5-0775224a8849')
INSERT [dbo].[RW_CORROSION_RATE_TANK] ([ID], [CorrosionID], [SoilSideCorrosionRate], [ProductSideCorrosionRate], [PotentialCorrosion], [TankPadMaterial], [TankDrainageType], [CathodicProtectionType], [TankBottomType], [SoilSideTemperature], [ProductCondition], [ProductSideTemp], [SteamCoil], [WaterDrawOff], [ProductSideBottom], [ModifiedSoilSideCorrosionRate], [ModifiedProductSideCorrosionRate], [FinalEstimatedCorrosionRate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 17, 0, 0, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, 0, 0, CAST(N'2019-10-23 14:52:43.977' AS DateTime), NULL, NULL, NULL, N'1768c19a-5e27-46d5-9e63-9e8bdae33c3e')
INSERT [dbo].[RW_CORROSION_RATE_TANK] ([ID], [CorrosionID], [SoilSideCorrosionRate], [ProductSideCorrosionRate], [PotentialCorrosion], [TankPadMaterial], [TankDrainageType], [CathodicProtectionType], [TankBottomType], [SoilSideTemperature], [ProductCondition], [ProductSideTemp], [SteamCoil], [WaterDrawOff], [ProductSideBottom], [ModifiedSoilSideCorrosionRate], [ModifiedProductSideCorrosionRate], [FinalEstimatedCorrosionRate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 18, 0, 0, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, 0, 0, CAST(N'2019-10-23 14:59:35.190' AS DateTime), NULL, NULL, NULL, N'b03db8b8-0f09-4bb6-ad19-b3ab8c471a00')
INSERT [dbo].[RW_CORROSION_RATE_TANK] ([ID], [CorrosionID], [SoilSideCorrosionRate], [ProductSideCorrosionRate], [PotentialCorrosion], [TankPadMaterial], [TankDrainageType], [CathodicProtectionType], [TankBottomType], [SoilSideTemperature], [ProductCondition], [ProductSideTemp], [SteamCoil], [WaterDrawOff], [ProductSideBottom], [ModifiedSoilSideCorrosionRate], [ModifiedProductSideCorrosionRate], [FinalEstimatedCorrosionRate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 19, 0, 0, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, 0, 0, CAST(N'2019-10-23 15:58:37.873' AS DateTime), NULL, NULL, NULL, N'a0a65528-d550-4034-9294-785198dbe789')
SET IDENTITY_INSERT [dbo].[RW_CORROSION_RATE_TANK] OFF
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.400' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'21668dd2-2d01-4615-98ca-533fa48be76c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.400' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'181f377e-7516-4138-bd1f-ec07779bfa7b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 8, 1, N'', 0, 0, 0, 0, 0, 0.1, 0.1, 0.1, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:39.000' AS DateTime), CAST(N'2019-08-21 11:09:38.330' AS DateTime), NULL, CAST(N'2019-10-28 15:46:39.000' AS DateTime), NULL, N'5f6dd1e4-c260-428f-9e4a-06842e4c9e0b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:39.000' AS DateTime), CAST(N'2019-08-21 11:09:38.333' AS DateTime), NULL, CAST(N'2019-10-28 15:46:39.000' AS DateTime), NULL, N'c37492f4-9e2a-4694-bd71-01423c882efd')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.403' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'c5d01b3c-3c7e-413d-a0f9-072b66157bc8')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.403' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'65728e75-8888-4e03-b4ac-bc01d9c60498')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.400' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'29f6b9ce-6e13-4c38-96be-70d4fa784280')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 32, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.377' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'4113b564-88a3-401c-a66d-54d90d8c7bda')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 34, 1, N'', 0, 0, 0, 0, 0, 0.004690122, 0.004690122, 0.004690122, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.373' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'44c68a53-efa0-40ac-95a0-8b5d6767170a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:39.000' AS DateTime), CAST(N'2019-08-21 11:09:38.343' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'e03e5ddc-72a6-4191-84dc-e6a5352c4e09')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.367' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'be9429eb-8d7b-49dc-b28a-3d1ddb71d4db')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:39.000' AS DateTime), CAST(N'2019-08-21 11:09:38.340' AS DateTime), NULL, CAST(N'2019-10-28 15:46:39.000' AS DateTime), NULL, N'e98f7bf7-a9ee-44be-bdeb-ca1c30e96154')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.370' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'abde0ad4-c204-46d5-8920-8a70616c3eaf')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 63, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.380' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'a8b56510-a2a2-478d-872b-bc454ed0f588')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 66, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.377' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'85206147-f3f1-4535-a16b-630fde1f777c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.373' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'be597e68-44a9-47d7-88f1-167564859805')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.380' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'86cb574f-ec48-412e-af22-d3e9b297a287')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.347' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'6501b887-bfce-4721-b425-206c289b3f68')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.370' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'7abf3c1b-1a01-4f79-9b61-f032fc6fa04d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 72, 1, N'', 0, 0, 0, 0, 0, 5000, 16803.24, 35952.73, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.367' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'66a8ae76-5f29-432a-bda3-c5f4b123d983')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-10-28 15:46:40.000' AS DateTime), CAST(N'2019-08-21 11:09:38.347' AS DateTime), NULL, CAST(N'2019-10-28 15:46:40.000' AS DateTime), NULL, N'd575ee32-0812-43cd-814c-52e5712f3207')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.433' AS DateTime), NULL, NULL, NULL, N'1480a205-4c53-485f-9770-ae1c52a5f5c4')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.430' AS DateTime), NULL, NULL, NULL, N'81d4b539-21ad-43d7-a0d8-a977b8510fa2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 8, 1, N'', 0, 0, 0, 0, 0, 1900, 1900, 1900, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.410' AS DateTime), NULL, NULL, NULL, N'1aa0ab45-2234-4778-a648-4871a2f51e30')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.410' AS DateTime), NULL, NULL, NULL, N'4ffe6d08-785b-4b07-88f1-7f839c586190')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.437' AS DateTime), NULL, NULL, NULL, N'0f9ae6be-5d10-4951-9a89-918cf7d3d445')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.437' AS DateTime), NULL, NULL, NULL, N'6e983650-3ba9-43f6-8e8a-69ff6e5a9e4b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.433' AS DateTime), NULL, NULL, NULL, N'd4f93429-304c-45fc-a033-8f6a768abd24')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 32, 1, N'', 0, 0, 0, 0, 0, 1900, 1900, 1900, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.427' AS DateTime), NULL, NULL, NULL, N'e0ede879-d08e-485b-b6b9-7abd0d9d840c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 34, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.427' AS DateTime), NULL, NULL, NULL, N'd2db4db6-8f4d-4bcd-9189-435338bc9c9a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.413' AS DateTime), NULL, NULL, NULL, N'c4182d7a-3317-4454-b76c-d6a7a2f213b9')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.420' AS DateTime), NULL, NULL, NULL, N'6aa13b4f-bfc1-4c55-8468-bf4d3cb96afb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.410' AS DateTime), NULL, NULL, NULL, N'2ede0e3c-6252-4d0c-8107-78b389270455')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.420' AS DateTime), NULL, NULL, NULL, N'092eedfd-56f2-434e-a962-8c71192393af')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 63, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.430' AS DateTime), NULL, NULL, NULL, N'103de983-70b1-4801-8a30-a2eb53afce07')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 66, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.427' AS DateTime), NULL, NULL, NULL, N'77948219-e109-4c8e-8be2-e715ec33a25c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.423' AS DateTime), NULL, NULL, NULL, N'fe051388-6cf9-4f95-aaa4-3e3dc5d90aa3')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.430' AS DateTime), NULL, NULL, NULL, N'31fc37b8-3111-4e9c-a16b-68e786e119eb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.417' AS DateTime), NULL, NULL, NULL, N'73b3144a-3a20-4cb1-8abd-8e6ae187ec63')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.423' AS DateTime), NULL, NULL, NULL, N'fdeff444-8d50-40ef-aead-3218e89b57f1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.420' AS DateTime), NULL, NULL, NULL, N'33af91f5-bef3-4508-9e7a-19fe8d2b82f8')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2034-08-27 11:02:43.000' AS DateTime), CAST(N'2019-08-27 11:02:43.417' AS DateTime), NULL, NULL, NULL, N'd17dbf2d-90b6-43da-a58d-c4f805a10f94')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.333' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'b1186b98-0769-4a50-b8d7-5d191ecc151b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.300' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'63ff27ee-970a-4f3a-a380-678a11e393d6')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 8, 1, N'', 0, 0, 0, 0, 0, 1390, 1390, 1390, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.277' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'98d860f0-7bfd-4136-87b6-e7ef2c7ca8ff')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.277' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'42e5affc-ef45-4204-bde0-9aa6e4944861')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:34:00.000' AS DateTime), CAST(N'2019-08-27 11:30:20.337' AS DateTime), NULL, CAST(N'2019-09-25 10:34:00.000' AS DateTime), NULL, N'282a0eb6-9819-4b0f-9b98-3436ef405231')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:34:00.000' AS DateTime), CAST(N'2019-08-27 11:30:20.333' AS DateTime), NULL, CAST(N'2019-09-25 10:34:00.000' AS DateTime), NULL, N'f59aa5d4-5332-41a8-bb2d-6bd49c3e4351')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.300' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'071b57f9-ac54-444c-825f-d3b9797495b8')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 32, 1, N'', 0, 0, 0, 0, 0, 1390, 1390, 1390, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.293' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'2f55e920-f180-46e6-835c-1f268096a9e6')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 34, 1, N'', 0, 0, 0, 0, 0, 6500, 6500, 6500, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.293' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'6804bd5a-cf9a-4986-9d24-72e9d3c0075f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 57, 1, N'', 0, 0, 0, 0, 0, 100, 344.6718, 728.2725, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.280' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'ddff2ef5-18d3-4a17-b3c3-6148ee31e09d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.287' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'b9491bf0-a4fd-47cf-8d6a-ca2b7b85f9c5')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 61, 1, N'', 0, 0, 0, 0, 0, 50, 172.3359, 364.1363, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.280' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'e2aa8588-f71f-49de-a926-9d0a7cc7d1bb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.290' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'3d9f1d75-703f-4398-b29d-9078004de287')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 63, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.297' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'05e98962-c0ea-4754-8695-64f895191ce4')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 66, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.297' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'8ebe4647-abe8-452e-b625-9744cc7ffd4b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.290' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'5a6a4bb6-b421-41e9-b262-3a8983b3296a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.300' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'fde0de26-a1b9-476e-8084-140756fdeb31')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 69, 1, N'', 0, 0, 0, 0, 0, 10, 34.46718, 72.82726, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.283' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'33e6f6a9-64e9-48eb-84b5-02d7670d4099')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.290' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'ef8a6457-d2e3-42f4-833f-d0544c965609')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.287' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'771b34df-4b6b-4373-b9cd-aa566a411ead')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 73, 1, N'', 0, 0, 0, 0, 0, 100, 344.6718, 728.2725, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-09-25 10:33:59.000' AS DateTime), CAST(N'2019-08-27 11:30:20.283' AS DateTime), NULL, CAST(N'2019-09-25 10:33:59.000' AS DateTime), NULL, N'fb5c1dc6-c243-4636-8696-c05ea9479ef1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.120' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'e087a1bd-3344-4e1d-bb20-d74244142565')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.117' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'c6f27a9f-005c-4c5e-86e4-1ea3d912eb29')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 8, 1, N'', 0, 0, 0, 0, 0, 6500, 6500, 6500, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.093' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'5950b28a-e96a-4a18-822e-59416cb8e9f5')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.097' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'b231dbfb-835b-4753-a3fa-3f9485de2bf5')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 10, 1, N'', 0, 0, 0, 0, 0, 0.4, 0.4, 0.4, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.120' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'0c822788-00f7-48b6-a8fd-c3f02e49bd19')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.120' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'c736c251-b5ff-421c-9b49-10d20d300ad3')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.117' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'2c62641e-8341-4f0d-b476-ea91cfd3a89b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 32, 1, N'', 0, 0, 0, 0, 0, 1900, 1900, 1900, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.110' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'4a28ee69-612d-476d-81f9-0975664d7e1c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 34, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.110' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'731da47b-57eb-4fc1-af93-f4081614489a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.100' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'6a18a651-3f71-464c-a7b2-867b65b0ef1d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.103' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'1cdb0302-89b3-4076-9ca2-81277c11c506')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.097' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'09e79843-d8b9-4ae2-9844-a1a683399d31')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.107' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'9f127dea-8c23-40e9-9101-2661a715bbe3')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 63, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.113' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'd8e0d367-e200-41b6-ab37-81639439d18d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 66, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.113' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'9b9441bd-afab-4b7c-8f95-378f1ce5af70')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.110' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'f4ea0718-a2e0-4181-9680-2458ede38db6')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.113' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'e281d98c-bc8c-46cc-bc2d-0d36916c6c69')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.100' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'4920bdd4-f369-467a-8345-ee9263805f03')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.107' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'b084d268-1ddd-4c24-b1c8-fa9d56a63b77')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.103' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'4e7a91f2-7229-46a2-a671-5b3610c0bc56')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2034-08-29 15:07:18.000' AS DateTime), CAST(N'2019-08-29 14:43:28.100' AS DateTime), NULL, CAST(N'2019-08-29 15:07:18.000' AS DateTime), NULL, N'd83136d9-3bbd-4a1a-af0d-dca177bfcbe7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:15.000' AS DateTime), CAST(N'2019-10-22 21:46:45.367' AS DateTime), NULL, CAST(N'2019-10-23 13:51:15.000' AS DateTime), NULL, N'f4205792-1d9a-4579-b916-6e3ac0627a38')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 2, 1, N'', 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:15.000' AS DateTime), CAST(N'2019-10-22 21:46:45.287' AS DateTime), NULL, CAST(N'2019-10-23 13:51:15.000' AS DateTime), NULL, N'a5623b65-a33c-4c8d-ad9e-06d4be37d208')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 8, 1, N'', 0, 0, 0, 0, 0, 0.556798, 1648.72, 3941.449, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:14.000' AS DateTime), CAST(N'2019-10-23 13:51:14.457' AS DateTime), NULL, NULL, NULL, N'69f7625f-ea13-449e-8fbd-fda176812476')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 9, 1, N'', 0, 0, 0, 0, 0, 0, 230, 1758, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:14.000' AS DateTime), CAST(N'2019-10-22 21:46:44.710' AS DateTime), NULL, CAST(N'2019-10-23 13:51:14.000' AS DateTime), NULL, N'98c39904-2070-4610-ad2f-38e92d18bf31')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:15.000' AS DateTime), CAST(N'2019-10-22 21:46:45.447' AS DateTime), NULL, CAST(N'2019-10-23 13:51:15.000' AS DateTime), NULL, N'45275aff-03a5-4f9b-96a8-c1e58a6f1ac2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:15.000' AS DateTime), CAST(N'2019-10-22 21:46:45.407' AS DateTime), NULL, CAST(N'2019-10-23 13:51:15.000' AS DateTime), NULL, N'5bf7ed4f-3387-4866-8bab-d29d2b4bebc8')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 18, 1, N'', 0, 0, 0, 0, 0, 5, 5, 5, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:15.000' AS DateTime), CAST(N'2019-10-22 21:46:45.330' AS DateTime), NULL, CAST(N'2019-10-23 13:51:15.000' AS DateTime), NULL, N'97398728-8062-44b2-83ec-d428e4d76dac')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 32, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:15.000' AS DateTime), CAST(N'2019-10-22 21:46:45.130' AS DateTime), NULL, CAST(N'2019-10-23 13:51:15.000' AS DateTime), NULL, N'c9939d40-54a0-4520-bed2-a6023e66da58')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 34, 1, N'', 0, 0, 0, 0, 0, 1.988733, 1.988733, 1.988733, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:14.000' AS DateTime), CAST(N'2019-10-22 21:46:45.093' AS DateTime), NULL, CAST(N'2019-10-23 13:51:14.000' AS DateTime), NULL, N'd239c7b8-a4c1-493d-9a0b-0c36a3fc4e4e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 57, 1, N'', 0, 0, 0, 0, 0, 1000, 2404.298, 6157.97, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:14.000' AS DateTime), CAST(N'2019-10-22 21:46:44.787' AS DateTime), NULL, CAST(N'2019-10-23 13:51:14.000' AS DateTime), NULL, N'fe9b06b0-728e-4a73-b968-d05e202c0028')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 60, 1, N'', 0, 0, 0, 0, 0, 1000, 2404.298, 6157.97, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:14.000' AS DateTime), CAST(N'2019-10-22 21:46:44.907' AS DateTime), NULL, CAST(N'2019-10-23 13:51:14.000' AS DateTime), NULL, N'8e90597a-5569-491e-8393-4383594ae8f2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 61, 1, N'', 0, 0, 0, 0, 0, 5000, 12021.49, 30789.85, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:14.000' AS DateTime), CAST(N'2019-10-22 21:46:44.750' AS DateTime), NULL, CAST(N'2019-10-23 13:51:14.000' AS DateTime), NULL, N'6c7892b8-029c-4b0d-a1eb-26c2cfaf06e6')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:14.000' AS DateTime), CAST(N'2019-10-22 21:46:44.983' AS DateTime), NULL, CAST(N'2019-10-23 13:51:14.000' AS DateTime), NULL, N'765a1b55-f907-4a9b-a052-d4b44aa53b47')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 63, 1, N'', 0, 0, 0, 0, 0, 0.2112678, 0.2112678, 0.2112678, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:15.000' AS DateTime), CAST(N'2019-10-22 21:46:45.217' AS DateTime), NULL, CAST(N'2019-10-23 13:51:15.000' AS DateTime), NULL, N'c9338882-9f21-481e-8a88-f31c8195ab9c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 66, 1, N'', 0, 0, 0, 0, 0, 1.056339, 1.056339, 1.056339, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:15.000' AS DateTime), CAST(N'2019-10-22 21:46:45.180' AS DateTime), NULL, CAST(N'2019-10-23 13:51:15.000' AS DateTime), NULL, N'9e015403-3587-4437-bafe-0454e5a451ab')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:14.000' AS DateTime), CAST(N'2019-10-22 21:46:45.057' AS DateTime), NULL, CAST(N'2019-10-23 13:51:14.000' AS DateTime), NULL, N'7ee0278a-6392-4528-a539-a7e929f7a0f3')
GO
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 68, 1, N'', 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:15.000' AS DateTime), CAST(N'2019-10-22 21:46:45.260' AS DateTime), NULL, CAST(N'2019-10-23 13:51:15.000' AS DateTime), NULL, N'43cacd9c-2e57-4635-a85e-57e37f59b0b8')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 69, 1, N'', 0, 0, 0, 0, 0, 100, 240.4298, 615.797, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:14.000' AS DateTime), CAST(N'2019-10-22 21:46:44.867' AS DateTime), NULL, CAST(N'2019-10-23 13:51:14.000' AS DateTime), NULL, N'7a9b5b85-254b-4089-9119-61d73845e2a2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:14.000' AS DateTime), CAST(N'2019-10-22 21:46:45.020' AS DateTime), NULL, CAST(N'2019-10-23 13:51:14.000' AS DateTime), NULL, N'42c7870d-1be6-4eda-8d39-629b74de58bc')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 72, 1, N'', 0, 0, 0, 0, 0, 5000, 12021.49, 30789.85, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:14.000' AS DateTime), CAST(N'2019-10-22 21:46:44.947' AS DateTime), NULL, CAST(N'2019-10-23 13:51:14.000' AS DateTime), NULL, N'61d0ca8d-11d3-4d4d-8469-b578e3a42cd5')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 73, 1, N'', 0, 0, 0, 0, 0, 100, 240.4298, 615.797, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2034-10-23 13:51:14.000' AS DateTime), CAST(N'2019-10-22 21:46:44.830' AS DateTime), NULL, CAST(N'2019-10-23 13:51:14.000' AS DateTime), NULL, N'89fee317-bd9f-4fe6-96be-cd1471c6ba10')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, CAST(N'2019-07-28 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'Marine', 0, 1, 1, 1, 232, N'Amine high velocity corrosion - Corrosion coupons', 1, 0, 0, 0, 1, 0.159999996423721, N'None', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-07-30 11:31:50.990' AS DateTime), NULL, NULL, NULL, N'ae7c7a4d-019c-4852-831c-28692fc8c320')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, CAST(N'2019-08-07 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-20 21:38:10.713' AS DateTime), NULL, NULL, NULL, N'70b9291f-49d0-4e0f-ac89-f4aa15dec138')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, CAST(N'2019-08-07 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-21 15:24:56.313' AS DateTime), NULL, NULL, NULL, N'cf20c8ba-a454-46f0-912e-1112530b175d')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, CAST(N'2019-07-28 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-21 15:25:47.017' AS DateTime), NULL, NULL, NULL, N'0a079443-f695-45c6-b210-a90e7666c6b1')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, CAST(N'2019-08-07 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-21 18:48:36.560' AS DateTime), NULL, NULL, NULL, N'a5fc77fa-d2e1-4d51-9044-8f9ec36c45cb')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, CAST(N'2019-08-27 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0.100000001490116, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-27 10:49:03.743' AS DateTime), NULL, NULL, NULL, N'35c0483e-7da8-49c4-9b47-3ddc80834476')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, CAST(N'2019-05-14 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-27 11:09:07.503' AS DateTime), NULL, NULL, NULL, N'cc013cb5-f87e-4021-9b0f-eb8215042195')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, CAST(N'2019-07-28 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 1, 0.159999996423721, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-27 11:18:57.337' AS DateTime), NULL, NULL, NULL, N'575a1c8e-9c71-48c5-8f36-3dd5bed8f99b')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, CAST(N'2019-12-29 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0.100000001490116, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-29 14:35:14.883' AS DateTime), NULL, NULL, NULL, N'67e10f46-860b-458d-94b8-6779b0369747')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, CAST(N'2019-12-29 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-09-25 11:18:17.973' AS DateTime), NULL, NULL, NULL, N'6befb30b-1940-4d7d-937b-4882dfe6a580')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, CAST(N'2019-09-04 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-09-25 11:20:06.417' AS DateTime), NULL, NULL, NULL, N'9e66df14-ffce-4780-a206-6dfb46eb7e2f')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-07-30 11:31:51.113' AS DateTime), NULL, NULL, NULL, N'b3583a8d-ed59-4d63-b7c3-197a4d059b2f')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-20 21:38:10.803' AS DateTime), NULL, NULL, NULL, N'071889ee-fa99-43f9-907c-62ea8720f82f')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-21 15:24:56.367' AS DateTime), NULL, NULL, NULL, N'f48a37cd-339d-40d7-a60a-545c59101b36')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-21 15:25:47.050' AS DateTime), NULL, NULL, NULL, N'179628f7-4131-4e51-8111-9dddc6248d0e')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-21 18:48:36.697' AS DateTime), NULL, NULL, NULL, N'2a1c0d73-76c8-4b21-affd-bef43669d379')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-27 10:49:03.810' AS DateTime), NULL, NULL, NULL, N'54cbd16f-a352-452d-b63d-9beb9e7401c1')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-27 11:09:07.507' AS DateTime), NULL, NULL, NULL, N'b93fb7d5-8a6c-4aa5-8676-b0ba892b8b68')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-27 11:18:57.367' AS DateTime), NULL, NULL, NULL, N'e0f1b861-e59d-4f30-81bb-59a4791c571f')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-29 14:35:15.003' AS DateTime), NULL, NULL, NULL, N'2a0fd141-3a12-4f2a-9716-801dc87b9d37')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-09-25 11:18:18.100' AS DateTime), NULL, NULL, NULL, N'fd556cff-f59c-40ca-8646-2fb6ac58aec6')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-09-25 11:20:06.510' AS DateTime), NULL, NULL, NULL, N'8455ab8b-9e22-4691-9ee3-e32c73b50ab3')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 0.1, 0.1, 0.1, 5000, 16803.24, 35952.73, 0.004690122, 0.004690122, 0.004690122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.16, N'', 0.000722, 0.1, 0.1, 0.1, 0.1046901, 0.1046901, 0.1046901, 5000.104, 16803.35, 35952.84, 0.5776121, 1, 1, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2019-08-20 21:10:12.790' AS DateTime), NULL, NULL, NULL, N'2925b28b-b0b9-4aca-b919-0b27ccbde816')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 1900, 1900, 1900, 0, 0, 0, 1900, 1900, 1900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, N'', 0.0001001, 1900, 1900, 1900, 3800, 3800, 3800, 3800, 3800, 3800, 0.038038, 0.038038, 0.038038, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2019-08-27 11:02:42.740' AS DateTime), NULL, NULL, NULL, N'e0df4cc4-bc4b-4ead-ae3b-b60c56b1839a')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, 95000, 95000, 95000, 0, 0, 0, 1900, 1900, 1900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, N'', 0.0001001, 95000, 95000, 95000, 96900, 96900, 96900, 96900, 96900, 96900, 0.969969, 0.969969, 0.969969, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2019-08-27 11:11:38.050' AS DateTime), NULL, NULL, NULL, N'13b67b9c-1584-4277-98a1-40983b98011a')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 1390, 1390, 1390, 100, 344.6718, 728.2725, 6500, 6500, 6500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.16, N'', 0.000722, 6500, 6500, 6500, 7890, 7890, 7890, 7990, 8234.672, 8618.272, 0.9230048, 0.9512693, 0.9955828, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2019-08-27 11:28:25.003' AS DateTime), NULL, NULL, NULL, N'b8ef4414-3415-493f-9d6e-292b71e56181')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 6500, 6500, 6500, 0, 0, 0, 1900, 1900, 1900, 0.4, 0.4, 0.4, 0, 0, 0, 0.4, 0.4, 0.4, 0.1, N'', 3E-05, 6500, 6500, 6500, 8400, 8400, 8400, 8400.8, 8400.8, 8400.8, 0.0252024, 0.0252024, 0.0252024, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2019-08-29 14:43:27.890' AS DateTime), NULL, NULL, NULL, N'a1a059ed-ddb5-4472-a55f-f26fd1ed76e8')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, 0, 230, 1758, 5000, 12021.49, 30789.85, 1.988733, 1.988733, 1.988733, 7, 7, 7, 1, 1, 1, 0, 0, 0, 0.1, N'', 3E-05, 1.988733, 230, 1758, 1.988733, 231.9887, 1759.989, 5009.989, 12261.48, 31029.84, 0.01502997, 0.03678443, 0.09308951, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2019-10-23 13:51:01.287' AS DateTime), NULL, NULL, NULL, N'197df4e4-42fb-43e1-a2ce-5ae3c4b3b5cf')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'', 122, 1000, 777, 0, 0, 0, N'High > 0.01%', N'', N'', 444, N'321 Stainless Steel', N'', 1, 0, 0, 0, 0, 0, 0, 21, 32, 32, CAST(N'2019-07-30 11:31:51.063' AS DateTime), NULL, NULL, NULL, N'686c315a-c6cd-445f-ace0-d53dabe5bfec')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-20 21:38:10.783' AS DateTime), NULL, NULL, NULL, N'f903cc10-8dfc-4775-a244-084ac8177e71')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-21 15:24:56.353' AS DateTime), NULL, NULL, NULL, N'20e25345-8191-4dcb-ac9f-efcf5a31c49f')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-21 15:25:47.043' AS DateTime), NULL, NULL, NULL, N'7a9619a1-64bd-4060-bde6-3235be784152')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-21 18:48:36.650' AS DateTime), NULL, NULL, NULL, N'38de7ea4-49d3-4d59-a156-b2413b293285')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-27 10:49:03.773' AS DateTime), NULL, NULL, NULL, N'5de62fd5-777d-4119-a93f-2e85f0e4501e')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-27 11:09:07.507' AS DateTime), NULL, NULL, NULL, N'83691d3c-cc8d-48d3-a5b4-636c8d87de03')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, CAST(N'2019-08-27 11:18:57.363' AS DateTime), NULL, NULL, NULL, N'f1167ad0-0ef6-4dd2-9592-fe64aeaef864')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-29 14:35:14.963' AS DateTime), NULL, NULL, NULL, N'85c5469a-c7ad-4716-baaa-cb4d222af900')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-09-25 11:18:18.050' AS DateTime), NULL, NULL, NULL, N'fc65ccf6-0a46-40ae-8702-991c8c7fdb4b')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-09-25 11:20:06.470' AS DateTime), NULL, NULL, NULL, N'aceacdbb-f33e-476f-9a0c-16b803b58747')
INSERT [dbo].[RW_SETTINGS] ([ID], [DefaultAssessmentMethod], [SchemaVersion], [UnlockCode], [CompanyName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 4, N'6.0.2', NULL, NULL, CAST(N'2019-06-28 16:50:34.637' AS DateTime), NULL, NULL, NULL, N'4c02d826-8db3-450c-9960-d0f25a88e7b2')
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (1, N'', 0, 0, 0, 0, 227, 112, 0, 1, 0, N'High Rich Amine', 0, 0, 0, 321, 0, 0, 0, 0, 134, 600, 22, 200, 1111, 0, 10, 0, 0, 0, N'', 0, 3, CAST(N'2019-07-30 11:31:51.093' AS DateTime), NULL, NULL, NULL, N'3708d764-2ee5-4210-ac8b-e8173cad68d2', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (2, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-20 21:38:10.797' AS DateTime), NULL, NULL, NULL, N'8c53a1a5-047a-4073-8f62-e55c32992eae', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (3, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-21 15:24:56.363' AS DateTime), NULL, NULL, NULL, N'2ad36246-4334-4631-bf36-7a787622f213', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (4, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-21 15:25:47.047' AS DateTime), NULL, NULL, NULL, N'977f1e85-d656-4f52-aa3d-9a88adf29522', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (5, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-21 18:48:36.670' AS DateTime), NULL, NULL, NULL, N'72608623-1a35-47e6-b514-f76a63a63320', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (6, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-27 10:49:03.803' AS DateTime), NULL, NULL, NULL, N'dfc05a60-558f-45a9-aa94-b8c544fc3e5f', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (7, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-27 11:09:07.507' AS DateTime), NULL, NULL, NULL, N'aee919bc-d109-4131-a79b-41ec7297121d', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (9, N'Disopropanolamine DIPA', 1, 0, 0, 0, 0, 0, 0, 1, 0, N'Low Lean Amine', 0, 0, 1, 1222, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 4, 0, 0, 0, N'', 0, 2, CAST(N'2019-08-27 11:18:57.367' AS DateTime), NULL, NULL, NULL, N'df1521e1-5239-4f2c-9ca1-f431a9e56231', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (10, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-29 14:35:14.977' AS DateTime), NULL, NULL, NULL, N'56d1e425-d520-490a-9a01-a5ed5d825865', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (11, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-09-25 11:18:18.080' AS DateTime), NULL, NULL, NULL, N'5f8f48f5-d02f-4a79-a24d-b03667e2e85a', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (12, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-09-25 11:20:06.490' AS DateTime), NULL, NULL, NULL, N'd847dd9e-a284-4eb4-82fb-b209b1b81e8d', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[SAFETY_FACTORS] ([SafetyFactorID], [SafetyFactorName], [A], [B], [C], [D], [E], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Scaled Full-Life', 1, 1, 1, 1, 1, CAST(N'2019-06-28 16:50:34.487' AS DateTime), NULL, NULL, NULL, N'7ff49305-0d86-4b4c-bb4e-34579ff58c47')
SET IDENTITY_INSERT [dbo].[SITES] ON 

INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'HAI', CAST(N'2019-07-30 11:29:14.413' AS DateTime), NULL, NULL, NULL, N'7df6340a-63b4-4086-bed2-0dffec823515')
INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'TEST', CAST(N'2019-08-27 10:38:37.490' AS DateTime), NULL, NULL, NULL, N'cd2b109b-f9a2-4ec5-9ed7-9ac61815bfbd')
INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'SS01', CAST(N'2019-10-17 11:59:28.920' AS DateTime), NULL, NULL, NULL, N'0ec170e4-53c1-49b4-8faf-490d0d0a1ece')
SET IDENTITY_INSERT [dbo].[SITES] OFF
INSERT [dbo].[TBL_204_DM_NOT_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (56, 0, 0, 0, 0, 0, 0, 0.9, 1.1, 1.2)
INSERT [dbo].[TBL_204_DM_NOT_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (44, 0, 0, 0, 0.8, 1.1, 2, 2, 2, 6)
INSERT [dbo].[TBL_204_DM_NOT_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (33, 0, 0, 1, 2, 4, 9, 19, 36, 60)
INSERT [dbo].[TBL_204_DM_NOT_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (22, 0, 0.7, 2, 9, 29, 69, 133, 224, 338)
INSERT [dbo].[TBL_204_DM_NOT_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (11, 0.1, 1.3, 10, 49, 143, 296, 500, 741, 1008)
INSERT [dbo].[TBL_204_DM_NOT_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (0, 0.9, 3, 39, 175, 424, 759, 1142, 1545, 1950)
INSERT [dbo].[TBL_204_DM_NOT_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-11, 1.2, 7, 109, 405, 850, 1366, 1897, 2415, 2903)
INSERT [dbo].[TBL_204_DM_NOT_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-22, 2, 16, 220, 697, 1317, 11969, 2596, 3176, 3703)
INSERT [dbo].[TBL_204_DM_NOT_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-33, 2, 30, 350, 988, 1740, 2479, 3160, 3769, 4310)
INSERT [dbo].[TBL_204_DM_NOT_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-44, 3, 46, 474, 1239, 2080, 2873, 3581, 4209, 4746)
INSERT [dbo].[TBL_204_DM_NOT_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-56, 4, 61, 579, 1436, 2336, 3160, 3883, 4509, 5000)
INSERT [dbo].[TBL_205_DM_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (56, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_205_DM_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (44, 0, 0, 0, 0, 0, 0, 0, 0, 0.2)
INSERT [dbo].[TBL_205_DM_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (33, 0, 0, 0, 0, 0, 0.5, 0.9, 1.1, 1.3)
INSERT [dbo].[TBL_205_DM_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (22, 0, 0, 0, 0.5, 1.1, 1.3, 2, 3, 4)
INSERT [dbo].[TBL_205_DM_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (11, 0, 0, 0.6, 1.2, 2, 4, 7, 13, 23)
INSERT [dbo].[TBL_205_DM_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (0, 0, 0, 1.1, 2, 6, 14, 29, 53, 88)
INSERT [dbo].[TBL_205_DM_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-11, 0, 0.4, 2, 5, 17, 41, 83, 144, 224)
INSERT [dbo].[TBL_205_DM_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-22, 0, 0.9, 3, 12, 38, 90, 171, 281, 416)
INSERT [dbo].[TBL_205_DM_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-33, 0, 1.1, 5, 22, 68, 153, 277, 436, 623)
INSERT [dbo].[TBL_205_DM_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-44, 0, 1.2, 7, 34, 102, 219, 382, 582, 810)
INSERT [dbo].[TBL_205_DM_PWHT] ([CET-Tref], [6.4], [12.7], [25.4], [38.1], [50.8], [63.5], [76.2], [88.9], [101.6]) VALUES (-56, 0, 1.3, 9, 46, 133, 277, 472, 704, 962)
SET IDENTITY_INSERT [dbo].[TBL_45_DM_THIN] ON 

INSERT [dbo].[TBL_45_DM_THIN] ([ID], [NumberOrder], [LevelConfidence], [PriorProbability]) VALUES (1, 1, N'Low', 0.5)
INSERT [dbo].[TBL_45_DM_THIN] ([ID], [NumberOrder], [LevelConfidence], [PriorProbability]) VALUES (2, 1, N'Medium', 0.7)
INSERT [dbo].[TBL_45_DM_THIN] ([ID], [NumberOrder], [LevelConfidence], [PriorProbability]) VALUES (3, 1, N'High', 0.7)
INSERT [dbo].[TBL_45_DM_THIN] ([ID], [NumberOrder], [LevelConfidence], [PriorProbability]) VALUES (4, 2, N'Low', 0.3)
INSERT [dbo].[TBL_45_DM_THIN] ([ID], [NumberOrder], [LevelConfidence], [PriorProbability]) VALUES (5, 2, N'Medium', 0.2)
INSERT [dbo].[TBL_45_DM_THIN] ([ID], [NumberOrder], [LevelConfidence], [PriorProbability]) VALUES (6, 2, N'High', 0.15)
INSERT [dbo].[TBL_45_DM_THIN] ([ID], [NumberOrder], [LevelConfidence], [PriorProbability]) VALUES (7, 3, N'Low', 0.2)
INSERT [dbo].[TBL_45_DM_THIN] ([ID], [NumberOrder], [LevelConfidence], [PriorProbability]) VALUES (8, 3, N'Medium', 0.1)
INSERT [dbo].[TBL_45_DM_THIN] ([ID], [NumberOrder], [LevelConfidence], [PriorProbability]) VALUES (9, 3, N'High', 0.05)
SET IDENTITY_INSERT [dbo].[TBL_45_DM_THIN] OFF
SET IDENTITY_INSERT [dbo].[TBL_46_DM_THIN] ON 

INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (1, 1, N'E', 0.33)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (2, 1, N'D', 0.4)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (3, 1, N'C', 0.5)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (4, 1, N'B', 0.7)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (5, 1, N'A', 0.9)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (6, 2, N'E', 0.33)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (7, 2, N'D', 0.33)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (8, 2, N'C', 0.3)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (9, 2, N'B', 0.2)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (10, 2, N'A', 0.09)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (11, 3, N'E', 0.33)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (12, 3, N'C', 0.27)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (13, 3, N'D', 0.2)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (14, 3, N'B', 0.1)
INSERT [dbo].[TBL_46_DM_THIN] ([ID], [NumberOrder], [EffectivenessCode], [ConditionalProbability]) VALUES (15, 3, N'A', 0.01)
SET IDENTITY_INSERT [dbo].[TBL_46_DM_THIN] OFF
SET IDENTITY_INSERT [dbo].[TBL_47_DM_THIN_TANK] ON 

INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (1, 0, 0.1, 1, 0.1, 0.1, 0.1, 0.1)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (2, 0.05, 4, 1, 1, 0.5, 0.4, 0.4)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (3, 0.1, 14, 1, 3, 1, 0.7, 0.7)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (4, 0.15, 32, 1, 8, 2, 1, 1)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (5, 0.2, 56, 1, 18, 6, 2, 1)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (6, 0.25, 87, 1, 32, 11, 4, 3)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (7, 0.3, 125, 1, 53, 21, 9, 6)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (8, 0.35, 170, 1, 80, 36, 16, 12)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (9, 0.4, 222, 1, 115, 57, 29, 21)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (10, 0.45, 281, 1, 158, 86, 47, 36)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (11, 0.5, 347, 1, 211, 124, 73, 58)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (12, 0.55, 420, 1, 273, 173, 107, 89)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (13, 0.6, 500, 1, 346, 234, 158, 133)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (14, 0.65, 587, 1, 430, 309, 222, 192)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (15, 0.7, 681, 1, 527, 401, 305, 270)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (16, 0.75, 782, 1, 635, 510, 409, 370)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (17, 0.8, 890, 1, 757, 638, 538, 498)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (18, 0.85, 1005, 1, 893, 789, 696, 658)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (19, 0.9, 1126, 1, 1044, 963, 888, 856)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (20, 0.95, 1255, 1, 1209, 1163, 1118, 1098)
INSERT [dbo].[TBL_47_DM_THIN_TANK] ([ID], [Art], [E], [Insp], [D], [C], [B], [A]) VALUES (21, 1, 1390, 1, 1390, 1390, 1390, 1390)
SET IDENTITY_INSERT [dbo].[TBL_47_DM_THIN_TANK] OFF
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (1, 0.3, 0.5, 9, 3, 0, 1)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (2, 0.5, 1, 40, 4, 0, 1)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (3, 0.7, 2, 146, 6, 0, 1)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (4, 1, 4, 428, 7, 0, 1)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (5, 1, 9, 1017, 9, 1, 1)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (6, 2, 16, 1978, 11, 1, 1)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (7, 3, 30, 3000, 13, 1, 2)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (8, 4, 53, 3000, 16, 1, 3)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (9, 6, 89, 3000, 20, 2, 7)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (10, 9, 146, 3000, 25, 3, 13)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (11, 12, 230, 3000, 30, 4, 26)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (12, 16, 351, 3000, 36, 5, 47)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (13, 22, 518, 3000, 44, 7, 82)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (14, 30, 738, 3000, 53, 9, 139)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (15, 40, 1017, 3000, 63, 11, 228)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (16, 53, 1358, 3000, 75, 15, 359)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (17, 69, 1758, 3000, 89, 19, 548)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (18, 89, 2209, 3000, 105, 25, 808)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (19, 115, 2697, 3000, 124, 31, 1151)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (20, 146, 3000, 3000, 146, 40, 1587)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (21, 184, 3000, 3000, 170, 50, 2119)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (22, 230, 3000, 3000, 199, 63, 2743)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (23, 286, 3000, 3000, 230, 78, 3000)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (24, 351, 3000, 3000, 266, 97, 3000)
INSERT [dbo].[TBL_54_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (25, 428, 3000, 3000, 306, 119, 3000)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (1, 30, 1, 0)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (2, 89, 4, 0)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (3, 230, 16, 0)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (4, 518, 53, 0)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (5, 1017, 146, 0.2)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (6, 1758, 351, 1)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (7, 2697, 738, 4)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (8, 3000, 1358, 16)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (9, 3000, 2209, 53)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (10, 3000, 3000, 146)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (11, 3000, 3000, 351)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (12, 3000, 3000, 738)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (13, 3000, 3000, 1358)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (14, 3000, 3000, 2209)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (15, 3000, 3000, 3000)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (16, 3000, 3000, 3000)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (17, 3000, 3000, 3000)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (18, 3000, 3000, 3000)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (19, 3000, 3000, 3000)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (20, 3000, 3000, 3000)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (21, 3000, 3000, 3000)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (22, 3000, 3000, 3000)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (23, 3000, 3000, 3000)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (24, 3000, 3000, 3000)
INSERT [dbo].[TBL_55_DM_LINNING_ORGANIC] ([YearInService], [LowQuality], [MediumQuality], [HighQuality]) VALUES (25, 3000, 3000, 3000)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (10, 10, 8, 3, 1, 1, 6, 2, 1, 1, 4, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (50, 50, 40, 17, 5, 3, 30, 10, 2, 1, 20, 5, 1, 1, 10, 2, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (100, 100, 80, 33, 10, 5, 60, 20, 4, 1, 40, 10, 2, 1, 20, 5, 1, 1, 10, 2, 1, 1, 5, 1, 1, 1)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (500, 500, 400, 170, 50, 25, 300, 100, 20, 5, 200, 50, 8, 1, 100, 25, 2, 1, 50, 10, 1, 1, 25, 5, 1, 1)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (1000, 1000, 800, 300, 100, 50, 600, 200, 40, 10, 400, 100, 16, 2, 200, 50, 5, 1, 100, 25, 2, 1, 50, 10, 1, 1)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (5000, 5000, 4000, 1670, 500, 250, 3000, 1000, 250, 50, 2000, 500, 80, 10, 1000, 250, 25, 2, 500, 125, 5, 1, 250, 50, 2, 1)
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'BAR', N'bar', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'9d2c1f76-404d-499d-b095-d6a369fbadee')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'Custom', N'Custom Scheme', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'710be4ff-65c6-4b39-938d-8e36ebb363a9')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'DEG_C', N'°C', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'a4d3a981-14bf-46a2-b6b7-1e963dec5b12')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'DEG_F', N'°F', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'd21ed983-b9d2-4cf1-8cbc-69e85b5efc10')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'European', N'European Scheme', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'9db16856-ba20-4c2c-853d-32f8fa73fb1e')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'FT3', N'ft³', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'50778728-70f2-4505-a376-7ba1c5d3fe8c')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'FT3HR', N'ft³/hr', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'df194a62-359a-494c-897a-a69085773a26')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'INCH', N'in', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'bac48dae-eae3-4e8a-ab8c-f63a73af2ac2')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'K', N'K', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'2217ef2d-ef7c-4247-b3b5-974e50580892')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'KG', N'kg', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'094e76b6-1d4c-436d-88fa-f4299301c856')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, N'KSI', N'KSI', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'daa68778-13ae-4aa4-8622-450eec02c4d5')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'LBFFT', N'lbf.ft', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'9b5b44a1-a1db-4153-99e3-cb4661c44ec1')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'M', N'm', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'ea8fe890-3bdb-4246-a3c7-3525c5cc739c')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'M3', N'm³', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'4de94dc4-6215-41e6-b75a-7e1d808ebfb3')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'M3HR', N'm³/hr', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'2b735b63-83b2-4f73-b405-0ac1baccac73')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'MIL', N'mil', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'7302157f-9192-491b-a379-81539d46a06b')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'MILYR', N'mil/yr', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'67600d52-c43b-4864-bb10-96c57f02b57b')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'MM', N'mm', CAST(N'2019-06-28 16:50:34.483' AS DateTime), NULL, NULL, NULL, N'5d75ef4c-074a-4417-abe1-476324f55da7')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'MMYR', N'mm/yr', CAST(N'2019-06-28 16:50:34.483' AS DateTime), NULL, NULL, NULL, N'e5242c07-5cc2-4a7e-ba32-5e2430f31480')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'MPA', N'MPa', CAST(N'2019-06-28 16:50:34.483' AS DateTime), NULL, NULL, NULL, N'5a3b1e67-e82c-4b46-9789-61b335ec7bce')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'MW', N'mW', CAST(N'2019-06-28 16:50:34.483' AS DateTime), NULL, NULL, NULL, N'32535678-57b4-45c8-bb72-c09b6e2e1a92')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'NCM2', N'N/cm²', CAST(N'2019-06-28 16:50:34.483' AS DateTime), NULL, NULL, NULL, N'f83749e0-bbdf-45fd-a1c3-91a1cfc9d501')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'NM', N'Nm', CAST(N'2019-06-28 16:50:34.487' AS DateTime), NULL, NULL, NULL, N'6615d8ac-6dd7-41e0-b6ef-a1c97711af48')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'NM2', N'N/m²', CAST(N'2019-06-28 16:50:34.487' AS DateTime), NULL, NULL, NULL, N'd900b07f-8652-4dec-8f42-e54bf800a953')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'PSI', N'psi', CAST(N'2019-06-28 16:50:34.487' AS DateTime), NULL, NULL, NULL, N'd90921b5-a8d7-406a-a132-0dac574fd643')
INSERT [dbo].[UNIT_DESCRIPTOR] ([UnitDescriptorID], [UnitCode], [UnitDescriptor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'US', N'US Scheme', CAST(N'2019-06-28 16:50:34.487' AS DateTime), NULL, NULL, NULL, N'124dcb17-e6cc-46cb-aab1-91751515adcc')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Pressure', N'MPA', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'18775e40-cef8-4403-91aa-af7539764496')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'Temperature', N'DEG_C', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'b744696e-9bd3-4c26-8053-6d1c20ababae')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Dimensions', N'MM', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'18488688-8e5d-4063-8fbd-2650739689cf')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'Volume', N'M3', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'16930aab-7953-43b0-b6c6-3013bfb66346')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'FlowRate', N'M3HR', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'1e63a577-42d8-4622-acaa-bd71cdd037c4')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'Diameter', N'MM', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'baef1990-d344-4182-a8d1-86d9c9d5bd69')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'Thickness', N'MM', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'df28b0cd-3765-463e-9155-7872b0f54dd1')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'MetalLoss', N'MM', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'044b8eb2-bc07-418a-96a7-32f675ca0301')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Corrosion', N'MM', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'c3081613-dd7e-4106-a4b6-52a1978d748c')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'Torque', N'LBFFT', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'f7ef90e7-9e47-453c-b297-33d1ca3302a0')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'Scheme', N'Custom', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'1f2dd828-2f3e-4cde-828b-cbd61b17e990')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'Stress', N'MPA', CAST(N'2019-06-28 16:50:34.477' AS DateTime), NULL, NULL, NULL, N'd8afaf67-25af-41e8-9992-cffa79fcd8e5')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'CorrosionRate', N'MMYR', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'cc12b5b8-51b9-4151-be0e-c5431ff9b42a')
INSERT [dbo].[UNITS] ([UnitID], [UnitName], [SelectedUnit], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'Meter', N'M', CAST(N'2019-06-28 16:50:34.480' AS DateTime), NULL, NULL, NULL, N'7c7a9a07-d5b7-42fe-acb5-c7f55cf34840')
INSERT [dbo].[USERS] ([UserID], [Title], [FirstName], [LastName], [JobTitle], [Department], [Company], [UserGroupName], [ADAuthentication], [SysUser], [IsActive], [LicenseKey], [Password], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (N'administrator', N'', N'Administrator', N'Administrator', N'', N'', N'', N'Administrators', 0, 1, 1, NULL, N'blfGC81EuE96PYQhKKkm8L/8goKJgzWvejPBgWaW3VI=6YTYtABd8EZtXGW4iTMItixtW3qAZBZ7elmT5wvQI1E=', CAST(N'2019-06-28 16:50:34.637' AS DateTime), NULL, NULL, NULL, N'5947316a-24a8-4b8e-a178-d95896247ea7')
/****** Object:  Index [IX_API_COMPONENT_TYPE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_API_COMPONENT_TYPE] ON [dbo].[API_COMPONENT_TYPE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_COFFluid]    Script Date: 10/29/2019 10:24:51 AM ******/
ALTER TABLE [dbo].[COF_FLUID] ADD  CONSTRAINT [UK_COFFluid] UNIQUE NONCLUSTERED 
(
	[COFFluidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_COF_FLUID]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_COF_FLUID] ON [dbo].[COF_FLUID]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_COMPONENT_DETAIL]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMPONENT_DETAIL] ON [dbo].[COMPONENT_DETAIL]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_COMPONENT_MASTER]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMPONENT_MASTER] ON [dbo].[COMPONENT_MASTER]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_COMPONENT_MODELLING]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMPONENT_MODELLING] ON [dbo].[COMPONENT_MODELLING]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_COMPONENT_TYPE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_COMPONENT_TYPE] ON [dbo].[COMPONENT_TYPE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DESIGN_CODE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DESIGN_CODE] ON [dbo].[DESIGN_CODE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DM_CATEGORY]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DM_CATEGORY] ON [dbo].[DM_CATEGORY]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DM_EXPECTED_TYPE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DM_EXPECTED_TYPE] ON [dbo].[DM_EXPECTED_TYPE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DM_ITEMS]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DM_ITEMS] ON [dbo].[DM_ITEMS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EQUIPMENT_EXTRA_FIELDS]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EQUIPMENT_EXTRA_FIELDS] ON [dbo].[EQUIPMENT_EXTRA_FIELDS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_EquipmentNumber]    Script Date: 10/29/2019 10:24:51 AM ******/
ALTER TABLE [dbo].[EQUIPMENT_MASTER] ADD  CONSTRAINT [UK_EquipmentNumber] UNIQUE NONCLUSTERED 
(
	[EquipmentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EQUIPMENT_MASTER]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EQUIPMENT_MASTER] ON [dbo].[EQUIPMENT_MASTER]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EQUIPMENT_REVISION]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EQUIPMENT_REVISION] ON [dbo].[EQUIPMENT_REVISION]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EQUIPMENT_REVISION_INSPECTION]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EQUIPMENT_REVISION_INSPECTION] ON [dbo].[EQUIPMENT_REVISION_INSPECTION]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EQUIPMENT_REVISION_INSPECTION_COVERAGE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EQUIPMENT_REVISION_INSPECTION_COVERAGE] ON [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EQUIPMENT_TYPE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EQUIPMENT_TYPE] ON [dbo].[EQUIPMENT_TYPE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EXTRA_FIELDS_LOOKUP]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EXTRA_FIELDS_LOOKUP] ON [dbo].[EXTRA_FIELDS_LOOKUP]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EXTRA_FIELDS_LOOKUP_COMPONENT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EXTRA_FIELDS_LOOKUP_COMPONENT] ON [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EXTRA_FIELDS_SETTING]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EXTRA_FIELDS_SETTING] ON [dbo].[EXTRA_FIELDS_SETTING]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EXTRA_FIELDS_SETTING_COMPONENT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_EXTRA_FIELDS_SETTING_COMPONENT] ON [dbo].[EXTRA_FIELDS_SETTING_COMPONENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FACILITY]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FACILITY] ON [dbo].[FACILITY]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FACILITY_RISK_TARGET]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FACILITY_RISK_TARGET] ON [dbo].[FACILITY_RISK_TARGET]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FILE_COMPONENT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FILE_COMPONENT] ON [dbo].[FILE_COMPONENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FILE_EQUIPMENT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FILE_EQUIPMENT] ON [dbo].[FILE_EQUIPMENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FILE_FACILITY]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_FILE_FACILITY] ON [dbo].[FILE_FACILITY]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_GenericFluid]    Script Date: 10/29/2019 10:24:51 AM ******/
ALTER TABLE [dbo].[GENERIC_FLUID] ADD  CONSTRAINT [UK_GenericFluid] UNIQUE NONCLUSTERED 
(
	[GenericFluid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GENERIC_FLUID]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_GENERIC_FLUID] ON [dbo].[GENERIC_FLUID]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GENERIC_MATERIAL]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_GENERIC_MATERIAL] ON [dbo].[GENERIC_MATERIAL]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IM_ITEMS]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IM_ITEMS] ON [dbo].[IM_ITEMS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IM_TYPE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IM_TYPE] ON [dbo].[IM_TYPE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IMAGE_COMPONENT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IMAGE_COMPONENT] ON [dbo].[IMAGE_COMPONENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IMAGE_EQUIPMENT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IMAGE_EQUIPMENT] ON [dbo].[IMAGE_EQUIPMENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_IMAGE_FACILITY]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_IMAGE_FACILITY] ON [dbo].[IMAGE_FACILITY]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_INSPECTION_COVERAGE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_INSPECTION_COVERAGE] ON [dbo].[INSPECTION_COVERAGE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_INSPECTION_COVERAGE_DETAIL]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_INSPECTION_COVERAGE_DETAIL] ON [dbo].[INSPECTION_COVERAGE_DETAIL]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_INSPECTION_DETAIL_TECHNIQUE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_INSPECTION_DETAIL_TECHNIQUE] ON [dbo].[INSPECTION_DETAIL_TECHNIQUE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_INSPECTION_PLAN]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_INSPECTION_PLAN] ON [dbo].[INSPECTION_PLAN]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ITEM_LIST_CONFIG]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ITEM_LIST_CONFIG] ON [dbo].[ITEM_LIST_CONFIG]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MANUFACTURER]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MANUFACTURER] ON [dbo].[MANUFACTURER]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_POINTS]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_POINTS] ON [dbo].[POINTS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PRD_COMPONENT_MASTER]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PRD_COMPONENT_MASTER] ON [dbo].[PRD_COMPONENT_MASTER]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PRD_DF_CLASSES]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PRD_DF_CLASSES] ON [dbo].[PRD_DF_CLASSES]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PRD_DISCHARGE_LOCATION]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PRD_DISCHARGE_LOCATION] ON [dbo].[PRD_DISCHARGE_LOCATION]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PRD_FAILURE_MODE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PRD_FAILURE_MODE] ON [dbo].[PRD_FAILURE_MODE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PRD_INSPECTION_CONFIDENCE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PRD_INSPECTION_CONFIDENCE] ON [dbo].[PRD_INSPECTION_CONFIDENCE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PRD_INSPECTION_EFFECTIVENESS]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PRD_INSPECTION_EFFECTIVENESS] ON [dbo].[PRD_INSPECTION_EFFECTIVENESS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PRD_INSPECTION_RESULT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PRD_INSPECTION_RESULT] ON [dbo].[PRD_INSPECTION_RESULT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PRD_OVERPRESSURE_DEMAND]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PRD_OVERPRESSURE_DEMAND] ON [dbo].[PRD_OVERPRESSURE_DEMAND]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PRD_SERVICE_SEVERITY]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PRD_SERVICE_SEVERITY] ON [dbo].[PRD_SERVICE_SEVERITY]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PRD_TYPE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PRD_TYPE] ON [dbo].[PRD_TYPE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PRD_WEIBULL_PARAMETER]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_PRD_WEIBULL_PARAMETER] ON [dbo].[PRD_WEIBULL_PARAMETER]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_REPORT_TEMPLATE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_REPORT_TEMPLATE] ON [dbo].[REPORT_TEMPLATE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_REPORT_TEMPLATE_COMPONENT_DEFAULT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_REPORT_TEMPLATE_COMPONENT_DEFAULT] ON [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_ASSESSMENT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_ASSESSMENT] ON [dbo].[RW_ASSESSMENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_CF_MASTER]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_CF_MASTER] ON [dbo].[RW_CF_MASTER]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_COATING]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_COATING] ON [dbo].[RW_COATING]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_COMPONENT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_COMPONENT] ON [dbo].[RW_COMPONENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_CORROSION_RATE_TANK]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_CORROSION_RATE_TANK] ON [dbo].[RW_CORROSION_RATE_TANK]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_DAMAGE_MECHANISM]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_DAMAGE_MECHANISM] ON [dbo].[RW_DAMAGE_MECHANISM]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_EQUIPMENT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_EQUIPMENT] ON [dbo].[RW_EQUIPMENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_EXTCOR_TEMPERATURE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_EXTCOR_TEMPERATURE] ON [dbo].[RW_EXTCOR_TEMPERATURE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_EXTRA_FIELDS]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_EXTRA_FIELDS] ON [dbo].[RW_EXTRA_FIELDS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_FULL_COF]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_FULL_COF] ON [dbo].[RW_FULL_COF]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_FULL_COF_FLUID]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_FULL_COF_FLUID] ON [dbo].[RW_FULL_COF_FLUID]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_FULL_COF_HOLE_SIZE]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_FULL_COF_HOLE_SIZE] ON [dbo].[RW_FULL_COF_HOLE_SIZE]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_FULL_COF_INPUT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_FULL_COF_INPUT] ON [dbo].[RW_FULL_COF_INPUT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_FULL_FCOF]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_FULL_FCOF] ON [dbo].[RW_FULL_FCOF]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_FULL_POF]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_FULL_POF] ON [dbo].[RW_FULL_POF]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_INSPECTION_DETAIL]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_INSPECTION_DETAIL] ON [dbo].[RW_INSPECTION_DETAIL]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_LF_DETAIL]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_LF_DETAIL] ON [dbo].[RW_LF_DETAIL]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_LF_MASTER]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_LF_MASTER] ON [dbo].[RW_LF_MASTER]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_MATERIAL]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_MATERIAL] ON [dbo].[RW_MATERIAL]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_POINTS]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_POINTS] ON [dbo].[RW_POINTS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_PRD_COF_INPUT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_PRD_COF_INPUT] ON [dbo].[RW_PRD_COF_INPUT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_PRD_COMPONENT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_PRD_COMPONENT] ON [dbo].[RW_PRD_COMPONENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_PRD_COMPONENT_LINKED]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_PRD_COMPONENT_LINKED] ON [dbo].[RW_PRD_COMPONENT_LINKED]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_PRD_INSPECTION]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_PRD_INSPECTION] ON [dbo].[RW_PRD_INSPECTION]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_PRD_OVERPRESSURE_DEMAND]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_PRD_OVERPRESSURE_DEMAND] ON [dbo].[RW_PRD_OVERPRESSURE_DEMAND]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_PRD_PROTECTED_COMPONENT]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_PRD_PROTECTED_COMPONENT] ON [dbo].[RW_PRD_PROTECTED_COMPONENT]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_PRD_RISK]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_PRD_RISK] ON [dbo].[RW_PRD_RISK]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_PRIMARY_FLUID]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_PRIMARY_FLUID] ON [dbo].[RW_PRIMARY_FLUID]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_REVISION_INSPECTION]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_REVISION_INSPECTION] ON [dbo].[RW_REVISION_INSPECTION]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_RISK_TARGET]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_RISK_TARGET] ON [dbo].[RW_RISK_TARGET]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_SAFETY_FACTOR]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_SAFETY_FACTOR] ON [dbo].[RW_SAFETY_FACTOR]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_SECONDARY_FLUID]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_SECONDARY_FLUID] ON [dbo].[RW_SECONDARY_FLUID]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_rw_settings]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_rw_settings] ON [dbo].[RW_SETTINGS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_STREAM]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_STREAM] ON [dbo].[RW_STREAM]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RW_THICKNESS]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_RW_THICKNESS] ON [dbo].[RW_THICKNESS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SAFETY_FACTORS]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SAFETY_FACTORS] ON [dbo].[SAFETY_FACTORS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SITES]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SITES] ON [dbo].[SITES]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_THICKNESS_READING]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_THICKNESS_READING] ON [dbo].[THICKNESS_READING]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UNIT_DESCRIPTOR]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UNIT_DESCRIPTOR] ON [dbo].[UNIT_DESCRIPTOR]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UNITS]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UNITS] ON [dbo].[UNITS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_USER_GROUPS]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_USER_GROUPS] ON [dbo].[USER_GROUPS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_USER_PERMISSION_LIST]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_USER_PERMISSION_LIST] ON [dbo].[USER_PERMISSION_LIST]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [KEY_USER_PERMISSIONS]    Script Date: 10/29/2019 10:24:51 AM ******/
ALTER TABLE [dbo].[USER_PERMISSIONS] ADD  CONSTRAINT [KEY_USER_PERMISSIONS] UNIQUE NONCLUSTERED 
(
	[UserID] ASC,
	[Category] ASC,
	[Permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_USER_PERMISSIONS]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_USER_PERMISSIONS] ON [dbo].[USER_PERMISSIONS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_USERS]    Script Date: 10/29/2019 10:24:51 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_USERS] ON [dbo].[USERS]
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COMPONENT_DETAIL] ADD  CONSTRAINT [DF_0ED19940_COMPONENT_DETAIL_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[COMPONENT_DETAIL] ADD  CONSTRAINT [DF_0ED19940_COMPONENT_DETAIL_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[COMPONENT_MODELLING] ADD  CONSTRAINT [DF_5EB1F3E7_COMPONENT_MODELLING_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[COMPONENT_MODELLING] ADD  CONSTRAINT [DF_5EB1F3E7_COMPONENT_MODELLING_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[DM_EXPECTED_TYPE] ADD  CONSTRAINT [DF_E784683A_DM_EXPECTED_TYPE_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[DM_EXPECTED_TYPE] ADD  CONSTRAINT [DF_E784683A_DM_EXPECTED_TYPE_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[EQUIPMENT_EXTRA_FIELDS] ADD  CONSTRAINT [DF_E61F626A_EQUIPMENT_EXTRA_FIELDS_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[EQUIPMENT_EXTRA_FIELDS] ADD  CONSTRAINT [DF_E61F626A_EQUIPMENT_EXTRA_FIELDS_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION] ADD  CONSTRAINT [DF_EQUIPMENT_REVISION_IsReviewed]  DEFAULT ((0)) FOR [IsReviewed]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION] ADD  CONSTRAINT [DF_EQUIPMENT_REVISION_IsApproved]  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION] ADD  CONSTRAINT [DF_3F4D9EE3_EQUIPMENT_REVISION_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION] ADD  CONSTRAINT [DF_3F4D9EE3_EQUIPMENT_REVISION_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] ADD  CONSTRAINT [DF_EQUIPMENT_REVISION_INSPECTION_CarriedOut]  DEFAULT ((0)) FOR [CarriedOut]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] ADD  CONSTRAINT [DF_EFC554CD_EQUIPMENT_REVISION_INSPECTION_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] ADD  CONSTRAINT [DF_EFC554CD_EQUIPMENT_REVISION_INSPECTION_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE] ADD  CONSTRAINT [DF_B787C8EA_EQUIPMENT_REVISION_INSPECTION_COVERAGE_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE] ADD  CONSTRAINT [DF_B787C8EA_EQUIPMENT_REVISION_INSPECTION_COVERAGE_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP] ADD  CONSTRAINT [DF_9D9A2BA1_EXTRA_FIELDS_LOOKUP_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP] ADD  CONSTRAINT [DF_9D9A2BA1_EXTRA_FIELDS_LOOKUP_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT] ADD  CONSTRAINT [DF_6DCD04AE_EXTRA_FIELDS_LOOKUP_COMPONENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT] ADD  CONSTRAINT [DF_6DCD04AE_EXTRA_FIELDS_LOOKUP_COMPONENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[FILE_COMPONENT] ADD  CONSTRAINT [DF_3C403670_FILE_COMPONENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[FILE_COMPONENT] ADD  CONSTRAINT [DF_3C403670_FILE_COMPONENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[FILE_EQUIPMENT] ADD  CONSTRAINT [DF_D78C71C4_FILE_EQUIPMENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[FILE_EQUIPMENT] ADD  CONSTRAINT [DF_D78C71C4_FILE_EQUIPMENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[FILE_FACILITY] ADD  CONSTRAINT [DF_E10E1F44_FILE_FACILITY_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[FILE_FACILITY] ADD  CONSTRAINT [DF_E10E1F44_FILE_FACILITY_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[GENERIC_FLUID] ADD  CONSTRAINT [DF_75A8642D_GENERIC_FLUID_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[GENERIC_FLUID] ADD  CONSTRAINT [DF_75A8642D_GENERIC_FLUID_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_IsPTA]  DEFAULT ((0)) FOR [IsPTA]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_IsHTHA]  DEFAULT ((0)) FOR [IsHTHA]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_Austenitic]  DEFAULT ((0)) FOR [Austenitic]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_Temper]  DEFAULT ((0)) FOR [Temper]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_CarbonLowAlloy]  DEFAULT ((0)) FOR [CarbonLowAlloy]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_NickelBased]  DEFAULT ((0)) FOR [NickelBased]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_GENERIC_MATERIAL_ChromeMoreEqual12]  DEFAULT ((0)) FOR [ChromeMoreEqual12]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_0B9DE2E7_GENERIC_MATERIAL_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[GENERIC_MATERIAL] ADD  CONSTRAINT [DF_0B9DE2E7_GENERIC_MATERIAL_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[IMAGE_COMPONENT] ADD  CONSTRAINT [DF_0D98ED13_IMAGE_COMPONENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[IMAGE_COMPONENT] ADD  CONSTRAINT [DF_0D98ED13_IMAGE_COMPONENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[IMAGE_EQUIPMENT] ADD  CONSTRAINT [DF_3797396D_IMAGE_EQUIPMENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[IMAGE_EQUIPMENT] ADD  CONSTRAINT [DF_3797396D_IMAGE_EQUIPMENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[IMAGE_FACILITY] ADD  CONSTRAINT [DF_8B0D053C_IMAGE_FACILITY_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[IMAGE_FACILITY] ADD  CONSTRAINT [DF_8B0D053C_IMAGE_FACILITY_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE] ADD  CONSTRAINT [DF_3647A70C_INSPECTION_COVERAGE_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE] ADD  CONSTRAINT [DF_3647A70C_INSPECTION_COVERAGE_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL] ADD  CONSTRAINT [DF_3647A70C_INSPECTION_COVERAGE_DETAIL_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL] ADD  CONSTRAINT [DF_3647A70C_INSPECTION_COVERAGE_DETAIL_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[INSPECTION_DETAIL_TECHNIQUE] ADD  CONSTRAINT [DF__INSPECTIO__Cover__02FC7413]  DEFAULT ((0)) FOR [Coverage]
GO
ALTER TABLE [dbo].[INSPECTION_DETAIL_TECHNIQUE] ADD  CONSTRAINT [DF_7F55E6A8_INSPECTION_DETAIL_TECHNIQUE_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[INSPECTION_DETAIL_TECHNIQUE] ADD  CONSTRAINT [DF_7F55E6A8_INSPECTION_DETAIL_TECHNIQUE_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[INSPECTION_PLAN] ADD  CONSTRAINT [DF_B45CD793_INSPECTION_PLAN_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[INSPECTION_PLAN] ADD  CONSTRAINT [DF_B45CD793_INSPECTION_PLAN_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[ITEM_LIST_CONFIG] ADD  CONSTRAINT [DF_3C77DB65_ITEM_LIST_CONFIG_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[ITEM_LIST_CONFIG] ADD  CONSTRAINT [DF_3C77DB65_ITEM_LIST_CONFIG_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[POINTS] ADD  CONSTRAINT [DF_79597FAC_POINTS_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[POINTS] ADD  CONSTRAINT [DF_79597FAC_POINTS_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[PRD_COMPONENT_MASTER] ADD  CONSTRAINT [DF_B1E2953E_PRD_COMPONENT_MASTER_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PRD_COMPONENT_MASTER] ADD  CONSTRAINT [DF_B1E2953E_PRD_COMPONENT_MASTER_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT] ADD  CONSTRAINT [DF_9B53B128_REPORT_TEMPLATE_ASSESSMENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT] ADD  CONSTRAINT [DF_9B53B128_REPORT_TEMPLATE_ASSESSMENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT] ADD  CONSTRAINT [DF_77013026_REPORT_TEMPLATE_COMPONENT_DEFAULT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT] ADD  CONSTRAINT [DF_77013026_REPORT_TEMPLATE_COMPONENT_DEFAULT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT] ADD  CONSTRAINT [DF_4D94F99E_REPORT_TEMPLATE_EQUIPMENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT] ADD  CONSTRAINT [DF_4D94F99E_REPORT_TEMPLATE_EQUIPMENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_CF_MASTER] ADD  CONSTRAINT [DF_BFD5846B_RW_CF_MASTER_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_CF_MASTER] ADD  CONSTRAINT [DF_BFD5846B_RW_CF_MASTER_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_EXTRA_FIELDS] ADD  CONSTRAINT [DF_025227DC_RW_EXTRA_FIELDS_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_EXTRA_FIELDS] ADD  CONSTRAINT [DF_025227DC_RW_EXTRA_FIELDS_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_FULL_COF] ADD  CONSTRAINT [DF_3D9B1711_RW_FULL_COF_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_FULL_COF] ADD  CONSTRAINT [DF_3D9B1711_RW_FULL_COF_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_FULL_COF_FLUID] ADD  CONSTRAINT [DF_B856E7FE_RW_FULL_COF_FLUID_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_FULL_COF_FLUID] ADD  CONSTRAINT [DF_B856E7FE_RW_FULL_COF_FLUID_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_FULL_COF_HOLE_SIZE] ADD  CONSTRAINT [DF_239635CB_RW_FULL_COF_HOLE_SIZE_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_FULL_COF_HOLE_SIZE] ADD  CONSTRAINT [DF_239635CB_RW_FULL_COF_HOLE_SIZE_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_FULL_COF_INPUT] ADD  CONSTRAINT [DF_8A295264_RW_FULL_COF_INPUT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_FULL_COF_INPUT] ADD  CONSTRAINT [DF_8A295264_RW_FULL_COF_INPUT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_FULL_COF_TANK] ADD  CONSTRAINT [DF_700255FF_RW_FULL_COF_TANK_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_FULL_COF_TANK] ADD  CONSTRAINT [DF_700255FF_RW_FULL_COF_TANK_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_FULL_FCOF] ADD  CONSTRAINT [DF_RW_FULL_FCOF_AIL]  DEFAULT ((0)) FOR [AIL]
GO
ALTER TABLE [dbo].[RW_FULL_FCOF] ADD  CONSTRAINT [DF_92C4E3A4_RW_FULL_FCOF_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_FULL_FCOF] ADD  CONSTRAINT [DF_92C4E3A4_RW_FULL_FCOF_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_INSPECTION_DETAIL] ADD  CONSTRAINT [DF_3637A70C_INSPECTION_COVERAGE_DETAIL_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_INSPECTION_DETAIL] ADD  CONSTRAINT [DF_3257A70C_RW_INSPECTION_DETAIL_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_LF_DETAIL] ADD  CONSTRAINT [DF_RW_LF_DETAIL_IsEL]  DEFAULT ((0)) FOR [IsEL]
GO
ALTER TABLE [dbo].[RW_LF_DETAIL] ADD  CONSTRAINT [DF_F2D7C887_RW_LF_DETAIL_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_LF_DETAIL] ADD  CONSTRAINT [DF_F2D7C887_RW_LF_DETAIL_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_LF_MASTER] ADD  CONSTRAINT [DF_948BAB73_RW_LF_MASTER_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_LF_MASTER] ADD  CONSTRAINT [DF_948BAB73_RW_LF_MASTER_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_POINTS] ADD  CONSTRAINT [DF_A43A97CC_RW_POINTS_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_POINTS] ADD  CONSTRAINT [DF_A43A97CC_RW_POINTS_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_PRD_COF_INPUT] ADD  CONSTRAINT [DF_CA58EB88_RW_PRD_COF_INPUT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_PRD_COF_INPUT] ADD  CONSTRAINT [DF_CA58EB88_RW_PRD_COF_INPUT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT] ADD  CONSTRAINT [DF_RW_PRD_COMPONENT_SoftSeat]  DEFAULT ((0)) FOR [SoftSeat]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT] ADD  CONSTRAINT [DF_RW_PRD_COMPONENT_PipingVibration]  DEFAULT ((0)) FOR [PipingVibration]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT] ADD  CONSTRAINT [DF_RW_PRD_COMPONENT_ExcessiveActuation]  DEFAULT ((0)) FOR [ExcessiveActuation]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT] ADD  CONSTRAINT [DF_RW_PRD_COMPONENT_Chatter]  DEFAULT ((0)) FOR [Chatter]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT] ADD  CONSTRAINT [DF_RW_PRD_COMPONENT_PulsatingCyclical]  DEFAULT ((0)) FOR [PulsatingCyclical]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT] ADD  CONSTRAINT [DF_DADA4760_RW_PRD_COMPONENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT] ADD  CONSTRAINT [DF_DADA4760_RW_PRD_COMPONENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT_LINKED] ADD  CONSTRAINT [DF_D1A52CDC_RW_PRD_COMPONENT_LINKED_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT_LINKED] ADD  CONSTRAINT [DF_D1A52CDC_RW_PRD_COMPONENT_LINKED_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_PRD_INSPECTION] ADD  CONSTRAINT [DF_RW_PRD_INSECTION_Overhaul]  DEFAULT ((0)) FOR [Overhaul]
GO
ALTER TABLE [dbo].[RW_PRD_INSPECTION] ADD  CONSTRAINT [DF_RW_PRD_INSECTION_IsPipingPlugged]  DEFAULT ((0)) FOR [IsPipingPlugged]
GO
ALTER TABLE [dbo].[RW_PRD_INSPECTION] ADD  CONSTRAINT [DF_4F9DC110_RW_PRD_INSPECTION_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_PRD_INSPECTION] ADD  CONSTRAINT [DF_4F9DC110_RW_PRD_INSPECTION_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_PRD_OVERPRESSURE_DEMAND] ADD  CONSTRAINT [DF_70368141_RW_PRD_OVERPRESSURE_DEMAND_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_PRD_OVERPRESSURE_DEMAND] ADD  CONSTRAINT [DF_70368141_RW_PRD_OVERPRESSURE_DEMAND_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_PRD_PROTECTED_COMPONENT] ADD  CONSTRAINT [DF_RW_PRD_PROTECTED_COMPONENT_EquipmentRiskAvailable]  DEFAULT ((0)) FOR [EquipmentRiskAvailable]
GO
ALTER TABLE [dbo].[RW_PRD_PROTECTED_COMPONENT] ADD  CONSTRAINT [DF_RW_PRD_PROTECTED_COMPONENT_UseEquipmentRisk]  DEFAULT ((0)) FOR [UseComponentDF]
GO
ALTER TABLE [dbo].[RW_PRD_PROTECTED_COMPONENT] ADD  CONSTRAINT [DF_39139489_RW_PRD_PROTECTED_COMPONENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_PRD_PROTECTED_COMPONENT] ADD  CONSTRAINT [DF_39139489_RW_PRD_PROTECTED_COMPONENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_PRD_RISK] ADD  CONSTRAINT [DF_EE1D716E_RW_PRD_RISK_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_PRD_RISK] ADD  CONSTRAINT [DF_EE1D716E_RW_PRD_RISK_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_PRIMARY_FLUID] ADD  CONSTRAINT [DF_D4F81868_RW_PRIMARY_FLUID_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_PRIMARY_FLUID] ADD  CONSTRAINT [DF_D4F81868_RW_PRIMARY_FLUID_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION] ADD  CONSTRAINT [DF_2F5666E8_RW_REVISION_INSPECTION_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION] ADD  CONSTRAINT [DF_2F5666E8_RW_REVISION_INSPECTION_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_RISK_TARGET] ADD  CONSTRAINT [DF_BA882196_RW_RISK_TARGET_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_RISK_TARGET] ADD  CONSTRAINT [DF_BA882196_RW_RISK_TARGET_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_SAFETY_FACTOR] ADD  CONSTRAINT [DF_C7548A2D_RW_SAFETY_FACTOR_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_SAFETY_FACTOR] ADD  CONSTRAINT [DF_C7548A2D_RW_SAFETY_FACTOR_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_SECONDARY_FLUID] ADD  CONSTRAINT [DF_0E4227CB_RW_SECONDARY_FLUID_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_SECONDARY_FLUID] ADD  CONSTRAINT [DF_0E4227CB_RW_SECONDARY_FLUID_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[RW_THICKNESS] ADD  CONSTRAINT [DF_RW_THICKNESS_Valid]  DEFAULT ((0)) FOR [ValidReading]
GO
ALTER TABLE [dbo].[RW_THICKNESS] ADD  CONSTRAINT [DF_A5EB98BE_RW_THICKNESS_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RW_THICKNESS] ADD  CONSTRAINT [DF_A5EB98BE_RW_THICKNESS_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[THICKNESS_READING] ADD  CONSTRAINT [DF_THICKNESS_READING_ValidReading]  DEFAULT ((0)) FOR [ValidReading]
GO
ALTER TABLE [dbo].[THICKNESS_READING] ADD  CONSTRAINT [DF_372690BE_THICKNESS_READING_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[THICKNESS_READING] ADD  CONSTRAINT [DF_372690BE_THICKNESS_READING_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[USER_GROUPS] ADD  CONSTRAINT [DF_42CE7BC9_USER_GROUPS_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[USER_GROUPS] ADD  CONSTRAINT [DF_42CE7BC9_USER_GROUPS_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[USER_PERMISSION_LIST] ADD  CONSTRAINT [DF_03381E47_USER_PERMISSION_LIST_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[USER_PERMISSION_LIST] ADD  CONSTRAINT [DF_03381E47_USER_PERMISSION_LIST_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[USER_PERMISSIONS] ADD  CONSTRAINT [DF_FFE19599_USER_PERMISSIONS_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[USER_PERMISSIONS] ADD  CONSTRAINT [DF_FFE19599_USER_PERMISSIONS_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
GO
ALTER TABLE [dbo].[COMPONENT_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_COMPONENT_DETAIL_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[COMPONENT_DETAIL] CHECK CONSTRAINT [FK_COMPONENT_DETAIL_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[COMPONENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_COMPONENT_MASTER_API_COMPONENT_TYPE] FOREIGN KEY([APIComponentTypeID])
REFERENCES [dbo].[API_COMPONENT_TYPE] ([APIComponentTypeID])
GO
ALTER TABLE [dbo].[COMPONENT_MASTER] CHECK CONSTRAINT [FK_COMPONENT_MASTER_API_COMPONENT_TYPE]
GO
ALTER TABLE [dbo].[COMPONENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_COMPONENT_MASTER_COMPONENT_TYPE] FOREIGN KEY([ComponentTypeID])
REFERENCES [dbo].[COMPONENT_TYPE] ([ComponentTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[COMPONENT_MASTER] CHECK CONSTRAINT [FK_COMPONENT_MASTER_COMPONENT_TYPE]
GO
ALTER TABLE [dbo].[COMPONENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_COMPONENT_MASTER_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[COMPONENT_MASTER] CHECK CONSTRAINT [FK_COMPONENT_MASTER_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[COMPONENT_MODELLING]  WITH CHECK ADD  CONSTRAINT [FK_COMPONENT_MODELLING_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[COMPONENT_MODELLING] CHECK CONSTRAINT [FK_COMPONENT_MODELLING_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[DM_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_DM_ITEMS_DM_CATEGORY] FOREIGN KEY([DMCategoryID])
REFERENCES [dbo].[DM_CATEGORY] ([DMCategoryID])
GO
ALTER TABLE [dbo].[DM_ITEMS] CHECK CONSTRAINT [FK_DM_ITEMS_DM_CATEGORY]
GO
ALTER TABLE [dbo].[EQUIPMENT_EXTRA_FIELDS]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_EXTRA_FIELDS_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_EXTRA_FIELDS] CHECK CONSTRAINT [FK_EQUIPMENT_EXTRA_FIELDS_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_MASTER_DESIGN_CODE1] FOREIGN KEY([DesignCodeID])
REFERENCES [dbo].[DESIGN_CODE] ([DesignCodeID])
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER] CHECK CONSTRAINT [FK_EQUIPMENT_MASTER_DESIGN_CODE1]
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_MASTER_EQUIPMENT_TYPE] FOREIGN KEY([EquipmentTypeID])
REFERENCES [dbo].[EQUIPMENT_TYPE] ([EquipmentTypeID])
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER] CHECK CONSTRAINT [FK_EQUIPMENT_MASTER_EQUIPMENT_TYPE]
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_MASTER_FACILITY] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[FACILITY] ([FacilityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER] CHECK CONSTRAINT [FK_EQUIPMENT_MASTER_FACILITY]
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_MASTER_MANUFACTURER] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[MANUFACTURER] ([ManufacturerID])
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER] CHECK CONSTRAINT [FK_EQUIPMENT_MASTER_MANUFACTURER]
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_MASTER_SITES1] FOREIGN KEY([SiteID])
REFERENCES [dbo].[SITES] ([SiteID])
GO
ALTER TABLE [dbo].[EQUIPMENT_MASTER] CHECK CONSTRAINT [FK_EQUIPMENT_MASTER_SITES1]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_REVISION_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION] CHECK CONSTRAINT [FK_EQUIPMENT_REVISION_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_DM_ITEMS] FOREIGN KEY([DMItemID])
REFERENCES [dbo].[DM_ITEMS] ([DMItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] CHECK CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_DM_ITEMS]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_EQUIPMENT_REVISION] FOREIGN KEY([RevisionID])
REFERENCES [dbo].[EQUIPMENT_REVISION] ([RevisionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] CHECK CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_EQUIPMENT_REVISION]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_EQUIPMENT_REVISION_INSPECTION] FOREIGN KEY([RevisionID], [CoverageDetailID])
REFERENCES [dbo].[EQUIPMENT_REVISION_INSPECTION] ([RevisionID], [CoverageDetailID])
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] CHECK CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_EQUIPMENT_REVISION_INSPECTION]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_IM_TYPE] FOREIGN KEY([IMTypeID])
REFERENCES [dbo].[IM_TYPE] ([IMTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION] CHECK CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_IM_TYPE]
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE]  WITH CHECK ADD  CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_COVERAGE_EQUIPMENT_REVISION] FOREIGN KEY([RevisionID])
REFERENCES [dbo].[EQUIPMENT_REVISION] ([RevisionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE] CHECK CONSTRAINT [FK_EQUIPMENT_REVISION_INSPECTION_COVERAGE_EQUIPMENT_REVISION]
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP]  WITH CHECK ADD  CONSTRAINT [FK_EXTRA_FIELDS_LOOKUP_EXTRA_FIELDS_SETTING] FOREIGN KEY([ExtraFieldID])
REFERENCES [dbo].[EXTRA_FIELDS_SETTING] ([ExtraFieldID])
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP] CHECK CONSTRAINT [FK_EXTRA_FIELDS_LOOKUP_EXTRA_FIELDS_SETTING]
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_EXTRA_FIELDS_LOOKUP_COMPONENT_EXTRA_FIELDS_SETTING_COMPONENT] FOREIGN KEY([ExtraFieldID])
REFERENCES [dbo].[EXTRA_FIELDS_SETTING_COMPONENT] ([ExtraFieldID])
GO
ALTER TABLE [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT] CHECK CONSTRAINT [FK_EXTRA_FIELDS_LOOKUP_COMPONENT_EXTRA_FIELDS_SETTING_COMPONENT]
GO
ALTER TABLE [dbo].[FACILITY]  WITH CHECK ADD  CONSTRAINT [FK_FACILITY_SITES] FOREIGN KEY([SiteID])
REFERENCES [dbo].[SITES] ([SiteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FACILITY] CHECK CONSTRAINT [FK_FACILITY_SITES]
GO
ALTER TABLE [dbo].[FACILITY_RISK_TARGET]  WITH CHECK ADD  CONSTRAINT [FK_FACILITY_RISK_TARGET_FACILITY] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[FACILITY] ([FacilityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FACILITY_RISK_TARGET] CHECK CONSTRAINT [FK_FACILITY_RISK_TARGET_FACILITY]
GO
ALTER TABLE [dbo].[FILE_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_FILE_COMPONENT_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FILE_COMPONENT] CHECK CONSTRAINT [FK_FILE_COMPONENT_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[FILE_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_FILE_EQUIPMENT_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FILE_EQUIPMENT] CHECK CONSTRAINT [FK_FILE_EQUIPMENT_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[FILE_FACILITY]  WITH CHECK ADD  CONSTRAINT [FK_FILE_FACILITY_FACILITY] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[FACILITY] ([FacilityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FILE_FACILITY] CHECK CONSTRAINT [FK_FILE_FACILITY_FACILITY]
GO
ALTER TABLE [dbo].[IM_TYPE]  WITH CHECK ADD  CONSTRAINT [FK_IM_TYPE_IM_ITEMS] FOREIGN KEY([IMItemID])
REFERENCES [dbo].[IM_ITEMS] ([IMItemID])
GO
ALTER TABLE [dbo].[IM_TYPE] CHECK CONSTRAINT [FK_IM_TYPE_IM_ITEMS]
GO
ALTER TABLE [dbo].[IMAGE_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_IMAGE_COMPONENT_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IMAGE_COMPONENT] CHECK CONSTRAINT [FK_IMAGE_COMPONENT_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[IMAGE_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_IMAGE_EQUIPMENT_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IMAGE_EQUIPMENT] CHECK CONSTRAINT [FK_IMAGE_EQUIPMENT_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[IMAGE_FACILITY]  WITH CHECK ADD  CONSTRAINT [FK_IMAGE_FACILITY_FACILITY] FOREIGN KEY([FacilityID])
REFERENCES [dbo].[FACILITY] ([FacilityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IMAGE_FACILITY] CHECK CONSTRAINT [FK_IMAGE_FACILITY_FACILITY]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_COVERAGE_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE] CHECK CONSTRAINT [FK_INSPECTION_COVERAGE_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_COVERAGE_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE] CHECK CONSTRAINT [FK_INSPECTION_COVERAGE_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_COVERAGE_INSPECTION_PLAN] FOREIGN KEY([PlanID])
REFERENCES [dbo].[INSPECTION_PLAN] ([PlanID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE] CHECK CONSTRAINT [FK_INSPECTION_COVERAGE_INSPECTION_PLAN]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_COVERAGE_DETAIL_DM_ITEMS] FOREIGN KEY([DMItemID])
REFERENCES [dbo].[DM_ITEMS] ([DMItemID])
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL] CHECK CONSTRAINT [FK_INSPECTION_COVERAGE_DETAIL_DM_ITEMS]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_COVERAGE_DETAIL_INSPECTION_COVERAGE] FOREIGN KEY([CoverageID])
REFERENCES [dbo].[INSPECTION_COVERAGE] ([ID])
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_DETAIL] CHECK CONSTRAINT [FK_INSPECTION_COVERAGE_DETAIL_INSPECTION_COVERAGE]
GO
ALTER TABLE [dbo].[INSPECTION_DETAIL_TECHNIQUE]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_DETAIL_TECHNIQUE_INSPECTION_COVERAGE] FOREIGN KEY([CoverageID])
REFERENCES [dbo].[INSPECTION_COVERAGE] ([ID])
GO
ALTER TABLE [dbo].[INSPECTION_DETAIL_TECHNIQUE] CHECK CONSTRAINT [FK_INSPECTION_DETAIL_TECHNIQUE_INSPECTION_COVERAGE]
GO
ALTER TABLE [dbo].[INSPECTION_DM_RULE]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_DM_RULE_DM] FOREIGN KEY([DMItemID])
REFERENCES [dbo].[DM_ITEMS] ([DMItemID])
GO
ALTER TABLE [dbo].[INSPECTION_DM_RULE] CHECK CONSTRAINT [FK_INSPECTION_DM_RULE_DM]
GO
ALTER TABLE [dbo].[INSPECTION_DM_RULE]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_DM_RULE_IM_ITEM] FOREIGN KEY([IMItemID])
REFERENCES [dbo].[IM_ITEMS] ([IMItemID])
GO
ALTER TABLE [dbo].[INSPECTION_DM_RULE] CHECK CONSTRAINT [FK_INSPECTION_DM_RULE_IM_ITEM]
GO
ALTER TABLE [dbo].[INSPECTION_DM_RULE]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_DM_RULE_IM_TYPE] FOREIGN KEY([IMTypeID])
REFERENCES [dbo].[IM_TYPE] ([IMTypeID])
GO
ALTER TABLE [dbo].[INSPECTION_DM_RULE] CHECK CONSTRAINT [FK_INSPECTION_DM_RULE_IM_TYPE]
GO
ALTER TABLE [dbo].[POINTS]  WITH CHECK ADD  CONSTRAINT [FK_POINTS_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POINTS] CHECK CONSTRAINT [FK_POINTS_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[PRD_COMPONENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_PRD_COMPONENT_MASTER_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
GO
ALTER TABLE [dbo].[PRD_COMPONENT_MASTER] CHECK CONSTRAINT [FK_PRD_COMPONENT_MASTER_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[PRD_COMPONENT_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_PRD_COMPONENT_MASTER_PRD_TYPE] FOREIGN KEY([PRDTypeID])
REFERENCES [dbo].[PRD_TYPE] ([ID])
GO
ALTER TABLE [dbo].[PRD_COMPONENT_MASTER] CHECK CONSTRAINT [FK_PRD_COMPONENT_MASTER_PRD_TYPE]
GO
ALTER TABLE [dbo].[PRD_INSPECTION_CONFIDENCE]  WITH CHECK ADD  CONSTRAINT [FK_PRD_INSPECTION_CONFIDENCE_PRD_INSPECTION_EFFECTIVENESS] FOREIGN KEY([EffectivenessID])
REFERENCES [dbo].[PRD_INSPECTION_EFFECTIVENESS] ([ID])
GO
ALTER TABLE [dbo].[PRD_INSPECTION_CONFIDENCE] CHECK CONSTRAINT [FK_PRD_INSPECTION_CONFIDENCE_PRD_INSPECTION_EFFECTIVENESS]
GO
ALTER TABLE [dbo].[PRD_INSPECTION_CONFIDENCE]  WITH CHECK ADD  CONSTRAINT [FK_PRD_INSPECTION_CONFIDENCE_PRD_INSPECTION_RESULT] FOREIGN KEY([InspectionResultID])
REFERENCES [dbo].[PRD_INSPECTION_RESULT] ([ID])
GO
ALTER TABLE [dbo].[PRD_INSPECTION_CONFIDENCE] CHECK CONSTRAINT [FK_PRD_INSPECTION_CONFIDENCE_PRD_INSPECTION_RESULT]
GO
ALTER TABLE [dbo].[PRD_WEIBULL_PARAMETER]  WITH NOCHECK ADD  CONSTRAINT [FK_PRD_WEIBULL_PARAMETER_PRD_FAILURE_MODE] FOREIGN KEY([FalureModeID])
REFERENCES [dbo].[PRD_FAILURE_MODE] ([ID])
GO
ALTER TABLE [dbo].[PRD_WEIBULL_PARAMETER] CHECK CONSTRAINT [FK_PRD_WEIBULL_PARAMETER_PRD_FAILURE_MODE]
GO
ALTER TABLE [dbo].[PRD_WEIBULL_PARAMETER]  WITH CHECK ADD  CONSTRAINT [FK_PRD_WEIBULL_PARAMETER_PRD_SERVICE_SEVERITY] FOREIGN KEY([ServiceSeverityID])
REFERENCES [dbo].[PRD_SERVICE_SEVERITY] ([ID])
GO
ALTER TABLE [dbo].[PRD_WEIBULL_PARAMETER] CHECK CONSTRAINT [FK_PRD_WEIBULL_PARAMETER_PRD_SERVICE_SEVERITY]
GO
ALTER TABLE [dbo].[PRD_WEIBULL_PARAMETER]  WITH NOCHECK ADD  CONSTRAINT [FK_PRD_WEIBULL_PARAMETER_PRD_TYPE] FOREIGN KEY([PRDTypeID])
REFERENCES [dbo].[PRD_TYPE] ([ID])
GO
ALTER TABLE [dbo].[PRD_WEIBULL_PARAMETER] CHECK CONSTRAINT [FK_PRD_WEIBULL_PARAMETER_PRD_TYPE]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT]  WITH CHECK ADD  CONSTRAINT [FK_REPORT_TEMPLATE_ASSESSMENT_REPORT_TEMPLATE] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[REPORT_TEMPLATE] ([TemplateID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT] CHECK CONSTRAINT [FK_REPORT_TEMPLATE_ASSESSMENT_REPORT_TEMPLATE]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT]  WITH CHECK ADD  CONSTRAINT [FK_REPORT_TEMPLATE_ASSESSMENT_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_ASSESSMENT] CHECK CONSTRAINT [FK_REPORT_TEMPLATE_ASSESSMENT_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT]  WITH CHECK ADD  CONSTRAINT [FK_REPORT_TEMPLATE_COMPONENT_DEFAULT_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT] CHECK CONSTRAINT [FK_REPORT_TEMPLATE_COMPONENT_DEFAULT_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT]  WITH CHECK ADD  CONSTRAINT [FK_REPORT_TEMPLATE_COMPONENT_DEFAULT_REPORT_TEMPLATE] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[REPORT_TEMPLATE] ([TemplateID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT] CHECK CONSTRAINT [FK_REPORT_TEMPLATE_COMPONENT_DEFAULT_REPORT_TEMPLATE]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_REPORT_TEMPLATE_EQUIPMENT_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT] CHECK CONSTRAINT [FK_REPORT_TEMPLATE_EQUIPMENT_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_REPORT_TEMPLATE_EQUIPMENT_REPORT_TEMPLATE] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[REPORT_TEMPLATE] ([TemplateID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPORT_TEMPLATE_EQUIPMENT] CHECK CONSTRAINT [FK_REPORT_TEMPLATE_EQUIPMENT_REPORT_TEMPLATE]
GO
ALTER TABLE [dbo].[RW_ASSESSMENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_ASSESSMENT_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_ASSESSMENT] CHECK CONSTRAINT [FK_RW_ASSESSMENT_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[RW_ASSESSMENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_ASSESSMENT_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
GO
ALTER TABLE [dbo].[RW_ASSESSMENT] CHECK CONSTRAINT [FK_RW_ASSESSMENT_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[RW_CF_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_RW_CF_MASTER_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_CF_MASTER] CHECK CONSTRAINT [FK_RW_CF_MASTER_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_COATING]  WITH CHECK ADD  CONSTRAINT [FK_RW_COATING_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_COATING] CHECK CONSTRAINT [FK_RW_COATING_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_COMPONENT_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_COMPONENT] CHECK CONSTRAINT [FK_RW_COMPONENT_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_CORROSION_RATE_TANK]  WITH CHECK ADD  CONSTRAINT [FK_RW_CORROSION_RATE_TANK_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_CORROSION_RATE_TANK] CHECK CONSTRAINT [FK_RW_CORROSION_RATE_TANK_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_DAMAGE_MECHANISM]  WITH CHECK ADD  CONSTRAINT [FK_RW_DAMAGE_MECHANISM_DM_ITEMS] FOREIGN KEY([DMItemID])
REFERENCES [dbo].[DM_ITEMS] ([DMItemID])
GO
ALTER TABLE [dbo].[RW_DAMAGE_MECHANISM] CHECK CONSTRAINT [FK_RW_DAMAGE_MECHANISM_DM_ITEMS]
GO
ALTER TABLE [dbo].[RW_DAMAGE_MECHANISM]  WITH CHECK ADD  CONSTRAINT [FK_RW_DAMAGE_MECHANISM_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_DAMAGE_MECHANISM] CHECK CONSTRAINT [FK_RW_DAMAGE_MECHANISM_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_EQUIPMENT_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_EQUIPMENT] CHECK CONSTRAINT [FK_RW_EQUIPMENT_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_EXTCOR_TEMPERATURE]  WITH CHECK ADD  CONSTRAINT [FK_RW_EXTCOR_TEMPERATURE_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_EXTCOR_TEMPERATURE] CHECK CONSTRAINT [FK_RW_EXTCOR_TEMPERATURE_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_EXTRA_FIELDS]  WITH CHECK ADD  CONSTRAINT [FK_RW_EXTRA_FIELDS_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_EXTRA_FIELDS] CHECK CONSTRAINT [FK_RW_EXTRA_FIELDS_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_COF]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_COF_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_COF] CHECK CONSTRAINT [FK_RW_FULL_COF_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_COF_FLUID]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_COF_FLUID_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_COF_FLUID] CHECK CONSTRAINT [FK_RW_FULL_COF_FLUID_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_COF_HOLE_SIZE]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_COF_HOLE_SIZE_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_COF_HOLE_SIZE] CHECK CONSTRAINT [FK_RW_FULL_COF_HOLE_SIZE_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_COF_INPUT]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_COF_INPUT_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_COF_INPUT] CHECK CONSTRAINT [FK_RW_FULL_COF_INPUT_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_COF_TANK]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_COF_TANK_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_COF_TANK] CHECK CONSTRAINT [FK_RW_FULL_COF_TANK_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_FCOF]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_FCOF_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_FCOF] CHECK CONSTRAINT [FK_RW_FULL_FCOF_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_FULL_POF]  WITH CHECK ADD  CONSTRAINT [FK_RW_FULL_POF_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_FULL_POF] CHECK CONSTRAINT [FK_RW_FULL_POF_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_INSPECTION_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_RW_INSPECTION_DETAIL_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
GO
ALTER TABLE [dbo].[RW_INSPECTION_DETAIL] CHECK CONSTRAINT [FK_RW_INSPECTION_DETAIL_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[RW_INSPECTION_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_RW_INSPECTION_DETAIL_DM_ITEMS] FOREIGN KEY([DMItemID])
REFERENCES [dbo].[DM_ITEMS] ([DMItemID])
GO
ALTER TABLE [dbo].[RW_INSPECTION_DETAIL] CHECK CONSTRAINT [FK_RW_INSPECTION_DETAIL_DM_ITEMS]
GO
ALTER TABLE [dbo].[RW_INSPECTION_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_RW_INSPECTION_DETAIL_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
GO
ALTER TABLE [dbo].[RW_INSPECTION_DETAIL] CHECK CONSTRAINT [FK_RW_INSPECTION_DETAIL_EQUIPMENT_MASTER]
GO
ALTER TABLE [dbo].[RW_INSPECTION_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_RW_INSPECTION_DETAIL_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_INSPECTION_DETAIL] CHECK CONSTRAINT [FK_RW_INSPECTION_DETAIL_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_LF_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_RW_LF_DETAIL_DM_ITEMS] FOREIGN KEY([DMItemID])
REFERENCES [dbo].[DM_ITEMS] ([DMItemID])
GO
ALTER TABLE [dbo].[RW_LF_DETAIL] CHECK CONSTRAINT [FK_RW_LF_DETAIL_DM_ITEMS]
GO
ALTER TABLE [dbo].[RW_LF_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_RW_LF_DETAIL_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_LF_DETAIL] CHECK CONSTRAINT [FK_RW_LF_DETAIL_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_LF_MASTER]  WITH CHECK ADD  CONSTRAINT [FK_RW_LF_MASTER_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_LF_MASTER] CHECK CONSTRAINT [FK_RW_LF_MASTER_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_MATERIAL]  WITH CHECK ADD  CONSTRAINT [FK_RW_MATERIAL_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_MATERIAL] CHECK CONSTRAINT [FK_RW_MATERIAL_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_POINTS]  WITH CHECK ADD  CONSTRAINT [FK_RW_POINTS_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_POINTS] CHECK CONSTRAINT [FK_RW_POINTS_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_PRD_COF_INPUT]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_COF_INPUT_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_PRD_COF_INPUT] CHECK CONSTRAINT [FK_RW_PRD_COF_INPUT_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_COMPONENT_PRD_DISCHARGE_LOCATION] FOREIGN KEY([DischargeLocationID])
REFERENCES [dbo].[PRD_DISCHARGE_LOCATION] ([ID])
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT] CHECK CONSTRAINT [FK_RW_PRD_COMPONENT_PRD_DISCHARGE_LOCATION]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_COMPONENT_PRD_SERVICE_SEVERITY] FOREIGN KEY([FailServiceSeverityID])
REFERENCES [dbo].[PRD_SERVICE_SEVERITY] ([ID])
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT] CHECK CONSTRAINT [FK_RW_PRD_COMPONENT_PRD_SERVICE_SEVERITY]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_COMPONENT_PRD_SERVICE_SEVERITY1] FOREIGN KEY([LeakServiceSeverityID])
REFERENCES [dbo].[PRD_SERVICE_SEVERITY] ([ID])
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT] CHECK CONSTRAINT [FK_RW_PRD_COMPONENT_PRD_SERVICE_SEVERITY1]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_COMPONENT_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT] CHECK CONSTRAINT [FK_RW_PRD_COMPONENT_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT_LINKED]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_COMPONENT_LINKED_COMPONENT_MASTER] FOREIGN KEY([ComponentLinkedID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT_LINKED] CHECK CONSTRAINT [FK_RW_PRD_COMPONENT_LINKED_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT_LINKED]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_COMPONENT_LINKED_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_PRD_COMPONENT_LINKED] CHECK CONSTRAINT [FK_RW_PRD_COMPONENT_LINKED_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_PRD_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_INSPECTION_PRD_INSPECTION_EFFECTIVENESS] FOREIGN KEY([InspectionResultID])
REFERENCES [dbo].[PRD_INSPECTION_EFFECTIVENESS] ([ID])
GO
ALTER TABLE [dbo].[RW_PRD_INSPECTION] CHECK CONSTRAINT [FK_RW_PRD_INSPECTION_PRD_INSPECTION_EFFECTIVENESS]
GO
ALTER TABLE [dbo].[RW_PRD_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_INSPECTION_PRD_INSPECTION_RESULT] FOREIGN KEY([InspectionResultID])
REFERENCES [dbo].[PRD_INSPECTION_RESULT] ([ID])
GO
ALTER TABLE [dbo].[RW_PRD_INSPECTION] CHECK CONSTRAINT [FK_RW_PRD_INSPECTION_PRD_INSPECTION_RESULT]
GO
ALTER TABLE [dbo].[RW_PRD_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_INSPECTION_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_PRD_INSPECTION] CHECK CONSTRAINT [FK_RW_PRD_INSPECTION_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_PRD_OVERPRESSURE_DEMAND]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_OVERPRESSURE_DEMAND_PRD_OVERPRESSURE_DEMAND] FOREIGN KEY([DemandCaseID])
REFERENCES [dbo].[PRD_OVERPRESSURE_DEMAND] ([ID])
GO
ALTER TABLE [dbo].[RW_PRD_OVERPRESSURE_DEMAND] CHECK CONSTRAINT [FK_RW_PRD_OVERPRESSURE_DEMAND_PRD_OVERPRESSURE_DEMAND]
GO
ALTER TABLE [dbo].[RW_PRD_OVERPRESSURE_DEMAND]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_OVERPRESSURE_DEMAND_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_PRD_OVERPRESSURE_DEMAND] CHECK CONSTRAINT [FK_RW_PRD_OVERPRESSURE_DEMAND_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_PRD_PROTECTED_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_PROTECTED_COMPONENT_COMPONENT_MASTER] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[COMPONENT_MASTER] ([ComponentID])
GO
ALTER TABLE [dbo].[RW_PRD_PROTECTED_COMPONENT] CHECK CONSTRAINT [FK_RW_PRD_PROTECTED_COMPONENT_COMPONENT_MASTER]
GO
ALTER TABLE [dbo].[RW_PRD_PROTECTED_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_PROTECTED_COMPONENT_PRD_DF_CLASSES] FOREIGN KEY([DFClassID])
REFERENCES [dbo].[PRD_DF_CLASSES] ([ID])
GO
ALTER TABLE [dbo].[RW_PRD_PROTECTED_COMPONENT] CHECK CONSTRAINT [FK_RW_PRD_PROTECTED_COMPONENT_PRD_DF_CLASSES]
GO
ALTER TABLE [dbo].[RW_PRD_PROTECTED_COMPONENT]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_PROTECTED_COMPONENT_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_PRD_PROTECTED_COMPONENT] CHECK CONSTRAINT [FK_RW_PRD_PROTECTED_COMPONENT_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_PRD_RISK]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRD_RISK_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_PRD_RISK] CHECK CONSTRAINT [FK_RW_PRD_RISK_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_PRIMARY_FLUID]  WITH CHECK ADD  CONSTRAINT [FK_RW_PRIMARY_FLUID_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_PRIMARY_FLUID] CHECK CONSTRAINT [FK_RW_PRIMARY_FLUID_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_RW_REVISION_INSPECTION_DM_ITEMS] FOREIGN KEY([DMItemID])
REFERENCES [dbo].[DM_ITEMS] ([DMItemID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION] CHECK CONSTRAINT [FK_RW_REVISION_INSPECTION_DM_ITEMS]
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_RW_REVISION_INSPECTION_IM_TYPE] FOREIGN KEY([IMTypeID])
REFERENCES [dbo].[IM_TYPE] ([IMTypeID])
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION] CHECK CONSTRAINT [FK_RW_REVISION_INSPECTION_IM_TYPE]
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION]  WITH CHECK ADD  CONSTRAINT [FK_RW_REVISION_INSPECTION_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_REVISION_INSPECTION] CHECK CONSTRAINT [FK_RW_REVISION_INSPECTION_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_RISK_TARGET]  WITH CHECK ADD  CONSTRAINT [FK_RW_RISK_TARGET_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_RISK_TARGET] CHECK CONSTRAINT [FK_RW_RISK_TARGET_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_SAFETY_FACTOR]  WITH CHECK ADD  CONSTRAINT [FK_RW_SAFETY_FACTOR_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_SAFETY_FACTOR] CHECK CONSTRAINT [FK_RW_SAFETY_FACTOR_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_SECONDARY_FLUID]  WITH CHECK ADD  CONSTRAINT [FK_RW_SECONDARY_FLUID_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_SECONDARY_FLUID] CHECK CONSTRAINT [FK_RW_SECONDARY_FLUID_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_STREAM]  WITH CHECK ADD  CONSTRAINT [FK_RW_STREAM_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_STREAM] CHECK CONSTRAINT [FK_RW_STREAM_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_THICKNESS]  WITH CHECK ADD  CONSTRAINT [FK_RW_THICKNESS_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
GO
ALTER TABLE [dbo].[RW_THICKNESS] CHECK CONSTRAINT [FK_RW_THICKNESS_RW_ASSESSMENT]
GO
ALTER TABLE [dbo].[RW_THICKNESS]  WITH CHECK ADD  CONSTRAINT [FK_RW_THICKNESS_RW_POINTS] FOREIGN KEY([PointID])
REFERENCES [dbo].[RW_POINTS] ([PointID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_THICKNESS] CHECK CONSTRAINT [FK_RW_THICKNESS_RW_POINTS]
GO
ALTER TABLE [dbo].[THICKNESS_READING]  WITH CHECK ADD  CONSTRAINT [FK_THICKNESS_READING_POINTS] FOREIGN KEY([PointID])
REFERENCES [dbo].[POINTS] ([PointID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[THICKNESS_READING] CHECK CONSTRAINT [FK_THICKNESS_READING_POINTS]
GO
ALTER TABLE [dbo].[USER_PERMISSIONS]  WITH CHECK ADD  CONSTRAINT [FK_USER_PERMISSIONS_USERS] FOREIGN KEY([UserID])
REFERENCES [dbo].[USERS] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[USER_PERMISSIONS] CHECK CONSTRAINT [FK_USER_PERMISSIONS_USERS]
GO
USE [master]
GO
ALTER DATABASE [rbi] SET  READ_WRITE 
GO
