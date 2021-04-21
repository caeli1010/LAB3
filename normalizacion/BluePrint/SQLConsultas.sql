USE BluePrintNuevo
GO
--1) Listado de todos los clientes.
SELECT * FROM Clientes

--2) Listado de todos los proyectos.
--SELECT * FROM Proyectos

--3) Listado con nombre, descripción, costo, fecha de inicio y de fin de todos los proyectos.
--SELECT Nombre, Descripcion, CostoEstimado, FechaInicio, FechaFin FROM Proyectos

--4) Listado con nombre, descripción, costo y fecha de inicio de todos los proyectos con costo mayor a cien mil pesos.
--SELECT Nombre, Descripcion, CostoEstimado, FechaInicio FROM Proyectos WHERE CostoEstimado>100000

--5) Listado con nombre, descripción, costo y fecha de inicio de todos los proyectos con costo menor a cincuenta mil pesos .
--SELECT Nombre, Descripcion, CostoEstimado, FechaInicio FROM Proyectos WHERE CostoEstimado<50000

--6) Listado con todos los datos de todos los proyectos que comiencen en el año 2020.
--SELECT *FROM Proyectos WHERE YEAR(FechaInicio) = 2020

--7) Listado con nombre, descripción y costo de los proyectos que comiencen en el año 2020 y cuesten más de cien mil pesos.
--SELECT Nombre, Descripcion, CostoEstimado, FechaInicio FROM Proyectos WHERE YEAR(FechaInicio)=2020 AND CostoEstimado>100000

--8) Listado con nombre del proyecto, costo y año de inicio del proyecto.
--SELECT Nombre, Descripcion, CostoEstimado, FechaInicio = YEAR(fechaInicio) FROM Proyectos

--9) Listado con nombre del proyecto, costo, fecha de inicio, fecha de fin y días de duración de los proyectos.
--SELECT Nombre, CostoEstimado, FechaInicio, FechaFin, DATEDIFF(day, FechaInicio, FechaFin) as Duracion FROM Proyectos

--10) Listado con razón social, cuit y teléfono de todos los clientes cuyo IDTipo sea 1, 3, 5 o 6
--SELECT RazonSocial, Cuit, Telefono, IdTipo FROM Clientes WHERE IdTipo IN (1,3,5,6)

--11) Listado con nombre del proyecto, costo, fecha de inicio y fin de todos los proyectos que no pertenezcan a los 
--clientes 1, 5 ni 10.
--SELECT Nombre, CostoEstimado, FechaInicio, FechaFin, IdCliente FROM Proyectos WHERE IdCliente NOT IN(1,5,10)

--12) Listado con nombre del proyecto, costo y descripción de aquellos proyectos que hayan comenzado entre el 1/1/2018 
--y el 24/6/2018.
--SELECT Nombre, CostoEstimado, Descripcion FROM Proyectos WHERE FechaInicio BETWEEN '2018/1/1' AND '2018/6/24'

--13) Listado con nombre del proyecto, costo y descripción de aquellos proyectos que hayan finalizado entre el 1/1/2019
--y el 12/12/2019.
--SELECT Nombre, CostoEstimado, Descripcion, FechaFin FROM Proyectos WHERE FechaFin BETWEEN '2019/1/1' AND '2019/12/12'

--14) Listado con nombre de proyecto y descripción de aquellos proyectos que aún no hayan finalizado.
--SELECT Nombre, Descripcion, FechaFin FROM Proyectos WHERE FechaFin IS NULL

--15) Listado con nombre de proyecto y descripción de aquellos proyectos que aún no hayan comenzado.
--SELECT Nombre, Descripcion, FechaInicio FROM Proyectos WHERE FechaInicio > GETDATE()

--16) Listado de clientes cuya razón social comience con letra vocal.
--SELECT * FROM Clientes WHERE RazonSocial LIKE '[AEIOU]%'

--17) Listado de clientes cuya razón social finalice con vocal.
--SELECT * FROM Clientes WHERE RazonSocial LIKE '%[aeiou]'

--18) Listado de clientes cuya razón social finalice con la palabra 'Inc'
--SELECT * FROM Clientes WHERE RazonSocial LIKE '%iNC'

--19) Listado de clientes cuya razón social no finalice con vocal.
--SELECT *FROM Clientes WHERE RazonSocial NOT LIKE '%[aeiou]'

--20) Listado de clientes cuya razón social no contenga espacios.
--SELECT * FROM Clientes WHERE RazonSocial NOT LIKE '% %'

--21) Listado de clientes cuya razón social contenga más de un espacio.
--SELECT * FROM Clientes WHERE RazonSocial LIKE '% % %'

--22) Listado de razón social, cuit, email y celular de aquellos clientes que tengan mail pero no teléfono.
--SELECT RazonSocial, Cuit, Celular, EMail, Telefono FROM Clientes WHERE EMail LIKE '%' AND Telefono IS NULL

--23) Listado de razón social, cuit, email y celular de aquellos clientes que no tengan mail pero sí teléfono.
--SELECT RazonSocial, Cuit, EMail, Celular, Telefono FROM Clientes WHERE EMail IS NULL AND Telefono LIKE '%'

--24) Listado de razón social, cuit, email, teléfono o celular de aquellos clientes que tengan mail o teléfono o celular .
--SELECT RazonSocial, Cuit, EMail, telefono, celular FROM Clientes WHERE EMail LIKE '%' OR Celular LIKE '%' OR TelefonoLIKE '%'

--25)Listado de razón social, cuit y mail. Si no dispone de mail debe aparecer el texto "Sin mail".
--SELECT RazonSocial, Cuit, COALESCE(EMail, 'Sin mail' ) as Contacto FROM Clientes 

--26)Listado de razón social, cuit y una columna llamada Contacto con el mail, si no posee mail, con el número de celular
--y si no posee número de celular con un texto que diga "Incontactable".
--SELECT RazonSocial, Cuit, COALESCE(EMail, Celular, 'Incontactable') as Contacto FROM Clientes