USE [Aurorita_Access]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 15/11/2020 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] NOT NULL,
	[NombreCategoria] [varchar](100) NULL,
	[Descripcion] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 15/11/2020 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [varchar](5) NOT NULL,
	[NombreCompania] [varchar](40) NOT NULL,
	[NombreContacto] [varchar](30) NOT NULL,
	[CargoContacto] [varchar](30) NOT NULL,
	[Direccion] [varchar](60) NOT NULL,
	[Region] [varchar](15) NULL,
	[CodigoPostal] [varchar](50) NULL,
	[Pais] [varchar](15) NOT NULL,
	[Telefono] [varchar](24) NULL,
	[Fax] [varchar](24) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompaniaEnvios]    Script Date: 15/11/2020 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompaniaEnvios](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](40) NOT NULL,
	[Telefono] [varchar](24) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesPedidos]    Script Date: 15/11/2020 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesPedidos](
	[Id] [int] NOT NULL,
	[Producto] [int] NOT NULL,
	[Precio] [varchar](20) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Descuento] [decimal](18, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 15/11/2020 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Nombre] [varchar](10) NOT NULL,
	[Cargo] [varchar](30) NOT NULL,
	[Tratamiento] [varchar](25) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[FechaContratacion] [datetime] NOT NULL,
	[Direccion] [varchar](60) NOT NULL,
	[Ciudad] [varchar](15) NOT NULL,
	[Region] [varchar](15) NULL,
	[CodigoPostal] [varchar](10) NOT NULL,
	[Extension] [varchar](4) NOT NULL,
	[Notas] [varchar](max) NOT NULL,
	[Jefe] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 15/11/2020 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[Id] [int] NOT NULL,
	[Cliente] [varchar](5) NOT NULL,
	[Empleado] [int] NOT NULL,
	[FechaPedido] [datetime] NOT NULL,
	[FechaEntrega] [datetime] NOT NULL,
	[FechaEnvio] [datetime] NULL,
	[FormaEnvio] [int] NOT NULL,
	[Cargo] [varchar](20) NOT NULL,
	[NombreDestinatario] [varchar](40) NOT NULL,
	[DireccionDestinatario] [varchar](60) NOT NULL,
	[CiudadDestinatario] [varchar](15) NOT NULL,
	[RegionDestinatario] [varchar](15) NULL,
	[CodigoPostalDestinatario] [varchar](10) NULL,
	[PaisDestinatario] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 15/11/2020 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](40) NOT NULL,
	[Proveedor] [int] NOT NULL,
	[Categoria] [int] NOT NULL,
	[Cantidad] [varchar](20) NOT NULL,
	[Precio] [varchar](20) NOT NULL,
	[UnidadEnExistencia] [int] NOT NULL,
	[UnidadesEnPedido] [int] NOT NULL,
	[NivelNuevoPedido] [int] NOT NULL,
	[Suspendida] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 15/11/2020 21:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Id] [int] NOT NULL,
	[NombreCompania] [varchar](40) NOT NULL,
	[NombreContacto] [varchar](50) NOT NULL,
	[CargoContacto] [varchar](50) NOT NULL,
	[Direccion] [varchar](60) NOT NULL,
	[Ciudad] [varchar](15) NOT NULL,
	[Region] [varchar](15) NULL,
	[CodigoPostal] [varchar](10) NOT NULL,
	[Pais] [varchar](15) NOT NULL,
	[Telefono] [varchar](24) NOT NULL,
	[Fax] [varchar](24) NULL
) ON [PRIMARY]
GO
