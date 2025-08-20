-- Crear la base de datos
CREATE DATABASE PokemonDB;
GO

USE PokemonDB;
GO

-- Tabla de Elementos (Tipos/Debilidades)
CREATE TABLE Elementos (
    Id INT PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL
);
GO

-- Tabla de Pokémons
CREATE TABLE Pokemons (
    Id INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Numero INT,
    Bio NVARCHAR(MAX),
    Altura FLOAT,
    Peso FLOAT,
    ImagenUrl NVARCHAR(300),
    IdEvolucion INT NULL,
    CONSTRAINT FK_Pokemons_Evolucion FOREIGN KEY (IdEvolucion) REFERENCES Pokemons(Id)
);
GO

-- Tabla de Entrenadores
CREATE TABLE Entrenadores (
    Id INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Apellido NVARCHAR(100),
    NickName NVARCHAR(100),
    Email NVARCHAR(100),
    Clave NVARCHAR(100),
    FechaNacimiento DATE
);
GO

-- Tabla de Ciudades
CREATE TABLE Ciudades (
    Id INT PRIMARY KEY,
    Nombre NVARCHAR(100)
);
GO

-- Tabla de Medallas
CREATE TABLE Medallas (
    Id INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    IdCiudad INT NOT NULL,
    Descripcion NVARCHAR(MAX),
    CONSTRAINT FK_Medallas_Ciudad FOREIGN KEY (IdCiudad) REFERENCES Ciudades(Id)
);
GO

-- Tabla de Gimnasios
CREATE TABLE Gimnasios (
    Id INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    IdCiudad INT NOT NULL,
    IdLider INT NOT NULL,
    IdMedalla INT NOT NULL,
    CONSTRAINT FK_Gimnasio_Ciudad FOREIGN KEY (IdCiudad) REFERENCES Ciudades(Id),
    CONSTRAINT FK_Gimnasio_Lider FOREIGN KEY (IdLider) REFERENCES Entrenadores(Id),
    CONSTRAINT FK_Gimnasio_Medalla FOREIGN KEY (IdMedalla) REFERENCES Medallas(Id)
);
GO

-- Tabla de Habilidades
CREATE TABLE Habilidades (
    Id INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Descripcion NVARCHAR(MAX),
    IdTipo INT NOT NULL,
    CONSTRAINT FK_Habilidades_Elemento FOREIGN KEY (IdTipo) REFERENCES Elementos(Id)
);
GO

-- Relación Pokemons-Habilidades
CREATE TABLE [Pokemons.Habilidades] (
    IdPokemon INT NOT NULL,
    IdHabilidad INT NOT NULL,
    PRIMARY KEY (IdPokemon, IdHabilidad),
    CONSTRAINT FK_PokeHabilidades_Pokemon FOREIGN KEY (IdPokemon) REFERENCES Pokemons(Id),
    CONSTRAINT FK_PokeHabilidades_Habilidad FOREIGN KEY (IdHabilidad) REFERENCES Habilidades(Id)
);
GO

-- Relación Pokemons-Tipos
CREATE TABLE [Pokemons.Tipos] (
    IdPokemon INT NOT NULL,
    IdElemento INT NOT NULL,
    PRIMARY KEY (IdPokemon, IdElemento),
    CONSTRAINT FK_PokeTipos_Pokemon FOREIGN KEY (IdPokemon) REFERENCES Pokemons(Id),
    CONSTRAINT FK_PokeTipos_Elemento FOREIGN KEY (IdElemento) REFERENCES Elementos(Id)
);
GO

-- Relación Pokemons-Debilidades
CREATE TABLE [Pokemons.Debilidades] (
    IdPokemon INT NOT NULL,
    IdElemento INT NOT NULL,
    PRIMARY KEY (IdPokemon, IdElemento),
    CONSTRAINT FK_PokeDebilidades_Pokemon FOREIGN KEY (IdPokemon) REFERENCES Pokemons(Id),
    CONSTRAINT FK_PokeDebilidades_Elemento FOREIGN KEY (IdElemento) REFERENCES Elementos(Id)
);
GO

-- Relación Pokémons de Entrenadores
CREATE TABLE [Entrenadores.Pokemons] (
    Id INT PRIMARY KEY,
    IdEntrenador INT NOT NULL,
    IdPokemon INT NOT NULL,
    Nombre NVARCHAR(100),
    CONSTRAINT FK_EntPoke_Entrenador FOREIGN KEY (IdEntrenador) REFERENCES Entrenadores(Id),
    CONSTRAINT FK_EntPoke_Pokemon FOREIGN KEY (IdPokemon) REFERENCES Pokemons(Id)
);
GO
