use TriviaDigimentore_db

create table Rol(
	idRol int identity(1,1) primary key,
	nombre varchar(20) not null,
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

create table Usuario(
	idUsuario int identity(1,1) primary key,
	nombre varchar(60) not null,
	apellido varchar(15),
	correo varchar(60),
	clave varchar(20) CHECK (clave <> ''),
	foto varchar(50),
	idRol int references Rol(idRol) not null,	
	celular varchar(10),
	empresa varchar(100),
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

create table ModoJuego(
	idModoJuego int identity(1,1) primary key,
	nombre varchar(15) not null,
	imagen varchar(50),
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

create table Sala(
	idSala int identity(1,1) primary key,
	nombre varchar(40) not null,
	imagen varchar(50),
	descripcion varchar(200),
	idModoJuego int references ModoJuego(idModoJuego) not null,
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
	fecha_activacion datetime,
	fechaCierre datetime NOT NULL,
	fechaCierreLondon datetime NOT NULL,
	tiempoXpreg int default 20 NOT NULL
);

create table Usuario_Sala(
	idUsuario int references Usuario(idUsuario) not null,
	idSala int references Sala(idSala) not null,
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
	puntaje int default 0,
	tiempo int default 0
);

create table Pregunta(
	idPregunta int identity(1,1) primary key,
	nombre varchar(150) not null,
	idSala int references Sala(idSala) not null,
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

create table Opcion(
	idOpcion int identity(1,1) primary key,
	nombre varchar(150) not null,
	correcta int not null,
	idPregunta int references Pregunta(idPregunta) not null,
	estado int default 1,
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

---------------------------
create table SalaJuego( -- este es para las posiciones durante el juego challenger
	idSala int,
	idJugador int,
	iniciales varchar(5),
	posicion int,

	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

create table SalaReciente( -- este es para las salas recientes visitadas
	idSala int,
	idJugador int,

	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
);

-----------------------------------------------------------------
-- Complementos => Colores, gráfica y sonido del juego
create table Complemento(
	idCom int identity(1,1) primary key,
	idSala int references Sala(idSala) not null,
	viendoIzquierda varchar(50),
	viendoDerecha varchar(50),
	color1 varchar(20),
	color2 varchar(20),
	plataforma1 varchar(50),
	plataforma2 varchar(50),
	plataforma3 varchar(50),
	plataforma4 varchar(50),
	decoracion1 varchar(50),
	decoracion2 varchar(50),
	decoracion3 varchar(50),
	decoracion4 varchar(50),
	objetoCielo1 varchar(50),
	objetoCielo2 varchar(50),
	objetoFondo1 varchar(50),
	objetoFondo2 varchar(50),
	objetoFondo3 varchar(50),
	objetoFondo4 varchar(50),
	objetoFondoMovil varchar(50),
	objetoFinal varchar(50),
	sonido varchar(50),
	fecha_creacion datetime default getdate(),
	fecha_modificacion datetime default getdate(),
	isDecoration int,
	isSkyObjects int,
	isBackgroundObjects int,
	isFinalObject int
);