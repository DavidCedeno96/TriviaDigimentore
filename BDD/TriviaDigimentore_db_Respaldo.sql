USE [TriviaDigimentore_db]
GO
/****** Object:  Table [dbo].[ModoJuego]    Script Date: 12/01/2024 14:39:24 ******/
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
/****** Object:  Table [dbo].[Opcion]    Script Date: 12/01/2024 14:39:24 ******/
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
/****** Object:  Table [dbo].[Pregunta]    Script Date: 12/01/2024 14:39:24 ******/
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
/****** Object:  Table [dbo].[pruebas]    Script Date: 12/01/2024 14:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pruebas](
	[id] [int] NULL,
	[texto] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 12/01/2024 14:39:24 ******/
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
/****** Object:  Table [dbo].[Sala]    Script Date: 12/01/2024 14:39:24 ******/
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
PRIMARY KEY CLUSTERED 
(
	[idSala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaJuego]    Script Date: 12/01/2024 14:39:24 ******/
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
/****** Object:  Table [dbo].[SalaReciente]    Script Date: 12/01/2024 14:39:24 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/01/2024 14:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[apellido] [varchar](15) NULL,
	[correo] [varchar](50) NULL,
	[clave] [varchar](20) NULL,
	[foto] [varchar](50) NULL,
	[idRol] [int] NOT NULL,
	[estado] [int] NULL,
	[fecha_creacion] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[celular] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Sala]    Script Date: 12/01/2024 14:39:24 ******/
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
SET IDENTITY_INSERT [dbo].[ModoJuego] ON 
GO
INSERT [dbo].[ModoJuego] ([idModoJuego], [nombre], [imagen], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (1, N'Challenger', N'img1.jpg', 1, CAST(N'2024-01-08T14:32:47.390' AS DateTime), CAST(N'2024-01-08T14:32:47.390' AS DateTime))
GO
INSERT [dbo].[ModoJuego] ([idModoJuego], [nombre], [imagen], [estado], [fecha_creacion], [fecha_modificacion]) VALUES (2, N'Supervivencia', N'img2.jpg', 1, CAST(N'2024-01-08T14:32:47.390' AS DateTime), CAST(N'2024-01-08T14:32:47.390' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ModoJuego] OFF
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
INSERT [dbo].[Sala] ([idSala], [nombre], [imagen], [descripcion], [idModoJuego], [estado], [fecha_creacion], [fecha_modificacion], [fecha_activacion]) VALUES (1, N'Sala 1', N'ofimatica-en-la-nube-tecnooffice.png', N'desc de sala 1', 1, 0, CAST(N'2024-01-12T11:37:16.350' AS DateTime), CAST(N'2024-01-12T11:37:16.350' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Sala] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular]) VALUES (1, N'admin', NULL, NULL, N'admin', NULL, 1, 1, CAST(N'2024-01-08T14:34:20.430' AS DateTime), CAST(N'2024-01-08T14:34:20.430' AS DateTime), NULL)
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular]) VALUES (2, N'sadmin', NULL, NULL, N'admin', NULL, 3, 1, CAST(N'2024-01-08T14:34:34.573' AS DateTime), CAST(N'2024-01-08T14:34:34.573' AS DateTime), NULL)
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular]) VALUES (3, N'Rita Lasso', NULL, N'rita@correo.com', N'User.2023', NULL, 2, 1, CAST(N'2024-01-12T14:08:56.163' AS DateTime), CAST(N'2024-01-12T14:31:02.440' AS DateTime), N'0992736250')
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [apellido], [correo], [clave], [foto], [idRol], [estado], [fecha_creacion], [fecha_modificacion], [celular]) VALUES (4, N'Benito Camelas', NULL, N'benito@correo.com', N'User2.2023', NULL, 2, 1, CAST(N'2024-01-12T14:36:30.360' AS DateTime), CAST(N'2024-01-12T14:36:30.360' AS DateTime), N'0995478414')
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
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
/****** Object:  StoredProcedure [dbo].[sp_B_OpcionByIdPregunta]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_Pregunta]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_PreguntaById]    Script Date: 12/01/2024 14:39:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_B_PreguntaById]	
	
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
	
			Select * from Pregunta
			where estado > 0 and idPregunta = @idPregunta
			order by idPregunta desc		
		
		end
		else
		begin 

			Select * from Pregunta	
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
/****** Object:  StoredProcedure [dbo].[sp_B_PreguntaByIdSala]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_Rol]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_Sala]    Script Date: 12/01/2024 14:39:25 ******/
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
		s.fecha_creacion,
		s.fecha_modificacion,
		s.fecha_activacion
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
		s.fecha_creacion,
		s.fecha_modificacion,
		s.fecha_activacion
		from Sala s inner join ModoJuego mj
		on s.idModoJuego = mj.idModoJuego	
		order by s.idSala desc
	end

END
GO
/****** Object:  StoredProcedure [dbo].[sp_B_SalaByAll]    Script Date: 12/01/2024 14:39:25 ******/
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
		s.fecha_creacion,
		s.fecha_modificacion,
		s.fecha_activacion
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
		s.fecha_creacion,
		s.fecha_modificacion,
		s.fecha_activacion
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
/****** Object:  StoredProcedure [dbo].[sp_B_SalaById]    Script Date: 12/01/2024 14:39:25 ******/
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
			@cantJugadas as 'cantJugadas',
			s.fecha_creacion,
			s.fecha_modificacion,
			s.fecha_activacion
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
			@cantJugadas as 'cantJugadas',
			s.fecha_creacion,
			s.fecha_modificacion,
			s.fecha_activacion
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
/****** Object:  StoredProcedure [dbo].[sp_B_SalaJuego]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_SalaJuegoByIds]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_SalaReciente]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_Usuario]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_Usuario_Sala]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_Usuario_SalaByIdSala]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_UsuarioByAll]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_UsuarioById]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_B_UsuarioLogin]    Script Date: 12/01/2024 14:39:25 ******/
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
	nombre = @nombre --COLLATE SQL_Latin1_General_CP1_CS_AS
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
			where u.nombre = @nombre and u.clave = @clave and u.estado > 0	

			set @info = 'Usuario encontrado por Login normal'
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
/****** Object:  StoredProcedure [dbo].[sp_C_Opcion]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_C_Pregunta]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_C_Sala]    Script Date: 12/01/2024 14:39:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Sala] 
	
	@nombre varchar(20),			
	@imagen varchar(50),
	@descripcion varchar(200),
	@idModoJuego int,		

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;
		
	BEGIN TRY  
		Insert into Sala (nombre, imagen, descripcion, idModoJuego, estado, fecha_activacion) values
		(NULLIF(@nombre, ''),
		NULLIF(@imagen, ''),
		NULLIF(@descripcion, ''),		
		@idModoJuego,
		0,
		'1800-01-01 00:00:00');

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
/****** Object:  StoredProcedure [dbo].[sp_C_SalaJuego]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_C_SalaReciente]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_C_Usuario]    Script Date: 12/01/2024 14:39:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_C_Usuario] 
	
	@nombre varchar(60),
	@apellido varchar(15) = null,
	@correo varchar(50) = null,
	@celular varchar(10),
	@clave varchar(20),
	@foto varchar(50) = null,
	@idRol int,	

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;

	Declare @contCelular int = 0, @contCorreo int = 0	

	Select @contCelular = COUNT(*) from Usuario where celular = @celular
	Select @contCorreo = COUNT(*) from Usuario where correo = @correo	

	if(@contCelular > 0)
	begin
		
		set @info = 'El Celular ya está registrado, celular'
		set @error = 1

	end
	else if((@correo <> '' or @correo <> null) and @contCorreo > 0)
	begin
		
		set @info = 'El Correo ya está registrado, correo'
		set @error = 1

	end
	else if(len(@nombre) > 60)
	begin
		
		set @info = 'El nombre y apellido solo se permite máximo 60 caracteres incluyendo espacios en blanco, nombre'
		set @error = 1

	end
	else
	begin

		BEGIN TRY  
			Insert into Usuario (nombre, apellido, correo, celular, clave, foto, idRol) values
			(NULLIF(@nombre, ''),
			NULLIF(@apellido, ''),
			NULLIF(@correo, ''),
			NULLIF(@celular, ''),
			@clave,
			NULLIF(@foto, ''),
			@idRol);

			set @info = 'Registro creado satisfactoriamente'
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
/****** Object:  StoredProcedure [dbo].[sp_C_Usuario_Sala]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_D_OpcionByIdPregunta]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_D_Pregunta]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_D_Sala]    Script Date: 12/01/2024 14:39:25 ******/
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
	
	declare @countIdSala int = 0, @idPregunta int = 0
	select @countIdSala = COUNT(*) from Sala where idSala = @idSala	

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

			Delete from Sala
			where idSala = @idSala
			

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
/****** Object:  StoredProcedure [dbo].[sp_D_Usuario]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_D_Usuario_Sala]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_U_Opcion]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_U_Pregunta]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_U_Sala]    Script Date: 12/01/2024 14:39:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_Sala] 
	
	@idSala int,
	@nombre varchar(20),
	@imagen varchar(50),
	@descripcion varchar(200),
	@idModoJuego int,

	@info varchar(max) output,
	@error int output
AS
BEGIN		

	SET NOCOUNT ON;
	
	declare @contIdSala int = 0, @oldImage varchar(50) = 'N/A'	
	select @contIdSala = COUNT(*), @oldImage = ISNULL(imagen, 'N/A') from Sala where idSala = @idSala group by imagen
	
	if(@contIdSala > 0)
	begin
		BEGIN TRY  
			Update Sala set 
			nombre = NULLIF(@nombre, ''),
			imagen = case @imagen when '' then imagen else @imagen end,
			descripcion = NULLIF(@descripcion, ''),		
			idModoJuego = @idModoJuego,
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
/****** Object:  StoredProcedure [dbo].[sp_U_SalaByEstado]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_U_SalaJuego]    Script Date: 12/01/2024 14:39:25 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_U_Usuario]    Script Date: 12/01/2024 14:39:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_U_Usuario] 
	
	@idUsuario int, 
	@nombre varchar(60),
	@apellido varchar(15) = null,
	@correo varchar(50),
	@celular varchar(10),
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
