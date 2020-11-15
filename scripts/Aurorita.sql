USE [Aurorita]
GO
/****** Object:  Table [dbo].[Dim_Anio]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Anio](
	[IdAnio] [int] IDENTITY(1,1) NOT NULL,
	[Anio] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Anio] PRIMARY KEY CLUSTERED 
(
	[IdAnio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Cargo]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Cargo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Dim_Cargo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Categoria]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Dim_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Ciudad]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Ciudad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdPais] [int] NOT NULL,
	[IdRegion] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Ciudad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_CodigoPostal]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_CodigoPostal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCiudad] [int] NULL,
	[CodigoPostal] [varchar](20) NULL,
 CONSTRAINT [PK_Dim_CodigoPostal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_CompaniaEnvio]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_CompaniaEnvio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Telefono] [varchar](24) NOT NULL,
 CONSTRAINT [PK_Dim_CompaniaEnvio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Contacto]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Contacto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreContacto] [varchar](100) NULL,
	[IdCargo] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Contacto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_DetalleVenta]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_DetalleVenta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Descuento] [int] NOT NULL,
	[IdDetalle] [int] NOT NULL,
 CONSTRAINT [PK_Dim_DetalleVenta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Dia]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Dia](
	[IdDia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Dim_Dia] PRIMARY KEY CLUSTERED 
(
	[IdDia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Estacion]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Estacion](
	[IdEstacion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Dim_Estacion] PRIMARY KEY CLUSTERED 
(
	[IdEstacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Fecha]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Fecha](
	[IdFecha] [int] IDENTITY(1,1) NOT NULL,
	[Dia] [int] NOT NULL,
	[IdMes] [int] NOT NULL,
	[IdDia] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Fecha] PRIMARY KEY CLUSTERED 
(
	[IdFecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Mes]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Mes](
	[IdMes] [int] IDENTITY(1,1) NOT NULL,
	[Mes] [int] NOT NULL,
	[IdAnio] [int] NOT NULL,
	[IdEstacion] [int] NOT NULL,
	[Trimestre] [int] NOT NULL,
	[Nombre] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Dim_Mes] PRIMARY KEY CLUSTERED 
(
	[IdMes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Pais]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Pais](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_Pais] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Persona]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Persona](
	[Id] [varchar](20) NOT NULL,
	[NombreCompania] [varchar](100) NOT NULL,
	[IdContacto] [int] NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Fax] [varchar](20) NOT NULL,
	[IdUbicacion] [int] NULL,
	[Tipo] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Persona] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Producto]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Producto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProveedor] [varchar](20) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Cantidad] [varchar](20) NOT NULL,
	[PrecioUnidad] [decimal](18, 2) NOT NULL,
	[UnidadExistencia] [int] NOT NULL,
	[UnidadesEnPedido] [int] NOT NULL,
	[NivelNuevoPedido] [int] NOT NULL,
	[Suspendida] [bit] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_Producto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Region]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Region](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Ubicacion]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Ubicacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[CodigoPostal] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Ubicacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Presupuesto]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Presupuesto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPais] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Valor] [int] NOT NULL,
	[Periodo] [varchar](7) NOT NULL,
 CONSTRAINT [PK_Fact_Presupuesto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Venta]    Script Date: 14/11/2020 22:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Venta](
	[IdVenta] [int] NOT NULL,
	[IdPersonaEmpleado] [varchar](20) NOT NULL,
	[IdFechaPedido] [int] NOT NULL,
	[IdFechaEntrega] [int] NOT NULL,
	[IdFechaEnvio] [int] NOT NULL,
	[IdFormaEnvio] [int] NOT NULL,
	[ValorTotal] [decimal](18, 2) NOT NULL,
	[IdPersonaCliente] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Fact_Venta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_Ciudad]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Ciudad_Dim_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Dim_Pais] ([Id])
GO
ALTER TABLE [dbo].[Dim_Ciudad] CHECK CONSTRAINT [FK_Dim_Ciudad_Dim_Pais]
GO
ALTER TABLE [dbo].[Dim_Ciudad]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Ciudad_Dim_Region] FOREIGN KEY([IdRegion])
REFERENCES [dbo].[Dim_Region] ([Id])
GO
ALTER TABLE [dbo].[Dim_Ciudad] CHECK CONSTRAINT [FK_Dim_Ciudad_Dim_Region]
GO
ALTER TABLE [dbo].[Dim_CodigoPostal]  WITH CHECK ADD  CONSTRAINT [FK_Dim_CodigoPostal_Dim_Ciudad] FOREIGN KEY([IdCiudad])
REFERENCES [dbo].[Dim_Ciudad] ([Id])
GO
ALTER TABLE [dbo].[Dim_CodigoPostal] CHECK CONSTRAINT [FK_Dim_CodigoPostal_Dim_Ciudad]
GO
ALTER TABLE [dbo].[Dim_Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Contacto_Dim_Cargo] FOREIGN KEY([IdCargo])
REFERENCES [dbo].[Dim_Cargo] ([Id])
GO
ALTER TABLE [dbo].[Dim_Contacto] CHECK CONSTRAINT [FK_Dim_Contacto_Dim_Cargo]
GO
ALTER TABLE [dbo].[Dim_DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_Dim_DetalleVenta_Dim_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Dim_Producto] ([Id])
GO
ALTER TABLE [dbo].[Dim_DetalleVenta] CHECK CONSTRAINT [FK_Dim_DetalleVenta_Dim_Producto]
GO
ALTER TABLE [dbo].[Dim_DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_Dim_DetalleVenta_Fact_Venta] FOREIGN KEY([IdDetalle])
REFERENCES [dbo].[Fact_Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[Dim_DetalleVenta] CHECK CONSTRAINT [FK_Dim_DetalleVenta_Fact_Venta]
GO
ALTER TABLE [dbo].[Dim_Fecha]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Fecha_Dim_Dia] FOREIGN KEY([IdDia])
REFERENCES [dbo].[Dim_Dia] ([IdDia])
GO
ALTER TABLE [dbo].[Dim_Fecha] CHECK CONSTRAINT [FK_Dim_Fecha_Dim_Dia]
GO
ALTER TABLE [dbo].[Dim_Fecha]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Fecha_Dim_Mes] FOREIGN KEY([IdMes])
REFERENCES [dbo].[Dim_Mes] ([IdMes])
GO
ALTER TABLE [dbo].[Dim_Fecha] CHECK CONSTRAINT [FK_Dim_Fecha_Dim_Mes]
GO
ALTER TABLE [dbo].[Dim_Mes]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Mes_Dim_Anio] FOREIGN KEY([IdAnio])
REFERENCES [dbo].[Dim_Anio] ([IdAnio])
GO
ALTER TABLE [dbo].[Dim_Mes] CHECK CONSTRAINT [FK_Dim_Mes_Dim_Anio]
GO
ALTER TABLE [dbo].[Dim_Mes]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Mes_Dim_Estacion] FOREIGN KEY([IdEstacion])
REFERENCES [dbo].[Dim_Estacion] ([IdEstacion])
GO
ALTER TABLE [dbo].[Dim_Mes] CHECK CONSTRAINT [FK_Dim_Mes_Dim_Estacion]
GO
ALTER TABLE [dbo].[Dim_Persona]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Persona_Dim_Contacto] FOREIGN KEY([IdContacto])
REFERENCES [dbo].[Dim_Contacto] ([Id])
GO
ALTER TABLE [dbo].[Dim_Persona] CHECK CONSTRAINT [FK_Dim_Persona_Dim_Contacto]
GO
ALTER TABLE [dbo].[Dim_Persona]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Persona_Dim_Ubicacion] FOREIGN KEY([IdUbicacion])
REFERENCES [dbo].[Dim_Ubicacion] ([Id])
GO
ALTER TABLE [dbo].[Dim_Persona] CHECK CONSTRAINT [FK_Dim_Persona_Dim_Ubicacion]
GO
ALTER TABLE [dbo].[Dim_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Producto_Dim_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Dim_Categoria] ([Id])
GO
ALTER TABLE [dbo].[Dim_Producto] CHECK CONSTRAINT [FK_Dim_Producto_Dim_Categoria]
GO
ALTER TABLE [dbo].[Dim_Producto]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Producto_Dim_Persona] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Dim_Persona] ([Id])
GO
ALTER TABLE [dbo].[Dim_Producto] CHECK CONSTRAINT [FK_Dim_Producto_Dim_Persona]
GO
ALTER TABLE [dbo].[Dim_Ubicacion]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Ubicacion_Dim_CodigoPostal] FOREIGN KEY([CodigoPostal])
REFERENCES [dbo].[Dim_CodigoPostal] ([Id])
GO
ALTER TABLE [dbo].[Dim_Ubicacion] CHECK CONSTRAINT [FK_Dim_Ubicacion_Dim_CodigoPostal]
GO
ALTER TABLE [dbo].[Fact_Presupuesto]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Presupuesto_Dim_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Dim_Categoria] ([Id])
GO
ALTER TABLE [dbo].[Fact_Presupuesto] CHECK CONSTRAINT [FK_Fact_Presupuesto_Dim_Categoria]
GO
ALTER TABLE [dbo].[Fact_Presupuesto]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Presupuesto_Dim_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Dim_Pais] ([Id])
GO
ALTER TABLE [dbo].[Fact_Presupuesto] CHECK CONSTRAINT [FK_Fact_Presupuesto_Dim_Pais]
GO
ALTER TABLE [dbo].[Fact_Venta]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Venta_Dim_CompaniaEnvio] FOREIGN KEY([IdFormaEnvio])
REFERENCES [dbo].[Dim_CompaniaEnvio] ([Id])
GO
ALTER TABLE [dbo].[Fact_Venta] CHECK CONSTRAINT [FK_Fact_Venta_Dim_CompaniaEnvio]
GO
ALTER TABLE [dbo].[Fact_Venta]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Venta_Dim_Fecha] FOREIGN KEY([IdFechaPedido])
REFERENCES [dbo].[Dim_Fecha] ([IdFecha])
GO
ALTER TABLE [dbo].[Fact_Venta] CHECK CONSTRAINT [FK_Fact_Venta_Dim_Fecha]
GO
ALTER TABLE [dbo].[Fact_Venta]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Venta_Dim_Fecha1] FOREIGN KEY([IdFechaEntrega])
REFERENCES [dbo].[Dim_Fecha] ([IdFecha])
GO
ALTER TABLE [dbo].[Fact_Venta] CHECK CONSTRAINT [FK_Fact_Venta_Dim_Fecha1]
GO
ALTER TABLE [dbo].[Fact_Venta]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Venta_Dim_Fecha2] FOREIGN KEY([IdFechaEnvio])
REFERENCES [dbo].[Dim_Fecha] ([IdFecha])
GO
ALTER TABLE [dbo].[Fact_Venta] CHECK CONSTRAINT [FK_Fact_Venta_Dim_Fecha2]
GO
ALTER TABLE [dbo].[Fact_Venta]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Venta_Dim_Persona] FOREIGN KEY([IdPersonaEmpleado])
REFERENCES [dbo].[Dim_Persona] ([Id])
GO
ALTER TABLE [dbo].[Fact_Venta] CHECK CONSTRAINT [FK_Fact_Venta_Dim_Persona]
GO
ALTER TABLE [dbo].[Fact_Venta]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Venta_Dim_Persona1] FOREIGN KEY([IdPersonaCliente])
REFERENCES [dbo].[Dim_Persona] ([Id])
GO
ALTER TABLE [dbo].[Fact_Venta] CHECK CONSTRAINT [FK_Fact_Venta_Dim_Persona1]
GO
