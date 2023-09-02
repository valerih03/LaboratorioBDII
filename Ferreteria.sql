create database Ferreteria;

use Ferreteria;
create table Empleados (
	IDEmpleado int primary key identity (1,1),
	Nombre varchar (50) NOT NULL,
	Apellido varchar (50) NOT NULL,
	DUI int NOT NULL,
	ISSS int NOT NULL,
	FechadeNacimiento date NOT NULL,
	Telefono varchar (20),
	Genero varchar (10),
	IDDireccion int NOT NULL,
	IDCargo int NOT NULL
);
create table Clientes (
	IDCliente int primary key identity (1,1),
	Nombre varchar (50) NOT NULL,
	Apellido varchar (50) NOT NULL,
	FechadeNacimiento date NOT NULL,
	Telefono varchar (20) NOT NULL, 
	Email varchar (100),
	Genero varchar (10),
	IDDireccion int NOT NULL
);
create table Productos (
	IDProducto int primary key identity (1,1),
	Nombre varchar (50) NOT NULL,
	Descripcion varchar (max),
	Precio decimal (10,2) NOT NULL,
	Stock int NOT NULL
);
create table Proveedor (
	IDProveedor int primary key identity (1,1),
	Nombre varchar (50) NOT NULL,
	Telefono varchar (20)NOT NULL, 
	IDDireccion int NOT NULL
);
create table Pedidos (
	IDPedidos int primary key identity (1,1),
	Fecha date NOT NULL, 
	Monto varchar (20)NOT NULL, 
	IDProveedor int NOT NULL
);
create table DetallePedidos (
	IDDetallePedido int primary key identity (1,1),
	CantidadProdPedido int NOT NULL,
	IDProducto int NOT NULL,
	IDPedido intNOT NULL
);
create table compras(
	IDCompra int primary key identity (1,1),
	Fecha date NOT NULL,
	Monto varchar (20)NOT NULL, 
	IDCliente int NOT NULL,
	IDEmpleado int NOT NULL
);
create table DetalleCompras (
	IDDetalleCompras int primary key identity (1,1),
	CantidadProdCompra int NOT NULL,
	IDProducto int NOT NULL,
	IDCompra int NOT NULL
);
create table Cargos(
	IDCargo int primary key identity (1,1),
	Cargo varchar (40)
);
create table Direcciones(
	IDDireccion int primary key identity (1,1),
	Lineal1 varchar (300) NOT NULL,
	Lineal2 varchar (300) NOT NULL,
	IDDistrito int NOT NULL
);
create table Distritos (
	IDDistrito int primary key identity (1,1),
	Distrito varchar (100) NOT NULL,
	IDMunicipio  int NOT NULL
);
create table Municipios (
	IDMunicipio int primary key identity (1,1),
	Municipio varchar (100) NOT NULL,
	IDDepartamento int NOT NULL
);
create table Departamentos(
	IDDepartamento int primary key identity (1,1),
	Departamento varchar (100) NOT NULL
);