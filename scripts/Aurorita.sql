USE [Aurorita]
GO
/****** Object:  Table [dbo].[Fact_Venta]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_Ciudad]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_Pais]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_CodigoPostal]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_Ubicacion]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_Persona]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  View [dbo].[ventaByPais]    Script Date: 15/11/2020 21:03:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  CREATE view [dbo].[ventaByPais] as (
    select count(*) cantidadVentas, isNull(max(pais.Nombre), 'OTRO') nombre, isNull(pais.Id, 9999) paisId from Fact_Venta vta 
	left join dim_persona pers on pers.Id = vta.IdPersonaCliente
	left join Dim_Ubicacion ubic on ubic.Id = pers.IdUbicacion
	left join Dim_CodigoPostal cp on ubic.CodigoPostal = cp.Id
	left join dim_ciudad cd on cd.Id = cp.IdCiudad
	left join Dim_Pais pais on pais.Id = cd.IdPais
  group by pais.Id
)
GO
/****** Object:  Table [dbo].[Dim_Producto]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  View [dbo].[getProductosLowStock]    Script Date: 15/11/2020 21:03:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view [dbo].[getProductosLowStock] as (

SELECT dp.[Id]
      ,[IdProveedor]
      ,[IdCategoria]
      ,[Cantidad]
      ,[PrecioUnidad]
      ,[UnidadExistencia]
      ,[UnidadesEnPedido]
      ,[NivelNuevoPedido]
      ,[Suspendida]
      ,[Nombre]
	  ,dm.NombreCompania
  FROM [Aurorita].[dbo].[Dim_Producto] dp
  left join Dim_Persona dm on dm.Id = dp.IdProveedor and dm.Tipo=3 
  where UnidadExistencia<=NivelNuevoPedido
  )
GO
/****** Object:  Table [dbo].[Dim_DetalleVenta]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  View [dbo].[llegadaDestinoProd]    Script Date: 15/11/2020 21:03:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[llegadaDestinoProd]
AS
SELECT pais.Id AS idPaisSalida, pais.Nombre AS paisSalida, prodVta.Nombre AS producto, prodVta.Cantidad, proved.pais AS paisLlegada, proved.idPais AS idPaisLlegada, vta.IdFechaPedido AS fecha
FROM   dbo.Fact_Venta AS vta LEFT OUTER JOIN
             dbo.Dim_Persona AS pers ON pers.Id = vta.IdPersonaCliente LEFT OUTER JOIN
             dbo.Dim_Ubicacion AS ubic ON ubic.Id = pers.IdUbicacion LEFT OUTER JOIN
             dbo.Dim_CodigoPostal AS cp ON cp.Id = ubic.CodigoPostal LEFT OUTER JOIN
             dbo.Dim_Ciudad AS city ON city.Id = cp.IdCiudad LEFT OUTER JOIN
             dbo.Dim_Pais AS pais ON pais.Id = city.IdPais LEFT OUTER JOIN
                 (SELECT dv.IdDetalle AS idCab, prod.Id, dv.Cantidad, prod.Nombre
                 FROM    dbo.Dim_DetalleVenta AS dv LEFT OUTER JOIN
                              dbo.Dim_Producto AS prod ON prod.Id = dv.IdProducto) AS prodVta ON prodVta.idCab = vta.IdVenta LEFT OUTER JOIN
             dbo.Dim_Producto AS prod ON prod.Id = prodVta.Id LEFT OUTER JOIN
                 (SELECT pers.Id, pers.NombreCompania, pais.Id AS idPais, pais.Nombre AS pais
                 FROM    dbo.Dim_Persona AS pers LEFT OUTER JOIN
                              dbo.Dim_Ubicacion AS ubic ON ubic.Id = pers.IdUbicacion LEFT OUTER JOIN
                              dbo.Dim_CodigoPostal AS cp ON cp.Id = ubic.CodigoPostal LEFT OUTER JOIN
                              dbo.Dim_Ciudad AS city ON city.Id = cp.IdCiudad LEFT OUTER JOIN
                              dbo.Dim_Pais AS pais ON pais.Id = city.IdPais
                 WHERE (pers.Tipo = 3)) AS proved ON proved.Id = prod.IdProveedor
GO
/****** Object:  View [dbo].[getTop10VentasPais]    Script Date: 15/11/2020 21:03:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
create view [dbo].[getTop10VentasPais] as (
SELECT TOP (1000) [IdVenta]
      ,[IdPersonaEmpleado]
      ,[IdFechaPedido]
      ,[IdFechaEntrega]
      ,[IdFechaEnvio]
      ,[IdFormaEnvio]
      ,[ValorTotal]
      ,[IdPersonaCliente],
	  dp.Nombre
  FROM [Aurorita].[dbo].[Fact_Venta] f
  left join Dim_Persona p on f.IdPersonaCliente = p.Id
  left join Dim_Ubicacion du on du.Id = IdUbicacion
  left join Dim_CodigoPostal dc on dc.Id = du.CodigoPostal
  left join Dim_Ciudad dcc on dcc.Id = dc.IdCiudad
  left join Dim_Pais dp on dp.Id = dcc.IdPais
 )
GO
/****** Object:  View [dbo].[proveedoresPorPais]    Script Date: 15/11/2020 21:03:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[proveedoresPorPais] as SELECT        COUNT(*) AS cantidad, ISNULL(MAX(pais.Nombre), 'OTRO') AS nombrePais
FROM            dbo.Dim_Producto AS pr LEFT OUTER JOIN
                         dbo.Dim_Persona AS pers ON pers.Id = pr.IdProveedor AND pers.Tipo = 3 LEFT OUTER JOIN
                         dbo.Dim_Ubicacion AS ubic ON ubic.Id = pers.IdUbicacion LEFT OUTER JOIN
                         dbo.Dim_CodigoPostal AS cp ON ubic.CodigoPostal = cp.Id LEFT OUTER JOIN
                         dbo.Dim_Ciudad AS cd ON cd.Id = cp.IdCiudad LEFT OUTER JOIN
                         dbo.Dim_Pais AS pais ON pais.Id = cd.IdPais
GROUP BY pais.Nombre
GO
/****** Object:  View [dbo].[montoByPais]    Script Date: 15/11/2020 21:03:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[montoByPais] as 
(
select sum(valortotal) monto, max(isNULL(pais.nombre, 'OTRO')) pais, max(isNULL(pais.id, 99999)) idPais from Fact_Venta vta
left join dbo.Dim_Persona AS pers ON pers.Id = vta.IdPersonaCliente 
LEFT OUTER JOIN dbo.Dim_Ubicacion AS ubic ON ubic.Id = pers.IdUbicacion 
LEFT OUTER JOIN dbo.Dim_CodigoPostal AS cp ON cp.Id = ubic.CodigoPostal
LEFT OUTER JOIN dbo.Dim_Ciudad AS city ON city.Id = cp.IdCiudad 
LEFT OUTER JOIN dbo.Dim_Pais AS pais ON pais.Id = city.IdPais 
group by IdPais
)
GO
/****** Object:  Table [dbo].[Dim_Anio]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_Cargo]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_Categoria]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_CompaniaEnvio]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_Contacto]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_Dia]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_Estacion]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_Fecha]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_Mes]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Dim_Region]    Script Date: 15/11/2020 21:03:43 ******/
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
/****** Object:  Table [dbo].[Fact_Presupuesto]    Script Date: 15/11/2020 21:03:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Presupuesto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPais] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Valor] [int] NOT NULL,
	[Periodo] [date] NOT NULL,
 CONSTRAINT [PK_Fact_Presupuesto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
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
/****** Object:  StoredProcedure [dbo].[sp_consulta_FaltanteProductos]    Script Date: 15/11/2020 21:03:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_consulta_FaltanteProductos]
AS
BEGIN
select
 (select count(*) from Aurorita_Access.dbo.productos where productos.NivelNuevoPedido > productos.UnidadEnExistencia) cantDebajo,
 (select count(*) from Aurorita_Access.dbo.productos) total ,
 (select convert(decimal, count(*)) a from Aurorita_Access.dbo.productos where productos.NivelNuevoPedido > productos.UnidadEnExistencia) / (select convert(decimal, count(*)) h from Aurorita_Access.dbo.productos) * 100 porcen
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
         Begin Table = "vta"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 320
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pers"
            Begin Extent = 
               Top = 207
               Left = 57
               Bottom = 404
               Right = 308
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ubic"
            Begin Extent = 
               Top = 405
               Left = 57
               Bottom = 575
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cp"
            Begin Extent = 
               Top = 576
               Left = 57
               Bottom = 746
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "city"
            Begin Extent = 
               Top = 747
               Left = 57
               Bottom = 944
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pais"
            Begin Extent = 
               Top = 945
               Left = 57
               Bottom = 1088
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "prod"
            Begin Extent = 
               Top = 1287
               Left = 57
               Bottom = 1484
               Right = 310
            End
            DisplayFlags = 280
            TopColumn ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'llegadaDestinoProd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 0
         End
         Begin Table = "prodVta"
            Begin Extent = 
               Top = 9
               Left = 377
               Bottom = 206
               Right = 599
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "proved"
            Begin Extent = 
               Top = 9
               Left = 656
               Bottom = 206
               Right = 907
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'llegadaDestinoProd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'llegadaDestinoProd'
GO
