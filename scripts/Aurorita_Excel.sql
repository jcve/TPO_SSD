USE [Aurorita_Excel]
GO
/****** Object:  Table [dbo].[Presupuesto]    Script Date: 15/11/2020 21:04:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presupuesto](
	[PaisDestinatario] [varchar](50) NOT NULL,
	[NombreCategoria] [varchar](50) NOT NULL,
	[Valor] [int] NOT NULL,
	[Periodo] [date] NOT NULL
) ON [PRIMARY]
GO
