USE [CLASE09_EXPLICACION01]
GO
/****** Object:  Table [dbo].[tiposcuenta]    Script Date: 05/23/2012 19:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tiposcuenta](
	[idtipocuenta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tiposcuenta] PRIMARY KEY CLUSTERED 
(
	[idtipocuenta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tiposcuenta] ON
INSERT [dbo].[tiposcuenta] ([idtipocuenta], [descripcion]) VALUES (1, N'Caja de ahorro')
INSERT [dbo].[tiposcuenta] ([idtipocuenta], [descripcion]) VALUES (2, N'Cuenta corriente')
SET IDENTITY_INSERT [dbo].[tiposcuenta] OFF
/****** Object:  Table [dbo].[provincias]    Script Date: 05/23/2012 19:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[provincias](
	[idprovincia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_provincias] PRIMARY KEY CLUSTERED 
(
	[idprovincia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[provincias] ON
INSERT [dbo].[provincias] ([idprovincia], [nombre]) VALUES (1, N'Buenos Aires')
INSERT [dbo].[provincias] ([idprovincia], [nombre]) VALUES (2, N'Córdoba')
SET IDENTITY_INSERT [dbo].[provincias] OFF
/****** Object:  Table [dbo].[ciudades]    Script Date: 05/23/2012 19:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ciudades](
	[codpostal] [int] IDENTITY(1,1) NOT NULL,
	[idprovincia] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ciudades] PRIMARY KEY CLUSTERED 
(
	[codpostal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ciudades] ON
INSERT [dbo].[ciudades] ([codpostal], [idprovincia], [nombre]) VALUES (1, 1, N'Buenos Aires')
INSERT [dbo].[ciudades] ([codpostal], [idprovincia], [nombre]) VALUES (2, 1, N'Tigre')
INSERT [dbo].[ciudades] ([codpostal], [idprovincia], [nombre]) VALUES (4, 1, N'Vicente López')
INSERT [dbo].[ciudades] ([codpostal], [idprovincia], [nombre]) VALUES (5, 2, N'Córdoba')
SET IDENTITY_INSERT [dbo].[ciudades] OFF
/****** Object:  Table [dbo].[sucursales]    Script Date: 05/23/2012 19:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sucursales](
	[idsucursal] [int] IDENTITY(1,1) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[codpostal] [int] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_sucursales] PRIMARY KEY CLUSTERED 
(
	[idsucursal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[sucursales] ON
INSERT [dbo].[sucursales] ([idsucursal], [direccion], [codpostal], [estado]) VALUES (1, N'Mitre 1200', 1, 1)
INSERT [dbo].[sucursales] ([idsucursal], [direccion], [codpostal], [estado]) VALUES (2, N'San Martín 233', 4, 1)
SET IDENTITY_INSERT [dbo].[sucursales] OFF
/****** Object:  Table [dbo].[clientes]    Script Date: 05/23/2012 19:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clientes](
	[idcliente] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[sexo] [char](1) NULL,
	[idsucursal] [int] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[clientes] ON
INSERT [dbo].[clientes] ([idcliente], [nombre], [apellido], [sexo], [idsucursal], [estado]) VALUES (1, N'Pedro', N'Fernández', N'M', 1, 1)
INSERT [dbo].[clientes] ([idcliente], [nombre], [apellido], [sexo], [idsucursal], [estado]) VALUES (2, N'Marina', N'González', N'F', 2, 1)
SET IDENTITY_INSERT [dbo].[clientes] OFF
/****** Object:  Table [dbo].[cuentas]    Script Date: 05/23/2012 19:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuentas](
	[nrocuenta] [nvarchar](20) NOT NULL,
	[idcliente] [bigint] NOT NULL,
	[idtipocuenta] [int] NOT NULL,
	[saldo] [decimal](10, 2) NOT NULL,
	[limite_descubierto] [decimal](10, 2) NOT NULL,
	[fecha_alta] [datetime] NULL,
	[fecha_baja] [datetime] NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_cuentas_1] PRIMARY KEY CLUSTERED 
(
	[nrocuenta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cuentas] ([nrocuenta], [idcliente], [idtipocuenta], [saldo], [limite_descubierto], [fecha_alta], [fecha_baja], [estado]) VALUES (N'1', 1, 1, CAST(400.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), '1/1/2001', NULL, 1)
INSERT [dbo].[cuentas] ([nrocuenta], [idcliente], [idtipocuenta], [saldo], [limite_descubierto], [fecha_alta], [fecha_baja], [estado]) VALUES (N'2', 2, 2, CAST(300.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), '1/1/2009', NULL, 1)
/****** Object:  Table [dbo].[tarjetas]    Script Date: 05/23/2012 19:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tarjetas](
	[idtarjeta] [bigint] IDENTITY(1,1) NOT NULL,
	[nrotarjeta] [nvarchar](16) NOT NULL,
	[idcliente] [bigint] NOT NULL,
	[tipotarjeta] [char](1) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tarjetas] PRIMARY KEY CLUSTERED 
(
	[idtarjeta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transferencias]    Script Date: 05/23/2012 19:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transferencias](
	[idtransferencia] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[idcuentaorigen] [nvarchar](20) NOT NULL,
	[idcuentadestino] [nvarchar](20) NOT NULL,
	[importe] [decimal](10, 2) NOT NULL,
	[referencia] [nvarchar](40) NULL,
	[beneficiario] [nvarchar](40) NULL,
 CONSTRAINT [PK_transferencias] PRIMARY KEY CLUSTERED 
(
	[idtransferencia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movimientos]    Script Date: 05/23/2012 19:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[movimientos](
	[idmovimiento] [bigint] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[nrocuenta] [nvarchar](20) NOT NULL,
	[tipomovimiento] [char](1) NOT NULL,
	[descripcion] [nvarchar](50) NULL,
	[importe] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_movimientos] PRIMARY KEY CLUSTERED 
(
	[idmovimiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_cuentas_limite_descubierto]    Script Date: 05/23/2012 19:38:32 ******/
ALTER TABLE [dbo].[cuentas] ADD  CONSTRAINT [DF_cuentas_limite_descubierto]  DEFAULT ((0)) FOR [limite_descubierto]
GO
/****** Object:  ForeignKey [FK_ciudades_provincias]    Script Date: 05/23/2012 19:38:32 ******/
ALTER TABLE [dbo].[ciudades]  WITH CHECK ADD  CONSTRAINT [FK_ciudades_provincias] FOREIGN KEY([idprovincia])
REFERENCES [dbo].[provincias] ([idprovincia])
GO
ALTER TABLE [dbo].[ciudades] CHECK CONSTRAINT [FK_ciudades_provincias]
GO
/****** Object:  ForeignKey [FK_clientes_sucursales]    Script Date: 05/23/2012 19:38:32 ******/
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [FK_clientes_sucursales] FOREIGN KEY([idsucursal])
REFERENCES [dbo].[sucursales] ([idsucursal])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [FK_clientes_sucursales]
GO
/****** Object:  ForeignKey [FK_cuentas_clientes]    Script Date: 05/23/2012 19:38:32 ******/
ALTER TABLE [dbo].[cuentas]  WITH CHECK ADD  CONSTRAINT [FK_cuentas_clientes] FOREIGN KEY([idcliente])
REFERENCES [dbo].[clientes] ([idcliente])
GO
ALTER TABLE [dbo].[cuentas] CHECK CONSTRAINT [FK_cuentas_clientes]
GO
/****** Object:  ForeignKey [FK_cuentas_tiposcuenta]    Script Date: 05/23/2012 19:38:32 ******/
ALTER TABLE [dbo].[cuentas]  WITH CHECK ADD  CONSTRAINT [FK_cuentas_tiposcuenta] FOREIGN KEY([idtipocuenta])
REFERENCES [dbo].[tiposcuenta] ([idtipocuenta])
GO
ALTER TABLE [dbo].[cuentas] CHECK CONSTRAINT [FK_cuentas_tiposcuenta]
GO
/****** Object:  ForeignKey [FK_movimientos_cuentas]    Script Date: 05/23/2012 19:38:32 ******/
ALTER TABLE [dbo].[movimientos]  WITH CHECK ADD  CONSTRAINT [FK_movimientos_cuentas] FOREIGN KEY([nrocuenta])
REFERENCES [dbo].[cuentas] ([nrocuenta])
GO
ALTER TABLE [dbo].[movimientos] CHECK CONSTRAINT [FK_movimientos_cuentas]
GO
/****** Object:  ForeignKey [FK_sucursales_ciudades]    Script Date: 05/23/2012 19:38:32 ******/
ALTER TABLE [dbo].[sucursales]  WITH CHECK ADD  CONSTRAINT [FK_sucursales_ciudades] FOREIGN KEY([codpostal])
REFERENCES [dbo].[ciudades] ([codpostal])
GO
ALTER TABLE [dbo].[sucursales] CHECK CONSTRAINT [FK_sucursales_ciudades]
GO
/****** Object:  ForeignKey [FK_tarjetas_clientes]    Script Date: 05/23/2012 19:38:32 ******/
ALTER TABLE [dbo].[tarjetas]  WITH CHECK ADD  CONSTRAINT [FK_tarjetas_clientes] FOREIGN KEY([idcliente])
REFERENCES [dbo].[clientes] ([idcliente])
GO
ALTER TABLE [dbo].[tarjetas] CHECK CONSTRAINT [FK_tarjetas_clientes]
GO
/****** Object:  ForeignKey [FK_transferencias_cuentas]    Script Date: 05/23/2012 19:38:32 ******/
ALTER TABLE [dbo].[transferencias]  WITH CHECK ADD  CONSTRAINT [FK_transferencias_cuentas] FOREIGN KEY([idcuentaorigen])
REFERENCES [dbo].[cuentas] ([nrocuenta])
GO
ALTER TABLE [dbo].[transferencias] CHECK CONSTRAINT [FK_transferencias_cuentas]
GO
/****** Object:  ForeignKey [FK_transferencias_cuentas1]    Script Date: 05/23/2012 19:38:32 ******/
ALTER TABLE [dbo].[transferencias]  WITH CHECK ADD  CONSTRAINT [FK_transferencias_cuentas1] FOREIGN KEY([idcuentadestino])
REFERENCES [dbo].[cuentas] ([nrocuenta])
GO
ALTER TABLE [dbo].[transferencias] CHECK CONSTRAINT [FK_transferencias_cuentas1]
GO
