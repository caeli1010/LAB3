USE parcial1
GO
--Aclaraciones
--Un cliente de tipo particular registra 'P' en el campo Tipo. Mientras que uno de tipo empresa registra 'E'.
--Las formas de pago pueden ser 'E' para efectivo, 'T' para tarjeta y 'C' para cheque.
--Los servicios con garant�a tienen al menos un d�a de garant�a.
--Resolver:
--1) Listado con Apellido y nombres de los clientes que hayan gastado m�s de $60000 en el a�o 2020 en concepto de
--servicios.

--SELECT CL.Apellido, CL.Nombre FROM Clientes AS CL
--WHERE (SELECT SUM(S.Importe) FROM Servicios AS S
--	WHERE YEAR(S.Fecha)=2020 AND S.IDCliente=CL.ID )>60000


--2) Listado con ID, Apellido y nombres sin repeticiones de los t�cnicos que hayan cobrado un servicio menos
--de $2600 y dicho servicio haya demorado m�s que el promedio general de duraci�n de servicios.

--SELECT DISTINCT TEC.ID, TEC.Apellido, TEC.Nombre FROM Tecnicos TEC
--INNER JOIN Servicios S ON S.IDTecnico=TEC.ID
--WHERE S.Duracion>(SELECT AVG(Duracion) FROM Servicios) AND S.Importe<2600


--3) Listado con Apellido y nombres de los t�cnicos, total recaudado en concepto de servicios abonados en 
--efectivo y total recaudado en concepto de servicios abonados con tarjeta. P�gina 1 de 2

--SELECT TEC.Apellido, TEC.Nombre, 
--	(SELECT ISNULL(SUM(S.Importe),0) FROM Servicios S
--	WHERE FormaPago LIKE 'E' AND  S.IDTecnico=TEC.ID) PagoEfectivo,
--	(SELECT ISNULL(SUM(S.Importe),0) FROM Servicios S
--	WHERE FormaPago LIKE 'C' AND  S.IDTecnico=TEC.ID) PagoCredito
--	FROM Tecnicos TEC
--	ORDER BY TEC.Apellido, TEC.Nombre

--4) Listar la cantidad de tipos de servicio que registre m�s clientes de tipo particular que clientes de tipo empresa.

--SELECT COUNT(DISTINCT TS.ID) AS Cantidad FROM TiposServicio TS
--WHERE (SELECT COUNT(CLI.ID) FROM Clientes CLI
--		INNER JOIN Servicios S ON S.IDCliente=CLI.ID
--		WHERE CLI.TIPO LIKE 'P' AND S.IDTipo=TS.ID)>
--		(SELECT COUNT(CLI.ID) FROM Clientes CLI
--		INNER JOIN Servicios S ON S.IDCliente=CLI.ID
--		WHERE CLI.TIPO LIKE 'E' AND S.IDTipo=TS.ID)

--5) Agregar las tablas y/o restricciones que considere necesario para permitir registrar que un cliente pueda 
--valorar el trabajo realizado en un servicio por parte de un t�cnico. Debe poder registrar un puntaje entre 1 y 
--10 y un texto de hasta 500 caracteres con observaciones.

CREATE TABLE Valoracion(
	IDTecnico int NOT NULL PRIMARY KEY,
	IDCliente int NOT NULL FOREIGN KEY REFERENCES Clientes(ID),
	Puntaje tinyint NOT NULL CHECK(Puntaje>0 and Puntaje<11),
	Descripcion varchar(500) NULL 
)