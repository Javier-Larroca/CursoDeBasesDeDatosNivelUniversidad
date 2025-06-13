USE master;
GO

--CREATE DATABASE CatalogoWeb_DB
--ON 
--(
--    NAME = 'CatalogoWeb_DB',
--    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CatalogoWeb_DB.mdf',
--    SIZE = 10MB,
--    MAXSIZE = 500MB,
--    FILEGROWTH = 100MB
--)
--LOG ON
--(
--    NAME = 'CatalogoWeb_DB_log',
--    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CatalogoWeb_DB_log.ldf',
--    SIZE = 10MB,
--    MAXSIZE = 500MB,
--    FILEGROWTH = 100MB
--);

Use CatalogoWeb_DB

GO
CREATE TABLE Usuarios(
	Id int Primary Key Identity(1,1),
	Email varchar(50) Not null,
	Contrasena varchar(50) Not null,
	Nombre varchar(50) Not null,
	Apellido varchar(50) Not null,
	UrlImagenPerfil varchar(255),
	EsAdmin Bit Not null
)


GO
CREATE TABLE Marcas(
	Id int Primary Key Identity(1,1),
	Descripcion varchar(50) not null
)

GO
CREATE TABLE Categorias(
	Id int Primary Key Identity(1,1),
	Descripcion varchar(50) not null
)


GO
CREATE TABLE Articulos(
	Id int not null Identity (1,1),
	Codigo varchar(50) not null unique,
	Nombre varchar(50) not null, 
	Descripcion varchar(50) not null,
	IdMarca int not null,
	IdCategoria int not null,
	ImagenUrl varchar(255),
	Precio decimal not null,

	Constraint PK_Articulos Primary Key (Id),
	Constraint FK_Articulos_Marca Foreign Key (IdMarca) References Marcas (Id),
	Constraint FK_Articulos_Categoria Foreign Key (IdCategoria) References Categorias (Id)
)

GO
CREATE TABLE Favoritos(
	Id int Primary Key Identity(1,1),
	IdUsuario int not null,
	IdArticulo int not null,

	Constraint FK_Favoritos_Usuarios Foreign Key (IdUsuario) References Usuarios (Id),
	Constraint FK_Favoritos_Articulos Foreign Key (IdArticulo) References Articulos (Id)
)






