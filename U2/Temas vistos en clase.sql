USE MaxiFlix_DB

--------------------SELECT--------------------------

--As define un nuevo nombre a la columna
Select Titulo 'Titulo de pelicula', 
MinutosDuracion AS 'Minutos de duración',
Bio AS Descripcion 
FROM Peliculas

--Cuenta la cantidad de datos encontrados.
Select COUNT(Id) as 'Cantidad Peliculas'
From Peliculas

--Devuelve el maximo encontrado
Select MAX(Id) 
From Peliculas

--Devuelve el minimo encontrado
Select MIN(Id) 
From Peliculas

--Devuelve la suma de todos los campos encontrados
Select SUM(Id) 
From Peliculas

--Se le pueden aplicar operaciona matematicas
SELECT SUM(MinutosDuracion)/60
FROM Peliculas

SELECT MIN(MinutosDuracion)
FROM Peliculas

------------------------ WHERE --------------------------

--Where con condicion de igualdad numerica
SELECT * FROM Peliculas
WHERE Id = 6

--Operadores relaciones: =, >, <, >=, <= !=

Select Titulo, Bio, MinutosDuracion/60 AS Horas 
FROM Peliculas 
WHERE MinutosDuracion > 120

SELECT *  
FROM Peliculas 
WHERE MinutosDuracion > 120

SELECT * 
FROM Reparto
WHERE Id = 11 

SELECT *
FROM [Peliculas.Reparto]
WHERE IdPelicula = 9

--TOP nos traera los primers, en este caso 5, registros encontrados 
SELECT TOP 5 * FROM Reparto
WHERE Id >= 45


--LIKE mezclado con % sirve para busquedas por  textos o fracciones de textos.
SELECT Titulo, MinutosDuracion, Bio 
FROM Peliculas
WHERE Bio LIKE '%cien%'

--LIKE
--'ALGO%'
--'%ALGO'
--'%ALGO%'

--Concetenadores logicos OR, AND y NOT

--OR
SELECT * FROM Reparto
WHERE Id = 5
OR Id = 6
OR Id = 7

--AND
SELECT * FROM Peliculas
WHERE MinutosDuracion > 99 AND MinutosDuracion <= 120

--MEZCLADOS
SELECT * FROM Peliculas
WHERE MinutosDuracion > 99 AND MinutosDuracion <= 120
AND Bio LIKE '%polic%'
OR Bio LIKE '%cien%'
OR Bio LIKE '%los%'
OR Bio LIKE '%co%'

--NOT
SELECT * FROM Peliculas
WHERE NOT (MinutosDuracion > 99 AND MinutosDuracion <= 120
AND Bio LIKE '%polic%'
OR Bio LIKE '%cien%'
OR Bio LIKE '%los%'
OR Bio LIKE '%co%')

-- IN

SELECT * FROM Reparto WHERE Id IN (10, 15, 66, 67)

--BETWEEN

SELECT * 
FROM Reparto 
WHERE Id BETWEEN 62 AND 67

SELECT * 
FROM Peliculas 
WHERE YEAR(FechaEstreno) BETWEEN 1990 AND 1999

--NULL

SELECT * 
FROM Peliculas 
WHERE IdDirector IS NULL

SELECT * 
FROM Peliculas 
WHERE IdDirector IS NOT NULL


-------------- JOINS ----------------------------

--INNET JOIN
SELECT Titulo, Nombre 
FROM Peliculas P
INNER JOIN Reparto R ON P.IdDirector = R.Id

SELECT P.Titulo, R.Nombre, R.Apellido FROM Peliculas P
INNER JOIN [Peliculas.Reparto] PR ON P.Id = PR.IdPelicula
INNER JOIN Reparto R ON PR.IdReparto = R.Id

--LEFT JOIN
SELECT Titulo, Nombre 
FROM Peliculas P
LEFT JOIN Reparto R ON P.IdDirector = R.Id

--RIGHT JOIN
SELECT Titulo, Nombre 
FROM Peliculas P
RIGHT JOIN Reparto R ON P.IdDirector = R.Id

--FULL JOIN
SELECT Titulo, Nombre 
FROM Peliculas P
FULL OUTER JOIN Reparto R ON P.IdDirector = R.Id


-------------------INSERTS-----------------------


INSERT INTO Peliculas (Titulo, Bio, MinutosDuracion)
VALUES ('El titulo', 'El bio', 111)

INSERT INTO Peliculas(FechaEstreno, Titulo, MinutosDuracion, Bio)
VALUES ('', '', 12, '')

INSERT INTO Peliculas(Titulo, Bio, MinutosDuracion)
VALUES ('Armageddon', 'Cuando el Gobierno estadounidense descubre que solo tiene 18 días para salvar al mundo de un asteroide, un equipo de astronautas es enviado al espacio con la misión de salvar a la Tierra de la destrucción', 151)

--YYYY-MM-DD
INSERT INTO Peliculas(FechaEstreno, Titulo, MinutosDuracion, Bio, IdDirector)
VALUES ('1982-11-04', 'Rambo', 93, 'El veterano de Vietnam, John Rambo, envuelve a la policía en una cacería en el bosque tras escapar de un vil comisario.', 15)

INSERT INTO Peliculas
VALUES ('', '', 11, '', null)

INSERT INTO Reparto (Id, Nombre)
VALUES (120, 'Agus') --No permite dado que Id es auto incremental (Identity)

INSERT INTO Plataformas (Id, Nombre, Precio)
VALUES (999, 'Campus Agus programa', 99.99) --En este caso si permite hacer insert en ID

INSERT INTO Peliculas
VALUES ('1997-06-05', 'Con Air', 115, 'Un preso en libertad condicional, condenado por error, se encuentra en un vuelo con un grupo de prisioneros despiadados, e intenta detener un secuestro violento.', 120) --No permite dado que no existe el nro de id de diretor.

SELECT * FROM Peliculas

------------------- UPDATE ---------------------

UPDATE Peliculas SET Bio = 'Esta es la bio de una pelicula', Titulo = 'Este es el titulo'
WHERE Id = 27

UPDATE Peliculas SET IdDirector = 1 WHERE MinutosDuracion > 140
SELECT * FROM Peliculas WHERE MinutosDuracion > 140

---------------------- DELETE ------------------

DELETE FROM Peliculas WHERE Id = 28

DELETE FROM Peliculas WHERE Id > 20
DELETE FROM MEDIA WHERE IdPelicula = 1















