USE BluePrintNuevo
GO
SELECT * FROM Modulos
SELECT * FROM TiposTarea where Nombre like '%Testing%'

--1)Por cada cliente listar razón social, cuit y nombre del tipo de cliente.

--SELECT CL.RazonSocial, CL.Cuit, TC.Nombre FROM Clientes AS CL 
--INNER JOIN TiposCliente AS TC ON TC.ID = CL.IDTipo

--2)Por cada cliente listar razón social, cuit y nombre de la ciudad y nombre del país. Sólo de aquellos clientes que 
--posean ciudad y país.

--SELECT CL.RazonSocial, CL.Cuit, C.Nombre AS Ciudad, P.Nombre AS Pais  FROM Clientes AS CL 
--INNER JOIN Ciudades AS C ON C.ID = CL.IDCiudad 
--INNER JOIN Paises AS P ON P.ID = C.IDPais

--3)Por cada cliente listar razón social, cuit y nombre de la ciudad y nombre del país. Listar también los datos de 
--aquellos clientes que no tengan ciudad relacionada.

--SELECT CL.RazonSocial, CL.Cuit, C.Nombre AS Ciudad, P.Nombre AS Pais FROM Clientes AS CL 
--LEFT JOIN Ciudades AS C ON C.ID = CL.IDCiudad LEFT JOIN Paises AS P ON P.ID = C.IDPais

--4)Por cada cliente listar razón social, cuit y nombre de la ciudad y nombre del país. Listar también los datos de 
--aquellas ciudades y países que no tengan clientes relacionados.

--SELECT CL.RazonSocial, CL.Cuit, C.Nombre AS Ciudad, P.Nombre AS Pais FROM Clientes AS CL 
--RIGHT JOIN Ciudades AS C ON C.ID = CL. IDCiudad RIGHT JOIN Paises AS P ON P.ID = C.IDPais

--5)Listar los nombres de las ciudades que no tengan clientes asociados. Listar también el nombre del país al que 
--pertenece la ciudad.

--SELECT C.Nombre AS Ciudad, P.Nombre AS Pais FROM Clientes AS CL 
--RIGHT JOIN Ciudades AS C ON C.ID = CL.IDCiudad RIGHT JOIN Paises AS P ON P.ID =  C.IDPais  WHERE CL.ID IS NULL

--6)Listar para cada proyecto el nombre del proyecto, el costo, la razón social del cliente, el nombre del tipo de
--cliente y el nombre de la ciudad (si la tiene registrada) de aquellos clientes cuyo tipo de cliente sea 'Extranjero'
--o 'Unicornio'.

--SELECT PR.Nombre, PR.CostoEstimado AS Costo, CL.RazonSocial, TC.Nombre, C.Nombre AS Ciudad, P.Nombre AS Pais 
--FROM Proyectos AS PR INNER JOIN Clientes AS CL ON CL.ID=PR.IDCliente INNER JOIN TiposCliente AS TC ON TC.ID=CL.IDTipo 
--INNER JOIN Ciudades AS C ON C.ID=CL.IDCiudad INNER JOIN Paises AS P ON P.ID=C.IDPais
--WHERE TC.Nombre LIKE 'Extranjero' OR TC.Nombre LIKE 'Unicornio'

--7)Listar los nombre de los proyectos de aquellos clientes que sean de los países 'Argentina' o 'Italia'.

--SELECT PR.Nombre, CL.RazonSocial, C.Nombre AS Ciudad, P.Nombre AS Pais FROM Proyectos AS PR 
--INNER JOIN Clientes AS CL ON CL.ID=PR.IDCliente INNER JOIN Ciudades AS C ON C.ID=CL.IDCiudad
--INNER JOIN Paises AS P ON P.ID=C.IDPais WHERE P.Nombre LIKE 'Argentina' OR P.Nombre LIKE 'Italia'

--8)Listar para cada módulo el nombre del módulo, el costo estimado del módulo, el nombre del proyecto, la descripción
--del proyecto y el costo estimado del proyecto de todos aquellos proyectos que hayan finalizado.

--SELECT M.Nombre, M.CostoEstimado AS Costo, PR.Nombre, PR.Descripcion, PR.CostoEstimado AS Precio, PR.FechaFin FROM Modulos AS M 
--INNER JOIN Proyectos AS PR ON PR.ID=M.IDProyecto WHERE PR.FechaFin LIKE '%'

--9)Listar los nombres de los módulos y el nombre del proyecto de aquellos módulos cuyo tiempo estimado de realización 
--sea de más de 100 horas.

--SELECT M.Nombre, PR.Nombre, M.TiempoEstimado FROM Modulos AS M INNER JOIN Proyectos AS PR ON PR.ID=M.IDProyecto 
--WHERE M.TiempoEstimado>100

--10)listar nombres de módulos, nombre del proyecto, descripción y tiempo estimado de aquellos módulos cuya fecha 
--estimada de fin sea mayor a la fecha real de fin y el costo estimado del proyecto sea mayor a cien mil.

--SELECT M.Nombre, PR.Nombre, M.FechaEstimadaFin AS Aproximado, M.FechaFin, PR.CostoEstimado FROM Modulos AS M 
--INNER JOIN Proyectos AS PR ON PR.ID=M.IDProyecto WHERE M.FechaEstimadaFin>M.FechaFin AND PR.CostoEstimado>100000

--11)Listar nombre de proyectos, sin repetir, que registren módulos que hayan finalizado antes que el tiempo estimado.

--SELECT DISTINCT PR.Nombre FROM Modulos AS M INNER JOIN Proyectos AS PR ON PR.ID=M.IDProyecto 
--WHERE M.FechaEstimadaFin>M.FechaFin

--12)Listar nombre de ciudades, sin repetir, que no registren clientes pero sí colaboradores.

--SELECT DISTINCT CI.Nombre FROM Ciudades AS CI
--LEFT JOIN Clientes AS CL ON CL.IDCiudad = CI.ID
--LEFT JOIN Colaboradores AS CO ON CO.IDCiudad = CI.ID
--WHERE CL.ID IS NULL AND CO.ID IS NOT NULL

--13)Listar el nombre del proyecto y nombre de módulos de aquellos módulos que contengan la palabra 'login' en su 
--nombre o descripción.

--SELECT PR.Nombre, M.Nombre, M.Descripcion FROM Modulos AS M 
--INNER JOIN Proyectos AS PR ON PR.ID=M.IDProyecto
--WHERE M.Nombre LIKE 'Login' OR M.Descripcion LIKE 'Login'

--14)Listar el nombre del proyecto y el nombre y apellido de todos los colaboradores que hayan realizado algún tipo
--de tarea cuyo nombre contenga 'Programación' o 'Testing'. Ordenarlo por nombre de proyecto de manera ascendente

--SELECT PR.Nombre AS Proyecto, COLAB.Nombre, COLAB.Apellido FROM Colaboradores AS COLAB
--JOIN Colaboraciones AS COL ON COL.IDColaborador = COLAB.ID
--JOIN Tareas AS TR ON TR.ID = COL.IDTarea
--JOIN TiposTarea AS TT ON TT.ID = TR.IDTipo
--JOIN Modulos AS M ON M.ID = TR.IDModulo
--JOIN Proyectos AS PR ON PR.ID = M.IDProyecto
--WHERE TT.Nombre LIKE '%Programacion%' OR TT.Nombre LIKE '%Testing%' 
--ORDER BY PR.Nombre ASC

--15)Listar nombre y apellido del colaborador, nombre del módulo, nombre del tipo de tarea, precio hora de 
--la colaboración y precio hora base de aquellos colaboradores que hayan cobrado su valor hora de 
--colaboración más del 50% del valor hora base.

--SELECT COLAB.Nombre, COLAB.Apellido, M.Nombre AS MODULO, TT.Nombre AS Tipo, COL.PrecioHora AS Valor, TT.PrecioHoraBase
--FROM Colaboradores AS COLAB
--JOIN Colaboraciones AS COL ON COL.IDColaborador=COLAB.ID
--JOIN Tareas AS TR ON TR.ID=COL.IDTarea
--JOIN TiposTarea AS TT ON TT.ID=TR.IDTipo
--JOIN Modulos AS M ON M.ID=TR.IDModulo
--JOIN Proyectos AS PR ON PR.ID=M.IDProyecto
--WHERE (COL.PrecioHora)>(TT.PrecioHoraBase*150/100)

--16)Listar nombres y apellidos de las tres colaboraciones de colaboradores externos que más hayan demorado en
--realizar alguna tarea cuyo nombre de tipo de tarea contenga 'Testing'.

--SELECT  TOP 3 COLAB.Nombre, colab.Apellido, COL.Tiempo, TT.Nombre FROM Colaboraciones AS COL
--JOIN Colaboradores AS COLAB ON COLAB.ID=COL.IDColaborador
--JOIN Tareas AS TR ON TR.ID=COL.IDTarea
--JOIN TiposTarea AS TT ON TT.ID=TR.IDTipo
--WHERE TT.NOMBRE LIKE '%Testing%' AND COLAB.Tipo LIKE 'E' ORDER BY COL.Tiempo DESC

--17)Listar apellido, nombre y mail de los colaboradores argentinos que sean internos y cuyo mail no contenga '.com'.

--SELECT DISTINCT COLAB.Nombre, COLAB.Apellido, COLAB.EMail FROM Colaboradores AS COLAB
--JOIN Colaboraciones AS COL ON COL.IDColaborador=COLAB.ID
--JOIN Ciudades AS C ON C.ID=COLAB.IDciudad
--JOIN Paises AS P ON P.ID=C.IDPais
--WHERE COLAB.EMail NOT LIKE '%.com%' AND COLAB.Tipo LIKE 'I' AND P.Nombre LIKE 'Argentina'

--18)Listar nombre del proyecto, nombre del módulo y tipo de tarea de aquellas tareas realizadas por colaboradores
--externos.

--SELECT PR.Nombre AS Proyecto, M.Nombre AS Modulo, TT.Nombre AS TipoTarea FROM Tareas AS TR
--JOIN TiposTarea AS TT ON TT.ID=TR.IDTipo
--JOIN Modulos AS M ON M.ID=TR.IDModulo
--JOIN Proyectos AS PR ON PR.ID=M.IDProyecto
--JOIN Colaboraciones AS COL ON COL.IDTarea=TR.ID
--JOIN Colaboradores AS COLAB ON COLAB.ID=COL.IDColaborador
--WHERE COLAB.Tipo LIKE 'E'

--19)Listar nombre de proyectos que no hayan registrado tareas.
--SELECT PR.Nombre FROM Proyectos AS PR 
--LEFT JOIN Modulos AS M ON M.IDProyecto=PR.ID 
--LEFT JOIN Tareas AS T ON T.IDModulo=M.ID
--WHERE T.ID IS NULL


--20)Listar apellidos y nombres, sin repeticiones, de aquellos colaboradores que hayan trabajado en algún proyecto 
--que aún no haya finalizado.

--SELECT DISTINCT COLAB.Nombre, COLAB.Apellido FROM Colaboradores AS COLAB 
--RIGHT JOIN Colaboraciones AS COL ON COL.IDColaborador=COLAB.ID
--RIGHT JOIN Tareas AS TR ON TR.ID=COL.IDTarea
--RIGHT JOIN Modulos AS M ON M.ID=TR.IDModulo
--RIGHT JOIN Proyectos AS PR ON PR.ID=M.IDProyecto
--WHERE PR.FechaFin IS NULL
