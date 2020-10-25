USE [Aurorita_Excel]
GO
/****** Object:  Table [dbo].[Presupuesto]    Script Date: 25/10/2020 01:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presupuesto](
	[PaisDestinatario] [varchar](50) NOT NULL,
	[NombreCategoria] [varchar](50) NOT NULL,
	[Valor] [int] NOT NULL,
	[Periodo] [varchar](7) NOT NULL
) ON [PRIMARY]
GO
