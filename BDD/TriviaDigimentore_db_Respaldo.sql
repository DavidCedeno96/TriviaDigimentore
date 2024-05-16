USE [TriviaDigimentore_db]
GO
/****** Object:  Table [dbo].[Complemento]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complemento](
	[idCom] [int] IDENTITY(1,1) NOT NULL,
	[idSala] [int] NOT NULL,
	[viendoIzquierda] [varchar](50) NULL,
	[viendoDerecha] [varchar](50) NULL,
	[color1] [varchar](20) NULL,
	[color2] [varchar](20) NULL,
	[plataforma1] [varchar](50) NULL,
	[plataforma2] [varchar](50) NULL,
	[plataforma3] [varchar](50) NULL,
	[plataforma4] [varchar](50) NULL,
	[decoracion1] [varchar](50) NULL,
	[decoracion2] [varchar](50) NULL,
	[decoracion3] [varchar](50) NULL,
	[decoracion4] [varchar](50) NULL,
	[objetoCielo1] [varchar](50) NULL,
	[objetoCielo2] [varchar](50) NULL,
	[objetoFondo1] [varchar](50) NULL,
	[objetoFondo2] [varchar](50) NULL,
	[objetoFondo3] [varchar](50) NULL,
	[objetoFondo4] [varchar](50) NULL,
	[objetoFondoMovil] [varchar](50) NULL,
	[objetoFinal] [varchar](50) NULL,
	[sonido] [varchar](50) NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[isDecoration] [int] NULL,
	[isSkyObjects] [int] NULL,
	[isBackgroundObjects] [int] NULL,
	[isFinalObject] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModoJuego]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModoJuego](
	[idModoJuego] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](15) NOT NULL,
	[imagen] [varchar](50) NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idModoJuego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opcion]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opcion](
	[idOpcion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[correcta] [int] NOT NULL,
	[idPregunta] [int] NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idOpcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[idSala] [int] NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pruebas]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pruebas](
	[id] [int] NULL,
	[texto] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sala]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sala](
	[idSala] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[imagen] [varchar](50) NULL,
	[descripcion] [varchar](200) NULL,
	[idModoJuego] [int] NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[fecha_activacion] [datetime] NULL,
	[fechaCierre] [datetime] NOT NULL,
	[fechaCierreLondon] [datetime] NOT NULL,
	[tiempoXpreg] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaJuego]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaJuego](
	[idSala] [int] NULL,
	[idJugador] [int] NULL,
	[iniciales] [varchar](5) NULL,
	[posicion] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[estadoJuego] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaReciente]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaReciente](
	[idSala] [int] NULL,
	[idJugador] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[apellido] [varchar](15) NULL,
	[correo] [varchar](60) NULL,
	[clave] [varchar](20) NULL,
	[foto] [varchar](50) NULL,
	[idRol] [int] NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[celular] [varchar](10) NULL,
	[empresa] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Sala]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Sala](
	[idUsuario] [int] NOT NULL,
	[idSala] [int] NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[puntaje] [int] NULL,
	[tiempo] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Complemento] ON 
GO
INSERT [dbo].[Complemento] ([idCom], [idSala], [viendoIzquierda], [viendoDerecha], [color1], [color2], [plataforma1], [plataforma2], [plataforma3], [plataforma4], [decoracion1], [decoracion2], [decoracion3], [decoracion4], [objetoCielo1], [objetoCielo2], [objetoFondo1], [objetoFondo2], [objetoFondo3], [objetoFondo4], [objetoFondoMovil], [objetoFinal], [sonido], [fecha_creacion], [fecha_modificacion], [isDecoration], [isSkyObjects], [isBackgroundObjects], [isFinalObject]) VALUES (1, 1, NULL, NULL, N'#a63f3f', N'#1cc44f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-01-22T13:02:07.837' AS DateTime), CAST(N'2024-01-22T15:40:43.900' AS DateTime), 0, 0, 0, 0)
GO
INSERT [dbo].[Complemento] ([idCom], [idSala], [viendoIzquierda], [viendoDerecha], [color1], [color2], [plataforma1], [plataforma2], [plataforma3], [plataforma4], [decoracion1], [decoracion2], [decoracion3], [decoracion4], [objetoCielo1], [objetoCielo2], [objetoFondo1], [objetoFondo2], [objetoFondo3], [objetoFondo4], [objetoFondoMovil], [objetoFinal], [sonido], [fecha_creacion], [fecha_modificacion], [isDecoration], [isSkyObjects], [isBackgroundObjects], [isFinalObject]) VALUES (2, 2, NULL, NULL, N'#0055ff', N'#050047', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-01-22T13:02:07.837' AS DateTime), CAST(N'2024-02-05T17:35:16.783' AS DateTime), 1, 1, 1, 1)
GO
INSERT [dbo].[Complemento] ([idCom], [idSala], [viendoIzquierda], [viendoDerecha], [color1], [color2], [plataforma1], [plataforma2], [plataforma3], [plataforma4], [decoracion1], [decoracion2], [decoracion3], [decoracion4], [objetoCielo1], [objetoCielo2], [objetoFondo1], [objetoFondo2], [objetoFondo3], [objetoFondo4], [objetoFondoMovil], [objetoFinal], [sonido], [fecha_creacion], [fecha_modificacion], [isDecoration], [isSkyObjects], [isBackgroundObjects], [isFinalObject]) VALUES (3, 3, NULL, NULL, N'#00cbe6', N'#0941ec', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-01-22T13:02:07.837' AS DateTime), CAST(N'2024-01-22T15:38:12.243' AS DateTime), 0, 0, 0, 0)
GO
INSERT [dbo].[Complemento] ([idCom], [idSala], [viendoIzquierda], [viendoDerecha], [color1], [color2], [plataforma1], [plataforma2], [plataforma3], [plataforma4], [decoracion1], [decoracion2], [decoracion3], [decoracion4], [objetoCielo1], [objetoCielo2], [objetoFondo1], [objetoFondo2], [objetoFondo3], [objetoFondo4], [objetoFondoMovil], [objetoFinal], [sonido], [fecha_creacion], [fecha_modificacion], [isDecoration], [isSkyObjects], [isBackgroundObjects], [isFinalObject]) VALUES (4, 4, NULL, NULL, N'#c7d237', N'#8383b9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-01-22T14:20:58.083' AS DateTime), CAST(N'2024-05-16T16:03:17.820' AS DateTime), 0, 0, 0, 0)
GO
INSERT [dbo].[Complemento] ([idCom], [idSala], [viendoIzquierda], [viendoDerecha], [color1], [color2], [plataforma1], [plataforma2], [plataforma3], [plataforma4], [decoracion1], [decoracion2], [decoracion3], [decoracion4], [objetoCielo1], [objetoCielo2], [objetoFondo1], [objetoFondo2], [objetoFondo3], [objetoFondo4], [objetoFondoMovil], [objetoFinal], [sonido], [fecha_creacion], [fecha_modificacion], [isDecoration], [isSkyObjects], [isBackgroundObjects], [isFinalObject]) VALUES (9, 9, N'viendoIzq_Sal Bosque.png', N'viendoDer_Sal Bosque.png', N'#00d9ff', N'#00b3ff', N'plat1_Sal Bosque.png', N'plat2_Sal Bosque.png', N'plat3_Sal Bosque.png', N'plat4_Sal Bosque.png', NULL, NULL, NULL, NULL, NULL, NULL, N'objFon1_Sal Bosque.png', N'objFon2_Sal Bosque.png', N'objFon3_Sal Bosque.png', N'objFon4_Sal Bosque.png', N'objFonMov_Sal Bosque.png', N'objFinal_Sal Bosque.png', NULL, CAST(N'2024-01-22T15:47:43.273' AS DateTime), CAST(N'2024-01-23T10:25:28.643' AS DateTime), 0, 0, 0, 0)
GO
INSERT [dbo].[Complemento] ([idCom], [idSala], [viendoIzquierda], [viendoDerecha], [color1], [color2], [plataforma1], [plataforma2], [plataforma3], [plataforma4], [decoracion1], [decoracion2], [decoracion3], [decoracion4], [objetoCielo1], [objetoCielo2], [objetoFondo1], [objetoFondo2], [objetoFondo3], [objetoFondo4], [objetoFondoMovil], [objetoFinal], [sonido], [fecha_creacion], [fecha_modificacion], [isDecoration], [isSkyObjects], [isBackgroundObjects], [isFinalObject]) VALUES (10, 10, NULL, NULL, N'#3671D1', N'#00002A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-01-31T11:17:52.300' AS DateTime), CAST(N'2024-01-31T11:17:52.300' AS DateTime), 1, 1, 1, 1)
GO
INSERT [dbo].[Complemento] ([idCom], [idSala], [viendoIzquierda], [viendoDerecha], [color1], [color2], [plataforma1], [plataforma2], [plataforma3], [plataforma4], [decoracion1], [decoracion2], [decoracion3], [decoracion4], [objetoCielo1], [objetoCielo2], [objetoFondo1], [objetoFondo2], [objetoFondo3], [objetoFondo4], [objetoFondoMovil], [objetoFinal], [sonido], [fecha_creacion], [fecha_modificacion], [isDecoration], [isSkyObjects], [isBackgroundObjects], [isFinalObject]) VALUES (11, 11, NULL, NULL, N'#3671D1', N'#00002A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-04-26T09:03:32.443' AS DateTime), CAST(N'2024-05-13T11:54:42.343' AS DateTime), 1, 1, 1, 1)
GO
INSERT [dbo].[Complemento] ([idCom], [idSala], [viendoIzquierda], [viendoDerecha], [color1], [color2], [plataforma1], [plataforma2], [plataforma3], [plataforma4], [decoracion1], [decoracion2], [decoracion3], [decoracion4], [objetoCielo1], [objetoCielo2], [objetoFondo1], [objetoFondo2], [objetoFondo3], [objetoFondo4], [objetoFondoMovil], [objetoFinal], [sonido], [fecha_creacion], [fecha_modificacion], [isDecoration], [isSkyObjects], [isBackgroundObjects], [isFinalObject]) VALUES (12, 12, NULL, NULL, N'#3671D1', N'#00002A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2024-04-26T12:56:20.013' AS DateTime), CAST(N'2024-05-16T17:02:09.953' AS DateTime), 1, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Complemento] OFF
GO
SET IDENTITY_INSERT [dbo].[ModoJuego] ON 
GO
INSERT [dbo].[ModoJuego] ([idModoJuego], [nombre], [imagen], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'Challenger', N'img1.jpg', 1, CAST(N'2024-01-08T14:32:47.390' AS DateTime), CAST(N'2024-01-08T14:32:47.390' AS DateTime))
GO
INSERT [dbo].[ModoJuego] ([idModoJuego], [nombre], [imagen], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (2, N'Supervivencia', N'img2.jpg', 1, CAST(N'2024-01-08T14:32:47.390' AS DateTime), CAST(N'2024-01-08T14:32:47.390' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ModoJuego] OFF
GO
SET IDENTITY_INSERT [dbo].[Opcion] ON 
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'Antigua', 0, 1, 1, CAST(N'2024-01-12T15:01:38.137' AS DateTime), CAST(N'2024-01-15T12:30:25.703' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (2, N'Quetzaltenango', 0, 1, 1, CAST(N'2024-01-12T15:01:38.137' AS DateTime), CAST(N'2024-01-15T12:30:25.703' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (3, N'Ciudad de Guatemala', 1, 1, 1, CAST(N'2024-01-12T15:01:38.137' AS DateTime), CAST(N'2024-01-15T12:30:25.703' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (5, N'Peso guatemalteco', 0, 2, 1, CAST(N'2024-01-12T15:01:38.140' AS DateTime), CAST(N'2024-01-15T12:30:19.023' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (6, N'Quetzal', 1, 2, 1, CAST(N'2024-01-12T15:01:38.140' AS DateTime), CAST(N'2024-01-15T12:30:19.023' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (7, N'Lempira', 0, 2, 1, CAST(N'2024-01-12T15:01:38.140' AS DateTime), CAST(N'2024-01-15T12:30:19.023' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (9, N'Volcán Tacaná', 0, 3, 1, CAST(N'2024-01-12T15:01:38.143' AS DateTime), CAST(N'2024-01-15T12:30:15.137' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (10, N'Volcán Tajumulco', 1, 3, 1, CAST(N'2024-01-12T15:01:38.143' AS DateTime), CAST(N'2024-01-15T12:30:15.137' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (11, N'Volcán de Fuego', 0, 3, 1, CAST(N'2024-01-12T15:01:38.143' AS DateTime), CAST(N'2024-01-15T12:30:15.137' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (13, N'Tamales', 1, 4, 1, CAST(N'2024-01-12T15:01:38.143' AS DateTime), CAST(N'2024-01-15T12:30:09.527' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (14, N'Enchiladas', 0, 4, 1, CAST(N'2024-01-12T15:01:38.143' AS DateTime), CAST(N'2024-01-15T12:30:09.530' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (15, N'Pupusas', 0, 4, 1, CAST(N'2024-01-12T15:01:38.143' AS DateTime), CAST(N'2024-01-15T12:30:09.530' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (17, N'Tikal', 1, 5, 1, CAST(N'2024-01-12T15:01:38.147' AS DateTime), CAST(N'2024-01-15T12:30:03.153' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (18, N'Copán', 0, 5, 1, CAST(N'2024-01-12T15:01:38.147' AS DateTime), CAST(N'2024-01-15T12:30:03.153' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (19, N'El Mirador', 0, 5, 1, CAST(N'2024-01-12T15:01:38.147' AS DateTime), CAST(N'2024-01-15T12:30:03.153' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (21, N'Antigua', 0, 6, 1, CAST(N'2024-01-15T12:31:09.193' AS DateTime), CAST(N'2024-01-15T12:32:58.763' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (22, N'Quetzaltenango', 0, 6, 1, CAST(N'2024-01-15T12:31:09.197' AS DateTime), CAST(N'2024-01-15T12:32:58.763' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (23, N'Ciudad de Guatemala', 1, 6, 1, CAST(N'2024-01-15T12:31:09.197' AS DateTime), CAST(N'2024-01-15T12:32:58.763' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (25, N'Peso guatemalteco', 0, 7, 1, CAST(N'2024-01-15T12:31:09.197' AS DateTime), CAST(N'2024-01-15T12:32:55.937' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (26, N'Quetzal', 1, 7, 1, CAST(N'2024-01-15T12:31:09.197' AS DateTime), CAST(N'2024-01-15T12:32:55.937' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (27, N'Lempira', 0, 7, 1, CAST(N'2024-01-15T12:31:09.197' AS DateTime), CAST(N'2024-01-15T12:32:55.937' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (29, N'Volcán Tacana', 0, 8, 1, CAST(N'2024-01-15T12:31:09.200' AS DateTime), CAST(N'2024-01-18T15:41:53.913' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (30, N'Volcán Tajumulco', 1, 8, 1, CAST(N'2024-01-15T12:31:09.200' AS DateTime), CAST(N'2024-01-18T15:41:53.913' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (31, N'Volcán de Fuego', 0, 8, 1, CAST(N'2024-01-15T12:31:09.200' AS DateTime), CAST(N'2024-01-18T15:41:53.913' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (33, N'Tamales', 1, 9, 1, CAST(N'2024-01-15T12:31:09.200' AS DateTime), CAST(N'2024-01-15T12:32:51.333' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (34, N'Enchiladas', 0, 9, 1, CAST(N'2024-01-15T12:31:09.200' AS DateTime), CAST(N'2024-01-15T12:32:51.333' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (35, N'Pupusas', 0, 9, 1, CAST(N'2024-01-15T12:31:09.200' AS DateTime), CAST(N'2024-01-15T12:32:51.337' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (37, N'Tikal', 1, 10, 1, CAST(N'2024-01-15T12:31:09.200' AS DateTime), CAST(N'2024-01-15T12:32:48.720' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (38, N'Copán', 0, 10, 1, CAST(N'2024-01-15T12:31:09.200' AS DateTime), CAST(N'2024-01-15T12:32:48.723' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (39, N'El Mirador', 0, 10, 1, CAST(N'2024-01-15T12:31:09.200' AS DateTime), CAST(N'2024-01-15T12:32:48.723' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (64, N'Antigua', 0, 17, 1, CAST(N'2024-01-22T15:49:36.967' AS DateTime), CAST(N'2024-01-22T15:49:36.967' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (65, N'Quetzaltenango', 0, 17, 1, CAST(N'2024-01-22T15:49:36.967' AS DateTime), CAST(N'2024-01-22T15:49:36.967' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (66, N'Ciudad de Guatemala', 1, 17, 1, CAST(N'2024-01-22T15:49:36.967' AS DateTime), CAST(N'2024-01-22T15:49:36.967' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (68, N'Peso guatemalteco', 0, 18, 1, CAST(N'2024-01-22T15:49:36.970' AS DateTime), CAST(N'2024-01-22T15:49:36.970' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (69, N'Quetzal', 1, 18, 1, CAST(N'2024-01-22T15:49:36.970' AS DateTime), CAST(N'2024-01-22T15:49:36.970' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (70, N'Lempira', 0, 18, 1, CAST(N'2024-01-22T15:49:36.970' AS DateTime), CAST(N'2024-01-22T15:49:36.970' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (72, N'Volcán Santa María', 0, 19, 1, CAST(N'2024-01-22T15:49:36.970' AS DateTime), CAST(N'2024-01-23T10:47:57.383' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (73, N'Volcán Tajumulco', 1, 19, 1, CAST(N'2024-01-22T15:49:36.970' AS DateTime), CAST(N'2024-01-23T10:47:57.383' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (74, N'Volcán de Fuego', 0, 19, 1, CAST(N'2024-01-22T15:49:36.970' AS DateTime), CAST(N'2024-01-23T10:47:57.383' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (76, N'Tamales', 1, 20, 1, CAST(N'2024-01-22T15:49:36.973' AS DateTime), CAST(N'2024-01-22T15:49:36.973' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (77, N'Enchiladas', 0, 20, 1, CAST(N'2024-01-22T15:49:36.973' AS DateTime), CAST(N'2024-01-22T15:49:36.973' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (78, N'Pupusas', 0, 20, 1, CAST(N'2024-01-22T15:49:36.973' AS DateTime), CAST(N'2024-01-22T15:49:36.973' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (80, N'Tikal', 1, 21, 1, CAST(N'2024-01-22T15:49:36.973' AS DateTime), CAST(N'2024-01-22T15:49:36.973' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (81, N'Copán', 0, 21, 1, CAST(N'2024-01-22T15:49:36.973' AS DateTime), CAST(N'2024-01-22T15:49:36.973' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (82, N'El Mirador', 0, 21, 1, CAST(N'2024-01-22T15:49:36.973' AS DateTime), CAST(N'2024-01-22T15:49:36.973' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (84, N'Opcion1', 0, 22, 1, CAST(N'2024-01-31T11:19:16.443' AS DateTime), CAST(N'2024-01-31T11:19:16.443' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (85, N'Opcion2', 0, 22, 1, CAST(N'2024-01-31T11:19:16.447' AS DateTime), CAST(N'2024-01-31T11:19:16.447' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (86, N'Opcion3', 1, 22, 1, CAST(N'2024-01-31T11:19:16.447' AS DateTime), CAST(N'2024-01-31T11:19:16.447' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (87, N'Opcion4', 0, 22, 1, CAST(N'2024-01-31T11:19:16.447' AS DateTime), CAST(N'2024-01-31T11:19:16.447' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (88, N'Ejemplo Opcion 1', 0, 23, 1, CAST(N'2024-01-31T11:23:23.857' AS DateTime), CAST(N'2024-01-31T11:23:23.857' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (89, N'Ejemplo Opcion 2', 1, 23, 1, CAST(N'2024-01-31T11:23:23.860' AS DateTime), CAST(N'2024-01-31T11:23:23.860' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (92, N'Ejemplo Opcion 2', 1, 24, 1, CAST(N'2024-01-31T11:23:23.860' AS DateTime), CAST(N'2024-01-31T11:23:23.860' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (93, N'Ejemplo Opcion 3', 0, 24, 1, CAST(N'2024-01-31T11:23:23.860' AS DateTime), CAST(N'2024-01-31T11:23:23.860' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (96, N'Ejemplo Opcion 1', 0, 25, 1, CAST(N'2024-01-31T11:23:23.863' AS DateTime), CAST(N'2024-01-31T11:23:23.863' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (97, N'Ejemplo Opcion 4', 1, 25, 1, CAST(N'2024-01-31T11:23:23.863' AS DateTime), CAST(N'2024-01-31T11:23:23.863' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (100, N'Ejemplo Opcion 2', 1, 26, 1, CAST(N'2024-01-31T11:23:23.863' AS DateTime), CAST(N'2024-01-31T11:23:23.863' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (101, N'Ejemplo Opcion 5', 0, 26, 1, CAST(N'2024-01-31T11:23:23.863' AS DateTime), CAST(N'2024-01-31T11:23:23.863' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (104, N'Ejemplo Opcion 2', 1, 27, 1, CAST(N'2024-01-31T11:23:23.867' AS DateTime), CAST(N'2024-01-31T11:23:23.867' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (105, N'Ejemplo Opcion 6', 0, 27, 1, CAST(N'2024-01-31T11:23:23.867' AS DateTime), CAST(N'2024-01-31T11:23:23.867' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (108, N'a) Exceso de interacción social', 0, 28, 1, CAST(N'2024-05-06T10:13:59.873' AS DateTime), CAST(N'2024-05-06T10:13:59.873' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (109, N'b) Dependencia de recursos tecnológicos avanzados', 0, 28, 1, CAST(N'2024-05-06T10:13:59.877' AS DateTime), CAST(N'2024-05-06T10:13:59.877' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (110, N'c) Preferencia por métodos de enseñanza tradicionales', 1, 28, 1, CAST(N'2024-05-06T10:13:59.877' AS DateTime), CAST(N'2024-05-06T10:13:59.877' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (112, N'a) Conductismo', 0, 29, 1, CAST(N'2024-05-06T10:13:59.877' AS DateTime), CAST(N'2024-05-06T10:13:59.877' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (113, N'b) Cognitivismo', 0, 29, 1, CAST(N'2024-05-06T10:13:59.880' AS DateTime), CAST(N'2024-05-06T10:13:59.880' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (114, N'c) Sociocultural de Vygotsky', 1, 29, 1, CAST(N'2024-05-06T10:13:59.880' AS DateTime), CAST(N'2024-05-06T10:13:59.880' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (116, N'a) Blockchain', 0, 30, 1, CAST(N'2024-05-06T10:13:59.880' AS DateTime), CAST(N'2024-05-06T10:13:59.880' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (117, N'b) Realidad Virtual', 1, 30, 1, CAST(N'2024-05-06T10:13:59.880' AS DateTime), CAST(N'2024-05-06T10:13:59.880' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (118, N'c) Bases de datos distribuidas', 0, 30, 1, CAST(N'2024-05-06T10:13:59.880' AS DateTime), CAST(N'2024-05-06T10:13:59.880' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (120, N'b) Constructivismo', 0, 31, 1, CAST(N'2024-05-06T10:13:59.880' AS DateTime), CAST(N'2024-05-06T10:13:59.880' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (121, N'c) Aprendizaje basado en la memoria', 0, 31, 1, CAST(N'2024-05-06T10:13:59.883' AS DateTime), CAST(N'2024-05-06T10:13:59.883' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (123, N'a) TCP/IP', 0, 32, 1, CAST(N'2024-05-06T10:13:59.883' AS DateTime), CAST(N'2024-05-06T10:13:59.883' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (124, N'b) SCORM', 1, 32, 1, CAST(N'2024-05-06T10:13:59.883' AS DateTime), CAST(N'2024-05-06T10:13:59.883' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (125, N'c) HTML5', 0, 32, 1, CAST(N'2024-05-06T10:13:59.883' AS DateTime), CAST(N'2024-05-06T10:13:59.883' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (127, N'a) 2005', 0, 33, 1, CAST(N'2024-05-06T10:13:59.887' AS DateTime), CAST(N'2024-05-06T10:13:59.887' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (128, N'b) 2012', 1, 33, 1, CAST(N'2024-05-06T10:13:59.887' AS DateTime), CAST(N'2024-05-06T10:13:59.887' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (129, N'c) 2015', 0, 33, 1, CAST(N'2024-05-06T10:13:59.887' AS DateTime), CAST(N'2024-05-06T10:13:59.887' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (131, N'a) Aprendizaje basado en proyectos', 0, 34, 1, CAST(N'2024-05-06T10:13:59.887' AS DateTime), CAST(N'2024-05-06T10:13:59.887' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (132, N'b) Microaprendizaje', 1, 34, 1, CAST(N'2024-05-06T10:13:59.887' AS DateTime), CAST(N'2024-05-06T10:13:59.887' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (133, N'c) Aprendizaje cooperativo', 0, 34, 1, CAST(N'2024-05-06T10:13:59.887' AS DateTime), CAST(N'2024-05-06T10:13:59.887' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (135, N'a) Impresión 3D', 0, 35, 1, CAST(N'2024-05-06T10:13:59.890' AS DateTime), CAST(N'2024-05-06T10:13:59.890' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (136, N'b) Realidad aumentada', 0, 35, 1, CAST(N'2024-05-06T10:13:59.890' AS DateTime), CAST(N'2024-05-06T10:13:59.890' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (137, N'c) Inteligencia Artificial', 1, 35, 1, CAST(N'2024-05-06T10:13:59.890' AS DateTime), CAST(N'2024-05-06T10:13:59.890' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (139, N'a) Costo más alto', 0, 36, 1, CAST(N'2024-05-06T10:13:59.890' AS DateTime), CAST(N'2024-05-06T10:13:59.890' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (140, N'b) Flexibilidad de horarios', 1, 36, 1, CAST(N'2024-05-06T10:13:59.890' AS DateTime), CAST(N'2024-05-06T10:13:59.890' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (141, N'c) Necesidad de infraestructura física', 0, 36, 1, CAST(N'2024-05-06T10:13:59.890' AS DateTime), CAST(N'2024-05-06T10:13:59.890' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (143, N'a) Exceso de interacción social', 0, 37, 1, CAST(N'2024-05-16T15:52:56.740' AS DateTime), CAST(N'2024-05-16T15:52:56.740' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (144, N'b) Dependencia de recursos tecnológicos avanzados', 0, 37, 1, CAST(N'2024-05-16T15:52:56.740' AS DateTime), CAST(N'2024-05-16T15:52:56.740' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (145, N'c) Preferencia por métodos de enseñanza tradicionales', 1, 37, 1, CAST(N'2024-05-16T15:52:56.740' AS DateTime), CAST(N'2024-05-16T15:52:56.740' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (147, N'a) Conductismo', 0, 38, 1, CAST(N'2024-05-16T15:52:56.743' AS DateTime), CAST(N'2024-05-16T15:52:56.743' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (148, N'b) Cognitivismo', 0, 38, 1, CAST(N'2024-05-16T15:52:56.743' AS DateTime), CAST(N'2024-05-16T15:52:56.743' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (149, N'c) Sociocultural de Vygotsky', 1, 38, 1, CAST(N'2024-05-16T15:52:56.743' AS DateTime), CAST(N'2024-05-16T15:52:56.743' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (151, N'a) Blockchain', 0, 39, 1, CAST(N'2024-05-16T15:52:56.743' AS DateTime), CAST(N'2024-05-16T15:52:56.743' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (152, N'b) Realidad Virtual', 1, 39, 1, CAST(N'2024-05-16T15:52:56.743' AS DateTime), CAST(N'2024-05-16T15:52:56.743' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (153, N'c) Bases de datos distribuidas', 0, 39, 1, CAST(N'2024-05-16T15:52:56.743' AS DateTime), CAST(N'2024-05-16T15:52:56.743' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (155, N'a) Blockchain', 0, 40, 1, CAST(N'2024-05-16T15:52:56.747' AS DateTime), CAST(N'2024-05-16T15:52:56.747' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (156, N'b) Constructivismo', 1, 40, 1, CAST(N'2024-05-16T15:52:56.747' AS DateTime), CAST(N'2024-05-16T15:52:56.747' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (157, N'c) Aprendizaje basado en la memoria', 0, 40, 1, CAST(N'2024-05-16T15:52:56.747' AS DateTime), CAST(N'2024-05-16T15:52:56.747' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (159, N'a) TCP/IP', 0, 41, 1, CAST(N'2024-05-16T15:52:56.747' AS DateTime), CAST(N'2024-05-16T15:52:56.747' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (160, N'b) SCORM', 1, 41, 1, CAST(N'2024-05-16T15:52:56.747' AS DateTime), CAST(N'2024-05-16T15:52:56.747' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (161, N'c) HTML5', 0, 41, 1, CAST(N'2024-05-16T15:52:56.747' AS DateTime), CAST(N'2024-05-16T15:52:56.747' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (163, N'a) 2005', 0, 42, 1, CAST(N'2024-05-16T15:52:56.750' AS DateTime), CAST(N'2024-05-16T15:52:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (164, N'b) 2012', 1, 42, 1, CAST(N'2024-05-16T15:52:56.750' AS DateTime), CAST(N'2024-05-16T15:52:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (165, N'c) 2015', 0, 42, 1, CAST(N'2024-05-16T15:52:56.750' AS DateTime), CAST(N'2024-05-16T15:52:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (167, N'a) Aprendizaje basado en proyectos', 0, 43, 1, CAST(N'2024-05-16T15:52:56.750' AS DateTime), CAST(N'2024-05-16T15:52:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (168, N'b) Microaprendizaje', 1, 43, 1, CAST(N'2024-05-16T15:52:56.750' AS DateTime), CAST(N'2024-05-16T15:52:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (169, N'c) Aprendizaje cooperativo', 0, 43, 1, CAST(N'2024-05-16T15:52:56.750' AS DateTime), CAST(N'2024-05-16T15:52:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (171, N'a) Impresión 3D', 0, 44, 1, CAST(N'2024-05-16T15:52:56.750' AS DateTime), CAST(N'2024-05-16T15:52:56.750' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (172, N'b) Realidad aumentada', 0, 44, 1, CAST(N'2024-05-16T15:52:56.753' AS DateTime), CAST(N'2024-05-16T15:52:56.753' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (173, N'c) Inteligencia Artificial', 1, 44, 1, CAST(N'2024-05-16T15:52:56.753' AS DateTime), CAST(N'2024-05-16T15:52:56.753' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (175, N'a) Costo más alto', 0, 45, 1, CAST(N'2024-05-16T15:52:56.753' AS DateTime), CAST(N'2024-05-16T15:52:56.753' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (176, N'b) Flexibilidad de horarios', 1, 45, 1, CAST(N'2024-05-16T15:52:56.753' AS DateTime), CAST(N'2024-05-16T15:52:56.753' AS DateTime))
GO
INSERT [dbo].[Opcion] ([idOpcion], [nombre], [correcta], [idPregunta], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (177, N'c) Necesidad de infraestructura física', 0, 45, 1, CAST(N'2024-05-16T15:52:56.753' AS DateTime), CAST(N'2024-05-16T15:52:56.753' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Opcion] OFF
GO
SET IDENTITY_INSERT [dbo].[Pregunta] ON 
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'¿Cuál es la capital de Guatemala?', 2, 1, CAST(N'2024-01-12T15:01:38.130' AS DateTime), CAST(N'2024-01-15T12:30:25.703' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (2, N'¿Cuál es la moneda oficial de Guatemala?', 2, 1, CAST(N'2024-01-12T15:01:38.140' AS DateTime), CAST(N'2024-01-15T12:30:19.020' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (3, N'¿Cuál es el volcán más alto de Guatemala?', 2, 1, CAST(N'2024-01-12T15:01:38.143' AS DateTime), CAST(N'2024-01-15T12:30:15.133' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (4, N'¿Cuál es el plato típico guatemalteco hecho a base de maíz y relleno de carne y salsa?', 2, 1, CAST(N'2024-01-12T15:01:38.143' AS DateTime), CAST(N'2024-01-15T12:30:09.527' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (5, N'¿Cuál es el sitio arqueológico maya más grande de Guatemala y uno de los más importantes de la región?', 2, 1, CAST(N'2024-01-12T15:01:38.147' AS DateTime), CAST(N'2024-01-15T12:30:03.150' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (6, N'¿Cuál es la capital de Guatemala?', 3, 1, CAST(N'2024-01-15T12:31:09.190' AS DateTime), CAST(N'2024-01-15T12:32:58.763' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (7, N'¿Cuál es la moneda oficial de Guatemala?', 3, 1, CAST(N'2024-01-15T12:31:09.197' AS DateTime), CAST(N'2024-01-15T12:32:55.933' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (8, N'¿Cuál es el volcán más alto de Guatemala?', 3, 1, CAST(N'2024-01-15T12:31:09.197' AS DateTime), CAST(N'2024-01-18T15:41:53.910' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (9, N'¿Cuál es el plato típico guatemalteco hecho a base de maíz y relleno de carne y salsa?', 3, 1, CAST(N'2024-01-15T12:31:09.200' AS DateTime), CAST(N'2024-01-15T12:32:51.333' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (10, N'¿Cuál es el sitio arqueológico maya más grande de Guatemala y uno de los más importantes de la región?', 3, 1, CAST(N'2024-01-15T12:31:09.200' AS DateTime), CAST(N'2024-01-15T12:32:48.720' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (17, N'¿Cuál es la capital de Guatemala?', 9, 1, CAST(N'2024-01-22T15:49:36.960' AS DateTime), CAST(N'2024-01-22T15:49:36.960' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (18, N'¿Cuál es la moneda oficial de Guatemala?', 9, 1, CAST(N'2024-01-22T15:49:36.970' AS DateTime), CAST(N'2024-01-22T15:49:36.970' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (19, N'¿Cuál es el volcán más alto de Guatemala?', 9, 1, CAST(N'2024-01-22T15:49:36.970' AS DateTime), CAST(N'2024-01-23T10:47:57.377' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (20, N'¿Cuál es el plato típico guatemalteco hecho a base de maíz y relleno de carne y salsa?', 9, 1, CAST(N'2024-01-22T15:49:36.970' AS DateTime), CAST(N'2024-01-22T15:49:36.970' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (21, N'¿Cuál es el sitio arqueológico maya más grande de Guatemala y uno de los más importantes de la región?', 9, 1, CAST(N'2024-01-22T15:49:36.973' AS DateTime), CAST(N'2024-01-22T15:49:36.973' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (22, N'¿Cuál es la capital de Ecuador?', 10, 1, CAST(N'2024-01-31T11:19:16.440' AS DateTime), CAST(N'2024-01-31T11:19:16.440' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (23, N'¿Ejemplo?', 10, 1, CAST(N'2024-01-31T11:23:23.853' AS DateTime), CAST(N'2024-01-31T11:23:23.853' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (24, N'¿Ejemplo2?', 10, 1, CAST(N'2024-01-31T11:23:23.860' AS DateTime), CAST(N'2024-01-31T11:23:23.860' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (25, N'¿Ejemplo3?', 10, 1, CAST(N'2024-01-31T11:23:23.860' AS DateTime), CAST(N'2024-01-31T11:23:23.860' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (26, N'¿Ejemplo4?', 10, 1, CAST(N'2024-01-31T11:23:23.863' AS DateTime), CAST(N'2024-01-31T11:23:23.863' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (27, N'¿Ejemplo5?', 10, 1, CAST(N'2024-01-31T11:23:23.867' AS DateTime), CAST(N'2024-01-31T11:23:23.867' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (28, N'¿Cuál de los siguientes es un desafío clave en la implementación del eLearning en entornos de bajos recursos?', 11, 1, CAST(N'2024-05-06T10:13:59.870' AS DateTime), CAST(N'2024-05-06T10:13:59.870' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (29, N'¿Qué teoría del aprendizaje enfatiza la importancia de la interacción social y la cultura en el aprendizaje?', 11, 1, CAST(N'2024-05-06T10:13:59.877' AS DateTime), CAST(N'2024-05-06T10:13:59.877' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (30, N'¿Cuál es una herramienta emergente en eLearning para crear entornos inmersivos?', 11, 1, CAST(N'2024-05-06T10:13:59.880' AS DateTime), CAST(N'2024-05-06T10:13:59.880' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (31, N'¿Qué principio pedagógico es esencial en el diseño de cursos eLearning efectivos?', 11, 1, CAST(N'2024-05-06T10:13:59.880' AS DateTime), CAST(N'2024-05-06T10:13:59.880' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (32, N'¿Cuál de estos es un estándar importante en eLearning para el contenido de cursos?', 11, 1, CAST(N'2024-05-06T10:13:59.883' AS DateTime), CAST(N'2024-05-06T10:13:59.883' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (33, N'¿En qué año se lanzó la primera plataforma MOOC (Massive Open Online Courses)?', 11, 1, CAST(N'2024-05-06T10:13:59.887' AS DateTime), CAST(N'2024-05-06T10:13:59.887' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (34, N'¿Qué metodología de eLearning se centra en dividir el contenido en pequeñas unidades?', 11, 1, CAST(N'2024-05-06T10:13:59.887' AS DateTime), CAST(N'2024-05-06T10:13:59.887' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (35, N'¿Qué tecnología ha permitido una mayor personalización del aprendizaje en línea?', 11, 1, CAST(N'2024-05-06T10:13:59.890' AS DateTime), CAST(N'2024-05-06T10:13:59.890' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (36, N'¿Cuál es una ventaja principal del eLearning frente al aprendizaje tradicional?', 11, 1, CAST(N'2024-05-06T10:13:59.890' AS DateTime), CAST(N'2024-05-06T10:13:59.890' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (37, N'¿Cuál de los siguientes es un desafío clave en la implementación del eLearning en entornos de bajos recursos?', 12, 1, CAST(N'2024-05-16T15:52:56.733' AS DateTime), CAST(N'2024-05-16T15:52:56.733' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (38, N'¿Qué teoría del aprendizaje enfatiza la importancia de la interacción social y la cultura en el aprendizaje?', 12, 1, CAST(N'2024-05-16T15:52:56.740' AS DateTime), CAST(N'2024-05-16T15:52:56.740' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (39, N'¿Cuál es una herramienta emergente en eLearning para crear entornos inmersivos?', 12, 1, CAST(N'2024-05-16T15:52:56.743' AS DateTime), CAST(N'2024-05-16T15:52:56.743' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (40, N'¿Qué principio pedagógico es esencial en el diseño de cursos eLearning efectivos?', 12, 1, CAST(N'2024-05-16T15:52:56.747' AS DateTime), CAST(N'2024-05-16T15:52:56.747' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (41, N'¿Cuál de estos es un estándar importante en eLearning para el contenido de cursos?', 12, 1, CAST(N'2024-05-16T15:52:56.747' AS DateTime), CAST(N'2024-05-16T15:52:56.747' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (42, N'¿En qué año se lanzó la primera plataforma MOOC (Massive Open Online Courses)?', 12, 1, CAST(N'2024-05-16T15:52:56.750' AS DateTime), CAST(N'2024-05-16T15:52:56.750' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (43, N'¿Qué metodología de eLearning se centra en dividir el contenido en pequeñas unidades?', 12, 1, CAST(N'2024-05-16T15:52:56.750' AS DateTime), CAST(N'2024-05-16T15:52:56.750' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (44, N'¿Qué tecnología ha permitido una mayor personalización del aprendizaje en línea?', 12, 1, CAST(N'2024-05-16T15:52:56.750' AS DateTime), CAST(N'2024-05-16T15:52:56.750' AS DateTime))
GO
INSERT [dbo].[Pregunta] ([idPregunta], [nombre], [idSala], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (45, N'¿Cuál es una ventaja principal del eLearning frente al aprendizaje tradicional?', 12, 1, CAST(N'2024-05-16T15:52:56.753' AS DateTime), CAST(N'2024-05-16T15:52:56.753' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 
GO
INSERT [dbo].[Rol] ([idRol], [nombre], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'Administrador', 1, CAST(N'2024-01-08T14:32:47.387' AS DateTime), CAST(N'2024-01-08T14:32:47.387' AS DateTime))
GO
INSERT [dbo].[Rol] ([idRol], [nombre], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (2, N'Jugador', 1, CAST(N'2024-01-08T14:32:47.387' AS DateTime), CAST(N'2024-01-08T14:32:47.387' AS DateTime))
GO
INSERT [dbo].[Rol] ([idRol], [nombre], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (3, N'SuperAdministrador', 1, CAST(N'2024-01-08T14:32:47.387' AS DateTime), CAST(N'2024-01-08T14:32:47.387' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Sala] ON 
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion], [fechaCierre], [fechaCierreLondon], [tiempoXpreg]) VALUES (1, N'Sala 1', N'ofimatica-en-la-nube-tecnooffice.png', N'desc de sala 1', 1, 0, CAST(N'2024-01-12T11:37:16.350' AS DateTime), CAST(N'2024-01-22T15:40:43.877' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-15T17:26:35.000' AS DateTime), CAST(N'2024-01-15T17:26:35.000' AS DateTime), 20)
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion], [fechaCierre], [fechaCierreLondon], [tiempoXpreg]) VALUES (2, N'Nueva sala G', NULL, NULL, 1, 1, CAST(N'2024-01-12T14:57:08.017' AS DateTime), CAST(N'2024-02-05T17:35:16.757' AS DateTime), CAST(N'2024-01-15T17:26:35.000' AS DateTime), CAST(N'2024-01-15T17:26:35.000' AS DateTime), CAST(N'2024-01-15T17:26:35.000' AS DateTime), 20)
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion], [fechaCierre], [fechaCierreLondon], [tiempoXpreg]) VALUES (3, N'Sala de test', NULL, NULL, 1, 1, CAST(N'2024-01-15T12:30:47.883' AS DateTime), CAST(N'2024-02-05T17:34:25.687' AS DateTime), CAST(N'2024-02-05T22:34:20.000' AS DateTime), CAST(N'2024-01-15T17:26:35.000' AS DateTime), CAST(N'2024-01-15T17:26:35.000' AS DateTime), 20)
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion], [fechaCierre], [fechaCierreLondon], [tiempoXpreg]) VALUES (4, N'Sala', NULL, NULL, 1, 0, CAST(N'2024-01-22T14:20:58.067' AS DateTime), CAST(N'2024-05-16T16:03:17.810' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime), CAST(N'2024-05-16T17:26:35.000' AS DateTime), CAST(N'2024-05-16T23:26:35.000' AS DateTime), 50)
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion], [fechaCierre], [fechaCierreLondon], [tiempoXpreg]) VALUES (9, N'Sal Bosque', NULL, NULL, 1, 1, CAST(N'2024-01-22T15:47:43.243' AS DateTime), CAST(N'2024-01-23T10:30:10.257' AS DateTime), CAST(N'2024-01-23T15:30:01.000' AS DateTime), CAST(N'2024-01-15T17:26:35.000' AS DateTime), CAST(N'2024-01-15T17:26:35.000' AS DateTime), 20)
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion], [fechaCierre], [fechaCierreLondon], [tiempoXpreg]) VALUES (10, N'Prompts IA', NULL, NULL, 1, 1, CAST(N'2024-01-31T11:17:52.273' AS DateTime), CAST(N'2024-01-31T11:24:26.387' AS DateTime), CAST(N'2024-01-31T16:23:30.000' AS DateTime), CAST(N'2024-01-15T17:26:35.000' AS DateTime), CAST(N'2024-01-15T17:26:35.000' AS DateTime), 20)
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion], [fechaCierre], [fechaCierreLondon], [tiempoXpreg]) VALUES (11, N'Bitme trivias 001', NULL, NULL, 1, 1, CAST(N'2024-04-26T09:03:32.420' AS DateTime), CAST(N'2024-05-13T11:54:42.317' AS DateTime), CAST(N'2024-05-06T16:14:23.000' AS DateTime), CAST(N'2024-05-15T12:45:23.000' AS DateTime), CAST(N'2024-05-15T18:45:23.000' AS DateTime), 20)
GO
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion], [fechaCierre], [fechaCierreLondon], [tiempoXpreg]) VALUES (12, N'pueba uno', N'2plugcourse.png', NULL, 1, 1, CAST(N'2024-04-26T12:56:19.987' AS DateTime), CAST(N'2024-05-16T17:02:09.927' AS DateTime), CAST(N'2024-05-16T21:53:08.000' AS DateTime), CAST(N'2024-05-16T17:20:00.000' AS DateTime), CAST(N'2024-05-16T23:20:00.000' AS DateTime), 60)
GO
SET IDENTITY_INSERT [dbo].[Sala] OFF
GO
INSERT [dbo].[SalaJuego] ([idSala], [idJugador], [iniciales], [posicion], [fecha_creacion], [fecha_modificacion], [estadoJuego]) VALUES (9, 1, N'A', 3, CAST(N'2024-01-31T11:38:13.780' AS DateTime), CAST(N'2024-01-31T11:38:54.107' AS DateTime), 1)
GO
INSERT [dbo].[SalaJuego] ([idSala], [idJugador], [iniciales], [posicion], [fecha_creacion], [fecha_modificacion], [estadoJuego]) VALUES (2, 1, N'A', 5, CAST(N'2024-01-22T09:46:07.517' AS DateTime), CAST(N'2024-02-05T17:36:27.077' AS DateTime), 1)
GO
INSERT [dbo].[SalaJuego] ([idSala], [idJugador], [iniciales], [posicion], [fecha_creacion], [fecha_modificacion], [estadoJuego]) VALUES (3, 1, N'A', 0, CAST(N'2024-02-05T17:34:30.367' AS DateTime), CAST(N'2024-02-05T17:34:30.367' AS DateTime), 1)
GO
INSERT [dbo].[SalaJuego] ([idSala], [idJugador], [iniciales], [posicion], [fecha_creacion], [fecha_modificacion], [estadoJuego]) VALUES (10, 1, N'A', 4, CAST(N'2024-01-31T11:25:58.960' AS DateTime), CAST(N'2024-01-31T11:27:55.583' AS DateTime), 1)
GO
INSERT [dbo].[SalaJuego] ([idSala], [idJugador], [iniciales], [posicion], [fecha_creacion], [fecha_modificacion], [estadoJuego]) VALUES (11, 5, N'CI', 1, CAST(N'2024-05-06T13:59:57.853' AS DateTime), CAST(N'2024-05-06T14:03:52.820' AS DateTime), 1)
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (2, 5, CAST(N'2024-01-12T15:03:22.023' AS DateTime), CAST(N'2024-01-15T14:18:01.003' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (2, 7, CAST(N'2024-01-12T15:52:37.107' AS DateTime), CAST(N'2024-01-12T15:52:37.107' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (1, 6, CAST(N'2024-01-14T13:31:00.450' AS DateTime), CAST(N'2024-01-15T12:25:00.363' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (1, 5, CAST(N'2024-01-15T09:36:22.910' AS DateTime), CAST(N'2024-01-15T11:00:43.620' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (2, 1, CAST(N'2024-01-15T10:58:04.080' AS DateTime), CAST(N'2024-02-05T17:35:32.113' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (2, 6, CAST(N'2024-01-15T11:19:53.320' AS DateTime), CAST(N'2024-01-15T11:31:17.920' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (3, 10, CAST(N'2024-01-16T12:14:29.163' AS DateTime), CAST(N'2024-01-16T12:14:29.163' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (3, 5, CAST(N'2024-01-16T12:16:25.850' AS DateTime), CAST(N'2024-01-16T12:16:25.850' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (1, 1, CAST(N'2024-01-22T09:45:34.610' AS DateTime), CAST(N'2024-01-22T09:45:34.610' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (9, 1, CAST(N'2024-01-22T15:54:26.850' AS DateTime), CAST(N'2024-01-31T11:38:12.437' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (9, 10, CAST(N'2024-01-23T11:28:00.020' AS DateTime), CAST(N'2024-01-23T11:28:00.020' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (10, 1, CAST(N'2024-01-31T11:25:36.953' AS DateTime), CAST(N'2024-01-31T11:26:06.317' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (10, 5, CAST(N'2024-01-31T11:34:05.400' AS DateTime), CAST(N'2024-01-31T11:34:05.400' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (12, 1, CAST(N'2024-04-26T12:58:28.880' AS DateTime), CAST(N'2024-05-13T11:53:01.277' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (11, 3, CAST(N'2024-05-06T11:24:38.493' AS DateTime), CAST(N'2024-05-06T11:24:38.493' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (11, 5, CAST(N'2024-05-06T13:59:55.457' AS DateTime), CAST(N'2024-05-06T14:04:20.747' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (12, 8, CAST(N'2024-05-13T11:52:19.127' AS DateTime), CAST(N'2024-05-13T11:52:29.313' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (12, 15, CAST(N'2024-05-16T17:12:26.343' AS DateTime), CAST(N'2024-05-16T17:12:26.343' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (3, 1, CAST(N'2024-01-15T12:31:17.750' AS DateTime), CAST(N'2024-02-05T17:34:42.447' AS DateTime))
GO
INSERT [dbo].[SalaReciente] ([idSala], [idJugador], [fecha_creacion], [fecha_modificacion]) VALUES (3, 6, CAST(N'2024-01-15T12:36:31.700' AS DateTime), CAST(N'2024-01-15T12:38:12.730' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular], [empresa]) VALUES (1, N'admin name', NULL, N'admin@correo.com', N'admin', NULL, 1, 1, CAST(N'2024-01-08T14:34:20.430' AS DateTime), CAST(N'2024-01-08T14:34:20.430' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular], [empresa]) VALUES (2, N'sadmin name', NULL, N'super-admin@correo.com', N'admin', NULL, 3, 1, CAST(N'2024-01-08T14:34:34.573' AS DateTime), CAST(N'2024-01-08T14:34:34.573' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular], [empresa]) VALUES (3, N'Rita Lasso', NULL, N'rita@correo.com', N'User.2023', NULL, 2, 1, CAST(N'2024-01-12T14:08:56.163' AS DateTime), CAST(N'2024-01-12T14:31:02.440' AS DateTime), N'0992736250', NULL)
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular], [empresa]) VALUES (4, N'Benito Camelas', NULL, N'benito@correo.com', N'User2.2023', NULL, 2, 1, CAST(N'2024-01-12T14:36:30.360' AS DateTime), CAST(N'2024-01-12T14:36:30.360' AS DateTime), N'0995478414', NULL)
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular], [empresa]) VALUES (5, N'Carlos Icaza', NULL, N'cicaza@digimentore.com.ec', N'CarlosIcaza', NULL, 2, 1, CAST(N'2024-01-12T15:00:33.057' AS DateTime), CAST(N'2024-01-15T10:57:48.353' AS DateTime), N'0995357576', NULL)
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular], [empresa]) VALUES (6, N'Byron Cedeño', NULL, N'bcedeno@digimentore.com.ec', N'Dcedeno.2023', NULL, 2, 1, CAST(N'2024-01-12T15:25:56.483' AS DateTime), CAST(N'2024-01-12T15:25:56.483' AS DateTime), N'0998270584', NULL)
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular], [empresa]) VALUES (7, N'Andrés López', NULL, N'mail@digimentore.net', N'Digimentore2011#', NULL, 2, 1, CAST(N'2024-01-12T15:47:51.150' AS DateTime), CAST(N'2024-01-12T15:47:51.150' AS DateTime), N'0994256314', NULL)
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular], [empresa]) VALUES (8, N'Dana Nuñez', NULL, N'dana@gmail.com', N'12345', NULL, 2, 1, CAST(N'2024-01-12T17:39:47.593' AS DateTime), CAST(N'2024-01-12T17:48:57.497' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular], [empresa]) VALUES (10, N'MIchael Villagrán', NULL, N'mikevm.tech@gmail.com', N'Mikevm2011', NULL, 2, 1, CAST(N'2024-01-16T12:13:55.797' AS DateTime), CAST(N'2024-01-16T12:13:55.797' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular], [empresa]) VALUES (15, N'Elver Galarraga', NULL, N'elver.ga@gmail.com', NULL, NULL, 2, 1, CAST(N'2024-05-16T17:12:26.280' AS DateTime), CAST(N'2024-05-16T17:12:26.280' AS DateTime), N'0998523654', N'Digimneotre')
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
INSERT [dbo].[Usuario_Sala] ([idUsuario], [idSala], [estado], [fecha_creacion], [fecha_modificacion], [puntaje], [tiempo]) VALUES (1, 9, 1, CAST(N'2024-01-31T11:38:56.123' AS DateTime), CAST(N'2024-01-31T11:38:56.123' AS DateTime), 3, 9890)
GO
INSERT [dbo].[Usuario_Sala] ([idUsuario], [idSala], [estado], [fecha_creacion], [fecha_modificacion], [puntaje], [tiempo]) VALUES (1, 2, 1, CAST(N'2024-02-05T17:36:29.143' AS DateTime), CAST(N'2024-02-05T17:36:29.143' AS DateTime), 5, 21746)
GO
INSERT [dbo].[Usuario_Sala] ([idUsuario], [idSala], [estado], [fecha_creacion], [fecha_modificacion], [puntaje], [tiempo]) VALUES (1, 10, 1, CAST(N'2024-01-31T11:28:14.733' AS DateTime), CAST(N'2024-01-31T11:28:14.733' AS DateTime), 4, 46351)
GO
ALTER TABLE [dbo].[Complemento] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Complemento] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[ModoJuego] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[ModoJuego] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[ModoJuego] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Opcion] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Opcion] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Opcion] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Pregunta] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Pregunta] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Pregunta] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Sala] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Sala] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Sala] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Sala] ADD  DEFAULT ((20)) FOR [tiempoXpreg]
GO
ALTER TABLE [dbo].[SalaJuego] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[SalaJuego] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[SalaJuego] ADD  CONSTRAINT [c_estadoJuego]  DEFAULT ((1)) FOR [estadoJuego]
GO
ALTER TABLE [dbo].[SalaReciente] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[SalaReciente] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Usuario_Sala] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Usuario_Sala] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Usuario_Sala] ADD  DEFAULT (getdate()) FOR [fecha_modificacion]
GO
ALTER TABLE [dbo].[Usuario_Sala] ADD  CONSTRAINT [df_puntaje]  DEFAULT ((0)) FOR [puntaje]
GO
ALTER TABLE [dbo].[Usuario_Sala] ADD  CONSTRAINT [df_tiempo]  DEFAULT ((0)) FOR [tiempo]
GO
ALTER TABLE [dbo].[Complemento]  WITH CHECK ADD FOREIGN KEY([idSala])
REFERENCES [dbo].[Sala] ([idSala])
GO
ALTER TABLE [dbo].[Opcion]  WITH CHECK ADD FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Pregunta] ([idPregunta])
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD FOREIGN KEY([idSala])
REFERENCES [dbo].[Sala] ([idSala])
GO
ALTER TABLE [dbo].[Sala]  WITH CHECK ADD FOREIGN KEY([idModoJuego])
REFERENCES [dbo].[ModoJuego] ([idModoJuego])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Usuario_Sala]  WITH CHECK ADD FOREIGN KEY([idSala])
REFERENCES [dbo].[Sala] ([idSala])
GO
ALTER TABLE [dbo].[Usuario_Sala]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [CHK_Clave_NotEmpty] CHECK  (([Clave]<>''))
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [CHK_Clave_NotEmpty]
GO
/****** Object:  StoredProcedure [dbo].[sp_B_Complemento]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_Complemento]	

	@idSala int,
	
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;	

	declare @contIdSala int = 0
	
	Select @contIdSala = COUNT(*) from Sala Where idSala = @idSala

	if(@contIdSala = 0)
	begin
		
		set @info = 'No existe la sala'
		set @error = 1
		
	end
	else
	begin

		Select * from Complemento
		Where idSala = @idSala
		
		set @info = 'ok'
		set @error = 0

	end

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_OpcionByIdPregunta]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_B_OpcionByIdPregunta]	
	
	@estados int,
	@idPregunta int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;
	declare @contIdPregunta int = 0
	select @contIdPregunta = COUNT(*) from Opcion where idPregunta = @idPregunta

	if(@contIdPregunta > 0)
	begin 
		
		if(@estados > 0)
		begin		
			select * from Opcion 
			where estado > 0 and
			idPregunta = @idPregunta
			order by idOpcion asc
		end
		else
		begin 
			
			select * from Opcion 
			where idPregunta = @idPregunta
			order by idOpcion asc
			
		end

		set @info = 'Encontrado'
		set @error = 0

	end
	else
	begin

		set @info = 'La pregunta no tiene opciones'
		set @error = 1

	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_Pregunta]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_B_Pregunta]	
	
	@estados int,
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;	

	if(@estados > 0)
	begin
	
		Select * from Pregunta
		where estado > 0
		order by idPregunta desc		
		
	end
	else
	begin 

		Select * from Pregunta		
		order by idPregunta desc
		
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_PreguntaById]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_PreguntaById]	
	
	@idPregunta int,
	@estados int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;	

	declare @contId int = 0
	select @contId = COUNT(*) from Pregunta where idPregunta = @idPregunta

	if(@contId > 0)
	begin
		if(@estados > 0)
		begin
	
			Select 
			p.idPregunta,
			p.nombre,
			p.idSala,
			(select s.tiempoXpreg from Sala s where s.idSala = p.idSala) as 'tiempoXpreg',
			p.estado,
			p.fecha_creacion,
			p.fecha_modificacion
			from Pregunta p
			where estado > 0 and idPregunta = @idPregunta
			order by idPregunta desc		
		
		end
		else
		begin 

			Select 
			p.idPregunta,
			p.nombre,
			p.idSala,
			(select s.tiempoXpreg from Sala s where s.idSala = p.idSala) as 'tiempoXpreg',
			p.estado,
			p.fecha_creacion,
			p.fecha_modificacion
			from Pregunta p
			where idPregunta = @idPregunta
			order by idPregunta desc
		
		end

		set @info = 'Encontrado'
		set @error = 0
	end
	else
	begin

		set @info = 'No se entontró el id de la pregunta'
		set @error = 1

	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_PreguntaByIdSala]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_PreguntaByIdSala]	
	
	@idSala int,
	@estados int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;	

	declare @contIdSala int = 0
	select @contIdSala = COUNT(*) from Pregunta where idSala = @idSala

	if(@contIdSala > 0)
	begin
		if(@estados > 0)
		begin
	
			Select * from Pregunta
			where estado > 0 and idSala = @idSala
			order by idPregunta desc		
		
		end
		else
		begin 

			Select * from Pregunta	
			where idSala = @idSala
			order by idPregunta desc
		
		end

		set @info = 'Encontrado'
		set @error = 0
	end
	else
	begin

		set @info = 'La sala no tiene preguntas'
		set @error = 1

	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_Rol]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_Rol] 
	
	@estados int,
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	if(@estados > 0)
	begin 		
		Select * from Rol where estado > 0		
	end
	else
	begin
		Select * from Rol
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_Sala]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_Sala]	
	
	@estados int,
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;	

	if(@estados > 0)
	begin		
		Select 
		s.idSala,
		s.nombre,
		ISNULL(s.imagen, 'N/A') as 'imagen',
		ISNULL(s.descripcion, 'N/A') as 'descripcion',
		mj.nombre as 'modoJuego',
		s.estado,
		(select COUNT(*) from Pregunta where idSala = s.idSala) as 'totalPreguntas',
		s.tiempoXpreg,
		s.fecha_creacion,
		s.fecha_modificacion,
		s.fecha_activacion,
		s.fechaCierre,
		s.fechaCierreLondon
		from Sala s inner join ModoJuego mj
		on s.idModoJuego = mj.idModoJuego
		where s.estado > 0
		order by s.idSala desc
	end
	else
	begin 
		Select 
		s.idSala,
		s.nombre,
		ISNULL(s.imagen, 'N/A') as 'imagen',
		ISNULL(s.descripcion, 'N/A') as 'descripcion',
		mj.nombre as 'modoJuego',
		s.estado,
		(select COUNT(*) from Pregunta where idSala = s.idSala) as 'totalPreguntas',
		s.tiempoXpreg,
		s.fecha_creacion,
		s.fecha_modificacion,
		s.fecha_activacion,
		s.fechaCierre,
		s.fechaCierreLondon
		from Sala s inner join ModoJuego mj
		on s.idModoJuego = mj.idModoJuego	
		order by s.idSala desc
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_SalaByAll]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_SalaByAll]	
	
	@buscar varchar(3),
	@estados int,
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;	

	if(@estados > 0)
	begin		
		Select 
		s.idSala,
		s.nombre,
		ISNULL(s.imagen, 'N/A') as 'imagen',
		ISNULL(s.descripcion, 'N/A') as 'descripcion',
		mj.nombre as 'modoJuego',
		s.estado,
		(select COUNT(*) from Pregunta where idSala = s.idSala) as 'totalPreguntas',
		s.tiempoXpreg,
		s.fecha_creacion,
		s.fecha_modificacion,
		s.fecha_activacion,
		s.fechaCierre,
		s.fechaCierreLondon
		from Sala s inner join ModoJuego mj
		on s.idModoJuego = mj.idModoJuego
		where (s.estado > 0) and
		(s.idSala like '%'+@buscar+'%' or
		s.nombre like '%'+@buscar+'%' or
		s.descripcion like '%'+@buscar+'%' or
		mj.nombre like '%'+@buscar+'%')
		order by s.idSala desc
	end
	else
	begin 
		Select 
		s.idSala,
		s.nombre,
		ISNULL(s.imagen, 'N/A') as 'imagen',
		ISNULL(s.descripcion, 'N/A') as 'descripcion',
		mj.nombre as 'modoJuego',
		s.estado,
		(select COUNT(*) from Pregunta where idSala = s.idSala) as 'totalPreguntas',
		s.tiempoXpreg,
		s.fecha_creacion,
		s.fecha_modificacion,
		s.fecha_activacion,
		s.fechaCierre,
		s.fechaCierreLondon
		from Sala s inner join ModoJuego mj
		on s.idModoJuego = mj.idModoJuego
		where 
		s.idSala like '%'+@buscar+'%' or
		s.nombre like '%'+@buscar+'%' or
		s.descripcion like '%'+@buscar+'%' or
		mj.nombre like '%'+@buscar+'%'
		order by s.idSala desc
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_SalaById]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_SalaById]	
	
	@idSala int,
	@estados int,
	@idUsuario int = 0,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	declare @countIdSala int = 0, @cantJugadas int = 0
	
	select @countIdSala = COUNT(*) from Sala where idSala = @idSala	
	select @cantJugadas = COUNT(*) from Usuario_Sala where idSala = @idSala and idUsuario = @idUsuario

	
	if(@countIdSala > 0)
	begin

		if(@estados > 0)
		begin		
			Select 
			s.idSala,
			s.nombre,
			ISNULL(s.imagen, 'N/A') as 'imagen',
			ISNULL(s.descripcion, 'N/A') as 'descripcion',
			mj.idModoJuego,
			mj.nombre as 'modoJuego',
			s.estado,
			(select COUNT(*) from Pregunta where idSala = s.idSala) as 'totalPreguntas',
			s.tiempoXpreg,
			@cantJugadas as 'cantJugadas',
			s.fecha_creacion,
			s.fecha_modificacion,
			s.fecha_activacion,
			s.fechaCierre,
			s.fechaCierreLondon
			from Sala s inner join ModoJuego mj
			on s.idModoJuego = mj.idModoJuego
			where s.estado > 0 and s.idSala = @idSala
			order by s.idSala desc
		end
		else
		begin 
			Select 
			s.idSala,
			s.nombre,
			ISNULL(s.imagen, 'N/A') as 'imagen',
			ISNULL(s.descripcion, 'N/A') as 'descripcion',
			mj.idModoJuego,
			mj.nombre as 'modoJuego',
			s.estado,
			(select COUNT(*) from Pregunta where idSala = s.idSala) as 'totalPreguntas',
			s.tiempoXpreg,
			@cantJugadas as 'cantJugadas',
			s.fecha_creacion,
			s.fecha_modificacion,
			s.fecha_activacion,
			s.fechaCierre,
			s.fechaCierreLondon
			from Sala s inner join ModoJuego mj
			on s.idModoJuego = mj.idModoJuego	
			where s.idSala = @idSala
			order by s.idSala desc
		end

		set @info = 'ok'
		set @error = 0
	end
	else
	begin
		set @info = 'No existe el id de la sala'
		set @error = 1
	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_SalaJuego]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_SalaJuego]	
	
	@idSala int,
	@idJugador int,
		
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	select sj.*, (select top 1 nombre from Usuario u where u.idUsuario = sj.idJugador) as 'nombre'
	from SalaJuego sj 
	where sj.idSala = @idSala and sj.idJugador <> @idJugador
	order by sj.posicion desc	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_SalaJuegoByIds]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_SalaJuegoByIds]	
	
	@idSala int,
	@idJugador int,
		
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	select sj.*, (select top 1 nombre from Usuario u where u.idUsuario = sj.idJugador) as 'nombre'
	from SalaJuego sj
	where sj.idSala = @idSala and sj.idJugador = @idJugador
	order by sj.posicion desc	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_SalaReciente]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_SalaReciente]	
	
	@estados int,
	@idJugador int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;	

	declare @tableSala table(
		idSala int,
		nombre varchar(40),
		imagen varchar(50),
		descripcion varchar(200),
		modoJuego varchar(15),
		estado int,
		fecha_creacion datetime,
		fecha_modificacion datetime,
		fecha_activacion datetime,
		idUsuario int
	);	

	declare @idSala int, @auxIdJugador int, @fechaCreacion datetime, @fechaModificacion datetime
	
	DECLARE cur_SalaReciente CURSOR FOR 
	Select idSala, idJugador from SalaReciente

	OPEN cur_SalaReciente
	FETCH NEXT FROM cur_SalaReciente INTO @idSala, @auxIdJugador
	WHILE @@fetch_status = 0
	BEGIN
	
		Select @fechaCreacion = fecha_creacion, @fechaModificacion = fecha_modificacion 
		from SalaReciente where idSala = @idSala and idJugador = @auxIdJugador

		Insert into @tableSala (idSala,nombre,imagen,descripcion,modoJuego,estado,fecha_creacion,fecha_modificacion,fecha_activacion,idUsuario)
		select s.idSala, s.nombre, s.imagen, s.descripcion, mj.nombre, s.estado, @fechaCreacion, @fechaModificacion, s.fecha_activacion, @auxIdJugador    
		from sala s inner join ModoJuego mj on mj.idModoJuego = s.idModoJuego
		where s.idSala = @idSala					

		FETCH NEXT FROM cur_SalaReciente INTO @idSala, @auxIdJugador
	END
	CLOSE cur_SalaReciente
	DEALLOCATE cur_SalaReciente


	if(@estados > 0)
	begin

		Select top 6 * 
		from @tableSala 
		where idUsuario = @idJugador and
		estado > 0
		order by fecha_modificacion desc

	end
	else
	begin

		Select top 6 *
		from @tableSala 
		where idUsuario = @idJugador
		order by fecha_modificacion desc

	end		
	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_Usuario]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_Usuario]	
	
	@estados int,
	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	if(@estados > 0)
	begin
		Select 
		u.idUsuario,
		u.nombre,
		isnull(u.correo,'N/A') as 'correo',
		u.celular,
		u.clave,
		r.nombre as 'rol',
		u.estado,
		u.fecha_creacion,
		u.fecha_modificacion
		from Usuario u inner join Rol r
		on u.idRol = r.idRol
		where u.estado > 0
	end
	else
	begin 
		Select 
		u.idUsuario,
		u.nombre,
		isnull(u.correo,'N/A') as 'correo',
		u.celular,
		u.clave,
		r.nombre as 'rol',
		u.estado,
		u.fecha_creacion,
		u.fecha_modificacion
		from Usuario u inner join Rol r
		on u.idRol = r.idRol		
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_Usuario_Sala]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_Usuario_Sala]	
		
	@estados int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	if(@estados > 0)
	begin	

		select * from Usuario_Sala
	
		Select
		u.idUsuario,
		u.nombre as 'usuario',
		u.clave,
		ISNULL(u.correo,'N/A') as 'correo',
		r.nombre as 'rol', 
		s.idSala,
		s.nombre as 'sala',
		ISNULL(s.descripcion,'N/A') as 'descripcion',
		us.fecha_creacion,
		us.fecha_modificacion,
		us.puntaje,
		us.tiempo	
		from Usuario_Sala us
		inner join Usuario u on u.idUsuario = us.idUsuario
		inner join Sala s on s.idSala = us.idSala
		inner join Rol r on r.idRol = u.idRol
		where us.estado > 0
		order by puntaje desc, tiempo asc

	end
	else
	begin 

		Select
		u.idUsuario,
		u.nombre as 'usuario',
		u.clave,
		ISNULL(u.correo,'N/A') as 'correo',
		r.nombre as 'rol', 
		s.idSala,
		s.nombre as 'sala',
		ISNULL(s.descripcion,'N/A') as 'descripcion',
		us.fecha_creacion,
		us.fecha_modificacion,
		us.puntaje,
		us.tiempo	
		from Usuario_Sala us
		inner join Usuario u on u.idUsuario = us.idUsuario
		inner join Sala s on s.idSala = us.idSala
		inner join Rol r on r.idRol = u.idRol		
		order by puntaje desc, tiempo asc

	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_Usuario_SalaByIdSala]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_Usuario_SalaByIdSala]	
	
	@idSala int,
	@estados int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	if(@estados > 0)
	begin	
	
		Select
		u.idUsuario,
		u.nombre as 'usuario',
		u.clave,
		ISNULL(u.correo, 'N/A') as 'correo',
		r.nombre as 'rol', 
		s.idSala,
		s.nombre as 'sala',
		us.fecha_creacion,
		us.fecha_modificacion,
		us.puntaje,
		us.tiempo	
		from Usuario_Sala us
		inner join Usuario u on u.idUsuario = us.idUsuario
		inner join Sala s on s.idSala = us.idSala
		inner join Rol r on r.idRol = u.idRol
		where us.estado > 0 and us.idSala = @idSala
		order by puntaje desc, tiempo asc

	end
	else
	begin 

		Select
		u.idUsuario,
		u.nombre as 'usuario',
		u.clave,
		ISNULL(u.correo, 'N/A') as 'correo',
		r.nombre as 'rol', 
		s.idSala,
		s.nombre as 'sala',
		us.fecha_creacion,
		us.fecha_modificacion,
		us.puntaje,
		us.tiempo	
		from Usuario_Sala us
		inner join Usuario u on u.idUsuario = us.idUsuario
		inner join Sala s on s.idSala = us.idSala
		inner join Rol r on r.idRol = u.idRol
		where us.idSala = @idSala
		order by puntaje desc, tiempo asc

	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_UsuarioByAll]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_UsuarioByAll]	
	
	@buscar varchar(max),
	@estados int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	if(@estados > 0)
	begin

		Select 
		u.idUsuario,
		u.nombre,
		u.celular,
		isnull(u.correo,'N/A') as 'correo',
		isnull(u.clave,'N/A') as 'clave',
		r.nombre as 'rol',
		u.estado,
		u.fecha_creacion,
		u.fecha_modificacion
		from Usuario u inner join Rol r
		on u.idRol = r.idRol
		where u.estado > 0 and 
		(u.nombre like '%'+@buscar+'%' or
		u.correo like '%'+@buscar+'%' or
		u.clave like '%'+@buscar+'%' or
		r.nombre like '%'+@buscar+'%')
		order by u.idUsuario desc

	end
	else
	begin 

		Select 
		u.idUsuario,
		u.nombre,
		u.celular,
		isnull(u.correo,'N/A') as 'correo',
		isnull(u.clave,'N/A') as 'clave',		
		r.nombre as 'rol',
		u.estado,
		u.fecha_creacion,
		u.fecha_modificacion
		from Usuario u inner join Rol r
		on u.idRol = r.idRol	
		where
		(u.nombre like '%'+@buscar+'%' or
		u.correo like '%'+@buscar+'%' or
		u.clave like '%'+@buscar+'%' or
		r.nombre like '%'+@buscar+'%')
		order by u.idUsuario desc

	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_UsuarioById]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_UsuarioById]	
	
	@estados int,
	@idUsuario int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;
	
	declare @contUsuario int = 0
	select @contUsuario = COUNT(*) from Usuario where idUsuario = @idUsuario

	if(@contUsuario > 0)
	begin
		
		if(@estados > 0)
		begin
			Select 
			u.idUsuario,
			u.nombre,
			u.correo,
			u.celular,
			u.clave,
			u.idRol,
			r.nombre as 'rol',
			u.estado,
			u.fecha_creacion,
			u.fecha_modificacion
			from Usuario u inner join Rol r
			on u.idRol = r.idRol
			where u.estado > 0 and u.idUsuario = @idUsuario
		end
		else
		begin 
			Select 
			u.idUsuario,
			u.nombre,
			u.correo,
			u.celular,
			u.clave,
			u.idRol,
			r.nombre as 'rol',
			u.estado,
			u.fecha_creacion,
			u.fecha_modificacion
			from Usuario u inner join Rol r
			on u.idRol = r.idRol		
			where u.idUsuario = @idUsuario
		end

		set @info = 'Encontrado'
		set @error = 0

	end
	else
	begin
		set @info = 'No se encontró el usuario'
		set @error = 1
	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_UsuarioLogin]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_B_UsuarioLogin]	
	
	@nombre varchar(40),
	@correo varchar(40),
	@clave varchar(20),
	@tipoLogin int,

	@info varchar(max) output,
	@error int output
AS
BEGIN

	SET NOCOUNT ON;

	declare @contUsuario1 int = 0, @contUsuario2 int = 0

	select @contUsuario1 = COUNT(*) from Usuario where
	correo = @correo --COLLATE SQL_Latin1_General_CP1_CS_AS
	and clave = @clave --COLLATE SQL_Latin1_General_CP1_CS_AS
	and estado > 0

	select @contUsuario2 = COUNT(*) from Usuario 
	where nombre = @nombre and correo = @correo


	if(@tipoLogin = 1) -- el 1 es el login normal 
	begin

		if(@contUsuario1 > 0)
		begin
			select u.idUsuario, u.nombre, u.correo, u.clave, r.idRol, r.nombre as 'rol'
			from Usuario u
			inner join Rol r
			on u.idRol = r.idRol
			where u.correo = @correo and u.clave = @clave and u.estado > 0	

			set @info = 'Usuario encontrado por Login'
			set @error = 0
		end
		else
		begin
			set @info = 'Correo y contraseña incorrectos'
			set @error = 1
		end
		
	end
	else if(@tipoLogin = 2) -- el 2 es el login desde el LMS
	begin
		
		if(@contUsuario2 > 0)
		begin

			select u.idUsuario, u.nombre, u.correo, u.clave, r.idRol, r.nombre as 'rol'
			from Usuario u
			inner join Rol r
			on u.idRol = r.idRol
			where u.nombre = @nombre and u.correo = @correo			

			set @info = 'Usuario encontrado por el LMS'
			set @error = 0
		end
		else
		begin
			
			BEGIN TRY  
			
				Insert into Usuario (nombre,correo,idRol) values
				(NULLIF(@nombre, ''),
				NULLIF(@correo, ''),				
				2)

				select u.idUsuario, u.nombre, u.correo, u.clave, r.idRol, r.nombre as 'rol'
				from Usuario u
				inner join Rol r
				on u.idRol = r.idRol
				where u.idUsuario = SCOPE_IDENTITY();				

				set @info = 'Usuario registrado y encontrado'
				set @error = 0

			END TRY
			BEGIN CATCH	

				set @info = ERROR_MESSAGE()
				set @error = 1

			END CATCH;	

		end
		
	end
	else
	begin

		set @info = 'Incorrecto el tipo de Iniciar Sesion'
		set @error = 1

	end
	

	print @info
END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Complemento]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Complemento] 
		
	@idSala int,
	@viendoIzq varchar(50),
	@viendoDer varchar(50),
	@color1 varchar(20),
	@color2 varchar(20),
	@plat1 varchar(50),
	@plat2 varchar(50),
	@plat3 varchar(50),
	@plat4 varchar(50),
	@dec1 varchar(50),
	@dec2 varchar(50),
	@dec3 varchar(50),
	@dec4 varchar(50),
	@objCie1 varchar(50),
	@objCie2 varchar(50),
	@objFon1 varchar(50),
	@objFon2 varchar(50),
	@objFon3 varchar(50),
	@objFon4 varchar(50),
	@objFonMov varchar(50),
	@objFinal varchar(50),
	@sonido varchar(50),

	@isDecoration int,
	@isSkyObjects int,
	@isBackgroundObjects int,
	@isFinalObject int,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;		
		
	BEGIN TRY  
		
		Insert into Complemento (idSala, viendoIzquierda, viendoDerecha, color1, color2, plataforma1, plataforma2, plataforma3, plataforma4, decoracion1, decoracion2, decoracion3, decoracion4, objetoCielo1, objetoCielo2, objetoFondo1, objetoFondo2, objetoFondo3, objetoFondo4, objetoFondoMovil, objetoFinal, sonido, isDecoration, isSkyObjects, isBackgroundObjects, isFinalObject) values
		(@idSala,
		NULLIF(@viendoIzq, ''),
		NULLIF(@viendoDer, ''),
		NULLIF(@color1, ''), 
		NULLIF(@color2, ''),
		NULLIF(@plat1, ''),
		NULLIF(@plat2, ''),
		NULLIF(@plat3, ''),
		NULLIF(@plat4, ''),
		NULLIF(@dec1, ''),
		NULLIF(@dec2, ''),
		NULLIF(@dec3, ''),
		NULLIF(@dec4, ''),
		NULLIF(@objCie1, ''),
		NULLIF(@objCie2, ''),
		NULLIF(@objFon1, ''),
		NULLIF(@objFon2, ''),
		NULLIF(@objFon3, ''),
		NULLIF(@objFon4, ''),
		NULLIF(@objFonMov, ''),
		NULLIF(@objFinal, ''),
		NULLIF(@sonido, ''),
		case @isDecoration when '' then 0 else @isDecoration end,
		case @isSkyObjects when '' then 0 else @isSkyObjects end,
		case @isBackgroundObjects when '' then 0 else @isDecoration end,
		case @isFinalObject when '' then 0 else @isDecoration end
		)

		set @info = 'Registro creado satisfactoriamente'
		set @error = 0

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;					

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Opcion]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Opcion] 
	
	@nombre varchar(150),
	@correcta int,
	@idPregunta int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;	
	declare @contNombre int = 0, @contOpcion int = 0, @idOpcion int = 0 	
	select @contNombre = COUNT(*), @idOpcion = idOpcion from Opcion where idPregunta = @idPregunta and nombre = @nombre group by idOpcion
	select @contOpcion = COUNT(*) from Opcion where idPregunta = @idPregunta

	BEGIN TRY  
		if(@contNombre > 0)
		begin 

			Update Opcion set nombre = @nombre where idOpcion = @idOpcion and idPregunta = @idPregunta
			set @info = CONCAT('Registro editado satisfactoriamente, id creado: ',@idOpcion)
			set @error = 0

		end
		else
		begin
			
			if(@contOpcion < 4)
			begin
				
				Insert into Opcion(nombre, correcta, idPregunta) values
				(NULLIF(@nombre, ''),
				@correcta,
				@idPregunta);

				set @info = CONCAT('Registro creado satisfactoriamente, id creado: ',SCOPE_IDENTITY())
				set @error = 0

			end
			else
			begin
				set @info = CONCAT('Maximo cuatro opciones, id creado: ',0)
				set @error = 1
			end

		end

		

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Pregunta]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Pregunta] 
	
	@nombre varchar(150),
	@idSala int,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;	
	declare @contNombre int = 0, @idPregunta int = 0 	
	select @contNombre = COUNT(*), @idPregunta = idPregunta from Pregunta where idSala = @idSala and nombre = @nombre group by idPregunta

	BEGIN TRY
		if(@contNombre > 0)
		begin 
			
			Update Pregunta set nombre = @nombre where idPregunta = @idPregunta and idSala = @idSala
			set @info = CONCAT('Registro editado satisfactoriamente, idPregunta: ',@idPregunta)
			set @error = 0
						
		end
		else
		begin
			
			Insert into Pregunta(nombre, idSala) values
			(NULLIF(@nombre, ''),
			@idSala);

			set @info = CONCAT('Registro creado satisfactoriamente, idPregunta: ',SCOPE_IDENTITY())
			set @error = 0

		end				

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Sala]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Sala] 
	
	@nombre varchar(40),			
	@imagen varchar(60),
	@descripcion varchar(200),
	@idModoJuego int,	
	@tiempoXpregunta int,
	@fechaCierre datetime,
	@fechaCierreLondon datetime,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;

	Declare @contNombre int = 0
	Select @contNombre = COUNT(*) from Sala where nombre = @nombre

	if(@tiempoXpregunta < 15)
	begin
		set @tiempoXpregunta = 15
	end

	if(@contNombre > 0)
	begin
		
		set @info = 'El Nombre de la sala ya esta registrado'
		set @error = 1

	end
	else
	begin

		BEGIN TRY  
			Insert into Sala (nombre, imagen, descripcion, idModoJuego, estado, tiempoXpreg, fecha_activacion, fechaCierre, fechaCierreLondon) values
			(NULLIF(@nombre, ''),
			NULLIF(@imagen, ''),
			NULLIF(@descripcion, ''),		
			@idModoJuego,
			0,
			@tiempoXpregunta,
			'1800-01-01 00:00:00',
			NULLIF(@fechaCierre, ''),
			NULLIF(@fechaCierreLondon, '')
			);

			set @info = CONCAT('Registro creado satisfactoriamente,',SCOPE_IDENTITY(),',',@nombre)
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;	

	end						

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_SalaJuego]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_SalaJuego] 
	
	@idSala int,
	@idJugador int,
	@iniciales varchar(5),	
	
	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;	

	declare @countJugador int = 0
	select @countJugador = COUNT(*) from SalaJuego where idSala = @idSala and idJugador = @idJugador

	BEGIN TRY  

		if(@countJugador > 0)
		begin

			update SalaJuego
			set posicion = 0, fecha_modificacion = GETDATE()
			where idSala = @idSala and idJugador = @idJugador

			set @info = 'Registro editado satisfactoriamente'
			set @error = 0

		end
		else
		begin

			insert into SalaJuego (idSala, idJugador, iniciales, posicion) values 
			(@idSala, @idJugador, @iniciales, 0)

			set @info = 'Registro creado satisfactoriamente'
			set @error = 0

		end			
		
	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_SalaReciente]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_SalaReciente] 
		
	@idSala int,		
	@idJugador int,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;	

	declare @contSala int = 0
	select @contSala = COUNT(*) from SalaReciente where idSala = @idSala and idJugador = @idJugador
	
		
	BEGIN TRY  
		if(@contSala > 0)
		begin 

			Update 
			SalaReciente set fecha_modificacion = GETDATE() 
			where idSala = @idSala and idJugador = @idJugador

			set @info = 'Registro editado satisfactoriamente'
			set @error = 0

		end
		else
		begin

			Insert into SalaReciente (idSala, idJugador) values
			(@idSala,@idJugador)

			set @info = 'Registro creado satisfactoriamente'
			set @error = 0

		end				

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;					

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Usuario]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Usuario] 
	
	@nombre varchar(60),
	@apellido varchar(15) = null,
	@correo varchar(60) = null,	
	@celular varchar(10) = null,	
	@empresa varchar(100) = null,	
	@clave varchar(20) = null,
	@foto varchar(50) = null,
	@idRol int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;

	Declare @contClave int = 0, @contCorreo int = 0, @contNombre int = 0, @idUsuario int = 0

	Select @contClave = COUNT(*) from Usuario where clave = @clave
	Select @contCorreo = COUNT(*), @idUsuario = idUsuario from Usuario where correo = @correo group by idUsuario		
	Select @contNombre = COUNT(*), @idUsuario = idUsuario from Usuario where nombre = @nombre group by idUsuario	


	if(len(@nombre) > 60)
	begin
		
		set @info = 'El nombre y apellido solo se permite máximo 60 caracteres incluyendo espacios en blanco, nombre'
		set @error = 1

	end
	else if(@contNombre > 0 or @contCorreo > 0)
	begin

		set @info = CONCAT('Usuario ya registrado, id:', @idUsuario)
		set @error = 0

	end
	else
	begin

		BEGIN TRY  
			Insert into Usuario (nombre, apellido, correo, celular, empresa, clave, foto, idRol) values
			(NULLIF(@nombre, ''),
			NULLIF(@apellido, ''),
			NULLIF(@correo, ''),
			NULLIF(@celular, ''),
			NULLIF(@empresa, ''),
			NULLIF(@clave, ''),
			NULLIF(@foto, ''),
			@idRol);

			set @idUsuario = SCOPE_IDENTITY()

			set @info = CONCAT('Registro creado satisfactoriamente, id:', @idUsuario)
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;

	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_C_Usuario_Sala]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Usuario_Sala] 
	
	@idUsuario int,
	@idSala int,
	@puntaje int,
	@tiempo int,
	
	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;		

	declare @contUsuarioSala int = 0
	select @contUsuarioSala = COUNT(*) from Usuario_Sala where idUsuario = @idUsuario and idSala = @idSala
	
	BEGIN TRY  
		if(@contUsuarioSala > 0)
		begin

			Update Usuario_Sala set 
			puntaje = @puntaje,
			tiempo = @tiempo,
			fecha_modificacion = GETDATE()
			where idUsuario = @idUsuario and idSala = @idSala

			set @info = 'Registro editado satisfactoriamente'
			set @error = 0

		end
		else
		begin
			
			Insert into Usuario_Sala (idUsuario, idSala, puntaje, tiempo) values
			(@idUsuario, @idSala, @puntaje, @tiempo)

			set @info = 'Registro creado satisfactoriamente'
			set @error = 0

		end		

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;					

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_D_OpcionByIdPregunta]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_D_OpcionByIdPregunta] 
	
	@idPregunta int,
	@idOpcion int,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;	

	Delete from Opcion 
	where idPregunta = @idPregunta and
	idOpcion > @idOpcion
	
	if(@@ROWCOUNT > 0)
	begin
		set @info = 'Registros eliminados satisfactoriamente'
	end
	else
	begin
		set @info = 'Ningún registro eliminado'
	end
	
	set @error = 0

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_D_Pregunta]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_D_Pregunta] 
	
	@idPregunta int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;
	
	declare @countIdPregunta int = 0, @idSala int = 0, @contPregunta int = 0
	select @countIdPregunta = COUNT(*), @idSala = idSala from Pregunta where idPregunta = @idPregunta  group by idSala		
	
	if(@countIdPregunta > 0)
	begin 

		BEGIN TRY
			Delete from Opcion
			where idPregunta = @idPregunta;

			Delete from Pregunta		
			where idPregunta = @idPregunta;

			set @info = 'Registro eliminado satisfactoriamente'
			set @error = 0

			select @contPregunta = COUNT(*) from Pregunta where idSala = @idSala

			if(@contPregunta < 5)
			begin
				Update Sala set estado = 0 where idSala = @idSala
			end

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;	

	end
	else
	begin		

		set @info = 'No se pudo eliminar'
		set @error = 1

	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_D_Sala]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_D_Sala] 
	
	@idSala int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;
	
	declare @countIdSala int = 0, @idPregunta int = 0, @nombre varchar(max), @oldImage varchar(max)
	select @countIdSala = COUNT(*) from Sala where idSala = @idSala		
	select @nombre = nombre, @oldImage = ISNULL(imagen, 'N/A') from Sala where idSala = @idSala	

	if(@countIdSala > 0)
	begin 

		BEGIN TRY
			-- INICIO CURSOR			
			DECLARE cur_pregunta CURSOR FOR 
			select idPregunta from Pregunta where idSala = @idSala
			OPEN cur_pregunta
			FETCH NEXT FROM cur_pregunta INTO @idPregunta
			WHILE @@fetch_status = 0
			BEGIN
				--PRINT @idPregunta
				Delete from Opcion where idPregunta = @idPregunta;

				FETCH NEXT FROM cur_pregunta INTO @idPregunta
			END
			CLOSE cur_pregunta
			DEALLOCATE cur_pregunta
			-- FIN CURSOR			

			Delete from Pregunta		
			where idSala = @idSala;

			Delete from SalaReciente
			where idSala = @idSala;

			Delete from Usuario_Sala
			where idSala = @idSala;

			Delete from SalaJuego
			where idSala = @idSala;			

			Delete from Complemento
			where idSala = @idSala;

			Delete from Sala
			where idSala = @idSala
			

			set @info = CONCAT('Registro eliminado satisfactoriamente, old_Image:',@oldImage,':',@nombre)
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;	

	end
	else
	begin		

		set @info = 'No se pudo eliminar'
		set @error = 1

	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_D_Usuario]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_D_Usuario] 
	
	@idUsuario int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;
	
	declare @countIdUsuario int = 0, @idRol int = 0, @contAdmins int = 0
	select @countIdUsuario = COUNT(*) from Usuario where idUsuario = @idUsuario
	select @idRol = idRol from Usuario where idUsuario = @idUsuario	

	if(@countIdUsuario > 0)
	begin 
		
		if(@idRol = 1 or @idRol = 3)
		begin
			select @contAdmins = COUNT(*) from Usuario where (idRol = 1 or idRol = 3) and idUsuario <> @idUsuario

			if(@contAdmins = 0)
			begin
				set @info = 'No se puede eliminar el usuario porque solo queda un administrador o superadministrador'
				set @error = 1

				print @info

				RETURN
			end
		end		

		BEGIN TRY								

			Delete from SalaJuego
			where idJugador = @idUsuario;

			Delete from SalaReciente
			where idJugador = @idUsuario;

			Delete from Usuario_Sala
			where idUsuario = @idUsuario;

			Delete from Usuario
			where idUsuario = @idUsuario;			
			
			set @info = 'Registro eliminado satisfactoriamente'
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;	

	end
	else
	begin		

		set @info = 'No se pudo eliminar'
		set @error = 1

	end	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_D_Usuario_Sala]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_D_Usuario_Sala] 

	@idSala int,	
	
	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;			

	declare @contIdSala int = 0
	select @contIdSala = COUNT(*) from Usuario_Sala where idSala = @idSala
	
	BEGIN TRY  
		if(@contIdSala > 0)
		begin
			
			Delete from Usuario_Sala where idSala = @idSala

			Delete from SalaJuego where idSala = @idSala

			set @info = 'Registro eliminado satisfactoriamente'
			set @error = 0

		end
		else
		begin						

			set @info = 'La sala no tiene ranking'
			set @error = 2

		end		

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;					

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_Complemento]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_Complemento] 
		
	@idCom int,	
	@viendoIzq varchar(50),
	@viendoDer varchar(50),
	@color1 varchar(20),
	@color2 varchar(20),
	@plat1 varchar(50),
	@plat2 varchar(50),
	@plat3 varchar(50),
	@plat4 varchar(50),
	@dec1 varchar(50),
	@dec2 varchar(50),
	@dec3 varchar(50),
	@dec4 varchar(50),
	@objCie1 varchar(50),
	@objCie2 varchar(50),
	@objFon1 varchar(50),
	@objFon2 varchar(50),
	@objFon3 varchar(50),
	@objFon4 varchar(50),
	@objFonMov varchar(50),
	@objFinal varchar(50),
	@sonido varchar(50),

	@isDecoration int,
	@isSkyObjects int,
	@isBackgroundObjects int,
	@isFinalObject int,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;			

	declare @contCom int = 0
	select @contCom = COUNT(*) from Complemento where idCom = @idCom

	if(@contCom = 0)
	begin
		
		set @info = 'No existe el complemento'
		set @error = 1

	end
	else 
	begin

		BEGIN TRY  
		
			Update Complemento set
			viendoIzquierda = case @viendoIzq when '' then viendoIzquierda else @viendoIzq end,
			viendoDerecha = case @viendoDer when '' then viendoDerecha else @viendoDer end,
			color1 = case @color1 when '' then color1 else @color1 end,
			color2 = case @color2 when '' then color2 else @color2 end,
			plataforma1 = case @plat1 when '' then plataforma1 else @plat1 end,
			plataforma2 = case @plat2 when '' then plataforma2 else @plat2 end,
			plataforma3 = case @plat3 when '' then plataforma3 else @plat3 end,
			plataforma4 = case @plat4 when '' then plataforma4 else @plat4 end,

			decoracion1 = case @dec1 when '' then decoracion1 else @dec1 end,
			decoracion2 = case @dec2 when '' then decoracion2 else @dec2 end,
			decoracion3 = case @dec3 when '' then decoracion3 else @dec3 end,
			decoracion4 = case @dec4 when '' then decoracion4 else @dec4 end,

			objetoCielo1 = case @objCie1 when '' then objetoCielo1 else @objCie1 end,
			objetoCielo2 = case @objCie2 when '' then objetoCielo2 else @objCie2 end,

			objetoFondo1 = case @objFon1 when '' then objetoFondo1 else @objFon1 end,
			objetoFondo2 = case @objFon2 when '' then objetoFondo2 else @objFon2 end,
			objetoFondo3 = case @objFon3 when '' then objetoFondo3 else @objFon3 end,
			objetoFondo4 = case @objFon4 when '' then objetoFondo4 else @objFon4 end,

			objetoFondoMovil = case @objFonMov when '' then objetoFondoMovil else @objFonMov end,
			objetoFinal = case @objFinal when '' then objetoFinal else @objFinal end,
			sonido = case @sonido when '' then sonido else @sonido end,	

			isDecoration = case @isDecoration when '' then 0 else @isDecoration end,	
			isSkyObjects = case @isSkyObjects when '' then 0 else @isSkyObjects end,	
			isBackgroundObjects = case @isBackgroundObjects when '' then 0 else @isBackgroundObjects end,	
			isFinalObject = case @isFinalObject when '' then 0 else @isFinalObject end,	

			fecha_modificacion = GETDATE()
			where idCom = @idCom		

			set @info = 'Registro editado satisfactoriamente'
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;	

	end						

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_Opcion]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_Opcion] 
	
	@idOpcion int,
	@nombre varchar(150),
	@correcta int,	
	@idPregunta int,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;	
	declare @contIdOpcion int = 0, @info_C_opcion varchar(max), @error_C_opcion int
	select @contIdOpcion = COUNT(*) from Opcion where idOpcion = @idOpcion

	if(@contIdOpcion > 0)
	begin
		
		BEGIN TRY  
			Update Opcion set 
			nombre = NULLIF(@nombre, ''),
			correcta = @correcta,			
			fecha_modificacion = GETDATE()
			where idOpcion = @idOpcion

			set @info = CONCAT('Registro editado satisfactoriamente, id editado: ',@idOpcion)
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;

		print @info
	end
	else
	begin
		
		exec sp_C_Opcion	
		@nombre = @nombre,	
		@correcta = @correcta,	
		@idPregunta = @idPregunta,	
		@info = @info_C_opcion output,
		@error = @error_C_opcion output
		
		set @info = @info_C_opcion
		set @error = @error_C_opcion

	end		
	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_Pregunta]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_Pregunta] 
	
	@idPregunta int,
	@nombre varchar(150),	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;		

	BEGIN TRY  
		Update Pregunta set 
		nombre = NULLIF(@nombre, ''),		
		fecha_modificacion = GETDATE()
		where idPregunta = @idPregunta;

		set @info = 'Registro editado satisfactoriamente'
		set @error = 0

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;	

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_Sala]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_Sala] 
	
	@idSala int,
	@nombre varchar(40),
	@imagen varchar(60),
	@descripcion varchar(200),
	@idModoJuego int,
	@tiempoXpregunta int,
	@fechaCierre datetime,
	@fechaCierreLondon datetime,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;
	
	declare @contIdSala int = 0, @oldImage varchar(50) = 'N/A'	
	select @contIdSala = COUNT(*), @oldImage = ISNULL(imagen, 'N/A') from Sala where idSala = @idSala group by imagen

	if(@tiempoXpregunta < 15)
	begin
		set @tiempoXpregunta = 15
	end
	
	if(@contIdSala > 0)
	begin
		BEGIN TRY  
			Update Sala set 
			nombre = NULLIF(@nombre, ''),
			imagen = case @imagen when '' then imagen else @imagen end,
			descripcion = NULLIF(@descripcion, ''),		
			idModoJuego = @idModoJuego,
			tiempoXpreg = @tiempoXpregunta,
			fechaCierre = NULLIF(@fechaCierre, ''),
			fechaCierreLondon = NULLIF(@fechaCierreLondon, ''),			
			fecha_modificacion = GETDATE()
			where idSala = @idSala		

			set @info = 'Registro editado satisfactoriamente, old_image: '+@oldImage
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;
	end
	else
	begin
		set @info = 'No se encontró el id de la Sala'
		set @error = 1
	end						

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_SalaByEstado]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_SalaByEstado] 
	
	@idSala int,
	@estado int,
	@fechaActivacion datetime,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;
	
	declare @contIdSala int = 0
	select @contIdSala = COUNT(*) from Sala where idSala = @idSala
	
	if(@contIdSala > 0)
	begin
		BEGIN TRY  

			if(@estado > 0)
			begin

				Update Sala set 
				estado = @estado,			
				fecha_modificacion = GETDATE(),
				fecha_activacion = @fechaActivacion
				where idSala = @idSala	

			end
			else
			begin

				Update Sala set 
				estado = @estado,			
				fecha_modificacion = GETDATE()				
				where idSala = @idSala


				Delete from SalaJuego
				where idSala = @idSala

			end
				

			set @info = 'Registro editado satisfactoriamente'
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;
	end
	else
	begin
		set @info = 'No se encontró el id de la Sala'
		set @error = 1
	end						

	print @info

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_SalaJuego]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_SalaJuego] 
	
	@idSala int,
	@idJugador int,
	@estadoJuego int,

	@info varchar(max) output,
	@error int output
AS
BEGIN	

	SET NOCOUNT ON;	

	declare @posicion int = 0
	select @posicion = posicion from SalaJuego where idSala = @idSala	and idJugador = @idJugador

	if(@estadoJuego > 0)
	begin
		set @posicion += 1	
	end	

	BEGIN TRY  
		Update SalaJuego set 
		posicion = @posicion, 
		estadoJuego = @estadoJuego,
		fecha_modificacion = GETDATE()
		where idSala = @idSala and
		idJugador = @idJugador			   		

		set @info = 'Registro editado satisfactoriamente'
		set @error = 0

	END TRY
	BEGIN CATCH	

		set @info = ERROR_MESSAGE()
		set @error = 1

	END CATCH;

	print @info
	

END
GO
/****** Object:  StoredProcedure [dbo].[sp_U_Usuario]    Script Date: 16/05/2024 17:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_Usuario] 
	
	@idUsuario int, 
	@nombre varchar(60),
	@apellido varchar(15) = null,
	@correo varchar(60),
	@celular varchar(10),
	@empresa varchar(100) = null,
	@clave varchar(20),
	@foto varchar(50) = null,
	@idRol int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;

	Declare @contCorreo int = 0, @contCelular int = 0, @auxIdRol int = 0, @contAdmins int = 0

	Select @contCelular = COUNT(*) from Usuario where celular = @celular and idUsuario <> @idUsuario
	Select @contCorreo = COUNT(*) from Usuario where correo = @correo and idUsuario <> @idUsuario	
	Select @auxIdRol = idRol from Usuario where idUsuario = @idUsuario		

	if(@contCelular > 0)
	begin
		set @info = 'El celular ya esta registrado, celular'
		set @error = 1
	end
	else if(@contCorreo > 0)
	begin 
		set @info = 'El correo electornico ya esta registrado, correo'
		set @error = 1
	end	
	else
	begin

		if((@auxIdRol = 1 or @auxIdRol = 3) and @idRol = 2)
		begin
			select @contAdmins = COUNT(*) from Usuario where (idRol = 1 or idRol = 3) and idUsuario <> @idUsuario

			if(@contAdmins = 0)
			begin
				set @info = 'No se puede editar el usuario porque solo queda un administrador o superadministrador'
				set @error = 1

				print @info

				RETURN
			end
		end	
		
		BEGIN TRY  
			Update Usuario set 
			nombre = NULLIF(@nombre, ''),
			apellido = NULLIF(@apellido, ''),
			correo = NULLIF(@correo, ''),
			celular = NULLIF(@celular, ''),
			empresa = NULLIF(@empresa, ''),
			clave = NULLIF(@clave, ''),
			foto = NULLIF(@foto, ''),
			idRol = @idRol,
			fecha_modificacion = GETDATE()
			where idUsuario = @idUsuario

			set @info = 'Registro editado satisfactoriamente'
			set @error = 0

		END TRY
		BEGIN CATCH	

			set @info = ERROR_MESSAGE()
			set @error = 1

		END CATCH;				

	end

	print @info

END
GO
