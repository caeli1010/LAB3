CREATE DATABASE uno_a_muchos
GO
USE uno_a_muchos
GO
CREATE TABLE ESTADIOS(
ID TINYINT NOT NULL PRIMARY KEY IDENTITY(1,1),
NOMBRE VARCHAR(30) NOT NULL,
FUNDACION DATETIME NOT NULL
)
GO
CREATE TABLE PARTIDOS(
IDPARTIDO INT NOT NULL PRIMARY KEY,
ESTADIO TINYINT NOT NULL FOREIGN KEY REFERENCES ESTADIOS(ID),
ELOCAL VARCHAR(30) NOT NULL,
VISITANTE VARCHAR(30) NOT NULL
)
GO
ALTER TABLE PARTIDOS
ADD FECHA SMALLDATETIME NOT NULL
GO
ALTER TABLE PARTIDOS 
DROP COLUMN ELOCAL
GO 
ALTER TABLE PARTIDOS
ALTER COLUMN VISITANTE BIT NOT NULL
GO
