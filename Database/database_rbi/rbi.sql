USE [rbi]
GO
/****** Object:  Table [dbo].[API_COMPONENT_TYPE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[COF_FLUID]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COF_FLUID](
	[COFFluidID] [int] IDENTITY(1,1) NOT NULL,
	[COFFluid] [nvarchar](100) NULL,
	[AliasName] [nvarchar](50) NULL,
	[ExamplesOfApplicable] [nvarchar](200) NULL,
	[FluidType] [nvarchar](50) NULL,
	[MW] [float] NULL,
	[NBP] [float] NULL,
	[Density] [float] NULL,
	[HeatEquation] [int] NULL,
	[IdealConstantA] [float] NULL,
	[IdealConstantB] [float] NULL,
	[IdealConstantC] [float] NULL,
	[IdealConstantD] [float] NULL,
	[IdealConstantE] [float] NULL,
	[AmbientState] [nvarchar](10) NULL,
	[AutoIgnitionTemperature] [float] NULL,
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
/****** Object:  Table [dbo].[COMPONENT_DETAIL]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[COMPONENT_MASTER]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[COMPONENT_MODELLING]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[COMPONENT_TYPE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[DESIGN_CODE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[DM_CATEGORY]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[DM_EXPECTED_TYPE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[DM_ITEMS]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[EQUIPMENT_EXTRA_FIELDS]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[EQUIPMENT_MASTER]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[EQUIPMENT_REVISION]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[EQUIPMENT_REVISION_INSPECTION]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[EQUIPMENT_REVISION_INSPECTION_COVERAGE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[EQUIPMENT_TYPE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[EXTRA_FIELDS_LOOKUP]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[EXTRA_FIELDS_LOOKUP_COMPONENT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[EXTRA_FIELDS_SETTING]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[EXTRA_FIELDS_SETTING_COMPONENT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[FACILITY]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[FACILITY_RISK_TARGET]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[FILE_COMPONENT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[FILE_EQUIPMENT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[FILE_FACILITY]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[GENERIC_FLUID]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[GENERIC_MATERIAL]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[IM_ITEMS]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[IM_TYPE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[IMAGE_COMPONENT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[IMAGE_EQUIPMENT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[IMAGE_FACILITY]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[INSPECTION_COVERAGE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
	[Created] [datetime] NULL CONSTRAINT [DF_3647A70C_INSPECTION_COVERAGE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_3647A70C_INSPECTION_COVERAGE_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_INSPECTION_COVERAGE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INSPECTION_COVERAGE_DETAIL]    Script Date: 5/4/2020 4:24:21 PM ******/
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
	[Created] [datetime] NULL CONSTRAINT [DF_3647A70C_INSPECTION_COVERAGE_DETAIL_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_3647A70C_INSPECTION_COVERAGE_DETAIL_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_INSPECTION_COVERAGE_DETAIL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[INSPECTION_COVERAGE_EQUIPMENT]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSPECTION_COVERAGE_EQUIPMENT](
	[CoverageID] [int] NOT NULL,
	[EquipmentID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_INSPECTION_COVERAGE_EQUIPMENT] PRIMARY KEY CLUSTERED 
(
	[CoverageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INSPECTION_DETAIL_TECHNIQUE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
	[Coverage] [int] NOT NULL CONSTRAINT [DF__INSPECTIO__Cover__02FC7413]  DEFAULT ((0)),
	[Created] [datetime] NULL CONSTRAINT [DF_7F55E6A8_INSPECTION_DETAIL_TECHNIQUE_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_7F55E6A8_INSPECTION_DETAIL_TECHNIQUE_AuditingID]  DEFAULT (newid()),
	[NDTMethod] [nchar](50) NULL,
 CONSTRAINT [PK_INSPECTION_DETAIL_TECHNIQUE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INSPECTION_DM_RULE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[INSPECTION_PLAN]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSPECTION_PLAN](
	[PlanID] [int] IDENTITY(1,1) NOT NULL,
	[InspPlanName] [nvarchar](150) NOT NULL,
	[InspPlanDate] [datetime] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_B45CD793_INSPECTION_PLAN_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_B45CD793_INSPECTION_PLAN_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_INSPECTION_PLAN] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ITEM_LIST_CONFIG]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[MANUFACTURER]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[POINTS]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[PRD_COMPONENT_MASTER]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[PRD_DF_CLASSES]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[PRD_DISCHARGE_LOCATION]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[PRD_FAILURE_MODE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[PRD_INSPECTION_CONFIDENCE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[PRD_INSPECTION_EFFECTIVENESS]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[PRD_INSPECTION_RESULT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[PRD_OVERPRESSURE_DEMAND]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[PRD_SERVICE_SEVERITY]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[PRD_TYPE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[PRD_WEIBULL_PARAMETER]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[REPORT_TEMPLATE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[REPORT_TEMPLATE_ASSESSMENT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[REPORT_TEMPLATE_COMPONENT_DEFAULT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[REPORT_TEMPLATE_EQUIPMENT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_ASSESSMENT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_CA_LEVEL1]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_CA_LEVEL1](
	[ID] [int] NOT NULL,
	[Release_Phase] [nvarchar](50) NULL,
	[fact_di] [float] NULL,
	[fact_mit] [float] NULL,
	[fact_ait] [float] NULL,
	[CA_cmd] [float] NULL,
	[CA_inj_flame] [float] NULL,
	[CA_inj_toxic] [float] NULL,
	[CA_inj_ntnf] [float] NULL,
	[FC_cmd] [float] NULL,
	[FC_affa] [float] NULL,
	[FC_prod] [float] NULL,
	[FC_inj] [float] NULL,
	[FC_envi] [float] NULL,
	[FC_total] [float] NULL,
	[FCOF_Category] [nvarchar](50) NULL,
 CONSTRAINT [PK_RW_CA_LEVEL1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_CA_TANK]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_CA_TANK](
	[ID] [int] NOT NULL,
	[Hydraulic_Water] [float] NULL,
	[Hydraulic_Fluid] [float] NULL,
	[Seepage_Velocity] [float] NULL,
	[Flow_Rate_D1] [float] NULL,
	[Flow_Rate_D2] [float] NULL,
	[Flow_Rate_D3] [float] NULL,
	[Flow_Rate_D4] [float] NULL,
	[Leak_Duration_D1] [float] NULL,
	[Leak_Duration_D2] [float] NULL,
	[Leak_Duration_D3] [float] NULL,
	[Leak_Duration_D4] [float] NULL,
	[Release_Volume_Leak_D1] [float] NULL,
	[Release_Volume_Leak_D2] [float] NULL,
	[Release_Volume_Leak_D3] [float] NULL,
	[Release_Volume_Leak_D4] [float] NULL,
	[Release_Volume_Rupture_D1] [float] NULL,
	[Release_Volume_Rupture_D2] [float] NULL,
	[Release_Volume_Rupture_D3] [float] NULL,
	[Release_Volume_Rupture_D4] [float] NULL,
	[Liquid_Height] [float] NULL,
	[Volume_Fluid] [float] NULL,
	[Time_Leak_Ground] [float] NULL,
	[Volume_SubSoil_Leak_D1] [float] NULL,
	[Volume_SubSoil_Leak_D4] [float] NULL,
	[Volume_Ground_Water_Leak_D1] [float] NULL,
	[Volume_Ground_Water_Leak_D4] [float] NULL,
	[Barrel_Dike_Leak] [float] NULL,
	[Barrel_Dike_Rupture] [float] NULL,
	[Barrel_Onsite_Leak] [float] NULL,
	[Barrel_Onsite_Rupture] [float] NULL,
	[Barrel_Offsite_Leak] [float] NULL,
	[Barrel_Offsite_Rupture] [float] NULL,
	[Barrel_Water_Leak] [float] NULL,
	[Barrel_Water_Rupture] [float] NULL,
	[FC_Environ_Leak] [float] NULL,
	[FC_Environ_Rupture] [float] NULL,
	[FC_Environ] [float] NULL,
	[Material_Factor] [float] NULL,
	[Component_Damage_Cost] [float] NULL,
	[Business_Cost] [float] NULL,
	[Consequence] [float] NULL,
	[ConsequenceCategory] [nvarchar](50) NULL,
 CONSTRAINT [PK_RW_CA_TANK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_CF_MASTER]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_COATING]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_COF_FACTOR]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_COF_FACTOR](
	[ID] [int] NULL,
	[ca_inj_flame] [float] NULL,
	[ca_cmd_flame] [float] NULL,
	[fc_cmd] [float] NULL,
	[fc_affa] [float] NULL,
	[fc_prod] [float] NULL,
	[fc_inj] [float] NULL,
	[fc_environment] [float] NULL,
	[fc_total] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_COMPONENT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_CORROSION_RATE_TANK]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_DAMAGE_MECHANISM]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_EQUIPMENT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_EXTCOR_TEMPERATURE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_EXTRA_FIELDS]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_FULL_COF]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_FULL_COF_FLUID]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_FULL_COF_HOLE_SIZE]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_FULL_COF_INPUT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_FULL_COF_TANK]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_FULL_FCOF]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_FULL_FCOF](
	[ID] [int] NOT NULL,
	[FCoFValue] [float] NULL,
	[FCoFCategory] [nvarchar](50) NULL,
	[AIL] [bit] NOT NULL CONSTRAINT [DF_RW_FULL_FCOF_AIL]  DEFAULT ((0)),
	[EquipOutageMultiplier] [float] NULL,
	[envcost] [float] NULL,
	[equipcost] [float] NULL,
	[prodcost] [float] NULL,
	[popdens] [float] NULL,
	[injcost] [float] NULL,
	[FCoFMatrixValue] [float] NULL,
	[Created] [datetime] NULL CONSTRAINT [DF_92C4E3A4_RW_FULL_FCOF_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_92C4E3A4_RW_FULL_FCOF_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_FULLY_FCOF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_FULL_POF]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_INPUT_CA_LEVEL1]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_INPUT_CA_LEVEL1](
	[ID] [int] NOT NULL,
	[API_FLUID] [nvarchar](50) NULL,
	[SYSTEM] [nvarchar](50) NULL,
	[Release_Duration] [nvarchar](50) NULL,
	[Detection_Type] [nvarchar](50) NULL,
	[Isulation_Type] [nvarchar](50) NULL,
	[Mitigation_System] [nvarchar](150) NULL,
	[Equipment_Cost] [float] NULL,
	[Injure_Cost] [float] NULL,
	[Evironment_Cost] [float] NULL,
	[Toxic_Percent] [float] NULL,
	[Personal_Density] [float] NULL,
	[Material_Cost] [float] NULL,
	[Production_Cost] [float] NULL,
	[Mass_Inventory] [float] NULL,
	[Mass_Component] [float] NULL,
	[Stored_Pressure] [float] NULL,
	[Stored_Temp] [float] NULL,
 CONSTRAINT [PK_RW_INPUT_CA_LEVEL1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_INPUT_CA_TANK]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_INPUT_CA_TANK](
	[ID] [int] NOT NULL,
	[FLUID_HEIGHT] [float] NULL,
	[SHELL_COURSE_HEIGHT] [float] NULL,
	[TANK_DIAMETTER] [float] NULL,
	[Prevention_Barrier] [bit] NOT NULL,
	[Environ_Sensitivity] [nvarchar](50) NULL,
	[P_lvdike] [float] NULL,
	[P_onsite] [float] NULL,
	[P_offsite] [float] NULL,
	[Soil_Type] [nvarchar](150) NULL,
	[TANK_FLUID] [nvarchar](150) NULL,
	[API_FLUID] [nvarchar](50) NULL,
	[SW] [float] NULL,
	[ProductionCost] [float] NULL,
 CONSTRAINT [PK_RW_INPUT_CA_TANK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_INSPECTION_DETAIL]    Script Date: 5/4/2020 4:24:21 PM ******/
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
	[Created] [datetime] NULL CONSTRAINT [DF_3637A70C_INSPECTION_COVERAGE_DETAIL_Created]  DEFAULT (getdate()),
	[CreatedBy] [nvarchar](50) NULL,
	[Modified] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[AuditingID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_3257A70C_RW_INSPECTION_DETAIL_AuditingID]  DEFAULT (newid()),
 CONSTRAINT [PK_RW_INSPECTION_DETAIL] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RW_INSPECTION_HISTORY]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_LF_DETAIL]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_LF_MASTER]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_MATERIAL]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_POINTS]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_PRD_COF_INPUT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_PRD_COMPONENT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_PRD_COMPONENT_LINKED]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_PRD_INSPECTION]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_PRD_OVERPRESSURE_DEMAND]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_PRD_PROTECTED_COMPONENT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_PRD_RISK]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_PRIMARY_FLUID]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_REVISION_INSPECTION]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_RISK_GRAPH]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RW_RISK_GRAPH](
	[ID] [int] NOT NULL,
	[risktarget] [float] NULL,
	[risk1] [float] NULL,
	[risk2] [float] NULL,
	[risk3] [float] NULL,
	[risk4] [float] NULL,
	[risk5] [float] NULL,
	[risk6] [float] NULL,
	[risk7] [float] NULL,
	[risk8] [float] NULL,
	[risk9] [float] NULL,
	[risk10] [float] NULL,
	[risk11] [float] NULL,
	[risk12] [float] NULL,
	[risk13] [float] NULL,
	[risk14] [float] NULL,
	[risk15] [float] NULL,
 CONSTRAINT [PK_RW_RISK_GRAPH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RW_RISK_TARGET]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_SAFETY_FACTOR]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_SECONDARY_FLUID]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_SETTINGS]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_STREAM]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[RW_THICKNESS]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[SAFETY_FACTORS]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[SITES]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[TBL_204_DM_HTHA]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_204_DM_HTHA](
	[Susceptibility] [varchar](50) NULL,
	[No Inspection] [int] NULL,
	[1D] [int] NULL,
	[1C] [int] NULL,
	[1B] [int] NULL,
	[2D] [int] NULL,
	[2C] [int] NULL,
	[2B] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_204_DM_NOT_PWHT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[TBL_205_DM_PWHT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[TBL_213_DM_IMPACT_EXEMPTION]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_213_DM_IMPACT_EXEMPTION](
	[ComponentThickness] [float] NULL,
	[CurveA] [float] NULL,
	[CurveB] [float] NULL,
	[CurveC] [float] NULL,
	[CurveD] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_214_DM_NOT_PWHT]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_214_DM_NOT_PWHT](
	[Tmin-Tref] [float] NULL,
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
/****** Object:  Table [dbo].[TBL_215_DM_PWHT]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_215_DM_PWHT](
	[Tmin-Tref] [float] NULL,
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
/****** Object:  Table [dbo].[TBL_3B21_SI_CONVERSION]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_3B21_SI_CONVERSION](
	[conversionFactory] [int] NULL,
	[SIUnits] [float] NULL,
	[USUnits] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_45_DM_THIN]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[TBL_46_DM_THIN]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[TBL_47_DM_THIN_TANK]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[TBL_511_512_CA_GAS_TOXIC]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_511_512_CA_GAS_TOXIC](
	[Toxic] [varchar](50) NULL,
	[ContinuousReleasesDuration] [varchar](50) NULL,
	[a] [float] NULL,
	[b] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_511_DFB_THIN]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_511_DFB_THIN](
	[art] [float] NULL,
	[E] [int] NULL,
	[insp] [int] NULL,
	[D] [int] NULL,
	[C] [int] NULL,
	[B] [int] NULL,
	[A] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM](
	[art] [float] NULL,
	[E] [int] NULL,
	[insp] [int] NULL,
	[D] [int] NULL,
	[C] [int] NULL,
	[B] [int] NULL,
	[A] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_513_CA_TOXIC]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_513_CA_TOXIC](
	[Toxic] [varchar](50) NULL,
	[ReleaseType] [varchar](50) NULL,
	[ContinuousReleasesDuration] [varchar](50) NULL,
	[a] [float] NULL,
	[b] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1](
	[Fluid] [varchar](50) NULL,
	[MW] [float] NULL,
	[Density] [float] NULL,
	[NBP] [float] NULL,
	[Ambient] [varchar](50) NULL,
	[ideal] [int] NULL,
	[A] [float] NULL,
	[B] [float] NULL,
	[C] [float] NULL,
	[D] [float] NULL,
	[E] [float] NULL,
	[Auto] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_54_DM_LINNING_INORGANIC]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[TBL_55_DM_LINNING_ORGANIC]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[TBL_58_CA_COMPONENT_DM]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_58_CA_COMPONENT_DM](
	[Fluid] [varchar](50) NULL,
	[CAINL_gas_a] [float] NULL,
	[CAINL_gas_b] [float] NULL,
	[CAINL_liquid_a] [float] NULL,
	[CAINL_liquid_b] [float] NULL,
	[CAIL_gas_a] [float] NULL,
	[CAIL_gas_b] [float] NULL,
	[CAIL_liquid_a] [float] NULL,
	[CAIL_liquid_b] [float] NULL,
	[IAINL_gas_a] [float] NULL,
	[IAINL_gas_b] [float] NULL,
	[IAINL_liquid_a] [float] NULL,
	[IAINL_liquid_b] [float] NULL,
	[IAIL_gas_a] [float] NULL,
	[IAIL_gas_b] [float] NULL,
	[IAIL_liquid_a] [float] NULL,
	[IAIL_liquid_b] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON](
	[Fluid] [varchar](50) NULL,
	[CAINL_gas_a] [float] NULL,
	[CAINL_gas_b] [float] NULL,
	[CAINL_liquid_a] [float] NULL,
	[CAINL_liquid_b] [float] NULL,
	[CALL_gas_a] [float] NULL,
	[CALL_gas_b] [float] NULL,
	[CALL_liquid_a] [float] NULL,
	[CALL_liquid_b] [float] NULL,
	[IAINL_gas_a] [float] NULL,
	[IAINL_gas_b] [float] NULL,
	[IAINL_liquid_a] [float] NULL,
	[IAINL_liquid_b] [float] NULL,
	[IAIL_gas_a] [float] NULL,
	[IAIL_gas_b] [float] NULL,
	[IAIL_liquid_a] [float] NULL,
	[IAIL_liquid_b] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_63_SCC_DM_PWHT]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[TBL_64_DM_LINNING_INORGANIC]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_64_DM_LINNING_INORGANIC](
	[YearsSinceLastInspection] [int] NULL,
	[Strip lined alloy] [float] NULL,
	[Castable refractory] [float] NULL,
	[Castable refractory severe condition] [float] NULL,
	[Glass lined] [float] NULL,
	[Acid Brick] [float] NULL,
	[Fibreglass] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_65_DM_LINNING_ORGANIC]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_65_DM_LINNING_ORGANIC](
	[YearInService] [int] NULL,
	[MoreThan6Years] [float] NULL,
	[WithinLast6Years] [float] NULL,
	[WithinLast3Years] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TBL_71_PROPERTIES_STORAGE_TANK]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_71_PROPERTIES_STORAGE_TANK](
	[Fluid] [varchar](50) NULL,
	[Level 1 Consequence Analysis Representative Fluid] [varchar](50) NULL,
	[Molecular Weight] [float] NULL,
	[Liquid Density] [float] NULL,
	[Liquid Density Viscosity] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC](
	[Soil Type] [varchar](50) NULL,
	[Hydraulic Conductivity for Water Lower Bound (in s)] [float] NULL,
	[Hydraulic Conductivity for Water Upper Bound (in s)] [float] NULL,
	[Soil Porosity] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_74_SCC_DM_PWHT]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_74_SCC_DM_PWHT](
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
/****** Object:  Table [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY]    Script Date: 5/4/2020 4:24:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY](
	[Location] [int] NULL,
	[Description] [varchar](50) NULL,
	[Low] [float] NULL,
	[Medium] [float] NULL,
	[High] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[THICKNESS_READING]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[UNIT_DESCRIPTOR]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[UNITS]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[USER_GROUPS]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[USER_PERMISSION_LIST]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[USER_PERMISSIONS]    Script Date: 5/4/2020 4:24:21 PM ******/
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
/****** Object:  Table [dbo].[USERS]    Script Date: 5/4/2020 4:24:21 PM ******/
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

INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'C1-C2', N'C1_To_C2', N'Methane, Ethane, Ethylene, LNG, Fluid Gas', N'Flammable', 23, -125, 250.512, 1, 12.3, 0.115, -2.87E-05, -1.3E-09, 0, N'Gas', 558, 0, 1, 0, CAST(N'2019-06-28 16:50:34.447' AS DateTime), NULL, NULL, NULL, N'1e47431b-c66e-4313-bcb2-afa6fd5665be')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'C3-C4', N'C3_To_C4', N'Propane, Butane, Isobutane, LPG', N'Flammable', 51, -21, 538.379, 1, 2.632, 0.3188, -0.000135, 1.47E-08, 0, N'Gas', 369, 0, 1, 0, CAST(N'2019-06-28 16:50:34.450' AS DateTime), NULL, NULL, NULL, N'5eb05714-a712-4ad8-b5f6-f17c3f8e9396')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'C5', N'C5', N'Pentane', N'Flammable', 72, 36, 625.199, 1, -3.626, 0.4873, -0.00026, 5.3E-08, 0, N'Liquid', 284, 0, 1, 0, CAST(N'2019-06-28 16:50:34.450' AS DateTime), NULL, NULL, NULL, N'6bdcae81-1d66-489f-a693-de6c7bdca6da')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'C6-C8', N'C6_To_C8', N'Gasoline, Naphtha, Light Straight Run, Heptane', N'Flammable', 100, 99, 684.018, 1, -5.146, 0.676, -0.000365, 7.66E-08, 0, N'Liquid', 223, 0, 1, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'3ac76b64-eb04-4898-b349-dee2e4472a86')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'C9-C12', N'C9_To_C12', N'Diesel, Kerosene', N'Flammable', 149, 184, 734.012, 1, -8.5, 1.01, -0.000556, 1.18E-07, 0, N'Liquid', 208, 0, 1, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'2d5f497e-f8fd-443d-b331-5fbe212aa5d0')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'C13-C-16', N'C13_To_C16', N'Jet Fuel, Kerosene, Atmosphere Gas Oil', N'Flammable', 205, 261, 764.527, 1, -11.7, 1.39, -0.000772, 1.67E-07, 0, N'Liquid', 202, 0, 1, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'cac6772e-cc20-4644-9081-723f656ace7f')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'C17-C25', N'C17_To_C25', N'Gas Oil, Typical Crude', N'Flammable', 280, 344, 775.019, 1, -22.4, 1.94, -0.00112, -2.53E-07, 0, N'Liquid', 202, 0, 1, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'78b19dcc-c8a5-455f-afab-2511115bcc92')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'C25+', N'C25_And_Above', N'Residium, Heavy Crude, Lube Oil, Seal Oil', N'Flammable', 422, 527, 900.026, 1, -22.4, 1.94, -0.00112, -2.53E-07, 0, N'Liquid', 202, 0, 1, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'd3643735-cc13-4c76-afcb-8739806329e8')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Water', N'Water', N'Water', N'No Flammable & No Toxic', 18, 100, 997.947, 3, 276000, -2090, 8.125, -0.0141, 9.37E-06, N'Liquid', NULL, 0, 0, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'2b8aa6d5-2942-4522-99d7-a36709196afe')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'Steam', N'Steam', N'Steam', N'No Flammable & No Toxic', 18, 100, 997.947, 3, 33400, 26800, 2610, 8900, 1170, N'Gas', NULL, 0, 0, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'6d2eec7c-c3c0-43d2-a631-2e165f359c20')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'Acid', N'Acid', N'Acid', N'No Flammable & No Toxic', 18, 100, 997.947, 3, 276000, -2090, 8.125, -0.0141, 9.37E-06, N'Liquid', NULL, 0, 0, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'4eb8bc5e-634b-4bb2-a504-2c8c68ac9104')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, N'Caustic', N'Caustic', N'Caustic', N'No Flammable & No Toxic', 18, 100, 997.947, 3, 276000, -2090, 8.125, -0.0141, 9.37E-06, N'Liquid', NULL, 0, 0, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'a54f0e66-f76b-41f3-853e-dcd921d5225d')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (13, N'H2', N'H2', N'Hydrogen', N'Flammable', 2, -253, 71.01, 1, 27.1, 0.00927, -1.38E-05, 7.65E-09, 0, N'Gas', 400, 0, 1, 0, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'2d5b0fd8-99c2-483d-9ad9-7a946f9b9b56')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (14, N'H2S', N'H2S', N'Hydrogen Sulfide', N'Flammable & Toxic', 34, -59, 993.029, 1, 31.9, 0.00144, 2.43E-05, -1.18E-08, 0, N'Gas', 260, 0, 1, 1, CAST(N'2019-06-28 16:50:34.453' AS DateTime), NULL, NULL, NULL, N'4e9e24a0-de1f-42c2-ba52-d52e0e92cebd')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (15, N'HFAcid', N'HFAcid', N'Hydrogen Fluoride', N'Toxic', 20, 20, 967.031, 1, 29.1, 0.000661, -2.03E-06, 2.5E-09, 0, N'Gas', 17760, 0, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'803769d6-154b-4c3e-acc8-178ca467bb95')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (16, N'CO', N'CO', N'Carbon Monoxide', N'Flammable & Toxic', 28, -191, 800.92, 2, 29100, 8770, 3090, 0.00846, 1540, N'Gas', 609, 0, 1, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'5db01dd0-bd4d-4321-ad32-da3b72a56651')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'DEE', N'DEE', N'Diethyl Ether', N'Flammable', 74, 35, 720.828, 2, 86200, 255000, 1540, 144000, -689, N'Liquid', 160, 0, 1, 0, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'77f1c193-1d71-460b-bc42-fce7a0a7efc6')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'HCL', N'HCL', N'Hydrogen Chloride', N'Toxic', 36, -85, 1185.362, 5, 0, 0, 0, 0, 0, N'Gas', NULL, 1.41, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'97d51097-4aa7-4411-9640-27ae577222fc')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'Nitric Acid', N'NitricAcid', N'Nitric Acid', N'Toxic', 63, 121, 1521.749, 4, 0, 0, 0, 0, 0, N'Liquid', NULL, 1.5, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'017ef316-4d16-4ed6-9f97-a10f88cbb40c')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'ALCL3', N'ALCL3', N'Alumunium Chloride', N'Toxic', 133.5, 194, 2434.798, 1, 43400, 39700, 417, 24000, 0, N'Powder', 558, 0, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'7fe89b05-0444-404b-8c1f-762122f6b28c')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, N'NO2', N'NO2', N'Nitrogen Dioxide', N'Toxic', 90, 135, 929.068, 4, 0, 0, 0, 0, 0, N'Liquid', NULL, 1.5, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'00fd99bc-ea0d-4d4e-bd27-fcb14b52a4b2')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'Phosgene', N'Phosgene', N'Phosgene', N'Toxic', 99, 83, 1377.583, 4, 0, 0, 0, 0, 0, N'Liquid', NULL, 1.5, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'b6d66c66-16e7-42b8-be2e-c08a42187994')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'TDI', N'TDI', N'Toluene Diisocyanate', N'Toxic', 174, 251, 1217.399, 4, 0, 0, 0, 0, 0, N'Liquid', 620, 1.5, 0, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'efe28c1f-356f-4195-bfed-371cb0ef9d7f')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'Methanol', N'Methanol', N'Methanol', N'Flammable', 32, 65, 800.92, 2, 39300, 87900, 1920, 53700, 897, N'Liquid', 464, 0, 1, 0, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'715de2b5-fb61-4508-b8b0-93e97a794c1f')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'PO', N'PO', N'Propylene Oxide', N'Flammable & Toxic', 58, 34, 832.957, 2, 49500, 174000, 1560, 115000, 702, N'Liquid', 449, 0, 1, 1, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'46c44a01-3295-461f-8f2a-fa0d49f5f756')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'Aromatics', N'Aromatics', N'Benzene, Toluene, Xylene, Cuemene', N'Flammable', 104, 145, 683.986, 2, 89300, 215000, 772, 99900, 2440, N'Liquid', 490, 0, 1, 0, CAST(N'2019-06-28 16:50:34.457' AS DateTime), NULL, NULL, NULL, N'55c4b597-cd71-4fbf-bdb6-3e0189745e12')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (27, N'Styrene', N'Styrene', N'Styrene', N'Flammable', 104, 145, 683.986, 2, 89300, 215000, 772, 99900, 2440, N'Liquid', 490, 0, 1, 0, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'9ab935e7-28a8-4299-8964-ee66ca1745da')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (28, N'EEA', N'EEA', N'Ethylene Glycol Monoethyl Ether Acetate', N'Flammable', 132, 156, 977.123, 2, 106000, 240000, 659, 150000, 1970, N'Liquid', 379, 0, 1, 0, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'867101ec-4043-42a2-9e81-bfa1d3d29312')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (29, N'EE', N'EE', N'Ethylene Glycol Monoethyl Ether', N'Flammable & Toxic', 90, 135, 929.068, 2, 32500, 300000, 1170, 208000, 473, N'Liquid', 235, 0, 1, 1, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'e6ba6bf5-1041-47e2-975c-a8c08136b616')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (30, N'EG', N'EG', N'Ethylene Glycol', N'Flammable', 62, 197, 1105.27, 2, 63000, 146000, 1670, 97300, 774, N'Liquid', 396, 0, 1, 0, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'7ffe273f-c948-4686-9b7e-728cd088c721')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (31, N'EO', N'EO', N'Ethylene Oxide', N'Flammable & Toxic', 44, 11, 881.013, 2, 33500, 121000, 1610, 82400, 737, N'Gas', 429, 0, 1, 1, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'2b5518ed-d3e2-4349-b60f-94b609f65089')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (32, N'Pyrophoric', N'Pyrophoric', N'Pyrophoric Materials', N'Flammable & Toxic', 149, 184, 734.012, 1, -8.5, 1.01, -0.000556, 1.18E-07, 0, N'Liquid', 54, 0, 1, 1, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'9ee4410e-f40c-46ba-bdc7-c07e4f98fe2b')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (33, N'Ammonia', N'Ammonia', N'Ammonia', N'Toxic', 17, -33, 681.9, 6, 0, 0, 0, 0, 0, N'Gas', 651, 1.32, 0, 1, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'696665b8-1437-4b07-a4c9-d2fd939a734d')
INSERT [dbo].[COF_FLUID] ([COFFluidID], [COFFluid], [AliasName], [ExamplesOfApplicable], [FluidType], [MW], [NBP], [Density], [HeatEquation], [IdealConstantA], [IdealConstantB], [IdealConstantC], [IdealConstantD], [IdealConstantE], [AmbientState], [AutoIgnitionTemperature], [K], [Flammable], [Toxic], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (34, N'Chlorine', N'Chlorine', N'Chlorine', N'Toxic', 71, -34, 1562.5, 7, 0, 0, 0, 0, 0, N'Gas', NULL, 1.33, 0, 1, CAST(N'2019-06-28 16:50:34.460' AS DateTime), NULL, NULL, NULL, N'9ab35449-f76c-4f15-a1c7-a30820f92dcb')
SET IDENTITY_INSERT [dbo].[COF_FLUID] OFF
SET IDENTITY_INSERT [dbo].[COMPONENT_MASTER] ON 

INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'2', 1, 4, N'chuot', N'', 0, 1, 3, CAST(N'2019-07-30 11:31:41.430' AS DateTime), N'hai', NULL, NULL, N'14de332d-e66c-488e-9bd5-f00bca42d69c')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'12', 3, 12, N'op lung', N'', 0, 0, 36, CAST(N'2019-08-20 21:38:04.583' AS DateTime), N'DO ANH TUAN', CAST(N'2020-03-02 09:06:45.000' AS DateTime), N'hai', N'74de2ab0-4610-4ee6-8e18-da21f51edc78')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'aas', 1, 12, N'man hinh', N'', 0, 0, 36, CAST(N'2019-08-21 15:24:22.373' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'5c2d079b-aed0-4c4e-8be6-89da4851ff65')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'1111', 3, 9, N'loa ', N'', 0, 0, 1, CAST(N'2019-08-21 18:48:27.907' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'a18b71ad-e77e-4ce0-b62b-9366d87bca77')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'CTEST', 4, 6, N'CTEST', N'', 0, 1, 6, CAST(N'2019-08-27 10:48:01.067' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'd68d0792-9124-4661-8a91-0a453bb23ec0')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'123', 5, 12, N'123', N'', 0, 0, 6, CAST(N'2019-08-27 11:08:55.007' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'483ed94c-f95c-4735-a2e1-fb2a82cb0604')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'PIPING', 6, 3, N'am thanh', N'', 0, 0, 4, CAST(N'2019-08-29 14:35:09.487' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'74b926ce-36a1-4238-8415-308fdd56951d')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (8, N'Tank', 6, 12, N'mic', N'', 0, 0, 36, CAST(N'2019-09-25 11:18:05.677' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'877102f9-9099-4d90-a70c-82db064fcab9')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, N'Tanktest', 7, 12, N'vvv', N'', 0, 1, 36, CAST(N'2019-09-25 11:20:00.777' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'd62ff9f6-ce4b-4963-adab-f305820b4589')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (23, N'CC01', 10, 6, N'CC01', N'', 0, 0, 4, CAST(N'2019-11-12 12:19:38.700' AS DateTime), N'DO ANH TUAN', NULL, NULL, N'e451361b-ee76-4d92-b2bc-5ee9591bf1b4')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (24, N'Tank Shell', 7, 13, N'Tank Shell', N'', 0, 0, 7, CAST(N'2020-02-26 13:39:15.700' AS DateTime), N'hai', NULL, NULL, N'3867683a-68ee-4d4c-8405-12b28d7bd331')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (25, N'tankBotom', 7, 12, N'tankBotoms', N'', 0, 0, 36, CAST(N'2020-04-15 22:53:46.627' AS DateTime), N'Nhat Ha', NULL, NULL, N'6383178b-c393-4ed0-9414-6ec032378d8a')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (26, N'231', 11, 7, N'gfd', N'', 0, 0, 3, CAST(N'2020-04-30 15:34:55.083' AS DateTime), N'Nhat Ha', NULL, NULL, N'bd077618-b990-45fc-ba89-29e36efef7ad')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1037, N'Fixed Roof', 7, 14, N'Fixed Roofs', N'', 0, 0, 38, CAST(N'2020-05-04 12:42:18.033' AS DateTime), N'Nhat Ha', NULL, NULL, N'dc763baa-e6fc-4db2-9f5c-102fc276964a')
INSERT [dbo].[COMPONENT_MASTER] ([ComponentID], [ComponentNumber], [EquipmentID], [ComponentTypeID], [ComponentName], [ComponentDesc], [IsEquipment], [IsEquipmentLinked], [APIComponentTypeID], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1038, N'u', 10, 3, N'', N'', 0, 0, 3, CAST(N'2020-05-04 16:01:24.220' AS DateTime), N'Nhat Ha', NULL, NULL, N'8d97d38e-2551-4e53-8a71-680052b9f217')
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
INSERT [dbo].[DESIGN_CODE] ([DesignCodeID], [DesignCode], [DesignCodeApp], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Design Code', N'', CAST(N'2019-10-17 11:59:41.320' AS DateTime), NULL, CAST(N'2019-11-12 13:57:00.000' AS DateTime), NULL, N'791afe22-6426-4aba-85e5-4b1a3e6dcbe5')
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
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'12212', 3, N'dien thoai', CAST(N'2019-08-07 00:00:00.000' AS DateTime), 1, 1, 1, 1, N'', N'', N'', 1, CAST(N'2020-03-02 09:06:23.000' AS DateTime), N'', CAST(N'2019-08-20 21:37:43.753' AS DateTime), NULL, NULL, NULL, N'489544e6-1f4a-4d6f-9b7f-68ac37aa7329')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, N'997', 14, N'EQTEST', CAST(N'2019-08-27 00:00:00.000' AS DateTime), 2, 2, 2, 2, N'', N'', N'', 1, CAST(N'2019-08-27 10:43:30.000' AS DateTime), N'', CAST(N'2019-08-27 10:43:30.550' AS DateTime), NULL, NULL, NULL, N'209342e3-8695-4655-9671-5f8643163442')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'TEST2', 11, N'123', CAST(N'2019-05-14 00:00:00.000' AS DateTime), 2, 2, 2, 2, N'', N'', N'', 1, CAST(N'2019-08-27 11:08:10.000' AS DateTime), N'', CAST(N'2019-08-27 11:08:10.563' AS DateTime), NULL, NULL, NULL, N'd9c07e87-8814-41db-a214-b0293892a93f')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, N'PIPING', 7, N'PIPING', CAST(N'2019-12-29 00:00:00.000' AS DateTime), 1, 2, 2, 1, N'', N'', N'', 1, CAST(N'2019-08-29 14:34:39.000' AS DateTime), N'', CAST(N'2019-08-29 14:34:39.747' AS DateTime), NULL, NULL, NULL, N'c6fbad66-a46b-4faf-9a00-948163a0f6ef')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, N'TAnk', 11, N'', CAST(N'2019-09-04 00:00:00.000' AS DateTime), 1, 2, 3, 2, N'', N'', N'', 1, CAST(N'2019-09-25 11:19:26.000' AS DateTime), N'', CAST(N'2019-09-25 11:19:26.683' AS DateTime), NULL, NULL, NULL, N'683046c5-addf-4be8-a450-072a0ea4ee6d')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, N'EE01', 8, N'EE01', CAST(N'2019-10-13 00:00:00.000' AS DateTime), 3, 5, 6, 3, N'', N'', N'', 1, CAST(N'2019-11-12 13:57:00.000' AS DateTime), N'', CAST(N'2019-11-12 12:19:38.420' AS DateTime), NULL, NULL, NULL, N'f89c727e-b56c-451f-b685-c88a1c2ec058')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, N'23', 2, N'fs', CAST(N'2020-04-24 00:00:00.000' AS DateTime), 1, 2, 7, 2, N'', N'', N'', 1, CAST(N'2020-04-30 02:02:53.000' AS DateTime), N'', CAST(N'2020-04-30 02:02:53.110' AS DateTime), NULL, NULL, NULL, N'3f0162d1-34c0-4101-b5c0-39e928dce27d')
INSERT [dbo].[EQUIPMENT_MASTER] ([EquipmentID], [EquipmentNumber], [EquipmentTypeID], [EquipmentName], [CommissionDate], [DesignCodeID], [SiteID], [FacilityID], [ManufacturerID], [PFDNo], [ProcessDescription], [EquipmentDesc], [IsArchived], [Archived], [ArchivedBy], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1011, N'tank2', 11, N'tank', CAST(N'2020-04-23 00:00:00.000' AS DateTime), 2, 2, 3, 2, N'', N'', N'', 1, CAST(N'2020-04-30 10:50:33.000' AS DateTime), N'', CAST(N'2020-04-30 10:50:34.010' AS DateTime), NULL, NULL, NULL, N'8f03ddf0-6197-4ee2-919d-3ed9bf095e2f')
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
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 5, N'FF01', 0.1, CAST(N'2019-11-12 12:19:37.600' AS DateTime), NULL, NULL, NULL, N'89dff749-f4e9-4e2e-8ced-6b5cd3fcccd7')
INSERT [dbo].[FACILITY] ([FacilityID], [SiteID], [FacilityName], [ManagementFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, 2, N'Dtest', 0.1, CAST(N'2020-04-30 02:02:23.317' AS DateTime), NULL, NULL, NULL, N'7655f8cc-b32f-43fb-aebd-2c79327151ea')
SET IDENTITY_INSERT [dbo].[FACILITY] OFF
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 1, 1, 1, 1, 1, 123, 1234, CAST(N'2019-07-30 11:29:31.337' AS DateTime), NULL, NULL, NULL, N'd3f47e0c-ea42-4aa3-b6fc-7e328b212f28')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, 1, 1, 1, 1, 1, 1000, 10000, CAST(N'2019-08-27 10:40:00.200' AS DateTime), NULL, NULL, NULL, N'e20c8bb6-5a0f-4e03-bea6-8396464bac1e')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 1, 1, 1, 1, 1, 21233, 3232, CAST(N'2019-09-25 11:19:04.667' AS DateTime), NULL, NULL, NULL, N'0b74a0a3-22f4-4b33-8750-ee4e79371f54')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-11-12 12:19:37.660' AS DateTime), NULL, NULL, NULL, N'544afff5-0052-458d-b292-b8f51017d615')
INSERT [dbo].[FACILITY_RISK_TARGET] ([FacilityID], [RiskTarget_A], [RiskTarget_B], [RiskTarget_C], [RiskTarget_D], [RiskTarget_E], [RiskTarget_CA], [RiskTarget_FC], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, 1, 1, 1, 1, 1, 23, 43, CAST(N'2020-04-30 02:02:23.343' AS DateTime), NULL, NULL, NULL, N'ca6ca355-4e00-49df-8b7b-9f6a7884f403')
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
SET IDENTITY_INSERT [dbo].[INSPECTION_COVERAGE] ON 

INSERT [dbo].[INSPECTION_COVERAGE] ([ID], [PlanID], [EquipmentID], [ComponentID], [Remarks], [Findings], [FindingRTF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4094, 3, 1, 1, N'', N'', N'', CAST(N'2020-04-25 08:16:20.593' AS DateTime), NULL, NULL, NULL, N'04392256-5622-4b2e-a8f7-1499075d612d')
INSERT [dbo].[INSPECTION_COVERAGE] ([ID], [PlanID], [EquipmentID], [ComponentID], [Remarks], [Findings], [FindingRTF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6092, 1004, 1, 1, N'', N'', N'', CAST(N'2020-05-01 23:55:15.483' AS DateTime), NULL, NULL, NULL, N'0960a6f7-7a62-4880-8bbc-138645a30ae5')
INSERT [dbo].[INSPECTION_COVERAGE] ([ID], [PlanID], [EquipmentID], [ComponentID], [Remarks], [Findings], [FindingRTF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6096, 1, 1, 1, N'xxxxx', N'zzz', N'', CAST(N'2020-05-01 23:55:43.723' AS DateTime), NULL, NULL, NULL, N'93fbaa57-05d6-4b2b-9072-4ee398382d0a')
INSERT [dbo].[INSPECTION_COVERAGE] ([ID], [PlanID], [EquipmentID], [ComponentID], [Remarks], [Findings], [FindingRTF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6097, 1, 3, 2, N'xxxxx', N'zzz', N'', CAST(N'2020-05-01 23:55:43.727' AS DateTime), NULL, NULL, NULL, N'8a31cedf-169d-45db-ba9d-3112d920b7c9')
INSERT [dbo].[INSPECTION_COVERAGE] ([ID], [PlanID], [EquipmentID], [ComponentID], [Remarks], [Findings], [FindingRTF], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6098, 1, 7, 9, N'xxxxx', N'zzz', N'', CAST(N'2020-05-01 23:55:43.727' AS DateTime), NULL, NULL, NULL, N'156adbb1-8805-457a-89b4-e54f9043dee3')
SET IDENTITY_INSERT [dbo].[INSPECTION_COVERAGE] OFF
SET IDENTITY_INSERT [dbo].[INSPECTION_COVERAGE_DETAIL] ON 

INSERT [dbo].[INSPECTION_COVERAGE_DETAIL] ([ID], [CoverageID], [DMItemID], [InspectionDate], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (40052, 4094, 63, CAST(N'2020-01-14 00:00:00.000' AS DateTime), N'E', N'Non-Intrusive + Eddy Current + ACFM - 0 % ', 0, CAST(N'2020-01-14 00:00:00.000' AS DateTime), CAST(N'2020-04-25 08:16:20.620' AS DateTime), NULL, NULL, NULL, N'1177b122-1537-4aa9-bf79-948e4500b3c4')
INSERT [dbo].[INSPECTION_COVERAGE_DETAIL] ([ID], [CoverageID], [DMItemID], [InspectionDate], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (40053, 4094, 66, CAST(N'2020-01-14 00:00:00.000' AS DateTime), N'E', N'Non-Intrusive + Eddy Current + ACFM - 0 % ', 0, CAST(N'2020-01-14 00:00:00.000' AS DateTime), CAST(N'2020-04-25 08:16:20.620' AS DateTime), NULL, NULL, NULL, N'22d6c127-a799-44f5-b2ae-69d8f77c4576')
INSERT [dbo].[INSPECTION_COVERAGE_DETAIL] ([ID], [CoverageID], [DMItemID], [InspectionDate], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (40054, 4094, 72, CAST(N'2020-01-14 00:00:00.000' AS DateTime), N'E', N'Non-Intrusive + Acoustic Emission + Crack Detection - 0 %
AND
Non-Intrusive + Eddy Current + ACFM - 0 % ', 0, CAST(N'2020-01-14 00:00:00.000' AS DateTime), CAST(N'2020-04-25 08:16:20.623' AS DateTime), NULL, NULL, NULL, N'd296c8f7-0c0e-4a2a-9ccf-4d637c737f45')
INSERT [dbo].[INSPECTION_COVERAGE_DETAIL] ([ID], [CoverageID], [DMItemID], [InspectionDate], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60055, 6092, 63, CAST(N'2020-04-22 00:00:00.000' AS DateTime), N'E', N'Non-Intrusive + Penetrant + Liquid Penetrant Inspection - 0 % ', 0, CAST(N'2020-04-22 00:00:00.000' AS DateTime), CAST(N'2020-05-01 23:55:15.517' AS DateTime), NULL, NULL, NULL, N'5a29808c-7406-4473-8ce3-ab54c0238c10')
INSERT [dbo].[INSPECTION_COVERAGE_DETAIL] ([ID], [CoverageID], [DMItemID], [InspectionDate], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60056, 6092, 66, CAST(N'2020-04-22 00:00:00.000' AS DateTime), N'E', N'Non-Intrusive + Penetrant + Liquid Penetrant Inspection - 0 % ', 0, CAST(N'2020-04-22 00:00:00.000' AS DateTime), CAST(N'2020-05-01 23:55:15.523' AS DateTime), NULL, NULL, NULL, N'e7bb1b21-78aa-4394-9111-f92d90658478')
INSERT [dbo].[INSPECTION_COVERAGE_DETAIL] ([ID], [CoverageID], [DMItemID], [InspectionDate], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60057, 6092, 72, CAST(N'2020-04-22 00:00:00.000' AS DateTime), N'E', N'Non-Intrusive + Acoustic Emission + Crack Detection - 0 %
AND
Non-Intrusive + Penetrant + Liquid Penetrant Inspection - 0 % ', 0, CAST(N'2020-04-22 00:00:00.000' AS DateTime), CAST(N'2020-05-01 23:55:15.527' AS DateTime), NULL, NULL, NULL, N'2593032a-9bc7-4d2f-aba3-ac69f74df99b')
INSERT [dbo].[INSPECTION_COVERAGE_DETAIL] ([ID], [CoverageID], [DMItemID], [InspectionDate], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60058, 6096, 63, CAST(N'2020-01-03 00:00:00.000' AS DateTime), N'E', N'Non-Intrusive + Eddy Current + Pulsed - 0 % ', 0, CAST(N'2020-01-03 00:00:00.000' AS DateTime), CAST(N'2020-05-01 23:55:43.750' AS DateTime), NULL, NULL, NULL, N'83a4a032-0ee3-45de-a9a4-afb689b1a91b')
INSERT [dbo].[INSPECTION_COVERAGE_DETAIL] ([ID], [CoverageID], [DMItemID], [InspectionDate], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60059, 6096, 66, CAST(N'2020-01-03 00:00:00.000' AS DateTime), N'E', N'Non-Intrusive + Eddy Current + Pulsed - 0 % ', 0, CAST(N'2020-01-03 00:00:00.000' AS DateTime), CAST(N'2020-05-01 23:55:43.757' AS DateTime), NULL, NULL, NULL, N'979075bd-139c-4538-b75d-3c34f4ef42dd')
INSERT [dbo].[INSPECTION_COVERAGE_DETAIL] ([ID], [CoverageID], [DMItemID], [InspectionDate], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60060, 6096, 72, CAST(N'2020-01-03 00:00:00.000' AS DateTime), N'E', N'Non-Intrusive + Acoustic Emission + Crack Detection - 0 %
AND
Non-Intrusive + Eddy Current + Pulsed - 0 % ', 0, CAST(N'2020-01-03 00:00:00.000' AS DateTime), CAST(N'2020-05-01 23:55:43.760' AS DateTime), NULL, NULL, NULL, N'93fab2c6-2c03-48dd-8670-0f22f18e0a01')
INSERT [dbo].[INSPECTION_COVERAGE_DETAIL] ([ID], [CoverageID], [DMItemID], [InspectionDate], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60061, 6098, 63, CAST(N'2020-01-03 00:00:00.000' AS DateTime), N'E', N'Non-Intrusive + Eddy Current + Pulsed - 0 % ', 0, CAST(N'2020-01-03 00:00:00.000' AS DateTime), CAST(N'2020-05-01 23:55:43.767' AS DateTime), NULL, NULL, NULL, N'7b824d3b-fc49-4333-92ba-34059a571a56')
INSERT [dbo].[INSPECTION_COVERAGE_DETAIL] ([ID], [CoverageID], [DMItemID], [InspectionDate], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (60062, 6098, 66, CAST(N'2020-01-03 00:00:00.000' AS DateTime), N'E', N'Non-Intrusive + Eddy Current + Pulsed - 0 % ', 0, CAST(N'2020-01-03 00:00:00.000' AS DateTime), CAST(N'2020-05-01 23:55:43.773' AS DateTime), NULL, NULL, NULL, N'40d39eec-cc95-47f1-9bc4-1c456ce520eb')
SET IDENTITY_INSERT [dbo].[INSPECTION_COVERAGE_DETAIL] OFF
SET IDENTITY_INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ON 

INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (40146, 4094, 8, 32, 1, 0, CAST(N'2020-04-25 08:16:20.603' AS DateTime), NULL, NULL, NULL, N'c5e14ca1-1b45-4382-819c-89b6c21402da', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (40147, 4094, 2, 5, 1, 0, CAST(N'2020-04-25 08:16:20.607' AS DateTime), NULL, NULL, NULL, N'a2abaf61-b49e-4213-856f-2aa0db266eb3', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (40148, 4094, 6, 25, 1, 0, CAST(N'2020-04-25 08:16:20.610' AS DateTime), NULL, NULL, NULL, N'ae03b987-7dfd-4f9b-8753-fdb96850fe5c', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (60140, 6092, 8, 32, 1, 0, CAST(N'2020-05-01 23:55:15.490' AS DateTime), NULL, NULL, NULL, N'ffe0b72c-7fd2-4d47-ba99-4c62d07ca8fd', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (60141, 6092, 10, 36, 1, 10, CAST(N'2020-05-01 23:55:15.493' AS DateTime), NULL, NULL, NULL, N'2f116c7c-897c-4861-b997-a99b8b0c8c22', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (60142, 6092, 3, 8, 1, 0, CAST(N'2020-05-01 23:55:15.497' AS DateTime), NULL, NULL, NULL, N'37706b19-ad27-4212-8359-ca2602b3d491', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (60152, 6096, 8, 32, 1, 0, CAST(N'2020-05-01 23:55:43.730' AS DateTime), NULL, NULL, NULL, N'f3697606-d5c1-4511-b091-18a95c8d6afb', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (60153, 6096, 6, 27, 1, 0, CAST(N'2020-05-01 23:55:43.730' AS DateTime), NULL, NULL, NULL, N'cf4e0ac9-e8f1-49cb-98ef-3937e70b66e3', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (60154, 6096, 9, 34, 1, 0, CAST(N'2020-05-01 23:55:43.730' AS DateTime), NULL, NULL, NULL, N'ed34f85c-aafa-4a40-9188-28b01f1b562a', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (60155, 6097, 8, 32, 1, 0, CAST(N'2020-05-01 23:55:43.730' AS DateTime), NULL, NULL, NULL, N'e1881cec-a78f-4de2-b1e9-e90ee6ad2d87', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (60156, 6097, 6, 27, 1, 0, CAST(N'2020-05-01 23:55:43.733' AS DateTime), NULL, NULL, NULL, N'017c9c56-8660-488e-9a63-1a6cff7125e3', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (60157, 6097, 9, 34, 1, 0, CAST(N'2020-05-01 23:55:43.733' AS DateTime), NULL, NULL, NULL, N'19e524bf-c289-43d9-bfd8-3ddd7bdaae69', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (60158, 6098, 8, 32, 1, 0, CAST(N'2020-05-01 23:55:43.737' AS DateTime), NULL, NULL, NULL, N'871ffde0-55a1-453f-a25e-3959f7f60830', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (60159, 6098, 6, 27, 1, 0, CAST(N'2020-05-01 23:55:43.737' AS DateTime), NULL, NULL, NULL, N'96a80081-c943-4414-9ae3-f36907f9b585', N'                                                  ')
INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] ([ID], [CoverageID], [IMItemID], [IMTypeID], [InspectionType], [Coverage], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [NDTMethod]) VALUES (60160, 6098, 9, 34, 1, 0, CAST(N'2020-05-01 23:55:43.737' AS DateTime), NULL, NULL, NULL, N'1ea54e38-3de3-4887-8388-53e0d64de968', N'                                                  ')
SET IDENTITY_INSERT [dbo].[INSPECTION_DETAIL_TECHNIQUE] OFF
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
SET IDENTITY_INSERT [dbo].[INSPECTION_PLAN] ON 

INSERT [dbo].[INSPECTION_PLAN] ([PlanID], [InspPlanName], [InspPlanDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Plan 1/10/2020 10:17:11 AM', CAST(N'2020-01-03 00:00:00.000' AS DateTime), CAST(N'2020-01-10 10:17:15.060' AS DateTime), NULL, NULL, NULL, N'b8796675-2a77-4f25-902d-440c37aee508')
INSERT [dbo].[INSPECTION_PLAN] ([PlanID], [InspPlanName], [InspPlanDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, N'Plan 1/13/2020 6:02:57 PM', CAST(N'2020-01-14 00:00:00.000' AS DateTime), CAST(N'2020-01-13 18:03:00.910' AS DateTime), NULL, NULL, NULL, N'1b798ad5-280b-4afe-a741-89b1491f3c13')
INSERT [dbo].[INSPECTION_PLAN] ([PlanID], [InspPlanName], [InspPlanDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1004, N'Plan 4/26/2020 10:59:04 PM', CAST(N'2020-04-22 00:00:00.000' AS DateTime), CAST(N'2020-04-26 22:59:23.170' AS DateTime), NULL, NULL, NULL, N'e729df54-a378-4f82-87ec-fe84ca738c58')
SET IDENTITY_INSERT [dbo].[INSPECTION_PLAN] OFF
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

INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (1, 1, 1, CAST(N'2019-07-30 11:31:50.000' AS DateTime), -1, 36, 1, N'', 0, 0, 0, N'', N'', CAST(N'2020-05-02 16:30:48.000' AS DateTime), N'', CAST(N'2020-05-02 16:30:48.000' AS DateTime), CAST(N'2019-07-30 11:31:50.953' AS DateTime), NULL, NULL, NULL, N'f816e6f0-f863-42c5-abc9-4274f029c2d0', N'New Proposal 1', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (2, 3, 2, CAST(N'2019-08-20 21:38:10.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2019-08-20 21:38:10.000' AS DateTime), N'', CAST(N'2019-08-20 21:38:10.000' AS DateTime), CAST(N'2019-08-20 21:38:10.540' AS DateTime), NULL, NULL, NULL, N'8f238dab-f227-4ce0-bbf1-d26a8b6a95f0', N'New Proposal 2', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (3, 3, 2, CAST(N'2019-08-21 15:24:56.000' AS DateTime), -1, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-04-30 22:52:06.000' AS DateTime), N'', CAST(N'2020-04-30 22:52:06.000' AS DateTime), CAST(N'2019-08-21 15:24:56.197' AS DateTime), NULL, NULL, NULL, N'240278ac-1e88-4f1c-80c6-965ce6d25876', N'New Proposal 3', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (4, 1, 3, CAST(N'2019-08-21 15:25:46.000' AS DateTime), -1, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-04-30 22:51:53.000' AS DateTime), N'', CAST(N'2020-04-30 22:51:53.000' AS DateTime), CAST(N'2019-08-21 15:25:47.007' AS DateTime), NULL, NULL, NULL, N'c9e33044-3f08-4547-aabc-ebaef7b353cd', N'New Proposal 4', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (5, 3, 4, CAST(N'2019-08-21 18:48:36.000' AS DateTime), -1, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-04-30 22:52:22.000' AS DateTime), N'', CAST(N'2020-04-30 22:52:22.000' AS DateTime), CAST(N'2019-08-21 18:48:36.423' AS DateTime), NULL, NULL, NULL, N'aa0f958e-2104-456a-9c16-b275b72b4d27', N'New Proposal 5', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (6, 4, 5, CAST(N'2019-08-27 10:49:03.000' AS DateTime), -1, 36, 1, N'', 0, 0, 0, N'', N'', CAST(N'2020-04-30 22:52:32.000' AS DateTime), N'', CAST(N'2020-04-30 22:52:32.000' AS DateTime), CAST(N'2019-08-27 10:49:03.657' AS DateTime), NULL, NULL, NULL, N'07b686bd-0090-4c39-8aaa-75cd28f36a4c', N'New Proposal 6', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (7, 5, 6, CAST(N'2019-08-27 11:09:07.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2019-08-27 11:09:07.000' AS DateTime), N'', CAST(N'2019-08-27 11:09:07.000' AS DateTime), CAST(N'2019-08-27 11:09:07.500' AS DateTime), NULL, NULL, NULL, N'b2504e8e-ff6b-49b2-943e-cb36802c74f1', N'New Proposal 7', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (9, 1, 1, CAST(N'2019-08-27 11:18:57.000' AS DateTime), -1, 36, 1, N'', 0, 0, 0, N'', N'', CAST(N'2019-09-25 10:33:43.000' AS DateTime), N'', CAST(N'2019-09-25 10:33:43.000' AS DateTime), CAST(N'2019-08-27 11:18:57.333' AS DateTime), NULL, NULL, NULL, N'3593c357-d878-4fcf-892d-74ab90172212', N'New Proposal 8', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (10, 6, 7, CAST(N'2019-08-29 14:35:14.000' AS DateTime), -1, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2019-08-29 15:07:15.000' AS DateTime), N'', CAST(N'2019-08-29 15:07:15.000' AS DateTime), CAST(N'2019-08-29 14:35:14.803' AS DateTime), NULL, NULL, NULL, N'781b3b35-36e0-454a-af72-c2a7be954edd', N'New Proposal 9', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (11, 6, 8, CAST(N'2019-09-25 11:18:17.000' AS DateTime), -1, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-04-15 14:04:34.000' AS DateTime), N'', CAST(N'2020-04-15 14:04:34.000' AS DateTime), CAST(N'2019-09-25 11:18:17.930' AS DateTime), NULL, NULL, NULL, N'1ce1622e-0fa9-42e1-bbaa-9490de85f75b', N'New Proposal 10', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (12, 7, 9, CAST(N'2019-09-25 11:20:06.000' AS DateTime), -1, 36, 1, N'', 0, 0, 0, N'', N'', CAST(N'2020-04-15 22:13:41.000' AS DateTime), N'', CAST(N'2020-04-15 22:13:41.000' AS DateTime), CAST(N'2019-09-25 11:20:06.377' AS DateTime), NULL, NULL, NULL, N'193e46f8-98e0-4993-91f3-f43f2d38cd0f', N'New Proposal 11', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (17, 10, 23, CAST(N'2019-10-23 00:00:00.000' AS DateTime), -1, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-04-20 21:46:22.000' AS DateTime), N'', CAST(N'2020-04-20 21:46:22.000' AS DateTime), CAST(N'2019-11-12 12:19:39.120' AS DateTime), NULL, NULL, NULL, N'27c5022b-47d9-48ea-aba0-2ecc5e54fd1a', N'New Proposal 2', 1)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (18, 1, 1, CAST(N'2019-11-16 11:48:57.000' AS DateTime), -1, 36, 1, N'', 0, 0, 0, N'', N'', CAST(N'2019-12-06 14:51:31.000' AS DateTime), N'', CAST(N'2019-12-06 14:51:31.000' AS DateTime), CAST(N'2019-11-16 11:48:57.970' AS DateTime), NULL, NULL, NULL, N'e5fa2e35-c970-4114-b531-7bbd6da032ab', N'New Proposal 12', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (19, 7, 9, CAST(N'2019-09-25 11:20:06.000' AS DateTime), -1, 36, 1, N'', 0, 0, 0, N'', N'', CAST(N'2020-04-15 21:57:56.000' AS DateTime), N'', CAST(N'2020-04-15 21:57:56.000' AS DateTime), CAST(N'2020-02-22 23:41:35.310' AS DateTime), NULL, NULL, NULL, N'0490de77-655a-433c-9440-1e408203a17a', N'New Proposal 11', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (20, 7, 24, CAST(N'2020-02-26 13:39:28.000' AS DateTime), -1, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-04-19 16:15:38.000' AS DateTime), N'', CAST(N'2020-04-19 16:15:38.000' AS DateTime), CAST(N'2020-02-26 13:39:28.367' AS DateTime), NULL, NULL, NULL, N'3839bade-a4c6-4f33-9616-fa15c912326a', N'New Proposal 14', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (21, 7, 25, CAST(N'2020-04-15 22:53:59.000' AS DateTime), -1, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-04-20 21:47:02.000' AS DateTime), N'', CAST(N'2020-04-20 21:47:02.000' AS DateTime), CAST(N'2020-04-15 22:53:59.327' AS DateTime), NULL, NULL, NULL, N'49e5c459-ac3a-4431-ab7a-7619edb320f0', N'New Proposal 15', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (22, 1, 1, CAST(N'2020-04-30 02:08:16.000' AS DateTime), -1, 36, 1, N'', 0, 0, 0, N'', N'', CAST(N'2020-05-01 17:34:51.000' AS DateTime), N'', CAST(N'2020-05-01 17:34:51.000' AS DateTime), CAST(N'2020-04-30 02:08:16.153' AS DateTime), NULL, NULL, NULL, N'101253d6-f4fa-42a8-a791-35e00e7d21bd', N'New Proposal 16', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (1022, 11, 26, CAST(N'2020-04-30 15:35:05.000' AS DateTime), -1, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-04-30 15:35:39.000' AS DateTime), N'', CAST(N'2020-04-30 15:35:39.000' AS DateTime), CAST(N'2020-04-30 15:35:06.000' AS DateTime), NULL, NULL, NULL, N'dd9e5a64-c48d-4458-8c5a-908791b9c98a', N'New Proposal 17', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (2022, 11, 26, CAST(N'2020-05-01 11:04:20.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-05-01 11:04:20.000' AS DateTime), N'', CAST(N'2020-05-01 11:04:20.000' AS DateTime), CAST(N'2020-05-01 11:04:20.560' AS DateTime), NULL, NULL, NULL, N'5275426e-4df8-4fe1-a81b-549a2a388c8b', N'New Proposal 18', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (2023, 11, 26, CAST(N'2020-05-01 11:05:31.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-05-01 11:05:31.000' AS DateTime), N'', CAST(N'2020-05-01 11:05:31.000' AS DateTime), CAST(N'2020-05-01 11:05:31.123' AS DateTime), NULL, NULL, NULL, N'976819db-6e0b-4e71-887f-50206e423d9c', N'New Proposal 19', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (2024, 11, 26, CAST(N'2020-05-01 11:11:38.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-05-01 11:11:38.000' AS DateTime), N'', CAST(N'2020-05-01 11:11:38.000' AS DateTime), CAST(N'2020-05-01 11:11:38.683' AS DateTime), NULL, NULL, NULL, N'c9e97d6c-130a-4b17-bc68-346e8943757d', N'New Proposal 20', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (2025, 11, 26, CAST(N'2020-05-01 11:13:31.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-05-01 11:13:31.000' AS DateTime), N'', CAST(N'2020-05-01 11:13:31.000' AS DateTime), CAST(N'2020-05-01 11:13:31.997' AS DateTime), NULL, NULL, NULL, N'a064ea7d-c1cb-4a70-9886-29ba08898f59', N'New Proposal 21', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (2026, 11, 26, CAST(N'2020-05-01 11:19:39.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-05-01 11:19:39.000' AS DateTime), N'', CAST(N'2020-05-01 11:19:39.000' AS DateTime), CAST(N'2020-05-01 11:19:39.617' AS DateTime), NULL, NULL, NULL, N'dcce4d23-293b-434a-989a-e81b3b53faee', N'New Proposal 22', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (3022, 11, 26, CAST(N'2020-05-04 16:00:28.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-05-04 16:00:28.000' AS DateTime), N'', CAST(N'2020-05-04 16:00:28.000' AS DateTime), CAST(N'2020-05-04 16:00:28.037' AS DateTime), NULL, NULL, NULL, N'0209878c-5404-4855-9830-1aa87a3eee74', N'New Proposal 23', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (3023, 10, 1038, CAST(N'2020-05-04 16:02:05.000' AS DateTime), -1, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-05-04 16:02:38.000' AS DateTime), N'', CAST(N'2020-05-04 16:02:38.000' AS DateTime), CAST(N'2020-05-04 16:02:05.900' AS DateTime), NULL, NULL, NULL, N'496ccfee-c4a9-4f68-b343-bd091075f869', N'New Proposal 24', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (3024, 11, 26, CAST(N'2020-05-04 16:04:48.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-05-04 16:04:48.000' AS DateTime), N'', CAST(N'2020-05-04 16:04:48.000' AS DateTime), CAST(N'2020-05-04 16:04:48.110' AS DateTime), NULL, NULL, NULL, N'728dd7f5-aac4-4ddb-95c1-c0bdc36706b6', N'New Proposal 25', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (3025, 1, 1, CAST(N'2020-05-04 16:05:10.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-05-04 16:05:10.000' AS DateTime), N'', CAST(N'2020-05-04 16:05:10.000' AS DateTime), CAST(N'2020-05-04 16:05:10.947' AS DateTime), NULL, NULL, NULL, N'6b255782-77ac-4295-8ef2-03bebc075155', N'New Proposal 26', 0)
INSERT [dbo].[RW_ASSESSMENT] ([ID], [EquipmentID], [ComponentID], [AssessmentDate], [AssessmentMethod], [RiskAnalysisPeriod], [IsEquipmentLinked], [RecordType], [ProposalNo], [RevisionNo], [IsRecommend], [ProposalOrRevision], [AdoptedBy], [AdoptedDate], [RecommendedBy], [RecommendedDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [ProposalName], [AddByExcel]) VALUES (3026, 1, 1, CAST(N'2020-05-04 16:05:34.000' AS DateTime), 0, 36, 0, N'', 0, 0, 0, N'', N'', CAST(N'2020-05-04 16:05:34.000' AS DateTime), N'', CAST(N'2020-05-04 16:05:34.000' AS DateTime), CAST(N'2020-05-04 16:05:34.003' AS DateTime), NULL, NULL, NULL, N'ce958425-f077-401d-9b69-25043c64c44c', N'New Proposal 27', 0)
SET IDENTITY_INSERT [dbo].[RW_ASSESSMENT] OFF
INSERT [dbo].[RW_CA_TANK] ([ID], [Hydraulic_Water], [Hydraulic_Fluid], [Seepage_Velocity], [Flow_Rate_D1], [Flow_Rate_D2], [Flow_Rate_D3], [Flow_Rate_D4], [Leak_Duration_D1], [Leak_Duration_D2], [Leak_Duration_D3], [Leak_Duration_D4], [Release_Volume_Leak_D1], [Release_Volume_Leak_D2], [Release_Volume_Leak_D3], [Release_Volume_Leak_D4], [Release_Volume_Rupture_D1], [Release_Volume_Rupture_D2], [Release_Volume_Rupture_D3], [Release_Volume_Rupture_D4], [Liquid_Height], [Volume_Fluid], [Time_Leak_Ground], [Volume_SubSoil_Leak_D1], [Volume_SubSoil_Leak_D4], [Volume_Ground_Water_Leak_D1], [Volume_Ground_Water_Leak_D4], [Barrel_Dike_Leak], [Barrel_Dike_Rupture], [Barrel_Onsite_Leak], [Barrel_Onsite_Rupture], [Barrel_Offsite_Leak], [Barrel_Offsite_Rupture], [Barrel_Water_Leak], [Barrel_Water_Rupture], [FC_Environ_Leak], [FC_Environ_Rupture], [FC_Environ], [Material_Factor], [Component_Damage_Cost], [Business_Cost], [Consequence], [ConsequenceCategory]) VALUES (11, 47.52, 310014.783341, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RW_CA_TANK] ([ID], [Hydraulic_Water], [Hydraulic_Fluid], [Seepage_Velocity], [Flow_Rate_D1], [Flow_Rate_D2], [Flow_Rate_D3], [Flow_Rate_D4], [Leak_Duration_D1], [Leak_Duration_D2], [Leak_Duration_D3], [Leak_Duration_D4], [Release_Volume_Leak_D1], [Release_Volume_Leak_D2], [Release_Volume_Leak_D3], [Release_Volume_Leak_D4], [Release_Volume_Rupture_D1], [Release_Volume_Rupture_D2], [Release_Volume_Rupture_D3], [Release_Volume_Rupture_D4], [Liquid_Height], [Volume_Fluid], [Time_Leak_Ground], [Volume_SubSoil_Leak_D1], [Volume_SubSoil_Leak_D4], [Volume_Ground_Water_Leak_D1], [Volume_Ground_Water_Leak_D4], [Barrel_Dike_Leak], [Barrel_Dike_Rupture], [Barrel_Onsite_Leak], [Barrel_Onsite_Rupture], [Barrel_Offsite_Leak], [Barrel_Offsite_Rupture], [Barrel_Water_Leak], [Barrel_Water_Rupture], [FC_Environ_Leak], [FC_Environ_Rupture], [FC_Environ], [Material_Factor], [Component_Damage_Cost], [Business_Cost], [Consequence], [ConsequenceCategory]) VALUES (12, 4.752, 3360.573, 10183.55, 3.15589, 0, 0, 0.002458174, 30, 0, 0, 30, 94.67671, 0, 0, 0.07374521, 6.574586, 0, 0, 0, 0, 2373.426, 0.04271593, 94.67671, 0.07374521, 0, 0, 0, 6.574586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'A')
INSERT [dbo].[RW_CA_TANK] ([ID], [Hydraulic_Water], [Hydraulic_Fluid], [Seepage_Velocity], [Flow_Rate_D1], [Flow_Rate_D2], [Flow_Rate_D3], [Flow_Rate_D4], [Leak_Duration_D1], [Leak_Duration_D2], [Leak_Duration_D3], [Leak_Duration_D4], [Release_Volume_Leak_D1], [Release_Volume_Leak_D2], [Release_Volume_Leak_D3], [Release_Volume_Leak_D4], [Release_Volume_Rupture_D1], [Release_Volume_Rupture_D2], [Release_Volume_Rupture_D3], [Release_Volume_Rupture_D4], [Liquid_Height], [Volume_Fluid], [Time_Leak_Ground], [Volume_SubSoil_Leak_D1], [Volume_SubSoil_Leak_D4], [Volume_Ground_Water_Leak_D1], [Volume_Ground_Water_Leak_D4], [Barrel_Dike_Leak], [Barrel_Dike_Rupture], [Barrel_Onsite_Leak], [Barrel_Onsite_Rupture], [Barrel_Offsite_Leak], [Barrel_Offsite_Rupture], [Barrel_Water_Leak], [Barrel_Water_Rupture], [FC_Environ_Leak], [FC_Environ_Rupture], [FC_Environ], [Material_Factor], [Component_Damage_Cost], [Business_Cost], [Consequence], [ConsequenceCategory]) VALUES (19, 4.752, 3360.573, 10183.55, 3.15589, 0, 0, 0.002458174, 30, 0, 0, 30, 94.67671, 0, 0, 0.07374521, 6.574586, 0, 0, 0, 0, 2373.426, 0.04271593, 94.67671, 0.07374521, 0, 0, 0, 6.574586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'A')
INSERT [dbo].[RW_CA_TANK] ([ID], [Hydraulic_Water], [Hydraulic_Fluid], [Seepage_Velocity], [Flow_Rate_D1], [Flow_Rate_D2], [Flow_Rate_D3], [Flow_Rate_D4], [Leak_Duration_D1], [Leak_Duration_D2], [Leak_Duration_D3], [Leak_Duration_D4], [Release_Volume_Leak_D1], [Release_Volume_Leak_D2], [Release_Volume_Leak_D3], [Release_Volume_Leak_D4], [Release_Volume_Rupture_D1], [Release_Volume_Rupture_D2], [Release_Volume_Rupture_D3], [Release_Volume_Rupture_D4], [Liquid_Height], [Volume_Fluid], [Time_Leak_Ground], [Volume_SubSoil_Leak_D1], [Volume_SubSoil_Leak_D4], [Volume_Ground_Water_Leak_D1], [Volume_Ground_Water_Leak_D4], [Barrel_Dike_Leak], [Barrel_Dike_Rupture], [Barrel_Onsite_Leak], [Barrel_Onsite_Rupture], [Barrel_Offsite_Leak], [Barrel_Offsite_Rupture], [Barrel_Water_Leak], [Barrel_Water_Rupture], [FC_Environ_Leak], [FC_Environ_Rupture], [FC_Environ], [Material_Factor], [Component_Damage_Cost], [Business_Cost], [Consequence], [ConsequenceCategory]) VALUES (20, 0, 0, 0, 37.09965, 148.3518, 9494.278, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'A')
INSERT [dbo].[RW_CA_TANK] ([ID], [Hydraulic_Water], [Hydraulic_Fluid], [Seepage_Velocity], [Flow_Rate_D1], [Flow_Rate_D2], [Flow_Rate_D3], [Flow_Rate_D4], [Leak_Duration_D1], [Leak_Duration_D2], [Leak_Duration_D3], [Leak_Duration_D4], [Release_Volume_Leak_D1], [Release_Volume_Leak_D2], [Release_Volume_Leak_D3], [Release_Volume_Leak_D4], [Release_Volume_Rupture_D1], [Release_Volume_Rupture_D2], [Release_Volume_Rupture_D3], [Release_Volume_Rupture_D4], [Liquid_Height], [Volume_Fluid], [Time_Leak_Ground], [Volume_SubSoil_Leak_D1], [Volume_SubSoil_Leak_D4], [Volume_Ground_Water_Leak_D1], [Volume_Ground_Water_Leak_D4], [Barrel_Dike_Leak], [Barrel_Dike_Rupture], [Barrel_Onsite_Leak], [Barrel_Onsite_Rupture], [Barrel_Offsite_Leak], [Barrel_Offsite_Rupture], [Barrel_Water_Leak], [Barrel_Water_Rupture], [FC_Environ_Leak], [FC_Environ_Rupture], [FC_Environ], [Material_Factor], [Component_Damage_Cost], [Business_Cost], [Consequence], [ConsequenceCategory]) VALUES (21, 47.52, 931.6255, 2823.107, 2073.37, 0, 0, 0, 7, 0, 0, 7, 14513.59, 0, 0, 0, 93902.46, 0, 0, 93902.46, 0, 93902.46, 0.1540855, 14513.59, 0, 0, 0, 0, 41.35415, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 360262500, 0, 360262500, N'E')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 0, 0, 1, 0, 0, CAST(N'2019-07-30 11:31:50.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 10, 0, CAST(N'2019-07-30 11:31:51.040' AS DateTime), NULL, NULL, NULL, N'dc9651d0-8015-4402-b25f-b8357f98ec31')
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
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 0, 0, 1, 0, 1, CAST(N'1900-03-07 00:00:00.000' AS DateTime), N'No coating or poor quality', N'Pearlite', N'Average', 0, N'Unknown', N'Castable refractory', 76, 454, 0, CAST(N'2019-11-12 12:19:58.500' AS DateTime), NULL, NULL, NULL, N'83d0d411-a5ea-4366-8fa2-bf689bbde265')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 0, 0, 0, 0, 0, CAST(N'2019-11-16 11:48:57.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2019-11-16 11:48:58.087' AS DateTime), NULL, NULL, NULL, N'89e748e4-a762-4cc6-959e-990cfc864d58')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 0, 0, 0, 0, 0, CAST(N'2019-09-25 11:20:06.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-02-22 23:41:35.390' AS DateTime), NULL, NULL, NULL, N'be757cc6-6c2b-48fa-97ba-d3e30f724550')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 0, 0, 0, 0, 0, CAST(N'2020-02-26 13:39:28.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-02-26 13:39:28.450' AS DateTime), NULL, NULL, NULL, N'b6e0a659-f361-4830-afaa-8e560bc25b11')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 0, 0, 0, 0, 0, CAST(N'2020-04-15 22:53:59.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-04-15 22:53:59.347' AS DateTime), NULL, NULL, NULL, N'ea1c6ac0-9708-47e2-975a-be3551caa927')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 0, 0, 0, 0, 0, CAST(N'2020-04-30 02:08:16.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-04-30 02:08:16.180' AS DateTime), NULL, NULL, NULL, N'1caed989-d582-41d1-8ecc-12c8c8d7e132')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 0, 0, 0, 0, 0, CAST(N'2020-04-30 15:35:06.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-04-30 15:35:06.033' AS DateTime), NULL, NULL, NULL, N'9290bf60-4961-40d6-a208-0fd626352c17')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2022, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:04:20.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-05-01 11:04:20.677' AS DateTime), NULL, NULL, NULL, N'f4d7913f-4b25-4a56-b7ef-0d0b69f89e8f')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2023, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:05:31.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-05-01 11:05:42.563' AS DateTime), NULL, NULL, NULL, N'4e41fb9c-b870-47ee-9644-03511d123646')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2024, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:11:38.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-05-01 11:11:38.713' AS DateTime), NULL, NULL, NULL, N'10688497-bd4b-4d29-b2eb-bedaf6da54b0')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2025, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:13:32.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-05-01 11:13:32.050' AS DateTime), NULL, NULL, NULL, N'4587eecb-aae1-42b1-8072-bb51d85bf5c6')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2026, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:19:39.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-05-01 11:19:39.640' AS DateTime), NULL, NULL, NULL, N'9797905f-5e44-4796-befa-dae43cff5c0c')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3022, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:00:28.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-05-04 16:00:28.090' AS DateTime), NULL, NULL, NULL, N'88cb94c3-cae8-4f60-8f48-e8fe34ea7a16')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:02:05.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-05-04 16:02:05.927' AS DateTime), NULL, NULL, NULL, N'226f8c11-8dd9-4c4f-b317-4c6ef0782ff2')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3024, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:04:48.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-05-04 16:04:48.133' AS DateTime), NULL, NULL, NULL, N'f93c922d-53d8-4c2a-b3b3-d0aa00a95492')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3025, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:05:10.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-05-04 16:05:10.973' AS DateTime), NULL, NULL, NULL, N'9d9966c4-1e00-4bdc-8797-85d742fe32a5')
INSERT [dbo].[RW_COATING] ([ID], [ExternalCoating], [ExternalInsulation], [InternalCladding], [InternalCoating], [InternalLining], [ExternalCoatingDate], [ExternalCoatingQuality], [ExternalInsulationType], [InsulationCondition], [InsulationContainsChloride], [InternalLinerCondition], [InternalLinerType], [CladdingThickness], [CladdingCorrosionRate], [SupportConfigNotAllowCoatingMaint], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3026, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:05:34.000' AS DateTime), N'', N'', N'', 0, N'', N'', 0, 0, 0, CAST(N'2020-05-04 16:05:34.030' AS DateTime), NULL, NULL, NULL, N'fcb4c137-28a2-4da0-9d58-506979ff279b')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 0, 1212, 331, 11, 12, N'', N'', N'Between 200 and 237', 0, 0, N'', N'', 1, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 2, 1, 21, N'Medium', 0, 445, N'', 0, 0, 1, 1, 0, 1, 0, 34, CAST(N'2019-07-30 11:31:51.017' AS DateTime), NULL, NULL, NULL, N'dfd35175-63b7-420a-8962-edf9e5c800d1')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-20 21:38:10.757' AS DateTime), NULL, NULL, NULL, N'3ccb2c05-bb2e-4f88-b5c6-9dc4c8f782c4')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-21 15:24:56.340' AS DateTime), NULL, NULL, NULL, N'3918e73f-5a25-4819-a799-6ad93869d02e')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-21 15:25:47.030' AS DateTime), NULL, NULL, NULL, N'4ecd8ef7-2aea-4e32-a906-cc470b855821')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-21 18:48:36.587' AS DateTime), NULL, NULL, NULL, N'b0c3be8b-b5fb-45ad-9a65-d36199805607')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-27 10:49:03.760' AS DateTime), NULL, NULL, NULL, N'5848e00c-7d2f-4201-a657-ed071ebc254f')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-27 11:09:07.503' AS DateTime), NULL, NULL, NULL, N'65439b5c-9a39-48c1-a866-f6ed3a20b578')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 0, 0, 0, 0, 0, N'', N'', N'Greater than 237', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-27 11:18:57.357' AS DateTime), NULL, NULL, NULL, N'22a762bd-31bf-4da9-bc5b-bed23023d019')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 0, 0, 0, 0, 0, N'All branches greater than 2" Nominal OD', N'Threaded, socket welded, or saddle on', N'', 0, 0, N'', N'Experience', 0, N'PRV chatter', 0, 0, N'6 to 10', N'Good condition', N'One', N'Moderate', 1, N'2 to 13 weeks', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-08-29 14:35:14.947' AS DateTime), NULL, NULL, NULL, N'bf053f36-39c8-49f2-b03a-d827de52d10f')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-09-25 11:18:18.000' AS DateTime), NULL, NULL, NULL, N'12e97661-f6a5-432e-bf14-4346c38941bb')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 1, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-09-25 11:20:06.433' AS DateTime), NULL, NULL, NULL, N'b9b6a563-309f-40a0-964e-150b1b103cb7')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 0, 43, 34, 12, 4, N'', N'', N'Below 200', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 21, 0, 0, N'', 0, 12, N'', 0, 0, 0, 0, 0, 0, 0, 23, CAST(N'2019-11-12 12:19:54.607' AS DateTime), NULL, NULL, NULL, N'af11cc4f-827d-43ef-bfb6-7476dade459c')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-11-16 11:48:58.060' AS DateTime), NULL, NULL, NULL, N'3c9766a2-23a6-4d79-9de9-4aaa4ccf6021')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 0, 32, 0, 12, 32, N'', N'', N'Between 200 and 237', 0, 0, N'Average', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'Low', 1, 1, 13, 32, 0.2, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-02-22 23:41:35.370' AS DateTime), NULL, NULL, NULL, N'59bd7d66-8b57-455b-837e-87c4f2919761')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 1, 1, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-02-26 13:39:28.430' AS DateTime), NULL, NULL, NULL, N'fe9da2fb-c0c4-414a-b1db-e22e27f7aef5')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 12000, 32, 0, 12, 32, N'', N'', N'Between 200 and 237', 0, 0, N'Average', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 1, 0, 32, 0, 23, N'', 0, 234, N'', 0, 0, 0, 0, 0, 0, 0, 34, CAST(N'2020-04-15 22:53:59.343' AS DateTime), NULL, NULL, NULL, N'8797e328-8077-469c-8587-2d2ce1cbf7e0')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-04-30 02:08:16.177' AS DateTime), NULL, NULL, NULL, N'97bd8732-5931-494e-8328-5b3caa713e76')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-04-30 15:35:06.027' AS DateTime), NULL, NULL, NULL, N'2bfa7a76-8293-4c34-bfae-b425756e294e')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2022, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:04:20.657' AS DateTime), NULL, NULL, NULL, N'8d7a789e-4d8c-41e6-bb44-2a3f50dadbe7')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2023, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:05:41.670' AS DateTime), NULL, NULL, NULL, N'7742a4d6-3663-4695-98c0-6e63ba26134a')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2024, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:11:38.707' AS DateTime), NULL, NULL, NULL, N'59b9981a-74ae-4af5-b437-68c237be6e0e')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2025, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:13:32.040' AS DateTime), NULL, NULL, NULL, N'5f98d942-ab67-448e-ad84-633ea116b095')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2026, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:19:39.633' AS DateTime), NULL, NULL, NULL, N'd267bd95-d8b8-4d62-8815-db244bfe2310')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3022, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:00:28.080' AS DateTime), NULL, NULL, NULL, N'a9d38804-6e55-4c5d-92bb-e3f955b1c12a')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:02:05.923' AS DateTime), NULL, NULL, NULL, N'c2c066e2-8ff2-4098-821b-21ef98ceb15c')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3024, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:04:48.130' AS DateTime), NULL, NULL, NULL, N'167d8878-e343-4dd2-979c-7ce4747a3dc9')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3025, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:05:10.970' AS DateTime), NULL, NULL, NULL, N'c5879cc2-4944-47e4-b7b8-b73e04d5a8d9')
INSERT [dbo].[RW_COMPONENT] ([ID], [NominalDiameter], [NominalThickness], [CurrentThickness], [MinReqThickness], [CurrentCorrosionRate], [BranchDiameter], [BranchJointType], [BrinnelHardness], [ChemicalInjection], [HighlyInjectionInsp], [ComplexityProtrusion], [CorrectiveAction], [CracksPresent], [CyclicLoadingWitin15_25m], [DamageFoundInspection], [DeltaFATT], [NumberPipeFittings], [PipeCondition], [PreviousFailures], [ShakingAmount], [ShakingDetected], [ShakingTime], [SeverityOfVibration], [ReleasePreventionBarrier], [ConcreteFoundation], [ShellHeight], [AllowableStress], [WeldJointEfficiency], [ComponentVolume], [ConfidenceCorrosionRate], [MinimumStructuralThicknessGoverns], [StructuralThickness], [CracksCurrentCondition], [FabricatedSteel], [EquipmentSatisfied], [NominalOperatingConditions], [CETGreaterOrEqual], [CyclicServiceFatigueVibration], [EquipmentCircuitShock], [HTHADamageObserved], [BrittleFractureThickness], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3026, 0, 0, 0, 0, 0, N'', N'', N'', 0, 0, N'', N'', 0, N'', 0, 0, N'', N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:05:34.030' AS DateTime), NULL, NULL, NULL, N'6579bb84-8c10-46f9-8fdc-82df53b3c083')
SET IDENTITY_INSERT [dbo].[RW_CORROSION_RATE_TANK] ON 

INSERT [dbo].[RW_CORROSION_RATE_TANK] ([ID], [CorrosionID], [SoilSideCorrosionRate], [ProductSideCorrosionRate], [PotentialCorrosion], [TankPadMaterial], [TankDrainageType], [CathodicProtectionType], [TankBottomType], [SoilSideTemperature], [ProductCondition], [ProductSideTemp], [SteamCoil], [WaterDrawOff], [ProductSideBottom], [ModifiedSoilSideCorrosionRate], [ModifiedProductSideCorrosionRate], [FinalEstimatedCorrosionRate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 7, 123, 123, N'Very Corrosive (<500  Ω-cm)', N'Continuous Asphalt', N'Storm Water Collects At Tank Base', N'Yes Per API 651', N'RPB Not Per API 650', N'24< Temp ≤ 66', N'Wet', N'66 < Temp ≤ 93', N'Yes', N'No', N'Widespread', 187.5258, 257439, 4449648, CAST(N'2019-08-22 11:31:29.920' AS DateTime), NULL, NULL, NULL, N'3f542f22-ecbc-4880-b3c2-2cf3f009b197')
INSERT [dbo].[RW_CORROSION_RATE_TANK] ([ID], [CorrosionID], [SoilSideCorrosionRate], [ProductSideCorrosionRate], [PotentialCorrosion], [TankPadMaterial], [TankDrainageType], [CathodicProtectionType], [TankBottomType], [SoilSideTemperature], [ProductCondition], [ProductSideTemp], [SteamCoil], [WaterDrawOff], [ProductSideBottom], [ModifiedSoilSideCorrosionRate], [ModifiedProductSideCorrosionRate], [FinalEstimatedCorrosionRate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 11, 144, 134, N'Corrosive (500-1000  Ω-cm)', N'Crushed Limestone', N'Storm Water Collects At Tank Base', N'Yes Per API 651', N'RPB Not Per API 650', N'66 < Temp ≤ 93', N'Dry', N'93 < Temp ≤ 121', N'Yes', N'Yes', N'Localised', 302.7024, 151.018, 302.7024, CAST(N'2019-08-23 10:58:24.107' AS DateTime), NULL, NULL, NULL, N'f81ebbc1-c470-4fb2-b512-54e02fa8a692')
INSERT [dbo].[RW_CORROSION_RATE_TANK] ([ID], [CorrosionID], [SoilSideCorrosionRate], [ProductSideCorrosionRate], [PotentialCorrosion], [TankPadMaterial], [TankDrainageType], [CathodicProtectionType], [TankBottomType], [SoilSideTemperature], [ProductCondition], [ProductSideTemp], [SteamCoil], [WaterDrawOff], [ProductSideBottom], [ModifiedSoilSideCorrosionRate], [ModifiedProductSideCorrosionRate], [FinalEstimatedCorrosionRate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 16, 0, 0, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, 0, 0, CAST(N'2019-10-23 14:48:50.623' AS DateTime), NULL, NULL, NULL, N'f6ffd8cc-c64a-4589-93e5-0775224a8849')
INSERT [dbo].[RW_CORROSION_RATE_TANK] ([ID], [CorrosionID], [SoilSideCorrosionRate], [ProductSideCorrosionRate], [PotentialCorrosion], [TankPadMaterial], [TankDrainageType], [CathodicProtectionType], [TankBottomType], [SoilSideTemperature], [ProductCondition], [ProductSideTemp], [SteamCoil], [WaterDrawOff], [ProductSideBottom], [ModifiedSoilSideCorrosionRate], [ModifiedProductSideCorrosionRate], [FinalEstimatedCorrosionRate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 17, 0, 0, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, 0, 0, CAST(N'2019-10-23 14:52:43.977' AS DateTime), NULL, NULL, NULL, N'1768c19a-5e27-46d5-9e63-9e8bdae33c3e')
INSERT [dbo].[RW_CORROSION_RATE_TANK] ([ID], [CorrosionID], [SoilSideCorrosionRate], [ProductSideCorrosionRate], [PotentialCorrosion], [TankPadMaterial], [TankDrainageType], [CathodicProtectionType], [TankBottomType], [SoilSideTemperature], [ProductCondition], [ProductSideTemp], [SteamCoil], [WaterDrawOff], [ProductSideBottom], [ModifiedSoilSideCorrosionRate], [ModifiedProductSideCorrosionRate], [FinalEstimatedCorrosionRate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 18, 0, 0, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, 0, 0, CAST(N'2019-10-23 14:59:35.190' AS DateTime), NULL, NULL, NULL, N'b03db8b8-0f09-4bb6-ad19-b3ab8c471a00')
INSERT [dbo].[RW_CORROSION_RATE_TANK] ([ID], [CorrosionID], [SoilSideCorrosionRate], [ProductSideCorrosionRate], [PotentialCorrosion], [TankPadMaterial], [TankDrainageType], [CathodicProtectionType], [TankBottomType], [SoilSideTemperature], [ProductCondition], [ProductSideTemp], [SteamCoil], [WaterDrawOff], [ProductSideBottom], [ModifiedSoilSideCorrosionRate], [ModifiedProductSideCorrosionRate], [FinalEstimatedCorrosionRate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 19, 0, 0, N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, 0, 0, CAST(N'2019-10-23 15:58:37.873' AS DateTime), NULL, NULL, NULL, N'a0a65528-d550-4034-9294-785198dbe789')
SET IDENTITY_INSERT [dbo].[RW_CORROSION_RATE_TANK] OFF
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.400' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'21668dd2-2d01-4615-98ca-533fa48be76c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.400' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'181f377e-7516-4138-bd1f-ec07779bfa7b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 8, 1, N'', 0, 0, 0, 1, 0, 0.1, 0.1, 0.1, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.330' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'5f6dd1e4-c260-428f-9e4a-06842e4c9e0b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.333' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'c37492f4-9e2a-4694-bd71-01423c882efd')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.403' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'c5d01b3c-3c7e-413d-a0f9-072b66157bc8')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.403' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'65728e75-8888-4e03-b4ac-bc01d9c60498')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.400' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'29f6b9ce-6e13-4c38-96be-70d4fa784280')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 32, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.377' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'4113b564-88a3-401c-a66d-54d90d8c7bda')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 34, 1, N'', 0, 0, 0, 1, 0, 0.001840417, 0.001840417, 0.001840417, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.373' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'44c68a53-efa0-40ac-95a0-8b5d6767170a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.343' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'e03e5ddc-72a6-4191-84dc-e6a5352c4e09')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.367' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'be9429eb-8d7b-49dc-b28a-3d1ddb71d4db')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.340' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'e98f7bf7-a9ee-44be-bdeb-ca1c30e96154')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.370' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'abde0ad4-c204-46d5-8920-8a70616c3eaf')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-22 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.380' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'a8b56510-a2a2-478d-872b-bc454ed0f588')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-22 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.377' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'85206147-f3f1-4535-a16b-630fde1f777c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.373' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'be597e68-44a9-47d7-88f1-167564859805')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.380' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'86cb574f-ec48-412e-af22-d3e9b297a287')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.347' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'6501b887-bfce-4721-b425-206c289b3f68')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.370' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'7abf3c1b-1a01-4f79-9b61-f032fc6fa04d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 72, 1, N'', 0, 0, 0, 1, 0, 5000, 12319.65, 31114.42, 0, 0, N'E', N'E', 0, CAST(N'2020-04-22 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.367' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'66a8ae76-5f29-432a-bda3-c5f4b123d983')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-02 16:30:50.000' AS DateTime), CAST(N'2019-08-21 11:09:38.347' AS DateTime), NULL, CAST(N'2020-05-02 16:30:50.000' AS DateTime), NULL, N'd575ee32-0812-43cd-814c-52e5712f3207')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.540' AS DateTime), NULL, NULL, NULL, N'816badf7-2aee-4800-8c1b-ce514ece75ea')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.540' AS DateTime), NULL, NULL, NULL, N'585cb327-1a22-4132-ba39-efc8f4bd1d44')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 8, 1, N'', 0, 0, 0, 1, 0, 6500, 6500, 6500, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.520' AS DateTime), NULL, NULL, NULL, N'dcb49c43-4890-4b5a-bc30-e821a29836cc')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.520' AS DateTime), NULL, NULL, NULL, N'e5642d6c-c55f-4c61-b2b3-d6b8ae23b77e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.543' AS DateTime), NULL, NULL, NULL, N'7fd4f495-4b73-416c-bf38-2545bee1fb08')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.543' AS DateTime), NULL, NULL, NULL, N'1a6d28d1-6d7b-4e5b-aabb-4e1931a2f331')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.540' AS DateTime), NULL, NULL, NULL, N'15b8fb92-a100-46f0-85fc-c0ab23efd9d5')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 32, 1, N'', 0, 0, 0, 1, 0, 1900, 1900, 1900, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.537' AS DateTime), NULL, NULL, NULL, N'9a928c97-62d0-424b-9795-b6c8645add30')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 34, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.537' AS DateTime), NULL, NULL, NULL, N'f84bc9bb-815f-417d-9925-fcb5b59b7284')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.527' AS DateTime), NULL, NULL, NULL, N'0a435df4-5b48-4ee8-9c36-a172ae6a198e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.530' AS DateTime), NULL, NULL, NULL, N'92ff2b57-3b6c-4714-9da6-a9e63034ea85')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.523' AS DateTime), NULL, NULL, NULL, N'1ae19209-ff61-4f22-a929-7c80a36ea55b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.533' AS DateTime), NULL, NULL, NULL, N'cb8a1bf2-b038-45c2-843a-a756f4d96b86')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.537' AS DateTime), NULL, NULL, NULL, N'eec52113-ab61-4856-98a7-0b2092e2090c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.537' AS DateTime), NULL, NULL, NULL, N'62f4f504-5c25-4352-af59-706d2bd5a7b4')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.533' AS DateTime), NULL, NULL, NULL, N'6d08db00-a85e-4e1e-9643-48f732b1e972')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.540' AS DateTime), NULL, NULL, NULL, N'4ebd9c68-77dc-4a60-9cc1-c64c09bde733')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.530' AS DateTime), NULL, NULL, NULL, N'c614dcb2-6d00-4355-aabc-097895b12594')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.533' AS DateTime), NULL, NULL, NULL, N'8e7e4457-01cf-403b-9d4b-5933a6d19b5d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.530' AS DateTime), NULL, NULL, NULL, N'c4bbe304-089d-45d4-a1b0-676423a91bda')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:08.000' AS DateTime), CAST(N'2020-04-30 22:52:08.527' AS DateTime), NULL, NULL, NULL, N'df13e4aa-fedd-47d9-9e0b-7213f2d00e7a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.757' AS DateTime), NULL, NULL, NULL, N'5f24fa8c-dcf3-43b3-8f2e-14896cd926a6')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.753' AS DateTime), NULL, NULL, NULL, N'3f622bfc-55d7-4f79-a9cc-ed8ee88588f2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 8, 1, N'', 0, 0, 0, 1, 0, 1390, 1390, 1390, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.727' AS DateTime), NULL, NULL, NULL, N'38a64586-5751-411b-8d4b-fbdfee99341a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.733' AS DateTime), NULL, NULL, NULL, N'822b4a1c-f427-4e22-be5f-270f77ef1e38')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.760' AS DateTime), NULL, NULL, NULL, N'4a652d29-c602-4bfa-9af6-bad5fb2e56d0')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.757' AS DateTime), NULL, NULL, NULL, N'473324f5-ff1a-4caa-9994-a75acc9908f1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.757' AS DateTime), NULL, NULL, NULL, N'bb8a7004-e0ca-409c-87ac-a68aabb25cb8')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 32, 1, N'', 0, 0, 0, 1, 0, 1390, 1390, 1390, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.750' AS DateTime), NULL, NULL, NULL, N'438e817d-3b9e-45bb-9414-507d4f883edc')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 34, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.747' AS DateTime), NULL, NULL, NULL, N'51411348-3410-4e22-bb2a-a07def949409')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.737' AS DateTime), NULL, NULL, NULL, N'67063504-9e61-43d5-ac21-4eb09907984f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.740' AS DateTime), NULL, NULL, NULL, N'99c6d88a-9ebd-4063-a5b5-5dde47fde755')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.737' AS DateTime), NULL, NULL, NULL, N'0dbcb2b3-5139-48d0-8275-9c03550cc082')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.743' AS DateTime), NULL, NULL, NULL, N'45eee891-f166-4409-a981-41262f166339')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.750' AS DateTime), NULL, NULL, NULL, N'98215d64-d86b-4665-8cd7-97a94d7307aa')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.750' AS DateTime), NULL, NULL, NULL, N'8b12be51-f647-4f64-8deb-200cc526861d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.747' AS DateTime), NULL, NULL, NULL, N'dc101057-ddeb-48ec-acab-cefb8f5d8d6f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.753' AS DateTime), NULL, NULL, NULL, N'e0891728-31ea-461e-8863-9c87ae3fddfe')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.740' AS DateTime), NULL, NULL, NULL, N'd30bbecc-3329-45ec-93be-b6e0177e72f2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.743' AS DateTime), NULL, NULL, NULL, N'17e2fd91-d1ff-4b83-ae55-ba33fb5a83a1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.740' AS DateTime), NULL, NULL, NULL, N'28b18917-fdf8-468c-b254-5f361d9d4148')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:51:55.000' AS DateTime), CAST(N'2020-04-30 22:51:55.737' AS DateTime), NULL, NULL, NULL, N'908360ca-15c6-48e8-a0d7-a0f137019490')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.330' AS DateTime), NULL, NULL, NULL, N'62c35abb-59ee-4574-a566-f037ba320003')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.330' AS DateTime), NULL, NULL, NULL, N'25f7028d-d7cb-4e8f-b1f2-c3639e66ae21')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 8, 1, N'', 0, 0, 0, 1, 0, 6500, 6500, 6500, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.313' AS DateTime), NULL, NULL, NULL, N'cb6a7931-fc87-4f8e-b8a0-07498c2e005c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.313' AS DateTime), NULL, NULL, NULL, N'119a10f1-45b5-490d-bd41-a01165fac200')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.333' AS DateTime), NULL, NULL, NULL, N'7b8f3ad4-9d7a-413e-9656-369c27023d95')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.330' AS DateTime), NULL, NULL, NULL, N'7f507b5d-be7e-4b6a-bdc4-3c5345380033')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.330' AS DateTime), NULL, NULL, NULL, N'2679df78-ae88-48d4-8ce0-a22aefbb5dcb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 32, 1, N'', 0, 0, 0, 1, 0, 1900, 1900, 1900, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.327' AS DateTime), NULL, NULL, NULL, N'60bb0ee6-dbc3-4539-9d90-45f2159353ad')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 34, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.327' AS DateTime), NULL, NULL, NULL, N'e99e6800-81b0-48ff-81fe-76b2f2a6459b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.317' AS DateTime), NULL, NULL, NULL, N'ec296a63-a83b-4501-a21d-988cbb0c55f2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.320' AS DateTime), NULL, NULL, NULL, N'b18f413b-57a4-4cbd-a426-02e6f2c45449')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.317' AS DateTime), NULL, NULL, NULL, N'add3560b-d1cc-4017-b689-fc89c9ecc634')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.320' AS DateTime), NULL, NULL, NULL, N'a263a5ba-eb61-4f90-9a9e-0876039796de')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.327' AS DateTime), NULL, NULL, NULL, N'315133c7-b002-4b16-a9f5-aeb19bb0a1a5')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.327' AS DateTime), NULL, NULL, NULL, N'd917dc0d-e858-4058-8fa6-da38ad39be53')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.323' AS DateTime), NULL, NULL, NULL, N'a2d05e98-cd3b-416a-a10a-ea23409d0b0c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.330' AS DateTime), NULL, NULL, NULL, N'1884c0d9-a088-4314-8b2f-a49bb0f41ec2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.320' AS DateTime), NULL, NULL, NULL, N'ff4fad21-dec4-4db2-a394-a3a6c697fd39')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.323' AS DateTime), NULL, NULL, NULL, N'f30bd8d7-3f7d-4eae-b0d8-946fe68aa2c0')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.320' AS DateTime), NULL, NULL, NULL, N'602e0c11-117e-4130-a594-3714291f05e7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-07 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:24.000' AS DateTime), CAST(N'2020-04-30 22:52:24.317' AS DateTime), NULL, NULL, NULL, N'668d0e36-4b48-4f95-9d8b-071d46201eaa')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.433' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'1480a205-4c53-485f-9770-ae1c52a5f5c4')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.430' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'81d4b539-21ad-43d7-a0d8-a977b8510fa2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 8, 1, N'', 0, 0, 0, 1, 0, 6500, 6500, 6500, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.410' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'1aa0ab45-2234-4778-a648-4871a2f51e30')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.410' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'4ffe6d08-785b-4b07-88f1-7f839c586190')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.437' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'0f9ae6be-5d10-4951-9a89-918cf7d3d445')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.437' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'6e983650-3ba9-43f6-8e8a-69ff6e5a9e4b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.433' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'd4f93429-304c-45fc-a033-8f6a768abd24')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 32, 1, N'', 0, 0, 0, 1, 0, 1900, 1900, 1900, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.427' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'e0ede879-d08e-485b-b6b9-7abd0d9d840c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 34, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.427' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'd2db4db6-8f4d-4bcd-9189-435338bc9c9a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.413' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'c4182d7a-3317-4454-b76c-d6a7a2f213b9')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.420' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'6aa13b4f-bfc1-4c55-8468-bf4d3cb96afb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.410' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'2ede0e3c-6252-4d0c-8107-78b389270455')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.420' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'092eedfd-56f2-434e-a962-8c71192393af')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.430' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'103de983-70b1-4801-8a30-a2eb53afce07')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.427' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'77948219-e109-4c8e-8be2-e715ec33a25c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.423' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'fe051388-6cf9-4f95-aaa4-3e3dc5d90aa3')
GO
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.430' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'31fc37b8-3111-4e9c-a16b-68e786e119eb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.417' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'73b3144a-3a20-4cb1-8abd-8e6ae187ec63')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.423' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'fdeff444-8d50-40ef-aead-3218e89b57f1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.420' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'33af91f5-bef3-4508-9e7a-19fe8d2b82f8')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-08-27 00:00:00.000' AS DateTime), CAST(N'2035-04-30 22:52:34.000' AS DateTime), CAST(N'2019-08-27 11:02:43.417' AS DateTime), NULL, CAST(N'2020-04-30 22:52:34.000' AS DateTime), NULL, N'd17dbf2d-90b6-43da-a58d-c4f805a10f94')
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
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.897' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'e9235e6b-0767-4a40-9a46-a0576f2c08ab')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.840' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'dac39ba5-1a51-4b70-95d9-49a974082884')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 8, 1, N'', 0, 0, 0, 1, 0, 1390, 1390, 1390, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.347' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'c602b0b7-f781-4e4a-a963-b5c4835232bb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.380' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'beeef9e7-6629-48f3-859b-98b11fa48f5c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 10, 1, N'', 0, 0, 0, 1, 0, 4, 4, 4, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.957' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'75cee6ca-e8d5-4241-a0dc-62fb10cc10fb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.927' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'ee676b33-c94e-41d5-8b38-42ff618f6acb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.870' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'25e740f3-9cd7-41bc-b32a-a62292d3ba64')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 32, 1, N'', 0, 0, 0, 1, 0, 1390, 1390, 1390, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.710' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'5a97ceaa-01f3-46f3-b3f0-98e4205f767c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 34, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.680' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'f2a218b3-4fb2-423e-81e4-0810b02e4fba')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.437' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'6f0fc548-fcba-41f7-b5ab-4b67c7304846')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.527' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'a46717f4-c69b-44f0-9eef-575a31629883')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.407' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'86132f97-fb43-4321-ae19-3be1e377d6c3')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.587' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'2a13e0c1-96ce-4202-b0b3-42b2152bce7c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.780' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'9b8b27ae-32cf-4a9a-9c9b-9c0c577db601')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.743' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'e1828987-fc87-47cf-9557-22315969810b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.647' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'196cd187-848a-4192-95f4-30bb9f67e7b3')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.810' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'92a118f0-4ad6-4473-826c-82ef13c035d2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.497' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'16e94f4d-f3a1-4bf5-9f96-496274740eb7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.617' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'c1e9677a-15f6-4a44-a98d-467a8cda51f9')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.557' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'3000c1db-4ade-4135-af66-4bc2fc421c6b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-12-29 00:00:00.000' AS DateTime), CAST(N'2035-04-15 14:04:36.000' AS DateTime), CAST(N'2020-02-23 00:04:26.467' AS DateTime), NULL, CAST(N'2020-04-15 14:04:36.000' AS DateTime), NULL, N'38b98252-1a05-43cf-8e1f-2237a3092296')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.500' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'b5f664f9-7c04-4dda-8ac7-f6ad44a83ccc')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.417' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'332afd06-be7f-4159-9f85-5dfdedbc5062')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 8, 1, N'', 0, 0, 0, 1, 0, 32500, 32500, 32500, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:58.733' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'8eb505cd-bcec-4e8d-83fe-b9a6a6df0bf0')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:58.787' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'2bc86b27-5b5f-454b-8cc8-b1a324b3647c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.587' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'eeafeee5-bb9f-4389-9012-b045ea380c93')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.550' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'fa92e9fe-76f0-4b02-9ea0-c06304857c43')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.460' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'95cd3c66-9d0d-49fd-9543-7580f13a4b26')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 32, 1, N'', 0, 0, 0, 1, 0, 1900, 1900, 1900, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.260' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'9de92668-5d94-4e71-8488-e162c23c04ed')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 34, 1, N'', 0, 0, 0, 1, 0, 6500, 6500, 6500, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.217' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'a31c7be7-30fb-4c9b-b25c-725596c28fb4')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:58.880' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'cb848506-ac62-454c-9866-e714c811016d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.017' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'b4b04f26-2285-425d-bce0-b041417c0f86')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:58.837' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'81dfe1db-da25-4af7-960e-5e520b5fa436')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.097' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'8e2b8d7f-3679-4cf0-a48a-c2fbd84d4a4c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.337' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'87a24736-84c9-4683-b0d9-5d0887486de7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.300' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'4ecf8504-8a2d-497b-a3fd-3c95fdf61fbd')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.170' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'8de25d8a-966c-41b8-a5f4-46b865ce0cda')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.373' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'6f0b7b5e-47c9-461e-9be2-0f994ad7342e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:58.970' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'8576c341-f574-4ec2-a0dc-ae2a90c8de34')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.130' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'd3a1985b-7e72-412e-88b3-278fcce4b82a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:59.057' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'8daf4086-6df3-4d72-a523-01d73458de3c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 22:29:26.000' AS DateTime), CAST(N'2019-11-19 15:42:58.923' AS DateTime), NULL, CAST(N'2020-04-15 22:29:26.000' AS DateTime), NULL, N'f12b2b4e-821f-45cb-a260-75720847739f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:27.120' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'1a21bbcc-f1b7-4ac5-95da-cd56d4d20d12')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:27.050' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'a7554c3a-def8-4cf2-972d-019a61627131')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 9, 1, N'', 0, 0, 0, 1, 0, 0, 2, 16, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:40.000' AS DateTime), CAST(N'2019-11-12 12:23:26.393' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'b6df6ad5-599e-4f36-b20c-1ef77d40e26b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:27.193' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'261b71e8-da21-42b7-b410-a250faae3f8e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:27.157' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'53fa649f-e33b-44ed-bd11-aebac87c4ba1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:27.087' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'cdadd158-c2e0-498a-8d38-b74e657f7a87')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 32, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:26.880' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'4dbf8dfc-48b4-4d1d-b416-9c41d8b4a69c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 34, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:26.830' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'31c2f17d-80ff-494b-b3cf-4473cb1030a7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:26.493' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'7b8174ff-f227-4bcc-b08b-151315f89378')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:26.623' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'eac8dcfc-183f-43d3-a415-bb65fdbbdf11')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:26.440' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'c931e538-e4e4-4005-ba96-4483899506d8')
GO
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:26.720' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'cee6635f-db96-4c6c-8f03-47100d624ebb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:26.980' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'1888eaab-fb2e-4497-b273-bf8db0fc816b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:26.930' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'89583e24-ea54-4238-8542-e1ea49accb20')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:26.790' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'e3d0eb92-7ae7-489f-aedd-134d9fc430d7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:27.013' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'de573545-749e-4639-84c3-48aed352676e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:26.580' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'c93ac866-f496-4a9c-8919-07a28d0a93f1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:26.757' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'0d8a2469-73e3-4ce4-a3c6-7b28d35e8a67')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 72, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:26.673' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'af61f693-88ae-432f-8035-cf8dd9262747')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-04-20 21:46:41.000' AS DateTime), CAST(N'2019-11-12 12:23:26.530' AS DateTime), NULL, CAST(N'2020-04-20 21:46:41.000' AS DateTime), NULL, N'7c3840a4-1175-4faf-8ff7-367e0e5e1ff2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:46.000' AS DateTime), CAST(N'2019-11-16 11:52:10.473' AS DateTime), NULL, CAST(N'2019-12-06 14:51:46.000' AS DateTime), NULL, N'f7b2c867-02c1-479c-9804-4058265621fc')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:10.390' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'1fa6b6bf-5945-466e-8b61-b3b018befefe')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 8, 1, N'', 0, 0, 0, 0, 0, 695, 695, 695, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:09.743' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'791b51d5-ac29-4be1-bbfb-cb6c9e4a4530')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:09.780' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'e082eb99-589d-4d18-a3ca-84e9101877dd')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:46.000' AS DateTime), CAST(N'2019-11-16 11:52:10.543' AS DateTime), NULL, CAST(N'2019-12-06 14:51:46.000' AS DateTime), NULL, N'c894f136-3873-458c-8b1b-4299922fb754')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:46.000' AS DateTime), CAST(N'2019-11-16 11:52:10.507' AS DateTime), NULL, CAST(N'2019-12-06 14:51:46.000' AS DateTime), NULL, N'691e6ec8-71ff-4c11-8be4-826c124d0fbd')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:46.000' AS DateTime), CAST(N'2019-11-16 11:52:10.433' AS DateTime), NULL, CAST(N'2019-12-06 14:51:46.000' AS DateTime), NULL, N'24febfaa-acff-49a8-a978-e15fc274b7d8')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 32, 1, N'', 0, 0, 0, 0, 0, 1390, 1390, 1390, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:10.233' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'6061780a-41fe-4ad6-92b5-a19ad0e308c9')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 34, 1, N'', 0, 0, 0, 0, 0, 6500, 6500, 6500, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:10.197' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'67a615ce-b12b-4b29-8295-c9bbb137572d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:09.877' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'ff17f716-2b12-4eca-b5a4-b89a338d6c32')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:09.983' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'd5d6180a-205b-4e49-bc81-b2f6ea815aa7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:09.817' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'3f253cd6-b692-491e-8af1-23977eca9e49')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:10.060' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'13926421-ff5b-4b29-84c7-fd12f89e906e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 63, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:10.310' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'd120e108-39f1-4a6d-aa54-a38ae193faa1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 66, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:10.270' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'4eb64336-ddc7-48a7-bc97-6cbd93c9591e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:10.137' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'eb7c5c73-a3d6-4ed1-b2aa-4da7f7319238')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:10.353' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'bde9a3fa-d79e-478a-9b0d-24781a135118')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:09.950' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'ffaf3c71-fc5a-4e98-a805-e973c9568337')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:10.100' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'544a45ca-9871-49b0-a1de-bf54155b5e89')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:10.020' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'0c324579-0266-4721-84f8-618b39510063')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2034-12-06 14:51:45.000' AS DateTime), CAST(N'2019-11-16 11:52:09.910' AS DateTime), NULL, CAST(N'2019-12-06 14:51:45.000' AS DateTime), NULL, N'9d49b87c-e28a-4592-b239-5d48dc20eeff')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:08.243' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'257fcc5c-6bd4-41ee-9776-e8bf3cfe306b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 2, 1, N'', 0, 0, 0, 1, 0, 0.009, 0.009, 0.009, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:08.180' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'779b7964-45de-4e16-b1d9-c4eef3a8e373')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 8, 1, N'', 0, 0, 0, 1, 0, 32500, 32500, 32500, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:07.703' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'7f379d0b-436e-4313-a5ee-24ca29bdcadd')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:07.733' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'540cc982-6ca9-4472-af89-8fdb308ac179')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:08.300' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'fdfa07c6-c36c-43ed-8b37-6a5cf822d935')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:08.270' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'd31712eb-4ab7-4210-a986-c258e565233c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:08.213' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'e9c5fa66-c686-4092-acbf-4b9b07241b71')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 32, 1, N'', 0, 0, 0, 1, 0, 1900, 1900, 1900, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:08.057' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'36fb95b0-e8e2-47c8-a519-dabdee64f536')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 34, 1, N'', 0, 0, 0, 1, 0, 6500, 6500, 6500, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:08.027' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'd6bc267e-c9a6-4324-b96f-368a7b7b38ba')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:07.790' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'80f81906-4b7b-4568-a5cb-b3a131947a71')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:07.873' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'465b3e18-1559-4b30-889f-1957f428bb31')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:07.760' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'0896a1fd-dcec-4a1e-a346-020c0b42f398')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:07.930' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'b1b31607-871d-45fc-8adf-f0c3712b2082')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:08.113' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'd2eb5d46-c487-4fba-a18b-bf4273072bc1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:08.083' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'b514f862-5ed8-4389-b7c1-49084cc8333d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:07.997' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'8bf74b25-7ac4-456d-82e2-2b9aee0539d6')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:08.147' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'e38caf29-c805-4d43-9628-9902f4b79b03')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:07.847' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'99d4dbac-7ace-4cef-9b8f-a8d47b9aa1eb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:07.963' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'34a0f8bd-3ee7-4c83-bb30-111c48666adc')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:07.903' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'1a4ac41e-d709-4b43-9655-5c83bcb6842b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-15 21:58:01.000' AS DateTime), CAST(N'2020-02-22 23:43:07.817' AS DateTime), NULL, CAST(N'2020-04-15 21:58:01.000' AS DateTime), NULL, N'51de831f-c835-4b39-a732-b32e63e873f5')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.383' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'540cbdc7-ed1e-4ddf-a17a-14800b0d9d9e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.323' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'0d622932-41a7-4dd6-98b8-4d92399b6474')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 8, 1, N'', 0, 0, 0, 1, 0, 69500, 69500, 69500, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:47.000' AS DateTime), CAST(N'2020-02-26 13:41:30.810' AS DateTime), NULL, CAST(N'2020-04-19 16:15:47.000' AS DateTime), NULL, N'6cf25337-99f8-46e7-a535-68217db8286e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:47.000' AS DateTime), CAST(N'2020-02-26 13:41:30.840' AS DateTime), NULL, CAST(N'2020-04-19 16:15:47.000' AS DateTime), NULL, N'36cd8e4d-5df7-4d1b-9b4b-47e50c20f6b0')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.443' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'd9806ed8-fc66-4a4d-bacf-d5f9e2a9d149')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.413' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'3f77c7d8-f543-4395-b3bb-5a89eb2bf6f7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.353' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'73f96111-aecc-4d5e-b4e0-96887e4b9fd7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 32, 1, N'', 0, 0, 0, 1, 0, 1390, 1390, 1390, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.203' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'f0cd9320-cbd4-4b7b-95d0-2e7158cd7a5b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 34, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.153' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'ce367d1c-dca7-492b-990d-e8043e8a7375')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:47.000' AS DateTime), CAST(N'2020-02-26 13:41:30.893' AS DateTime), NULL, CAST(N'2020-04-19 16:15:47.000' AS DateTime), NULL, N'72a972ae-6617-4927-9533-064bb4f8bc88')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.003' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'27dd3349-c311-4ce8-ba2e-94999268fd9b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:47.000' AS DateTime), CAST(N'2020-02-26 13:41:30.867' AS DateTime), NULL, CAST(N'2020-04-19 16:15:47.000' AS DateTime), NULL, N'462edba9-adbc-44c3-974b-b9c9b099c891')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.063' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'557548fe-7785-45ce-b32b-b9a117ca2475')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.263' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'6889def2-bf6b-46ae-9652-29ce2e761489')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.233' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'ee9be008-5778-445b-9cd0-31f863fe8690')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.123' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'059d5e72-2617-4744-8241-54d76f8c2857')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.293' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'768dd70d-6b71-4c77-9b77-46492e0ce73b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:30.973' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'ca9845b8-88c4-408b-b824-669c6254a66b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.093' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'58357aac-59e7-450a-9dd1-5679c7e634d6')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:31.033' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'f214afc8-b75a-4d7a-9373-e735fc2c1e44')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2035-04-19 16:15:48.000' AS DateTime), CAST(N'2020-02-26 13:41:30.927' AS DateTime), NULL, CAST(N'2020-04-19 16:15:48.000' AS DateTime), NULL, N'98bc2254-7168-4a15-b574-a537c3127a7e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.920' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'308aae10-f09d-4da9-85ea-71effed4a564')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 2, 1, N'', 0, 0, 0, 1, 0, 175, 175, 175, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.913' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'fd9898fa-f7a0-494a-ab68-1ff71b7f8f94')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 8, 1, N'', 0, 0, 0, 1, 0, 69500, 69500, 69500, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:10.000' AS DateTime), CAST(N'2020-04-15 22:56:28.890' AS DateTime), NULL, CAST(N'2020-04-20 21:47:10.000' AS DateTime), NULL, N'45383e74-b9e5-4e21-bf12-ad97ae3e160e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:10.000' AS DateTime), CAST(N'2020-04-15 22:56:28.890' AS DateTime), NULL, CAST(N'2020-04-20 21:47:10.000' AS DateTime), NULL, N'73819c63-ddda-44ec-bbd0-0811d8a04da1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.920' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'2b2d4abe-6919-4e71-8287-0e12c0a69773')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.920' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'03cbc994-c4bb-42c3-a0cc-3a23ab53285f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.917' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'3008172b-172b-4dc5-a6b6-9bb9d48bbefb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 32, 1, N'', 0, 0, 0, 1, 0, 1390, 1390, 1390, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.910' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'a4c9eb7a-9e86-4c24-9971-c8a6859a5b35')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 34, 1, N'', 0, 0, 0, 1, 0, 6500, 6500, 6500, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.907' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'8fac3d2a-3576-4214-802d-1c689496b961')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.893' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'005f200c-4134-46ea-8d55-c60fea2ea57d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.900' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'ecc09d76-b630-4cc4-a5e5-14a312e9edb5')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.893' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'8eddb452-9c36-4ccd-8242-1decd74eb38a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.900' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'1bb52232-2860-4ebe-b61d-1ab5cc66afa4')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.910' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'6816a9ba-3523-4cb5-b1e7-587db8944d49')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.910' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'830cd9c6-891a-4eba-83ac-bf3310827156')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.903' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'137b405e-9322-45a9-b05f-b1bab37ec37c')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.913' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'3caa6a01-8696-4f57-aab5-fc62381423fb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.897' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'1167c8c5-b1ee-449b-b466-8636d66ecaf5')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.903' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'ceb27554-c0b0-4086-9f21-e775b78fccbc')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.900' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'a1b75e77-d5b3-4352-879a-1df0da19996a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-09-04 00:00:00.000' AS DateTime), CAST(N'2021-04-20 21:47:11.000' AS DateTime), CAST(N'2020-04-15 22:56:28.897' AS DateTime), NULL, CAST(N'2020-04-20 21:47:11.000' AS DateTime), NULL, N'15d725a6-0253-413a-8fac-08daff8d87fe')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.570' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'b6caea56-4c65-49e2-8170-427b77ce36a9')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.570' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'b31cd3bd-a8ac-4900-a318-c183faf6eb47')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 8, 1, N'', 0, 0, 0, 1, 0, 1390, 1390, 1390, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.543' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'8a92a226-22fa-4db4-87fd-7dd59562d174')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.547' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'1dcdb5e2-7cf3-4043-ac7e-7770c77975fe')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.573' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'b1a7e2a5-5327-4c30-8c74-db64c2deac00')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.570' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'a90335f5-1046-46c0-9bb6-59deffa3f12b')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.570' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'00e73b91-82a8-43e4-b6bd-21321e832d1a')
GO
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 32, 1, N'', 0, 0, 0, 1, 0, 1390, 1390, 1390, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.560' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'5fd06c64-f862-4061-b475-2d50b79c5390')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 34, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.557' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'67e8fbad-9f5a-408e-801e-0c122ba8214e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.550' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'5f60816f-87d5-4c26-baab-50fda5dce372')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.553' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'35651cb7-a592-46d0-a57a-7f03b0ed51bd')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.547' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'92723443-2378-4169-baae-6b0794e5a118')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.553' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'd0ebd5ff-c5c5-4865-978c-4b2bddfefa1a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.560' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'fd860327-25da-4e83-a889-932bc09dc68a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.560' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'94c0d924-0e19-4105-a769-93385a87406d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.557' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'b3357b67-c5ca-4254-b22c-7381911468aa')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.567' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'e675df72-687e-4b37-b2fe-8d37283695d2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.550' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'f01e7785-5841-4db8-b843-b0b37ef321d9')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.557' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'692db13d-059c-47dc-b872-2d8e0233380f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.553' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'97f776a3-a8e4-486c-ac01-46e49b09f880')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-07-28 00:00:00.000' AS DateTime), CAST(N'2035-05-01 17:34:53.000' AS DateTime), CAST(N'2020-05-01 17:23:28.550' AS DateTime), NULL, CAST(N'2020-05-01 17:34:53.000' AS DateTime), NULL, N'9c6bfddc-abb0-4e01-a61a-b2e4ce3161c4')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.680' AS DateTime), NULL, NULL, NULL, N'f1e5cee2-10bf-4c28-8ab1-1d297de91f5d')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.677' AS DateTime), NULL, NULL, NULL, N'91730d30-d644-4947-ab64-1b5239e4f315')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 8, 1, N'', 0, 0, 0, 1, 0, 6500, 6500, 6500, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.653' AS DateTime), NULL, NULL, NULL, N'eb6974e0-8296-4b81-8dd9-67bfd07763d1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.657' AS DateTime), NULL, NULL, NULL, N'5725fd5d-24dd-4c0d-8c6b-c6b5c18f6c2a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.683' AS DateTime), NULL, NULL, NULL, N'a44fca8c-59a2-4cd4-b309-e1ed62483e7f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.680' AS DateTime), NULL, NULL, NULL, N'4c0db59b-1ea7-42a2-a18c-4f4f649b3d1f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.680' AS DateTime), NULL, NULL, NULL, N'25642e29-211e-4e3f-923b-9cf42d51c483')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 32, 1, N'', 0, 0, 0, 1, 0, 1900, 1900, 1900, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.673' AS DateTime), NULL, NULL, NULL, N'3d13e76e-e4a0-4b74-bdb2-bdaebd1e5163')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 34, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.673' AS DateTime), NULL, NULL, NULL, N'8dfe83a7-83c7-423d-a242-dae5eb51abe1')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.660' AS DateTime), NULL, NULL, NULL, N'3e557355-0223-4502-b8f2-9ea8c96b032e')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.663' AS DateTime), NULL, NULL, NULL, N'291b1f06-86d4-4ffb-9e4a-0d7e5abebe09')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.660' AS DateTime), NULL, NULL, NULL, N'd851ca6d-a456-4c04-b463-2019bb35755a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.670' AS DateTime), NULL, NULL, NULL, N'0cc3c605-0a2c-41c9-a5bb-577652595d03')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.677' AS DateTime), NULL, NULL, NULL, N'5c150a13-66a0-4ed8-99a5-4b62bf69aa19')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.677' AS DateTime), NULL, NULL, NULL, N'37617a1a-6745-423d-bc95-d888afdcfea6')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.673' AS DateTime), NULL, NULL, NULL, N'3fe2b844-6d29-488f-84e8-4f8ce3be96f6')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.677' AS DateTime), NULL, NULL, NULL, N'1cc977dc-a3ae-413c-9fc0-5f29a761061f')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.660' AS DateTime), NULL, NULL, NULL, N'7ab2cb8d-92f5-4f53-9869-89f16f3f02a2')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.670' AS DateTime), NULL, NULL, NULL, N'0657067a-90fb-4642-8d2f-e469f5194870')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.670' AS DateTime), NULL, NULL, NULL, N'fab54d8c-f1a9-46a9-b69d-532e3d46f0ea')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2020-04-24 00:00:00.000' AS DateTime), CAST(N'2035-04-30 15:35:41.000' AS DateTime), CAST(N'2020-04-30 15:35:41.660' AS DateTime), NULL, NULL, NULL, N'5d25709a-5b4f-418c-bdad-79e85fd95c62')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 1, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.970' AS DateTime), NULL, NULL, NULL, N'b4c41d46-997d-4817-91ac-aff29f682d64')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 2, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.970' AS DateTime), NULL, NULL, NULL, N'3518bf1a-6728-4229-9968-9e44ecdaa2cf')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 8, 1, N'', 0, 0, 0, 1, 0, 6500, 6500, 6500, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.950' AS DateTime), NULL, NULL, NULL, N'e7c3a1b6-249c-426d-9060-8b7407808e01')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 9, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.953' AS DateTime), NULL, NULL, NULL, N'd70e595e-6a47-4193-99a4-bd1b48c4dfea')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 10, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.973' AS DateTime), NULL, NULL, NULL, N'92238301-6ff7-448c-92a5-44c42bb6b094')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 14, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.973' AS DateTime), NULL, NULL, NULL, N'e4856812-3e2e-45df-800b-7a6c7edce7e8')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 18, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.970' AS DateTime), NULL, NULL, NULL, N'bf45027a-ef28-48c0-954f-4428d305fe20')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 32, 1, N'', 0, 0, 0, 1, 0, 1900, 1900, 1900, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.967' AS DateTime), NULL, NULL, NULL, N'2c9c04eb-d5af-41b5-a0dd-38a4dee5a1e8')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 34, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.963' AS DateTime), NULL, NULL, NULL, N'926fe3cb-b3df-4ea6-b441-eb683eedab5a')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 57, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.957' AS DateTime), NULL, NULL, NULL, N'809224e5-c171-42fb-afb3-195705a4f9f5')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 60, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.960' AS DateTime), NULL, NULL, NULL, N'1785609f-9f27-45e7-a01a-9f86549a6e72')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 61, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.957' AS DateTime), NULL, NULL, NULL, N'2f6f0b49-0da0-4b10-bdca-33d0b5815636')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 62, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.960' AS DateTime), NULL, NULL, NULL, N'78c6e232-d1cb-42da-a77d-ad4a4eea7a40')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 63, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.967' AS DateTime), NULL, NULL, NULL, N'ea9494be-58cd-4503-b812-8eba91acfc90')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 66, 1, N'', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.967' AS DateTime), NULL, NULL, NULL, N'0f4e40ef-13ef-4df9-8d5e-9ef65c5c02d4')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 67, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.963' AS DateTime), NULL, NULL, NULL, N'f368c913-2b20-47d7-b07c-ee2271cc36e7')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 68, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.970' AS DateTime), NULL, NULL, NULL, N'372f1d77-6635-4a41-be53-06b4d4fb80a3')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 69, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.960' AS DateTime), NULL, NULL, NULL, N'fc6a8305-33cc-4434-bc10-b9d30f13f5f6')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 70, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.963' AS DateTime), NULL, NULL, NULL, N'58386072-04d1-4b88-9e1e-a826adde22eb')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 72, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.960' AS DateTime), NULL, NULL, NULL, N'8a9e62a3-fcf0-4763-9e7c-fb9a1dddf521')
INSERT [dbo].[RW_DAMAGE_MECHANISM] ([ID], [DMItemID], [IsActive], [Notes], [ExpectedTypeID], [IsEL], [ELValue], [IsDF], [IsUserDisabled], [DF1], [DF2], [DF3], [DFBase], [RLI], [HighestInspectionEffectiveness], [SecondInspectionEffectiveness], [NumberOfInspections], [LastInspDate], [InspDueDate], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 73, 1, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'E', N'E', 0, CAST(N'2019-10-13 00:00:00.000' AS DateTime), CAST(N'2035-05-04 16:02:40.000' AS DateTime), CAST(N'2020-05-04 16:02:40.960' AS DateTime), NULL, NULL, NULL, N'1e9759be-be1c-4a80-bca0-ab51e0e82b2c')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, CAST(N'2019-07-28 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'Marine', 0, 1, 1, 1, 232, N'Amine high velocity corrosion - Corrosion coupons', 1, 0, 0, 0, 1, 0.159999996423721, N'None', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-07-30 11:31:50.990' AS DateTime), NULL, NULL, NULL, N'ae7c7a4d-019c-4852-831c-28692fc8c320')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, CAST(N'2019-08-07 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-20 21:38:10.713' AS DateTime), NULL, NULL, NULL, N'70b9291f-49d0-4e0f-ac89-f4aa15dec138')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, CAST(N'2019-08-07 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0.159999996423721, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-21 15:24:56.313' AS DateTime), NULL, NULL, NULL, N'cf20c8ba-a454-46f0-912e-1112530b175d')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, CAST(N'2019-07-28 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0.159999996423721, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-21 15:25:47.017' AS DateTime), NULL, NULL, NULL, N'0a079443-f695-45c6-b210-a90e7666c6b1')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, CAST(N'2019-08-07 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0.159999996423721, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-21 18:48:36.560' AS DateTime), NULL, NULL, NULL, N'a5fc77fa-d2e1-4d51-9044-8f9ec36c45cb')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, CAST(N'2019-08-27 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0.100000001490116, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-27 10:49:03.743' AS DateTime), NULL, NULL, NULL, N'35c0483e-7da8-49c4-9b47-3ddc80834476')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, CAST(N'2019-05-14 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-27 11:09:07.503' AS DateTime), NULL, NULL, NULL, N'cc013cb5-f87e-4021-9b0f-eb8215042195')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, CAST(N'2019-07-28 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 1, 0.159999996423721, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-27 11:18:57.337' AS DateTime), NULL, NULL, NULL, N'575a1c8e-9c71-48c5-8f36-3dd5bed8f99b')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, CAST(N'2019-12-29 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0.100000001490116, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-08-29 14:35:14.883' AS DateTime), NULL, NULL, NULL, N'67e10f46-860b-458d-94b8-6779b0369747')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, CAST(N'2019-12-29 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0.100000001490116, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-09-25 11:18:17.973' AS DateTime), NULL, NULL, NULL, N'6befb30b-1940-4d7d-937b-4882dfe6a580')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, CAST(N'2019-09-04 00:00:00.000' AS DateTime), 1, 0, 0, 0, 0, N'', 0, 1, 0, 1, 0, N'Amine high velocity corrosion - Electrical resistance probes', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'Fine Sand', N'Low', 435, N'', 0, 0, CAST(N'2019-09-25 11:20:06.417' AS DateTime), NULL, NULL, NULL, N'9e66df14-ffce-4780-a206-6dfb46eb7e2f')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, CAST(N'2019-07-28 00:00:00.000' AS DateTime), 1, 0, 0, 0, 0, N'', 1, 1, 1, 1, 0, N'Amine low velocity corrosion - Corrosion coupons', 0, 0, 0, 0, 1, 0.159999996423721, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2019-11-16 11:48:58.023' AS DateTime), NULL, NULL, NULL, N'63501bbc-d059-41d0-8f47-207b545ff616')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, CAST(N'2019-09-04 00:00:00.000' AS DateTime), 1, 0, 0, 0, 0, N'', 0, 1, 0, 1, 0, N'Amine high velocity corrosion - Electrical resistance probes', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'Fine Sand', N'Low', 435, N'', 0, 0, CAST(N'2020-02-22 23:41:35.347' AS DateTime), NULL, NULL, NULL, N'229c4470-1a84-4e96-8e87-1976f8d5fe38')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, CAST(N'2019-09-04 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'Coarse Sand', N'Medium', 34, N'', 0, 0, CAST(N'2020-02-26 13:39:28.403' AS DateTime), NULL, NULL, NULL, N'8ceb0f5e-26b6-42b0-a305-9333a6402f93')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, CAST(N'2019-09-04 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'Coarse Sand', N'Low', 435, N'', 0, 0, CAST(N'2020-04-15 22:53:59.333' AS DateTime), NULL, NULL, NULL, N'7ede82c0-2a8b-40fb-b42d-4b2474e9f6a2')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, CAST(N'2019-07-28 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0.159999996423721, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2020-04-30 02:08:16.167' AS DateTime), NULL, NULL, NULL, N'1796b6a0-be20-4102-ac6e-8831b384eeab')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, CAST(N'2020-04-24 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2020-04-30 15:35:06.020' AS DateTime), NULL, NULL, NULL, N'9047cfda-87c1-4f26-9776-0d1d92646a61')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2022, CAST(N'2020-04-24 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2020-05-01 11:04:20.623' AS DateTime), NULL, NULL, NULL, N'dfa07c5e-2432-4eb8-97be-c9610276f144')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2023, CAST(N'2020-04-24 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2020-05-01 11:05:40.190' AS DateTime), NULL, NULL, NULL, N'2c9c5be9-db06-4b29-8bab-25f6e512ff1e')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2024, CAST(N'2020-04-24 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2020-05-01 11:11:38.697' AS DateTime), NULL, NULL, NULL, N'48240dec-6ddb-44c1-8bff-d459ae762260')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2025, CAST(N'2020-04-24 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2020-05-01 11:13:32.023' AS DateTime), NULL, NULL, NULL, N'8c79c5a9-2f73-43a9-a57e-cb6b5a44a6f8')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2026, CAST(N'2020-04-24 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2020-05-01 11:19:39.627' AS DateTime), NULL, NULL, NULL, N'7ae8eaa1-cc72-428a-9c31-3bcc3028c461')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3022, CAST(N'2020-04-24 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2020-05-04 16:00:28.060' AS DateTime), NULL, NULL, NULL, N'c51ebfdd-a42b-418f-bb3d-ae178ae98752')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, CAST(N'2019-10-13 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2020-05-04 16:02:05.913' AS DateTime), NULL, NULL, NULL, N'68b358d7-9f9d-436d-a8eb-d87d5907771e')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3024, CAST(N'2020-04-24 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2020-05-04 16:04:48.117' AS DateTime), NULL, NULL, NULL, N'90007ecd-ecaa-4d5d-9c40-54cf144b47c8')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3025, CAST(N'2019-07-28 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2020-05-04 16:05:10.960' AS DateTime), NULL, NULL, NULL, N'9615d286-713a-4632-8a5b-883508a78b4a')
INSERT [dbo].[RW_EQUIPMENT] ([ID], [CommissionDate], [AdminUpsetManagement], [ContainsDeadlegs], [CyclicOperation], [HighlyDeadlegInsp], [DowntimeProtectionUsed], [ExternalEnvironment], [HeatTraced], [InterfaceSoilWater], [LinerOnlineMonitoring], [MaterialExposedToClExt], [MinReqTemperaturePressurisation], [OnlineMonitoring], [PresenceSulphidesO2], [PresenceSulphidesO2Shutdown], [PressurisationControlled], [PWHT], [SteamOutWaterFlush], [ManagementFactor], [ThermalHistory], [YearLowestExpTemp], [Volume], [TypeOfSoil], [EnvironmentSensitivity], [DistanceToGroundWater], [AdjustmentSettle], [ComponentIsWelded], [TankIsMaintained], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3026, CAST(N'2019-07-28 00:00:00.000' AS DateTime), 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, N'', 0, 0, N'', N'', 0, N'', 0, 0, CAST(N'2020-05-04 16:05:34.023' AS DateTime), NULL, NULL, NULL, N'c4ab3448-e978-4d46-a4a5-3c41c0ab1076')
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
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, 1, 23, 34, 12, 21, 0, 0, 0, 0, 0, CAST(N'2019-11-12 12:19:55.330' AS DateTime), NULL, NULL, NULL, N'561ad9c0-c83e-4812-88df-230bf05f9f7c')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-11-16 11:48:58.183' AS DateTime), NULL, NULL, NULL, N'0d6390d6-16b9-4abe-ba95-f6e53294e609')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-02-22 23:41:35.450' AS DateTime), NULL, NULL, NULL, N'6ef626b0-fbba-4372-b16a-6a60e412b63d')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-02-26 13:39:28.510' AS DateTime), NULL, NULL, NULL, N'3c04993e-b4d5-45d8-bf3b-18e3afb7cb8e')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-04-15 22:53:59.367' AS DateTime), NULL, NULL, NULL, N'e2912d77-0018-46d1-9f1b-99f145dec682')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-04-30 02:08:16.200' AS DateTime), NULL, NULL, NULL, N'b8c3b4cf-3c43-4a0e-a93b-132e5283b9d7')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-04-30 15:35:06.050' AS DateTime), NULL, NULL, NULL, N'571d2019-50e4-4d63-a8df-a65b6392fd97')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2022, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:04:20.740' AS DateTime), NULL, NULL, NULL, N'ff1d4605-b776-480c-b474-22a92f16c5a9')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2023, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:05:44.877' AS DateTime), NULL, NULL, NULL, N'61479afa-b778-4032-8a0e-a6c839b1bda5')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:11:38.737' AS DateTime), NULL, NULL, NULL, N'063d226c-a788-4c64-b98f-8b8e2efb0da3')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:13:32.087' AS DateTime), NULL, NULL, NULL, N'd8a83fbb-69e1-4d05-ba50-ae129ba58e9f')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:19:39.657' AS DateTime), NULL, NULL, NULL, N'6de16644-179d-4c7e-915c-dbd9d5aeea90')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3022, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:00:28.120' AS DateTime), NULL, NULL, NULL, N'f4cfca20-4f9d-4d1c-99c1-9c4c09cc558e')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:02:05.940' AS DateTime), NULL, NULL, NULL, N'0a76da23-9ed6-43a0-a24f-c667c4c240fa')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:04:48.153' AS DateTime), NULL, NULL, NULL, N'94a1793b-7a8d-4dd3-a7cb-f1520a170eba')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:05:10.987' AS DateTime), NULL, NULL, NULL, N'd902bcca-612e-4537-a7d9-78050bf70828')
INSERT [dbo].[RW_EXTCOR_TEMPERATURE] ([ID], [Minus12ToMinus8], [Minus8ToPlus6], [Plus6ToPlus32], [Plus32ToPlus71], [Plus71ToPlus107], [Plus107ToPlus121], [Plus121ToPlus135], [Plus135ToPlus162], [Plus162ToPlus176], [MoreThanPlus176], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:05:34.043' AS DateTime), NULL, NULL, NULL, N'07dd0004-05e9-470b-944f-b1157a535d20')
INSERT [dbo].[RW_FULL_FCOF] ([ID], [FCoFValue], [FCoFCategory], [AIL], [EquipOutageMultiplier], [envcost], [equipcost], [prodcost], [popdens], [injcost], [FCoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 0, N'A', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-11-19 15:42:58.610' AS DateTime), NULL, NULL, NULL, N'9ca8d25f-2beb-40c7-b509-a463e9a13eab')
INSERT [dbo].[RW_FULL_FCOF] ([ID], [FCoFValue], [FCoFCategory], [AIL], [EquipOutageMultiplier], [envcost], [equipcost], [prodcost], [popdens], [injcost], [FCoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 0, N'A', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-02-22 23:43:07.627' AS DateTime), NULL, NULL, NULL, N'f56153a2-4e53-4327-8317-d58ca08ac2e5')
INSERT [dbo].[RW_FULL_FCOF] ([ID], [FCoFValue], [FCoFCategory], [AIL], [EquipOutageMultiplier], [envcost], [equipcost], [prodcost], [popdens], [injcost], [FCoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 0, N'A', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-02-26 13:41:27.153' AS DateTime), NULL, NULL, NULL, N'0f3171f0-ae62-4611-ac40-60c4a2a1942c')
INSERT [dbo].[RW_FULL_FCOF] ([ID], [FCoFValue], [FCoFCategory], [AIL], [EquipOutageMultiplier], [envcost], [equipcost], [prodcost], [popdens], [injcost], [FCoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 0, N'A', 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-04-15 22:56:28.870' AS DateTime), NULL, NULL, NULL, N'd262573c-dc3a-47a3-b759-149f8b97a676')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 0.1, 0.1, 0.1, 5000, 12319.65, 31114.42, 0.001840417, 0.001840417, 0.001840417, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.16, N'', 0.000722, 0.1, 0.1, 0.1, 0.1018404, 0.1018404, 0.1018404, 5000.102, 12319.75, 31114.52, 0.5776118, 1, 1, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2019-08-20 21:10:12.790' AS DateTime), NULL, NULL, NULL, N'2925b28b-b0b9-4aca-b919-0b27ccbde816')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3, 6500, 6500, 6500, 0, 0, 0, 1900, 1900, 1900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.16, N'', 3.06E-05, 6500, 6500, 6500, 8400, 8400, 8400, 8400, 8400, 8400, 0.0411264, 0.0411264, 0.0411264, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2020-04-30 22:52:08.453' AS DateTime), NULL, NULL, NULL, N'18531feb-a29a-459c-b634-fa06fb0c6a0a')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (4, 1390, 1390, 1390, 0, 0, 0, 1390, 1390, 1390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.16, N'', 0.000722, 1390, 1390, 1390, 2780, 2780, 2780, 2780, 2780, 2780, 0.3211456, 0.3211456, 0.3211456, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2020-04-30 22:51:55.700' AS DateTime), NULL, NULL, NULL, N'8dfc1695-de70-4668-83bb-5d587702e2cb')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, 6500, 6500, 6500, 0, 0, 0, 1900, 1900, 1900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.16, N'', 3.06E-05, 6500, 6500, 6500, 8400, 8400, 8400, 8400, 8400, 8400, 0.0411264, 0.0411264, 0.0411264, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2020-04-30 22:52:24.260' AS DateTime), NULL, NULL, NULL, N'd667dfbc-212e-4967-8838-3bbd741c01f9')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (6, 6500, 6500, 6500, 0, 0, 0, 1900, 1900, 1900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, N'', 0.0001001, 6500, 6500, 6500, 8400, 8400, 8400, 8400, 8400, 8400, 0.084084, 0.084084, 0.084084, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2019-08-27 11:02:42.740' AS DateTime), NULL, NULL, NULL, N'e0df4cc4-bc4b-4ead-ae3b-b60c56b1839a')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (7, 95000, 95000, 95000, 0, 0, 0, 1900, 1900, 1900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, N'', 0.0001001, 95000, 95000, 95000, 96900, 96900, 96900, 96900, 96900, 96900, 0.969969, 0.969969, 0.969969, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2019-08-27 11:11:38.050' AS DateTime), NULL, NULL, NULL, N'13b67b9c-1584-4277-98a1-40983b98011a')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (9, 1390, 1390, 1390, 100, 344.6718, 728.2725, 6500, 6500, 6500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.16, N'', 0.000722, 6500, 6500, 6500, 7890, 7890, 7890, 7990, 8234.672, 8618.272, 0.9230048, 0.9512693, 0.9955828, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2019-08-27 11:28:25.003' AS DateTime), NULL, NULL, NULL, N'b8ef4414-3415-493f-9d6e-292b71e56181')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (10, 6500, 6500, 6500, 0, 0, 0, 1900, 1900, 1900, 0.4, 0.4, 0.4, 0, 0, 0, 0.4, 0.4, 0.4, 0.1, N'', 3E-05, 6500, 6500, 6500, 8400, 8400, 8400, 8400.8, 8400.8, 8400.8, 0.0252024, 0.0252024, 0.0252024, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2019-08-29 14:43:27.890' AS DateTime), NULL, NULL, NULL, N'a1a059ed-ddb5-4472-a55f-f26fd1ed76e8')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (11, 1390, 1390, 1390, 0, 0, 0, 1390, 1390, 1390, 4, 4, 4, 0, 0, 0, 4, 4, 4, 0.1, N'', 0.000722, 1390, 1390, 1390, 2780, 2780, 2780, 2788, 2788, 2788, 0.2012936, 0.2012936, 0.2012936, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2020-02-23 00:04:26.260' AS DateTime), NULL, NULL, NULL, N'fdd8df72-af1d-4ed9-b2e1-718429165fd8')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 32500, 32500, 32500, 0, 0, 0, 6500, 6500, 6500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, N'', 0.0001001, 32500, 32500, 32500, 39000, 39000, 39000, 39000, 39000, 39000, 0.39039, 0.39039, 0.39039, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2019-11-19 15:42:53.663' AS DateTime), NULL, NULL, NULL, N'cec33ef0-90fc-4ad5-8bd8-563192728278')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, 695, 695, 695, 0, 0, 0, 6500, 6500, 6500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.16, N'', 0.000722, 6500, 6500, 6500, 7195, 7195, 7195, 7195, 7195, 7195, 0.8311664, 0.8311664, 0.8311664, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2019-11-16 11:52:09.637' AS DateTime), NULL, NULL, NULL, N'47c944dc-3954-4dff-850c-21245586a4b4')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, 32500, 32500, 32500, 0, 0, 0, 6500, 6500, 6500, 0.009, 0.009, 0.009, 0, 0, 0, 0, 0, 0, 0.1, N'', 0.0001001, 32500, 32500, 32500, 39000, 39000, 39000, 39000.01, 39000.01, 39000.01, 0.3903901, 0.3903901, 0.3903901, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2020-02-22 23:43:03.950' AS DateTime), NULL, NULL, NULL, N'80355eb5-08dd-45ea-8312-c01a4a2936f8')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, 69500, 69500, 69500, 0, 0, 0, 1390, 1390, 1390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, N'', 0.000722, 69500, 69500, 69500, 70890, 70890, 70890, 70890, 70890, 70890, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2020-02-26 13:41:14.560' AS DateTime), NULL, NULL, NULL, N'790e8e49-3748-438c-8c9e-480b85b37388')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, 69500, 69500, 69500, 0, 0, 0, 6500, 6500, 6500, 175, 175, 175, 0, 0, 0, 0, 0, 0, 0.1, N'', 0.000722, 69500, 69500, 69500, 76000, 76000, 76000, 76175, 76175, 76175, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2020-04-15 22:56:02.750' AS DateTime), NULL, NULL, NULL, N'82578bac-48bf-4229-b5d4-eb6e486d52ee')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 1390, 1390, 1390, 0, 0, 0, 1390, 1390, 1390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.16, N'', 0.000722, 1390, 1390, 1390, 2780, 2780, 2780, 2780, 2780, 2780, 0.3211456, 0.3211456, 0.3211456, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2020-05-01 17:23:28.520' AS DateTime), NULL, NULL, NULL, N'a69be736-ad51-4255-938c-649b3badb191')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, 6500, 6500, 6500, 0, 0, 0, 1900, 1900, 1900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, N'', 3.06E-05, 6500, 6500, 6500, 8400, 8400, 8400, 8400, 8400, 8400, 0.025704, 0.025704, 0.025704, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2020-04-30 15:35:41.583' AS DateTime), NULL, NULL, NULL, N'7b19fe58-c7a2-435f-90dc-0b6f1ce21af9')
INSERT [dbo].[RW_FULL_POF] ([ID], [ThinningAP1], [ThinningAP2], [ThinningAP3], [SCCAP1], [SCCAP2], [SCCAP3], [ExternalAP1], [ExternalAP2], [ExternalAP3], [BrittleAP1], [BrittleAP2], [BrittleAP3], [HTHA_AP1], [HTHA_AP2], [HTHA_AP3], [FatigueAP1], [FatigueAP2], [FatigueAP3], [FMS], [ThinningType], [GFFTotal], [ThinningLocalAP1], [ThinningLocalAP2], [ThinningLocalAP3], [ThinningGeneralAP1], [ThinningGeneralAP2], [ThinningGeneralAP3], [TotalDFAP1], [TotalDFAP2], [TotalDFAP3], [PoFAP1], [PoFAP2], [PoFAP3], [MatrixPoFAP1], [MatrixPoFAP2], [MatrixPoFAP3], [RLI], [SemiAP1], [SemiAP2], [SemiAP3], [PoFAP1Category], [PoFAP2Category], [PoFAP3Category], [CoFValue], [CoFCategory], [CoFMatrixValue], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, 6500, 6500, 6500, 0, 0, 0, 1900, 1900, 1900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, N'', 3.06E-05, 6500, 6500, 6500, 8400, 8400, 8400, 8400, 8400, 8400, 0.025704, 0.025704, 0.025704, 0, 0, 0, 0, 0, 0, 0, N'5', N'5', N'5', 0, N'', 0, CAST(N'2020-05-04 16:02:40.887' AS DateTime), NULL, NULL, NULL, N'ab6636b8-2ab2-4fc6-8fad-ba05c1f9207c')
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (3022, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (3023, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (3024, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (3025, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[RW_INPUT_CA_LEVEL1] ([ID], [API_FLUID], [SYSTEM], [Release_Duration], [Detection_Type], [Isulation_Type], [Mitigation_System], [Equipment_Cost], [Injure_Cost], [Evironment_Cost], [Toxic_Percent], [Personal_Density], [Material_Cost], [Production_Cost], [Mass_Inventory], [Mass_Component], [Stored_Pressure], [Stored_Temp]) VALUES (3026, N'', N'', N'', N'', N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[RW_INSPECTION_DETAIL] ON 

INSERT [dbo].[RW_INSPECTION_DETAIL] ([ID], [DetailID], [EquipmentID], [ComponentID], [Coverage_DetailID], [InspPlanName], [InspectionDate], [DMItemID], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [IsActive], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 1, 1, 1, 0, N'Plan 1/13/2020 6:02:57 PM', CAST(N'2020-01-14 00:00:00.000' AS DateTime), 63, N'E', N'Non-Intrusive + Eddy Current + ACFM - 0 % ', 0, CAST(N'2020-01-14 00:00:00.000' AS DateTime), 1, CAST(N'2020-05-01 17:34:55.280' AS DateTime), NULL, NULL, NULL, N'bd8ce711-8225-485f-9e66-26a8e9e2074c')
INSERT [dbo].[RW_INSPECTION_DETAIL] ([ID], [DetailID], [EquipmentID], [ComponentID], [Coverage_DetailID], [InspPlanName], [InspectionDate], [DMItemID], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [IsActive], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 2, 1, 1, 0, N'Plan 1/13/2020 6:02:57 PM', CAST(N'2020-01-14 00:00:00.000' AS DateTime), 66, N'E', N'Non-Intrusive + Eddy Current + ACFM - 0 % ', 0, CAST(N'2020-01-14 00:00:00.000' AS DateTime), 1, CAST(N'2020-05-01 17:34:55.293' AS DateTime), NULL, NULL, NULL, N'1ab52be7-6331-4812-a5e3-3eefd5c542ac')
INSERT [dbo].[RW_INSPECTION_DETAIL] ([ID], [DetailID], [EquipmentID], [ComponentID], [Coverage_DetailID], [InspPlanName], [InspectionDate], [DMItemID], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [IsActive], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, 3, 1, 1, 0, N'Plan 1/13/2020 6:02:57 PM', CAST(N'2020-01-14 00:00:00.000' AS DateTime), 72, N'E', N'Non-Intrusive + Acoustic Emission + Crack Detection - 0 %
AND
Non-Intrusive + Eddy Current + ACFM - 0 % ', 0, CAST(N'2020-01-14 00:00:00.000' AS DateTime), 1, CAST(N'2020-05-01 17:34:55.297' AS DateTime), NULL, NULL, NULL, N'3122362f-4b51-48a6-8d93-2cdcb646bf2f')
INSERT [dbo].[RW_INSPECTION_DETAIL] ([ID], [DetailID], [EquipmentID], [ComponentID], [Coverage_DetailID], [InspPlanName], [InspectionDate], [DMItemID], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [IsActive], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 10, 7, 9, 6089, N'Plan 1/10/2020 10:17:11 AM', CAST(N'2020-01-03 00:00:00.000' AS DateTime), 63, N'E', N'Non-Intrusive + Eddy Current + Pulsed - 0 % ', 0, CAST(N'2020-01-03 00:00:00.000' AS DateTime), 1, CAST(N'2020-05-01 23:15:38.220' AS DateTime), NULL, NULL, NULL, N'e2374ccd-caba-4f00-88b1-8ad3bc1a60de')
INSERT [dbo].[RW_INSPECTION_DETAIL] ([ID], [DetailID], [EquipmentID], [ComponentID], [Coverage_DetailID], [InspPlanName], [InspectionDate], [DMItemID], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [IsActive], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 11, 7, 9, 6089, N'Plan 1/10/2020 10:17:11 AM', CAST(N'2020-01-03 00:00:00.000' AS DateTime), 66, N'E', N'Non-Intrusive + Eddy Current + Pulsed - 0 % ', 0, CAST(N'2020-01-03 00:00:00.000' AS DateTime), 1, CAST(N'2020-05-01 23:15:38.277' AS DateTime), NULL, NULL, NULL, N'24ef09d2-685a-4ab5-8b8b-a3465bd0ed1a')
INSERT [dbo].[RW_INSPECTION_DETAIL] ([ID], [DetailID], [EquipmentID], [ComponentID], [Coverage_DetailID], [InspPlanName], [InspectionDate], [DMItemID], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [IsActive], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 21, 7, 9, 6098, N'Plan 1/10/2020 10:17:11 AM', CAST(N'2020-01-03 00:00:00.000' AS DateTime), 63, N'E', N'Non-Intrusive + Eddy Current + Pulsed - 0 % ', 0, CAST(N'2020-01-03 00:00:00.000' AS DateTime), 1, CAST(N'2020-05-01 23:55:43.763' AS DateTime), NULL, NULL, NULL, N'8d76d25e-75e3-4af3-a394-ad5b71220906')
INSERT [dbo].[RW_INSPECTION_DETAIL] ([ID], [DetailID], [EquipmentID], [ComponentID], [Coverage_DetailID], [InspPlanName], [InspectionDate], [DMItemID], [EffectivenessCode], [InspectionSummary], [IsCarriedOut], [CarriedOutDate], [IsActive], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (12, 22, 7, 9, 6098, N'Plan 1/10/2020 10:17:11 AM', CAST(N'2020-01-03 00:00:00.000' AS DateTime), 66, N'E', N'Non-Intrusive + Eddy Current + Pulsed - 0 % ', 0, CAST(N'2020-01-03 00:00:00.000' AS DateTime), 1, CAST(N'2020-05-01 23:55:43.773' AS DateTime), NULL, NULL, NULL, N'157f9faf-0239-4a27-b907-19f0aa9e61e0')
SET IDENTITY_INSERT [dbo].[RW_INSPECTION_DETAIL] OFF
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
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (17, N'23', 23, 32, 0, 0, 32, 32, N'', N'', N'', 0, N'347 Stainless Steel, Alloy 20, Alloy 625, All austenitic weld overlay', N'', 1, 0, 0, 0, 0, 0, 1, 32, 32, 32, CAST(N'2019-11-12 12:19:58.050' AS DateTime), NULL, NULL, NULL, N'ddd620d9-d58c-4f5a-91e5-00bfd9cd2508')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (18, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2019-11-16 11:48:58.117' AS DateTime), NULL, NULL, NULL, N'0e0ee366-f840-4d78-9159-f629aa60925f')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (19, N'', 0, 0, 34, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, CAST(N'2020-02-22 23:41:35.407' AS DateTime), NULL, NULL, NULL, N'0f09ded0-5c00-4260-ac78-64b77b8a2bcd')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (20, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-02-26 13:39:28.470' AS DateTime), NULL, NULL, NULL, N'1d22861f-ff6f-4f7d-b565-0746ab4bedd3')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (21, N'', 0, 0, 34, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 1, 0, 1, 0, 1, 0, 0, 14, CAST(N'2020-04-15 22:53:59.353' AS DateTime), NULL, NULL, NULL, N'eced2aa6-176f-422a-9219-be78be906840')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (22, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-04-30 02:08:16.187' AS DateTime), NULL, NULL, NULL, N'909b281e-c2ed-4bdf-bba9-fa09f403953d')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1022, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-04-30 15:35:06.040' AS DateTime), NULL, NULL, NULL, N'17a1a3be-caf6-4316-a6ca-1b428e4f1fd7')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2022, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:04:20.697' AS DateTime), NULL, NULL, NULL, N'5c0c8b30-4c99-40f4-9e2e-59c2e5b8bc11')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2023, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:05:43.273' AS DateTime), NULL, NULL, NULL, N'7f96dd6f-1746-4f9f-9baa-5aa36ac55163')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2024, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:11:38.720' AS DateTime), NULL, NULL, NULL, N'a3eb0f2a-d92f-4fed-8bcb-b91e93fbd054')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2025, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:13:32.060' AS DateTime), NULL, NULL, NULL, N'f44901c6-3a72-4b99-a766-6f9e01e88cfd')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2026, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-01 11:19:39.647' AS DateTime), NULL, NULL, NULL, N'a423a0c9-0cd1-4f1d-a9d7-a214886e82a7')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3022, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:00:28.100' AS DateTime), NULL, NULL, NULL, N'2e74864a-bc5f-4c5e-9643-e3c343bfb4ab')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3023, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:02:05.930' AS DateTime), NULL, NULL, NULL, N'701d7afa-cc51-4ee2-a84e-2c6f0b87b192')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3024, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:04:48.140' AS DateTime), NULL, NULL, NULL, N'3c13ef40-542e-434b-9a20-ea002c7e25b7')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3025, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:05:10.977' AS DateTime), NULL, NULL, NULL, N'766cd2f2-4ec1-47c5-bc4a-cbf7ebd02101')
INSERT [dbo].[RW_MATERIAL] ([ID], [MaterialName], [DesignPressure], [DesignTemperature], [MinDesignTemperature], [BrittleFractureThickness], [CorrosionAllowance], [SigmaPhase], [SulfurContent], [HeatTreatment], [SteelProductForm], [ReferenceTemperature], [PTAMaterialCode], [HTHAMaterialCode], [IsPTA], [IsHTHA], [Austenitic], [Temper], [CarbonLowAlloy], [NickelBased], [ChromeMoreEqual12], [YieldStrength], [TensileStrength], [CostFactor], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (3026, N'', 0, 0, 0, 0, 0, 0, N'', N'', N'', 0, N'', N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, CAST(N'2020-05-04 16:05:34.033' AS DateTime), NULL, NULL, NULL, N'add2e659-a7f3-45ea-9715-ee3cf96d74d3')
INSERT [dbo].[RW_SETTINGS] ([ID], [DefaultAssessmentMethod], [SchemaVersion], [UnlockCode], [CompanyName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, 4, N'6.0.2', NULL, NULL, CAST(N'2019-06-28 16:50:34.637' AS DateTime), NULL, NULL, NULL, N'4c02d826-8db3-450c-9960-d0f25a88e7b2')
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (1, N'', 0, 0, 0, 0, 227, 112, 0, 1, 0, N'High Rich Amine', 0, 0, 0, 321, 0, 0, 0, 0, 134, 600, 22, 200, 1111, 0, 10, 0, 0, 0, N'', 0, 3, CAST(N'2019-07-30 11:31:51.093' AS DateTime), NULL, NULL, NULL, N'3708d764-2ee5-4210-ac8b-e8173cad68d2', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (2, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-20 21:38:10.797' AS DateTime), NULL, NULL, NULL, N'8c53a1a5-047a-4073-8f62-e55c32992eae', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (3, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-21 15:24:56.363' AS DateTime), NULL, NULL, NULL, N'2ad36246-4334-4631-bf36-7a787622f213', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (4, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-21 15:25:47.047' AS DateTime), NULL, NULL, NULL, N'977f1e85-d656-4f52-aa3d-9a88adf29522', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (5, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-21 18:48:36.670' AS DateTime), NULL, NULL, NULL, N'72608623-1a35-47e6-b514-f76a63a63320', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (6, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-27 10:49:03.803' AS DateTime), NULL, NULL, NULL, N'dfc05a60-558f-45a9-aa94-b8c544fc3e5f', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (7, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-27 11:09:07.507' AS DateTime), NULL, NULL, NULL, N'aee919bc-d109-4131-a79b-41ec7297121d', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (9, N'Disopropanolamine DIPA', 1, 0, 0, 0, 0, 0, 0, 1, 0, N'Low Lean Amine', 0, 0, 1, 1222, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 4, 0, 0, 0, N'', 0, 2, CAST(N'2019-08-27 11:18:57.367' AS DateTime), NULL, NULL, NULL, N'df1521e1-5239-4f2c-9ca1-f431a9e56231', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (10, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-08-29 14:35:14.977' AS DateTime), NULL, NULL, NULL, N'56d1e425-d520-490a-9a01-a5ed5d825865', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (11, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-09-25 11:18:18.080' AS DateTime), NULL, NULL, NULL, N'5f8f48f5-d02f-4a79-a24d-b03667e2e85a', N'C5', N'Nitric Acid', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (12, N'Diethanolamine DEA', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-09-25 11:20:06.490' AS DateTime), NULL, NULL, NULL, N'd847dd9e-a284-4eb4-82fb-b209b1b81e8d', N'Light Diesel Oil', N'', 132, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (17, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 32, 0, 0, 0, 0, 0, 0, 432, 22, 32, 22, 3, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-11-12 12:19:57.330' AS DateTime), NULL, NULL, NULL, N'2f49bcd0-8059-4758-b12f-1ab1ed8b2edf', N'', N'gasoline', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (18, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2019-11-16 11:48:58.153' AS DateTime), NULL, NULL, NULL, N'd141a1f5-a199-4c47-9307-a15e8471b9d8', N'', NULL, 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (19, N'Diethanolamine DEA', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-02-22 23:41:35.433' AS DateTime), NULL, NULL, NULL, N'beba88a1-5c38-4cdf-a15f-5417c4861eb3', N'Light Diesel Oil', N'', 132, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (20, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-02-26 13:39:28.493' AS DateTime), NULL, NULL, NULL, N'3dc55b66-0611-4a5e-8c33-25ed23f1fde6', N'Gasoline', N'', 100, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (21, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-04-15 22:53:59.363' AS DateTime), NULL, NULL, NULL, N'5613123d-0ae2-4ba3-a51c-dfa3c8b943d6', N'Heavy Crude Oil', N'', 132, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (22, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-04-30 02:08:16.197' AS DateTime), NULL, NULL, NULL, N'cd7409c5-15ce-45a6-aa68-ef94e8f282a6', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (1022, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-04-30 15:35:06.047' AS DateTime), NULL, NULL, NULL, N'6b848382-6ba8-4ad2-970a-1b349a6858bd', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (2022, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-05-01 11:04:20.727' AS DateTime), NULL, NULL, NULL, N'fb4cb6f2-3cc1-45a5-8610-ca1905b7ff2c', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (2023, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-05-01 11:05:44.100' AS DateTime), NULL, NULL, NULL, N'aeaa06dc-4e8a-4bb9-b9fc-fe87f3f845e1', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (2024, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-05-01 11:11:38.730' AS DateTime), NULL, NULL, NULL, N'f52236a3-1b95-4cf9-98a1-534cbc945102', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (2025, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-05-01 11:13:32.077' AS DateTime), NULL, NULL, NULL, N'6694dcf9-dafc-48c0-bc9e-55fc831754fb', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (2026, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-05-01 11:19:39.653' AS DateTime), NULL, NULL, NULL, N'5d0f95c7-5c3b-4ac1-a87e-e1bfe4b01bc3', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (3022, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-05-04 16:00:28.113' AS DateTime), NULL, NULL, NULL, N'f22aa19b-a060-4472-9015-45620ad82641', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (3023, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-05-04 16:02:05.937' AS DateTime), NULL, NULL, NULL, N'a877f56b-c2df-47e3-ab67-d19fe05aca86', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (3024, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-05-04 16:04:48.150' AS DateTime), NULL, NULL, NULL, N'b25db541-9a80-45b7-9630-ce9bd955cc67', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (3025, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-05-04 16:05:10.983' AS DateTime), NULL, NULL, NULL, N'b3d5b63d-c0ec-4a67-a84f-b89e5ab8d963', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[RW_STREAM] ([ID], [AmineSolution], [AqueousOperation], [AqueousShutdown], [ToxicConstituent], [Caustic], [Chloride], [CO3Concentration], [Cyanide], [ExposedToGasAmine], [ExposedToSulphur], [ExposureToAmine], [FlammableFluidID], [FlowRate], [H2S], [H2SInWater], [Hydrogen], [H2SPartialPressure], [Hydrofluoric], [MaterialExposedToClInt], [MaxOperatingPressure], [MaxOperatingTemperature], [MinOperatingPressure], [MinOperatingTemperature], [CriticalExposureTemperature], [ModelFluidID], [NaOHConcentration], [NonFlameToxicFluidID], [LiquidLevel], [ReleaseFluidPercentToxic], [StoragePhase], [ToxicFluidID], [WaterpH], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID], [TankFluidName], [TankToxicFluidName], [FluidHeight], [FluidLeaveDikePercent], [FluidLeaveDikeRemainOnSitePercent], [FluidGoOffSitePercent]) VALUES (3026, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'', 0, 0, CAST(N'2020-05-04 16:05:34.040' AS DateTime), NULL, NULL, NULL, N'35a2eee5-0072-470f-818b-4b703daef269', N'', N'', 0, 0, 0, 0)
INSERT [dbo].[SAFETY_FACTORS] ([SafetyFactorID], [SafetyFactorName], [A], [B], [C], [D], [E], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'Scaled Full-Life', 1, 1, 1, 1, 1, CAST(N'2019-06-28 16:50:34.487' AS DateTime), NULL, NULL, NULL, N'7ff49305-0d86-4b4c-bb4e-34579ff58c47')
SET IDENTITY_INSERT [dbo].[SITES] ON 

INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (1, N'HAI', CAST(N'2019-07-30 11:29:14.413' AS DateTime), NULL, NULL, NULL, N'7df6340a-63b4-4086-bed2-0dffec823515')
INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (2, N'TEST', CAST(N'2019-08-27 10:38:37.490' AS DateTime), NULL, NULL, NULL, N'cd2b109b-f9a2-4ec5-9ed7-9ac61815bfbd')
INSERT [dbo].[SITES] ([SiteID], [SiteName], [Created], [CreatedBy], [Modified], [ModifiedBy], [AuditingID]) VALUES (5, N'SS01', CAST(N'2019-11-12 12:19:37.317' AS DateTime), NULL, NULL, NULL, N'905c3605-9497-42f9-86c1-d7dcb6133a8e')
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
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (1, 31623, 12)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (2, 1000, 1)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (3, 4536, 10000)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (4, 2.205, 1)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (5, 2.205, 1)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (6, 25.2, 55.6)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (7, 55.6, 100)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (8, 0.0929, 1)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (9, 0.123, 0.6)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (10, 9.744, 63.32)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (11, 0.145, 1)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (12, 1.8, 1)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (13, 6.29, 0.178)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (14, 1, 3600)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (15, 4.685, 1)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (16, 30.89, 70)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (17, 0.001481, 0.00723)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (18, 0.005, 0.0164)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (19, 1.085, 1.015)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (20, 1.013, 0.147)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (21, 5328, 9590)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (22, 5.8, 14.62)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (23, 0.45, 0.346)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (24, 2.6, 2.279)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (25, 0.0296, 0.0438)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (26, 100, 14.5)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (27, 1, 0.3967)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (28, 1000, 6895)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (29, 0.0004303, 0.000185)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (30, 9.76E-08, 6.43E-07)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (31, 864, 7200)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (32, 0.543, 106.8)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (33, 0.0815, 16.03)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (34, 86.4, 189200)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (35, 29.6195, 8.0592)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (36, 30.5, 100)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (37, 1.408E-08, 1.408E-05)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (38, 1.1341, 403.95)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (39, 3.9365, 7.2622)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (40, 5.9352, 5.0489)
INSERT [dbo].[TBL_3B21_SI_CONVERSION] ([conversionFactory], [SIUnits], [USUnits]) VALUES (41, 32, 0)
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
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.55, 1350, 5, 800, 260, 90, 90)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.55, 1350, 6, 700, 240, 90, 90)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 1500, 1, 1400, 1250, 850, 500)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 1500, 2, 1300, 900, 400, 230)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 1500, 3, 1200, 620, 250, 210)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 1500, 4, 1000, 450, 220, 210)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 1500, 5, 900, 360, 210, 210)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 1500, 6, 800, 300, 210, 210)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 1900, 1, 1700, 1400, 1000, 700)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 1900, 2, 1600, 1105, 670, 530)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 1900, 3, 1300, 880, 550, 500)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 1900, 4, 1200, 700, 530, 500)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 1900, 5, 1100, 840, 500, 500)
INSERT [dbo].[TBL_511_DFB_THIN] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 1900, 6, 1000, 600, 500, 500)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.05, 4, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.1, 14, 1, 3, 1, 1, 1)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.15, 32, 1, 8, 2, 1, 1)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.2, 56, 1, 18, 6, 2, 1)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.25, 87, 1, 32, 11, 4, 3)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.3, 125, 1, 53, 21, 9, 6)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.35, 170, 1, 80, 36, 16, 12)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.4, 222, 1, 115, 57, 29, 21)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.45, 281, 1, 158, 86, 47, 36)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.5, 347, 1, 211, 124, 73, 58)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.55, 420, 1, 273, 173, 109, 89)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.6, 500, 1, 346, 234, 158, 133)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.65, 587, 1, 430, 309, 222, 192)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.7, 681, 1, 527, 401, 305, 270)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.75, 782, 1, 635, 510, 409, 370)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.8, 890, 1, 757, 638, 538, 498)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.85, 1005, 1, 893, 789, 696, 658)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.9, 1126, 1, 1044, 963, 888, 856)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (0.95, 1255, 1, 1209, 1163, 1118, 1098)
INSERT [dbo].[TBL_512_DFB_THIN_TANK_BOTTOM] ([art], [E], [insp], [D], [C], [B], [A]) VALUES (1, 1390, 1, 1390, 1390, 1390, 1390)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'AlCl3', N'Gas', N'All', 3.4531, 0.9411)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'CO', N'Gas', N'3', 9.55, 1.15)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'CO', N'Gas', N'5', 60.09, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'CO', N'Gas', N'10', 189.42, 1.13)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'CO', N'Gas', N'20', 651.49, 1.11)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'CO', N'Gas', N'40', 1252.67, 1.17)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'CO', N'Gas', N'60', 1521.89, 1.21)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HCl', N'Gas', N'3', 47.39, 1.09)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HCl', N'Gas', N'5', 123.67, 1.15)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HCl', N'Gas', N'10', 531.45, 1.1)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HCl', N'Gas', N'20', 224.55, 1.18)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HCl', N'Gas', N'40', 950.92, 1.2)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'HCl', N'Gas', N'60', 2118.87, 1.23)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Gas', N'3', 13230.9, 1.25)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Gas', N'5', 17146, 1.25)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Gas', N'10', 23851.3, 1.24)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Gas', N'20', 31185, 1.23)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Gas', N'40', 35813.7, 1.22)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Gas', N'60', 38105.8, 1.22)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Liquid', N'3', 1114.96, 1.08)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Liquid', N'5', 2006.1, 1.02)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Liquid', N'10', 2674.47, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Liquid', N'20', 4112.65, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Liquid', N'40', 6688.99, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Nitric Acid', N'Liquid', N'60', 9458.29, 1.12)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Gas', N'3', 1071.74, 0.7)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Gas', N'5', 1466.57, 0.68)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Gas', N'10', 1902.9, 0.68)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Gas', N'20', 2338.76, 0.72)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Gas', N'40', 3621.1, 0.7)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Gas', N'60', 4070.48, 0.71)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Liquid', N'3', 430, 0.98)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Liquid', N'5', 610.31, 1.04)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Liquid', N'10', 1340.93, 1.07)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Liquid', N'20', 3020.54, 1.08)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Liquid', N'40', 6110.67, 1.12)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'NO2', N'Liquid', N'60', 9455.68, 1.13)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Gas', N'3', 3095.33, 1.2)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Gas', N'5', 5918.49, 1.29)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Gas', N'10', 12129.3, 1.24)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Gas', N'20', 27459.6, 1.27)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Gas', N'40', 63526.4, 1.3)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Gas', N'60', 96274.2, 1.31)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Liquid', N'3', 733.39, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Liquid', N'5', 1520.02, 1.1)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Liquid', N'10', 4777.72, 1.12)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Liquid', N'20', 14727.5, 1.16)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Liquid', N'40', 42905, 1.2)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'Phosgene', N'Liquid', N'60', 77287.7, 1.23)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'TDI', N'Liquid', N'3', 793.04, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'TDI', N'Liquid', N'5', 846.54, 1.09)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'TDI', N'Liquid', N'10', 1011.9, 1.1)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'TDI', N'Liquid', N'20', 1026.06, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'TDI', N'Liquid', N'40', 1063.8, 1.06)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'TDI', N'Liquid', N'60', 1252.57, 1.03)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'1.5', 0.8954, 1.171)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'3', 1.7578, 1.181)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'5', 4.0002, 1.122)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'10', 7.54, 1.111)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'20', 24.56, 0.971)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'40', 31.22, 0.995)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Gas', N'60', 59.67, 0.899)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Liquid', N'10', 0.6857, 1.105)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Liquid', N'20', 3.6389, 1.065)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Liquid', N'40', 9.8422, 1.132)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EE', N'Liquid', N'60', 23.513, 1.104)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'1.5', 0.5085, 1.222)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'3', 2.972, 1.207)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'5', 7.9931, 1.271)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'10', 47.69, 1.2909)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'20', 237.57, 1.2849)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'40', 1088.4, 1.1927)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'EO', N'Gas', N'60', 1767.5, 1.203)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Gas', N'3', 0.0008, 1.913)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Gas', N'5', 0.0864, 1.217)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Gas', N'10', 0.1768, 1.2203)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Gas', N'20', 0.4172, 1.2164)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Gas', N'40', 0.9537, 1.2097)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Gas', N'60', 1.2289, 1.2522)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Liquid', N'5', 2.4084, 1.198)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Liquid', N'10', 9.0397, 1.111)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Liquid', N'20', 17.425, 1.114)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Liquid', N'40', 34.255, 1.118)
INSERT [dbo].[TBL_513_CA_TOXIC] ([Toxic], [ReleaseType], [ContinuousReleasesDuration], [a], [b]) VALUES (N'PO', N'Liquid', N'60', 367.06, 0.9855)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Acid', 18, 62.3, 212, N'Liquid', 3, 276000, -2090, 8.125, -0.0141, 9.37E-06, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'AlCl3', 133.5, 152, 382, N'Powder', 1, 43400, 39700, 417, 24000, 0, 1036)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C1-C2', 23, 15.639, -193, N'Gas', 1, 12.3, 0.115, -2.87E-05, -1.3E-09, 0, 1036)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C13-C16', 205, 47.728, 502, N'Liquid', 1, -11.7, 1.39, -0.000772, 1.67E-07, 0, 396)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C17-C25', 280, 48.383, 651, N'Liquid', 1, -22.4, 1.94, -0.00112, -2.53E-07, 0, 396)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C25+', 422, 56.187, 981, N'Liquid', 1, -22.4, 1.94, -0.00112, -2.53E-07, 0, 396)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C3-C4', 51, 33.61, -6.3, N'Gas', 1, 2.632, 0.3188, -13470, 1.466E-08, 0, 696)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C5', 72, 39.03, 97, N'Liquid', 1, -3.626, 0.4873, -0.00026, 5.3E-08, 0, 544)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C6-C8', 100, 42.702, 210, N'Liquid', 1, -5.146, 0.6762, -0.000365, 7.658E-08, 0, 433)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'C9-C12', 149, 45.823, 364, N'Liquid', 1, -8.5, 1.01, -0.000556, 1.18E-07, 0, 406)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'CO', 28, 50, -312, N'Gas', 2, 29100, 8770, 3090, 8460, 1540, 1128)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'DEE', 74, 45, 95, N'Liquid', 2, 86200, 255000, 1540, 144000, -689, 320)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'EE', 90, 58, 275, N'Liquid', 2, 32500, 300000, 1170, 208000, 473, 455)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'EEA', 132, 61, 313, N'Liquid', 2, 106000, 240000, 659, 150000, 1970, 715)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'EG', 62, 69, 387, N'Liquid', 2, 63000, 146000, 1670, 97300, 774, 745)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'EO', 44, 55, 51, N'Gas', 2, 33500, 121000, 1610, 82400, 737, 804)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'H2', 2, 4.433, -423, N'Gas', 1, 27.1, 0.00927, -1.38E-05, 7.65E-09, 0, 752)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'H2S', 34, 61.993, -75, N'Gas', 1, 31.9, 0.00144, 2.43E-05, -1.18E-08, 0, 500)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'HCl', 36, 74, -121, N'Gas', 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'HF', 20, 60.37, 68, N'Gas', 1, 29.1, 0.000661, -2.03E-06, 2.5E-09, 0, 32000)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Methanol', 32, 50, 149, N'Liquid', 2, 39300, 87900, 1920, 53700, 897, 867)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Nitric Acid', 63, 95, 250, N'Liquid', 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'NO2', 90, 58, 275, N'Liquid', 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Phosgene', 99, 86, 181, N'Liquid', 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'PO', 58, 52, 93, N'Liquid', 2, 49500, 174000, 1560, 115000, 702, 840)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Pyrophoric', 149, 45.823, 364, N'Liquid', 1, -8.5, 1.01, -0.000556, 1.18E-07, 0, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Steam', 18, 62.3, 212, N'Gas', 3, 33400, 26800, 2610, 8900, 1170, 0)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Styrene', 104, 42.7, 293, N'Liquid', 2, 89300, 215000, 772, 99900, 2440, 914)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'TDI', 174, 76, 484, N'Liquid', 0, 0, 0, 0, 0, 0, 1148)
INSERT [dbo].[TBL_52_CA_PROPERTIES_LEVEL_1] ([Fluid], [MW], [Density], [NBP], [Ambient], [ideal], [A], [B], [C], [D], [E], [Auto]) VALUES (N'Water', 18, 62.3, 212, N'Liquid', 3, 276000, -2090, 8.125, -0.0141, 9.37E-06, 0)
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
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Aromatics', 64.14, 0.963, 353.5, 0.883, 1344, 0.937, 487.7, 0.268, 18.08, 0.686, 0.14, 0.935, 512.6, 0.713, 1.404, 0.935)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C1-C2', 8.669, 0.98, 0, 0, 55.13, 0.95, 0, 0, 6.469, 0.67, 0, 0, 163.7, 0.62, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C13-C16', 0, 0, 12.11, 0.9, 0, 0, 196.7, 0.92, 0, 0, 0.086, 0.88, 0, 0, 1.714, 0.88)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C17-C25', 0, 0, 3.785, 0.9, 0, 0, 165.5, 0.92, 0, 0, 0.021, 0.91, 0, 0, 1.068, 0.91)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C25+', 0, 0, 2.098, 0.91, 0, 0, 103, 0.9, 0, 0, 0.006, 0.99, 0, 0, 0.284, 0.99)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C3-C4', 10.13, 1, 0, 0, 64.23, 1, 0, 0, 4.59, 0.72, 0, 0, 79.94, 0.63, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C5', 5.115, 0.99, 100.6, 0.89, 62.41, 1, 0, 0, 2.214, 0.73, 0.271, 0.85, 41.38, 0.61, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C6-C8', 5.846, 0.98, 34.17, 0.89, 63.98, 1, 103.4, 0.95, 2.188, 0.66, 0.749, 0.78, 41.49, 0.61, 8.18, 0.55)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C9-C12', 2.419, 0.98, 24.6, 0.9, 76.98, 0.95, 110.3, 0.95, 1.111, 0.66, 0.559, 0.76, 42.28, 0.61, 0.848, 0.53)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'CO', 0.04, 1.752, 0, 0, 0, 0, 0, 0, 10.97, 0.667, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'DEE', 9.072, 1.134, 164.2, 1.106, 67.42, 1.033, 976, 0.649, 24.51, 0.667, 0.981, 0.919, 0, 0, 1.09, 0.919)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EE', 2.595, 1.005, 35.45, 1, 0, 0, 0, 0, 6.119, 0.667, 14.79, 1, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EEA', 0, 1.035, 23.96, 1, 0, 0, 0, 0, 1.261, 0.667, 14.13, 1, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EG', 1.548, 0.973, 22.12, 1, 0, 0, 0, 0, 1.027, 0.667, 14.13, 1, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EO', 6.712, 1.069, 0, 0, 0, 0, 0, 0, 21.46, 0.667, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'H2', 13.13, 0.992, 0, 0, 86.02, 1, 0, 0, 9.605, 0.657, 0, 0, 216.5, 0.618, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'H2S', 6.554, 1, 0, 0, 38.11, 0.89, 0, 0, 22.63, 0.63, 0, 0, 53.72, 0.61, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'HF', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Methanol', 0.005, 0.909, 340.4, 0.934, 0, 0, 0, 0, 4.425, 0.667, 0.363, 0.9, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'PO', 3.277, 1.114, 257, 0.96, 0, 0, 0, 0, 10.32, 0.667, 0.629, 0.869, 0, 0, 0, 0)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Pyrophoric', 2.419, 0.98, 24.6, 0.9, 76.98, 0.95, 110.3, 0.95, 1.111, 0.66, 0.559, 0.76, 42.28, 0.61, 0.848, 0.53)
INSERT [dbo].[TBL_58_CA_COMPONENT_DM] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CAIL_gas_a], [CAIL_gas_b], [CAIL_liquid_a], [CAIL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Styrene', 3.952, 1.097, 21.1, 1, 80.11, 1.055, 0, 0, 1.804, 0.667, 14.36, 1, 83.68, 0.713, 143.6, 1)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Aromatics', 12.76, 0.963, 66.01, 0.883, 261.9, 0.937, 56, 0.268, 2.889, 0.686, 0.027, 0.935, 83.68, 0.713, 0.273, 0.935)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C1-C2', 21.83, 0.96, 0, 0, 143.2, 0.92, 0, 0, 12.46, 0.67, 0, 0, 473.9, 0.63, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C13-C16', 0, 0, 34.36, 0.89, 0, 0, 539.4, 0.9, 0, 0, 0.242, 0.88, 0, 0, 4.843, 0.88)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C17-C25', 0, 0, 10.7, 0.89, 0, 0, 458, 0.9, 0, 0, 0.061, 0.91, 0, 0, 3.052, 0.9)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C25+', 0, 0, 6.196, 0.89, 0, 0, 303.6, 0.9, 0, 0, 0.016, 0.99, 0, 0, 0.833, 0.99)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C3-C4', 25.64, 1, 0, 0, 171.4, 1, 0, 0, 9.702, 0.75, 0, 0, 270.4, 0.63, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C5', 12.71, 1, 290.1, 0.89, 166.1, 1, 0, 0, 4.82, 0.76, 0.79, 0.85, 146.7, 0.63, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C6-C8', 3.49, 0.96, 96.88, 0.89, 169.7, 1, 252.8, 0.92, 4.216, 0.67, 2.186, 0.78, 147.2, 0.63, 31.89, 0.54)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'C9-C12', 5.755, 0.96, 70.03, 0.89, 188.6, 0.92, 269.4, 0.92, 2.035, 0.66, 1.609, 0.76, 151, 0.63, 2.847, 0.54)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'CO  ', 5.491, 0.991, 0, 0, 0, 0, 0, 0, 16.91, 0.692, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'DEE', 26.76, 1.025, 236.7, 1.219, 241.5, 0.997, 488.9, 0.864, 31.71, 0.682, 8.333, 0.814, 128.3, 0.657, 9.258, 0.814)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EE', 7.107, 0.969, 8.142, 0.8, 0, 0, 0, 0, 25.36, 0.66, 0.029, 0.927, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EEA', 0, 0.946, 79.66, 0.835, 0, 0, 0, 0, 1.825, 0.687, 0.03, 0.924, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EG', 5.042, 0.947, 59.96, 0.869, 0, 0, 0, 0, 1.435, 0.687, 0.027, 0.922, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'EO', 11, 1.105, 0, 0, 0, 0, 0, 0, 34.7, 0.665, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'H2', 32.05, 0.933, 0, 0, 228.8, 1, 0, 0, 18.43, 0.652, 0, 0, 636.5, 0.621, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'H2S', 10.65, 1, 0, 0, 73.25, 0.94, 0, 0, 41.43, 0.63, 0, 0, 191.5, 0.63, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'HF', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Methanol', 0, 1.008, 849.9, 0.902, 0, 0, 0, 0, 6.035, 6.88, 1.157, 0.871, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'PO', 8.239, 1.047, 352.8, 0.84, 0, 0, 0, 0, 13.33, 0.682, 2.732, 0.83, 0, 0, 0, 0)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Pyrophoric', 5.755, 0.96, 70.03, 0.89, 188.6, 0.92, 269.4, 0.92, 2.035, 0.66, 1.609, 0.76, 151, 0.63, 2.847, 0.54)
INSERT [dbo].[TBL_59_COMPONENT_DAMAGE_PERSON] ([Fluid], [CAINL_gas_a], [CAINL_gas_b], [CAINL_liquid_a], [CAINL_liquid_b], [CALL_gas_a], [CALL_gas_b], [CALL_liquid_a], [CALL_liquid_b], [IAINL_gas_a], [IAINL_gas_b], [IAINL_liquid_a], [IAINL_liquid_b], [IAIL_gas_a], [IAIL_gas_b], [IAIL_liquid_a], [IAIL_liquid_b]) VALUES (N'Styrene', 12.76, 0.963, 66.01, 0.883, 261.9, 0.937, 56, 0.268, 2.889, 0.686, 0.027, 0.935, 83.68, 0.713, 0.273, 0.935)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (10, 10, 8, 3, 1, 1, 6, 2, 1, 1, 4, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (50, 50, 40, 17, 5, 3, 30, 10, 2, 1, 20, 5, 1, 1, 10, 2, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (100, 100, 80, 33, 10, 5, 60, 20, 4, 1, 40, 10, 2, 1, 20, 5, 1, 1, 10, 2, 1, 1, 5, 1, 1, 1)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (500, 500, 400, 170, 50, 25, 300, 100, 20, 5, 200, 50, 8, 1, 100, 25, 2, 1, 50, 10, 1, 1, 25, 5, 1, 1)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (1000, 1000, 800, 300, 100, 50, 600, 200, 40, 10, 400, 100, 16, 2, 200, 50, 5, 1, 100, 25, 2, 1, 50, 10, 1, 1)
INSERT [dbo].[TBL_63_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (5000, 5000, 4000, 1670, 500, 250, 3000, 1000, 250, 50, 2000, 500, 80, 10, 1000, 250, 25, 2, 500, 125, 5, 1, 250, 50, 2, 1)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (1, 0.3, 0.5, 9, 3, 0, 1)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (2, 0.5, 1, 40, 4, 0, 1)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (3, 0.7, 2, 146, 6, 0, 1)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (4, 1, 4, 428, 7, 0, 1)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (5, 1, 9, 1017, 9, 1, 1)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (6, 2, 16, 1978, 11, 1, 1)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (7, 3, 30, 3000, 13, 1, 2)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (8, 4, 53, 3000, 16, 1, 3)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (9, 6, 89, 3000, 20, 2, 7)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (10, 9, 146, 3000, 25, 3, 13)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (11, 12, 230, 3000, 30, 4, 26)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (12, 16, 351, 3000, 36, 5, 47)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (13, 22, 518, 3000, 44, 7, 82)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (14, 30, 738, 3000, 53, 9, 139)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (15, 40, 1017, 3000, 63, 11, 228)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (16, 53, 1358, 3000, 75, 15, 359)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (17, 69, 1758, 3000, 89, 19, 548)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (18, 89, 2209, 3000, 105, 25, 808)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (19, 115, 2697, 3000, 124, 31, 1151)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (20, 146, 3000, 3000, 146, 40, 1587)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (21, 184, 3000, 3000, 170, 50, 2119)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (22, 230, 3000, 3000, 199, 63, 2743)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (23, 286, 3000, 3000, 230, 78, 3000)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (24, 351, 3000, 3000, 266, 97, 3000)
INSERT [dbo].[TBL_64_DM_LINNING_INORGANIC] ([YearsSinceLastInspection], [Strip lined alloy], [Castable refractory], [Castable refractory severe condition], [Glass lined], [Acid Brick], [Fibreglass]) VALUES (25, 428, 3000, 3000, 306, 119, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (1, 30, 1, 0)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (2, 89, 4, 0)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (3, 230, 16, 0)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (4, 518, 53, 0)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (5, 1017, 146, 0.2)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (6, 1758, 351, 1)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (7, 2697, 738, 4)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (8, 3000, 1358, 16)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (9, 3000, 2209, 53)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (10, 3000, 3000, 146)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (11, 3000, 3000, 351)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (12, 3000, 3000, 738)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (13, 3000, 3000, 1358)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (14, 3000, 3000, 2209)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (15, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (16, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (17, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (18, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (19, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (20, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (21, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (22, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (23, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (24, 3000, 3000, 3000)
INSERT [dbo].[TBL_65_DM_LINNING_ORGANIC] ([YearInService], [MoreThan6Years], [WithinLast6Years], [WithinLast3Years]) VALUES (25, 3000, 3000, 3000)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Crude Oil', N'C17-C25', 280, 48.383, 7.706E-05)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Fuel Oil', N'C17-C25', 280, 48.383, 7.706E-05)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Gasonline', N'C6-C8', 100, 42.702, 8.383E-05)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Heavy Crude Oil', N'C25+', 422, 56.187, 9.6E-05)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Heavy Diesel Oil', N'C13-C16', 205, 47.728, 5.129E-05)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Heavy Fuel Oil', N'C25+', 422, 56.187, 9.6E-05)
INSERT [dbo].[TBL_71_PROPERTIES_STORAGE_TANK] ([Fluid], [Level 1 Consequence Analysis Representative Fluid], [Molecular Weight], [Liquid Density], [Liquid Density Viscosity]) VALUES (N'Light Diesel Oil', N'C9-C12', 149, 45.823, 2.169E-05)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Coarse Sand', 0.0394, 0.00394, 0.33)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Fine Sand', 0.00394, 0.000394, 0.33)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Very Fine Sand', 0.000394, 3.94E-06, 0.33)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Silt', 3.94E-06, 3.94E-07, 0.41)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Sandy Clay', 3.94E-07, 3.94E-08, 0.45)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Clay', 3.94E-08, 3.94E-09, 0.5)
INSERT [dbo].[TBL_72_SOIL_TYPE_AND_PROPERTIES_ATMOSPHERIC] ([Soil Type], [Hydraulic Conductivity for Water Lower Bound (in s)], [Hydraulic Conductivity for Water Upper Bound (in s)], [Soil Porosity]) VALUES (N'Concrete-Asphalt', 3.94E-11, 3.94E-12, 0.99)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (10, 10, 8, 3, 1, 1, 6, 2, 1, 1, 4, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (50, 50, 40, 17, 5, 3, 30, 10, 2, 1, 20, 5, 1, 1, 10, 2, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (100, 100, 80, 33, 10, 5, 60, 20, 4, 1, 40, 10, 2, 1, 20, 5, 1, 1, 10, 2, 1, 1, 5, 1, 1, 1)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (500, 500, 400, 170, 50, 25, 300, 100, 20, 5, 200, 50, 8, 1, 100, 25, 2, 1, 50, 10, 1, 1, 25, 5, 1, 1)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (1000, 100, 800, 330, 100, 50, 600, 200, 40, 10, 400, 100, 16, 2, 200, 50, 5, 1, 100, 25, 2, 1, 50, 10, 1, 1)
INSERT [dbo].[TBL_74_SCC_DM_PWHT] ([SVI], [E], [1D], [1C], [1B], [1A], [2D], [2C], [2B], [2A], [3D], [3C], [3B], [3A], [4D], [4C], [4B], [4A], [5D], [5C], [5B], [5A], [6D], [6C], [6B], [6A]) VALUES (5000, 500, 4000, 1670, 250, 250, 3000, 1000, 250, 50, 2000, 500, 80, 10, 1000, 250, 25, 2, 500, 125, 5, 1, 250, 50, 2, 1)
INSERT [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY] ([Location], [Description], [Low], [Medium], [High]) VALUES (1, N'C_indike', 10, 10, 10)
INSERT [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY] ([Location], [Description], [Low], [Medium], [High]) VALUES (2, N'C_ssonline', 50, 50, 50)
INSERT [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY] ([Location], [Description], [Low], [Medium], [High]) VALUES (3, N'C_ssoffline', 100, 250, 500)
INSERT [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY] ([Location], [Description], [Low], [Medium], [High]) VALUES (4, N'C_subsoil', 500, 1500, 3000)
INSERT [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY] ([Location], [Description], [Low], [Medium], [High]) VALUES (5, N'C_groundwater', 1000, 5000, 10000)
INSERT [dbo].[TBL_76_PARAMETER_EVIRON_SENSITIVITY] ([Location], [Description], [Low], [Medium], [High]) VALUES (6, N'C_water', 500, 1500, 5000)
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
/****** Object:  Index [UK_COFFluid]    Script Date: 5/4/2020 4:24:22 PM ******/
ALTER TABLE [dbo].[COF_FLUID] ADD  CONSTRAINT [UK_COFFluid] UNIQUE NONCLUSTERED 
(
	[COFFluidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_EquipmentNumber]    Script Date: 5/4/2020 4:24:22 PM ******/
ALTER TABLE [dbo].[EQUIPMENT_MASTER] ADD  CONSTRAINT [UK_EquipmentNumber] UNIQUE NONCLUSTERED 
(
	[EquipmentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_GenericFluid]    Script Date: 5/4/2020 4:24:22 PM ******/
ALTER TABLE [dbo].[GENERIC_FLUID] ADD  CONSTRAINT [UK_GenericFluid] UNIQUE NONCLUSTERED 
(
	[GenericFluid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [KEY_USER_PERMISSIONS]    Script Date: 5/4/2020 4:24:22 PM ******/
ALTER TABLE [dbo].[USER_PERMISSIONS] ADD  CONSTRAINT [KEY_USER_PERMISSIONS] UNIQUE NONCLUSTERED 
(
	[UserID] ASC,
	[Category] ASC,
	[Permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = ON, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[INSPECTION_COVERAGE_EQUIPMENT] ADD  CONSTRAINT [DF_316DF396_INSPECTION_COVERAGE_EQUIPMENT_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_EQUIPMENT] ADD  CONSTRAINT [DF_316DF396_INSPECTION_COVERAGE_EQUIPMENT_AuditingID]  DEFAULT (newid()) FOR [AuditingID]
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
ALTER TABLE [dbo].[INSPECTION_COVERAGE_EQUIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_INSPECTION_COVERAGE_EQUIPMENT_EQUIPMENT_MASTER] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[EQUIPMENT_MASTER] ([EquipmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[INSPECTION_COVERAGE_EQUIPMENT] CHECK CONSTRAINT [FK_INSPECTION_COVERAGE_EQUIPMENT_EQUIPMENT_MASTER]
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
ALTER TABLE [dbo].[RW_RISK_GRAPH]  WITH CHECK ADD  CONSTRAINT [FK_RW_RISK_GRAPH_RW_ASSESSMENT] FOREIGN KEY([ID])
REFERENCES [dbo].[RW_ASSESSMENT] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RW_RISK_GRAPH] CHECK CONSTRAINT [FK_RW_RISK_GRAPH_RW_ASSESSMENT]
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
