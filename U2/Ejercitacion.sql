USE MaxiFlix_DB
--Ejercicios Unidad 2
--Teniendo la DB MaxiFlix instalada, realizar las siguientes consultas.
--CONSULTAS DE SELECT

--1) Obtener las Pel�culas estrenadas en la D�cada de los '80.

Select * 
From Peliculas 
Where Year(FechaEstreno) Between 1980 And 1989

--2) Obtener los Actores nacidos en la D�cada de los '70.

Select *
From Reparto
Where Year(FechaNacimiento) Between 1970 And 1979

--3) Obtener las Peliculas que se encuentran en la Plataforma de Disney+.

Select * 
From Peliculas P
Inner Join [Peliculas.Plataformas] PP On P.Id = PP.IdPelicula
Inner Join Plataformas Pl On Pl.Id = PP.IdPlataforma
Where Pl.Nombre Like '%disney%'

--4) Obtener la Cantidad de Pel�culas con Clasificaci�n R. (Considerar usar el Comando LIKE)

Select Count(*) 
From Peliculas P
Inner Join [Peliculas.Clasificaciones] PC On P.Id = PC.IdPelicula
Inner Join Clasificaciones C On C.Id = Pc.IdClasificacion
Where C.Descripcion Like 'R%'


--5) Obtener la Pel�cula que mayor duraci�n tiene.

Select Top 1 *
From Peliculas
Order By MinutosDuracion Desc

--6) Obtener las Pel�culas de Categor�a 'Superh�roes'.

Select *
From Peliculas P
Inner Join [Peliculas.Categorias] PC On PC.IdPelicula=P.Id
Inner Join Categorias C On C.Id = PC.IdCategoria
Where C.Descripcion Like 'Superh�roes'

--7) Obtener la Cantidad de Actores que trabajaron en la Pel�cula 'Los Intocables'.

Select Count(*) 
From Reparto R
Inner Join [Peliculas.Reparto] PR On R.Id = PR.IdReparto 
Inner Join Peliculas P On P.Id = PR.IdPelicula
Where P.Titulo Like 'Los Intocables'


--8) Obtener los Actores que trabajaron en la Pel�culas 'Los Intocables'.

Select R.Nombre, R.Apellido, R.FechaNacimiento
From Reparto R
Inner Join [Peliculas.Reparto] PR On R.Id = PR.IdReparto 
Inner Join Peliculas P On P.Id = PR.IdPelicula
Where P.Titulo Like 'Los Intocables'

--9) Obtener el Total de Pel�culas del Cat�logo.

Select Count(*) 
From Peliculas

--10) Obtener la Lista de Usuarios Inactivos.

Select * 
From Usuarios
Where Activo = 0

--CONSULTAS DE INSERT

--11) Ingresar el siguiente Film.
--Pel�cula: "The Good, the Bad and the Ugly"
--Biograf�a: "Tres hombres violentos pelean por una caja que alberga 200 000 d�lares, la cual fue escondida durante la Guerra Civil. Dado que ninguno puede encontrar la tumba donde est� el bot�n sin la ayuda de los otros dos, deben colaborar, pese a odiarse."
--Duraci�n: 162 minutos
--Fecha de Estreno: 11 de enero de 1968

Select * from Peliculas

Insert into Peliculas (FechaEstreno, Titulo, MinutosDuracion, Bio)
Values ('1968-01-11', 'The Good, the Bad and the Ugly', 162, 'Tres hombres violentos pelean por una caja que alberga 200 000 d�lares, la cual fue escondida durante la Guerra Civil. Dado que ninguno puede encontrar la tumba donde est� el bot�n sin la ayuda de los otros dos, deben colaborar, pese a odiarse.')

--12) En base al Film recientemente agregado al Cat�logo, agreg�rselo como Favorito a Severus Snape.

Select * from Peliculas
Select * from Usuarios
Select * from [Usuarios.Favoritos]

Insert into [Usuarios.Favoritos]
Values (26, 4, '2025-06-06')

--13) Ahora hagamos que esta pelicula se pueda ver en las Plataformas de Netflix y Amazon.

Select * from Peliculas
Select * from Plataformas
Select * from [Peliculas.Plataformas]

Insert into [Peliculas.Plataformas] (Id, IdPelicula, IdPlataforma, FechaAlta)
Values (44, 26, 1, '2025-06-06') , (45, 26, 2, '2025-06-06')

--14) �Cu�l es la "relaci�n" que tienen estas consultas al Ejecutarse? �Cu�l es el motivo?

INSERT INTO Peliculas (FechaEstreno, Titulo, MinutosDuracion, Bio, IdDirector) VALUES ('2014-08-21', 'Relatos Salvajes', 122, 'Seis relatos que alternan la intriga, la comedia y la violencia. Sus personajes se ver�n empujados hacia el abismo y hacia el innegable placer de perder el control al cruzar la delgada l�nea que separa la civilizaci�n de la barbarie.', 112);
INSERT INTO [Peliculas.Categorias] (Id, IdCategoria, IdPelicula) VALUES (75, 6, 2);
INSERT INTO [Peliculas.Plataformas] (IdPelicula, IdPlataforma, FechaAlta) VALUES (24, 10, '2024-03-27');

--CONSULTAS DE UPDATE

--15) La Pel�cula de Rocky dej� de estar disponible en la Plataforma de Paramount+ el 16 de enero del 2024.

Select * from Peliculas Where Titulo Like '%rocky%' -- 3
Select * from Plataformas Where Nombre Like '%Paramount%' --9
Select * from [Peliculas.Plataformas] 

Update [Peliculas.Plataformas]
Set FechaBaja = '2024-01-16'
Where IdPelicula = 3 And IdPlataforma = 9

--16) Hubo un error al momento de registrar la pel�cula de Iron Man. El Protagonista no fue Robert Downey Jr., qui�n interpret� el papel fue Diego Peretti.

Select * from Reparto where Nombre like 'Diego' and Apellido like 'Peretti' -- 107
Select * from Reparto where Nombre like 'Robert' and Apellido like 'Downey Jr.' -- 1
Select * from Peliculas where Titulo like 'Iron Man' -- 2
Select * from  [Peliculas.Reparto] Where IdPelicula = 2 and IdReparto = 1

Update [Peliculas.Reparto]
Set Protagonista = 0
Where IdPelicula = 2 and IdReparto = 1

Insert Into [Peliculas.Reparto] (IdReparto, IdPelicula, Protagonista)
Values (107, 2, 1)

--17) La Plataforma Tubi TV cambia de firma, dado que cambiar� su nombre a MaxiPrograma TV.

Select * from Plataformas where Nombre like '%Tubi tv%'

Update Plataformas
Set Nombre = 'MaxiPrograma TV'
Where Id = 10

--18) La Pel�cula de Spiderman cambia su Clasificaci�n de PG-13 a 'Apta para todos los P�blicos'.

Select * from Peliculas where Titulo like '%spiderman%' --12
Select * from Clasificaciones where Descripcion like 'PG-13%' --3
Select * from [Peliculas.Clasificaciones]

Update [Peliculas.Clasificaciones]
Set IdClasificacion = 3
Where IdPelicula = 12

--CONSULTAS DE DELETE

--19) El Usuario Homero Simpson hace mucho tiempo que est� inactivo. Hay que eliminarlo de la Base de manera f�sica.

Select * from Usuarios Where Nombre like 'Homero' -- 3

Delete from Usuarios
Where Id = 3

--20) Realizar una limpieza de las Puntuaciones de las Pel�culas. Eliminar todas las Puntuaciones desde el 2020 hasta el 2023 (inclusive). �Se podr� realizar la Consulta?

Select * from [Peliculas.Puntuacion]
Delete from [Peliculas.Puntuacion]
Where Year(FechaPuntuacion) between 2020 and 2023

--21) Se debe realizar una limpieza de Pel�culas. Hay que eliminar las Pel�culas que se hayan estrenado desde 1980 hasta 1989 (inclusive). �Se podr� realizar la Consulta?

--Delete from Peliculas
--Where Year(FechaEstreno) between 1980 and 1989

--No se puede realizar dado que estas peliculas se encuentran vinculadas a claves foraneas de otras tablas