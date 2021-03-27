create database Libreria
GO
use Libreria
GO
create table ARTICULOS(
codigo varchar(6) not null primary key,
descripcion varchar(30) not null,
marca varchar(15) null,
precio_Compra decimal not null check(precio_Compra>0),
precio_Venta decimal not null check(precio_Venta>0),
stock tinyint not null,
stock_minimo tinyint not null,
stock_X_Encima_Minimo tinyint not null,
estado bit not null
)
GO
create table PROVINCIAS(
id tinyint not null identity(1,1) primary key,
provincia varchar(20) not null,
)
GO
create table LOCALIDADES(
id tinyint not null foreign key references PROVINCIAS(id),
codigoPostal smallint not null primary key,
localidad varchar(30) not null
)
GO
create table DIRECCIONES(
id smallint not null identity(1,1) primary key,
codigo_postal smallint not null foreign key references LOCALIDADES(codigoPostal),
calle varchar(15) not null,
altura smallint not null check(altura>0),
piso tinyint null,
departamento nvarchar null
)
GO
create table VENDEDORES(
dni int not null primary key,
legajo smallint not null unique identity(1,1),
apellido varchar(25) not null,
nombres varchar(25) not null,
sexo nvarchar not null check(sexo='F' OR sexo='M' OR sexo='X'),
fechaNacimiento smalldatetime not null check(fechaNacimiento<GETDATE()),
edad tinyint not null,
fechaIngresoEmpresa smalldatetime not null check(fechaIngresoEmpresa<GETDATE()),
provincia tinyint not null foreign key references PROVINCIAS(id),
localidad smallint not null foreign key references LOCALIDADES(codigoPostal),
direccion smallint not null foreign key references DIRECCIONES(id),
telefono int null,
sueldo money not null check(sueldo>0)
)
GO
create table CLIENTE(
dni int not null primary key,
nombre varchar(30) not null,
email varchar(25) not null,
provincia tinyint not null foreign key references PROVINCIAS(id),
localidad smallint not null foreign key references LOCALIDADES(codigoPostal),
direccion smallint not null foreign key references DIRECCIONES(id),
)
GO
create table VENTAS(
nroFactura int not null identity(1,1) primary key,
fechaVenta smalldatetime not null check(fechaVenta<GETDATE()),
cliente int not null foreign key references CLIENTE(dni),
vendedor int not null foreign key references VENDEDORES(dni),
formaPago nvarchar not null check(formaPago='E' or formaPago='T'),
importe money not null check(importe>0)
)
GO
create table DETALLEVENTAS(
id smallint not null identity(1,1) primary key,
nroFactura int not null foreign key references VENTAS(nroFactura),
cordigoArticulo varchar(6) not null foreign key references ARTICULOS(codigo),
cantidad smallint not null check(cantidad>0)
)