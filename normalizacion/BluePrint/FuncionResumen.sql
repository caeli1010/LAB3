USE BluePrintNuevo
GO

--1)La cantidad de colaboradores
--SELECT COUNT(*) FROM COLABORADORES AS COLAB

--2)La cantidad de colaboradores nacidos entre 1990 y 2000.
--SELECT COUNT(FechaNacimiento) FROM Colaboradores WHERE FechaNacimiento BETWEEN '1990' AND '2000'

--3)El promedio de precio hora base de los tipos de tareas
--SELECT AVG(PrecioHoraBase) FROM TiposTarea

--4)El promedio de costo de los proyectos iniciados en el año 2019.
--SELECT AVG(CostoEstimado) FROM Proyectos AS PR WHERE YEAR(FechaInicio)=2019

--5)El costo más alto entre los proyectos de clientes de tipo 'Unicornio'
--SELECT MAX(CostoEstimado) FROM Proyectos AS PR 
--LEFT JOIN Clientes AS Cl ON Cl.ID = PR.IDCliente
--LEFT JOIN TiposCliente AS TCl on TCl.ID= Cl.IDTipo
--WHERE TCl.Nombre LIKE 'Unicornio'

--6)El costo más bajo entre los proyectos de clientes del país 'Argentina'
--SELECT MIN(PR.CostoEstimado) FROM Proyectos AS PR
--LEFT JOIN Clientes AS CL ON CL.ID = PR.IDCliente
--LEFT JOIN Ciudades AS C ON C.ID = CL.IDCiudad
--LEFT JOIN Paises AS P ON P.ID = C.IDPais
--WHERE P.Nombre LIKE 'Argentina'

--7)La suma total de los costos estimados entre todos los proyectos.
--SELECT SUM(PR.CostoEstimado) FROM Proyectos AS PR

--8)Por cada ciudad, listar el nombre de la ciudad y la cantidad de clientes.
--SELECT C.Nombre AS Ciudad, Count(*) FROM Ciudades AS C
--LEFT JOIN Clientes AS CL ON CL.IDCiudad = C.ID
--GROUP BY Nombre

--9)Por cada país, listar el nombre del país y la cantidad de clientes.
--SELECT P.Nombre AS Pais, Count(*) AS Clientes FROM Paises AS P
--LEFT JOIN Ciudades AS C ON C.IDPais = P.ID
--LEFT JOIN Clientes AS CL ON CL.IDCiudad = C.ID
--GROUP BY P.Nombre

--10)Por cada tipo de tarea, la cantidad de colaboraciones registradas. Indicar el tipo de tarea y la cantidad calculada.
--SELECT TT.Nombre, COUNT (*) FROM TiposTarea AS TT
--JOIN Tareas AS T ON T.IDTipo = TT.ID
--JOIN Colaboraciones AS COL ON COL.IDTarea = TT.ID
--GROUP BY TT.Nombre

--11)Por cada tipo de tarea, la cantidad de colaboradores distintos que la hayan realizado. Indicar el tipo de tarea y la 
--cantidad calculada.
--SELECT TT.Nombre AS Tarea, COUNT(DISTINCT COLAB.ID) FROM TiposCliente AS TT
--LEFT JOIN Tareas AS T ON T.IDTipo = TT.ID
--LEFT JOIN Colaboraciones AS COL ON COL.IDTarea = T.ID
--LEFT JOIN Colaboradores AS COLAB ON COLAB.ID = COL.IDColaborador
--GROUP BY TT.Nombre

--12)Por cada módulo, la cantidad total de horas trabajadas. Indicar el ID, nombre del módulo y la cantidad totalizada. 
--Mostrar los módulos sin horas registradas con 0.
--SELECT M.ID, M.Nombre AS Modulo, ISNULL(SUM(COL.Tiempo),0) AS Tiempo FROM Modulos AS M
--LEFT JOIN Tareas AS T ON T.IDModulo = M.ID
--LEFT JOIN Colaboraciones AS COL ON COL.IDTarea = T.ID
--WHERE Tiempo>0 
--GROUP BY M.ID, M.Nombre 

--13)Por cada módulo y tipo de tarea, el promedio de horas trabajadas. Indicar el ID y nombre del módulo, 
--el nombre del tipo de tarea y el total calculado.
--SELECT M.ID AS id, M.Nombre AS Modulo, TT.ID AS IdTarea, AVG(COL.Tiempo) FROM Modulos AS M
--INNER JOIN Tareas AS T ON T.IDModulo = M.ID
--LEFT JOIN TiposTarea AS TT ON TT.ID = T.IDTipo
--INNER JOIN Colaboraciones AS COL ON COL.IDTarea = T.ID
--GROUP BY M.ID, M.Nombre, TT.ID

--14)Por cada módulo, indicar su ID, apellido y nombre del colaborador y total que se le debe abonar 
--en concepto de colaboraciones realizadas en dicho módulo.
--SELECT M.ID AS Id, COLAB.Nombre, COLAB.Apellido, SUM(COL.PrecioHora*COL.Tiempo) FROM Modulos AS M
--INNER JOIN Tareas AS T ON T.IDModulo = M.ID
--INNER JOIN Colaboraciones AS COL ON COL.IDTarea = T.ID
--INNER JOIN Colaboradores AS COLAB ON COL.IDColaborador = COLAB.ID
--GROUP BY M.ID, COLAB.Nombre, COLAB.Apellido

--15)Por cada proyecto indicar el nombre del proyecto y la cantidad de horas registradas en concepto 
--de colaboraciones y el total que debe abonar en concepto de colaboraciones.
--SELECT PR.Nombre AS Proyectos, SUM(COL.Tiempo) AS Horas, 
--SUM(COL.PrecioHora * COL.Tiempo) AS Total FROM Proyectos AS PR
--LEFT JOIN Modulos AS M ON M.IDProyecto = PR.ID
--LEFT JOIN Tareas AS T ON T.IDModulo = M.ID
--INNER JOIN Colaboraciones AS COL ON COL.IDTarea = T.ID
--GROUP BY PR.Nombre

--16)Listar los nombres de los proyectos que hayan registrado menos de cinco colaboradores distintos
--y más de 100 horas total de trabajo.
--SELECT PR.Nombre, COUNT(COL.IDColaborador) AS Colaborador,
--SUM(COL.Tiempo) AS Tiempo FROM Proyectos AS PR
--LEFT JOIN Modulos AS M ON M.IDProyecto = PR.ID
--LEFT JOIN Tareas AS T ON T.IDModulo = M.ID
--INNER JOIN Colaboraciones AS COL ON COL.IDTarea = T.ID
--GROUP BY PR.Nombre
--HAVING COUNT(COL.IDColaborador) < 5 AND SUM(COL.Tiempo) >100

--17)Listar los nombres de los proyectos que hayan comenzado en el año 2020 que hayan registrado más de tres módulos.
--SELECT PR.Nombre FROM Proyectos AS PR
--LEFT JOIN Modulos AS M ON M.IDProyecto = PR.ID
--WHERE YEAR(PR.FechaInicio) = '2020'
--GROUP BY PR.Nombre
--HAVING COUNT(M.ID) > 3

--18)Listar para cada colaborador externo, el apellido y nombres y el tiempo máximo de horas que ha trabajo 
--en una colaboración. 
--SELECT COLAB.Nombre, COLAB.Apellido, MAX(COL.Tiempo) AS Tiempo FROM Colaboradores AS COLAB
--LEFT JOIN Colaboraciones AS COL ON COL.IDColaborador = COLAB.ID
--WHERE COLAB.Tipo = 'E'
--GROUP BY COLAB.Nombre, COLAB.Apellido order by COLAB.Nombre asC

--19)Listar para cada colaborador interno, el apellido y nombres y el promedio percibido en concepto de colaboraciones.
--SELECT COLAB.Nombre, COLAB.Apellido, AVG(COL.PrecioHora) FROM Colaboradores AS COLAB
--LEFT JOIN Colaboraciones AS COL ON COL.IDColaborador = COLAB.ID
--WHERE COLAB.Tipo = 'I'
--GROUP BY COLAB.Nombre, COLAB.Apellido order by COLAB.Nombre asC

--20)Listar el promedio percibido en concepto de colaboraciones para colaboradores internos y el promedio percibido 
--en concepto de colaboraciones para colaboradores externos.
SELECT COLAB.Tipo, AVG(COL.PrecioHora*)  FROM Colaboradores AS COLAB
LEFT JOIN Colaboraciones AS COL ON COL.IDColaborador = COLAB.ID
WHERE 

--21)Listar el nombre del proyecto y el total neto estimado. Este último valor surge del costo estimado menos los pagos que requiera hacer en concepto de colaboraciones.

--22)Listar la cantidad de colaboradores distintos que hayan colaborado en alguna tarea que correspondan a proyectos de clientes de tipo 'Unicornio'.

--23)La cantidad de tareas realizadas por colaboradores del país 'Argentina'.

--24)Por cada proyecto, la cantidad de módulos que se haya estimado mal la fecha de fin. Es decir, que se haya finalizado antes o después que la fecha estimada. Indicar el nombre del proyecto y la cantidad calculada.

