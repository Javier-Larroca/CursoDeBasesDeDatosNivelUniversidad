use master
create database [MundoPokemon_DB]
go
use [MundoPokemon_DB]
go
USE [MundoPokemon_DB]
GO

/****** Object:  Table [dbo].[Elementos]    Script Date: 5/10/2024 10:23:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Elementos](
	[Id] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Elementos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [MundoPokemon_DB]
GO

/****** Object:  Table [dbo].[Habilidades]    Script Date: 5/10/2024 10:24:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Habilidades](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](250) NULL,
	[IdTipo] [int] NOT NULL,
 CONSTRAINT [PK_Habilidades] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Habilidades]  WITH CHECK ADD  CONSTRAINT [FK_Habilidades_Tipo] FOREIGN KEY([IdTipo])
REFERENCES [dbo].[Elementos] ([Id])
GO

ALTER TABLE [dbo].[Habilidades] CHECK CONSTRAINT [FK_Habilidades_Tipo]
GO

USE [MundoPokemon_DB]
GO

/****** Object:  Table [dbo].[Pokemons]    Script Date: 5/10/2024 10:24:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pokemons](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Numero] [int] NULL,
	[Bio] [varchar](250) NULL,
	[Altura] [float] NULL,
	[Peso] [float] NULL,
	[ImagenUrl] [varchar](500) NULL,
	[IdEvolucion] [int] NULL,
 CONSTRAINT [PK_Pokemons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pokemons]  WITH CHECK ADD  CONSTRAINT [FK_Pokemons_Pokemons] FOREIGN KEY([IdEvolucion])
REFERENCES [dbo].[Pokemons] ([Id])
GO

ALTER TABLE [dbo].[Pokemons] CHECK CONSTRAINT [FK_Pokemons_Pokemons]
GO

USE [MundoPokemon_DB]
GO

/****** Object:  Table [dbo].[Pokemons.Tipos]    Script Date: 5/10/2024 10:25:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pokemons.Tipos](
	[Id] [int] NOT NULL,
	[IdPokemon] [int] NULL,
	[IdElemento] [int] NULL,
 CONSTRAINT [PK_Pokemons.Tipos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pokemons.Tipos]  WITH CHECK ADD  CONSTRAINT [FK_Pokemons.Tipos_Elementos] FOREIGN KEY([IdElemento])
REFERENCES [dbo].[Elementos] ([Id])
GO

ALTER TABLE [dbo].[Pokemons.Tipos] CHECK CONSTRAINT [FK_Pokemons.Tipos_Elementos]
GO

ALTER TABLE [dbo].[Pokemons.Tipos]  WITH CHECK ADD  CONSTRAINT [FK_Pokemons.Tipos_Pokemons] FOREIGN KEY([IdPokemon])
REFERENCES [dbo].[Pokemons] ([Id])
GO

ALTER TABLE [dbo].[Pokemons.Tipos] CHECK CONSTRAINT [FK_Pokemons.Tipos_Pokemons]
GO

USE [MundoPokemon_DB]
GO

/****** Object:  Table [dbo].[Pokemons.Debilidades]    Script Date: 5/10/2024 10:25:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pokemons.Debilidades](
	[Id] [int] NOT NULL,
	[IdPokemon] [int] NULL,
	[IdElemento] [int] NULL,
 CONSTRAINT [PK_Pokemons.Debilidades] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pokemons.Debilidades]  WITH CHECK ADD  CONSTRAINT [FK_Pokemons.Debilidades_Elementos] FOREIGN KEY([IdElemento])
REFERENCES [dbo].[Elementos] ([Id])
GO

ALTER TABLE [dbo].[Pokemons.Debilidades] CHECK CONSTRAINT [FK_Pokemons.Debilidades_Elementos]
GO

ALTER TABLE [dbo].[Pokemons.Debilidades]  WITH CHECK ADD  CONSTRAINT [FK_Pokemons.Debilidades_Pokemons] FOREIGN KEY([IdPokemon])
REFERENCES [dbo].[Pokemons] ([Id])
GO

ALTER TABLE [dbo].[Pokemons.Debilidades] CHECK CONSTRAINT [FK_Pokemons.Debilidades_Pokemons]
GO

USE [MundoPokemon_DB]
GO

/****** Object:  Table [dbo].[Pokemons.Habilidades]    Script Date: 5/10/2024 10:25:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pokemons.Habilidades](
	[Id] [int] NOT NULL,
	[IdPokemon] [int] NULL,
	[IdHabilidad] [int] NULL,
 CONSTRAINT [PK_Pokemons.Habilidades] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pokemons.Habilidades]  WITH CHECK ADD  CONSTRAINT [FK_Pokemons.Habilidades_Habilidades] FOREIGN KEY([IdHabilidad])
REFERENCES [dbo].[Habilidades] ([Id])
GO

ALTER TABLE [dbo].[Pokemons.Habilidades] CHECK CONSTRAINT [FK_Pokemons.Habilidades_Habilidades]
GO

ALTER TABLE [dbo].[Pokemons.Habilidades]  WITH CHECK ADD  CONSTRAINT [FK_Pokemons.Habilidades_Pokemons] FOREIGN KEY([IdPokemon])
REFERENCES [dbo].[Pokemons] ([Id])
GO

ALTER TABLE [dbo].[Pokemons.Habilidades] CHECK CONSTRAINT [FK_Pokemons.Habilidades_Pokemons]
GO

USE [MundoPokemon_DB]
GO

/****** Object:  Table [dbo].[Evoluciones.Variables]    Script Date: 5/10/2024 10:26:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Evoluciones.Variables](
	[Id] [int] NOT NULL,
	[IdEvolucion] [int] NULL,
	[IdPokemon] [int] NULL,
 CONSTRAINT [PK_Evoluciones.Variables] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Evoluciones.Variables]  WITH CHECK ADD  CONSTRAINT [FK_Evoluciones.Variables_Pokemons] FOREIGN KEY([IdPokemon])
REFERENCES [dbo].[Pokemons] ([Id])
GO

ALTER TABLE [dbo].[Evoluciones.Variables] CHECK CONSTRAINT [FK_Evoluciones.Variables_Pokemons]
GO

ALTER TABLE [dbo].[Evoluciones.Variables]  WITH CHECK ADD  CONSTRAINT [FK_Evoluciones.Variables_Pokemons1] FOREIGN KEY([IdEvolucion])
REFERENCES [dbo].[Pokemons] ([Id])
GO

ALTER TABLE [dbo].[Evoluciones.Variables] CHECK CONSTRAINT [FK_Evoluciones.Variables_Pokemons1]
GO

USE [MundoPokemon_DB]
GO

/****** Object:  Table [dbo].[Entrenadores]    Script Date: 5/10/2024 10:26:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Entrenadores](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[NickName] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Clave] [varchar](25) NULL,
	[FechaNacimiento] [date] NULL,
 CONSTRAINT [PK_Entrenadores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [MundoPokemon_DB]
GO

/****** Object:  Table [dbo].[Medallas]    Script Date: 5/10/2024 10:27:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Medallas](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ImagenUrl] [varchar](500) NULL,
 CONSTRAINT [PK_Medallas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [MundoPokemon_DB]
GO

/****** Object:  Table [dbo].[Entrenadores.Medallas]    Script Date: 5/10/2024 10:27:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Entrenadores.Medallas](
	[Id] [int] NOT NULL,
	[IdEntrenador] [int] NULL,
	[IdMedalla] [int] NULL,
	[FechaObtencion] [date] NULL,
 CONSTRAINT [PK_Entrenadores.Medallas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Entrenadores.Medallas]  WITH CHECK ADD  CONSTRAINT [FK_Entrenadores.Medallas_Entrenadores] FOREIGN KEY([IdEntrenador])
REFERENCES [dbo].[Entrenadores] ([Id])
GO

ALTER TABLE [dbo].[Entrenadores.Medallas] CHECK CONSTRAINT [FK_Entrenadores.Medallas_Entrenadores]
GO

ALTER TABLE [dbo].[Entrenadores.Medallas]  WITH CHECK ADD  CONSTRAINT [FK_Entrenadores.Medallas_Medallas] FOREIGN KEY([IdMedalla])
REFERENCES [dbo].[Medallas] ([Id])
GO

ALTER TABLE [dbo].[Entrenadores.Medallas] CHECK CONSTRAINT [FK_Entrenadores.Medallas_Medallas]
GO

USE [MundoPokemon_DB]
GO

/****** Object:  Table [dbo].[Entrenadores.Pokemons]    Script Date: 5/10/2024 10:27:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Entrenadores.Pokemons](
	[Id] [int] NOT NULL,
	[IdEntrenador] [int] NULL,
	[IdPokemon] [int] NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Entrenadores.Pokemons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Entrenadores.Pokemons]  WITH CHECK ADD  CONSTRAINT [FK_Entrenadores.Pokemons_Entrenadores] FOREIGN KEY([IdEntrenador])
REFERENCES [dbo].[Entrenadores] ([Id])
GO

ALTER TABLE [dbo].[Entrenadores.Pokemons] CHECK CONSTRAINT [FK_Entrenadores.Pokemons_Entrenadores]
GO

ALTER TABLE [dbo].[Entrenadores.Pokemons]  WITH CHECK ADD  CONSTRAINT [FK_Entrenadores.Pokemons_Pokemons] FOREIGN KEY([IdPokemon])
REFERENCES [dbo].[Pokemons] ([Id])
GO

ALTER TABLE [dbo].[Entrenadores.Pokemons] CHECK CONSTRAINT [FK_Entrenadores.Pokemons_Pokemons]
GO

USE [MundoPokemon_DB]
GO

/****** Object:  Table [dbo].[Ciudades]    Script Date: 5/10/2024 10:27:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ciudades](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Ciudades] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [MundoPokemon_DB]
GO

/****** Object:  Table [dbo].[Gimnasios]    Script Date: 5/10/2024 10:28:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Gimnasios](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[IdCiudad] [int] NULL,
	[IdMedalla] [int] NULL,
	[IdEntrenador] [int] NULL,
 CONSTRAINT [PK_Gimnasios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Gimnasios]  WITH CHECK ADD  CONSTRAINT [FK_Gimnasios_Ciudades] FOREIGN KEY([IdCiudad])
REFERENCES [dbo].[Ciudades] ([Id])
GO

ALTER TABLE [dbo].[Gimnasios] CHECK CONSTRAINT [FK_Gimnasios_Ciudades]
GO

ALTER TABLE [dbo].[Gimnasios]  WITH CHECK ADD  CONSTRAINT [FK_Gimnasios_Entrenadores] FOREIGN KEY([IdEntrenador])
REFERENCES [dbo].[Entrenadores] ([Id])
GO

ALTER TABLE [dbo].[Gimnasios] CHECK CONSTRAINT [FK_Gimnasios_Entrenadores]
GO

ALTER TABLE [dbo].[Gimnasios]  WITH CHECK ADD  CONSTRAINT [FK_Gimnasios_Medallas] FOREIGN KEY([IdMedalla])
REFERENCES [dbo].[Medallas] ([Id])
GO

ALTER TABLE [dbo].[Gimnasios] CHECK CONSTRAINT [FK_Gimnasios_Medallas]
GO

