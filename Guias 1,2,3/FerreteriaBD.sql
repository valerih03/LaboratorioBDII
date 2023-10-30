create database FerreteriaBD;
go
use FerreteriaBD;
-- TABLAS
-- ROLES
go
--4
create table Departamentos(
	ID_Departamento char(2) primary key,
	Departamento varchar(60) not null,
	Pais varchar(60)
);
go
--11
create table Municipios(
	ID_Municipio char(3) primary key,
	Municipio varchar(60) not null,
	ID_Departamento char(2) not null,
	ID_Distritos int not null
);
go
--8
create table Distritos(
	ID_Distrito varchar(5) primary key,
	Distrito varchar(60) not null,
	ID_Municipio char(3) not null
);
go
--7
create table Direcciones(
	IDDireccion int primary key,
    	Linea1 varchar(100) not null,
    	Linea2 varchar(100),
    	ID_Distrito varchar(5) not null,
    	CodigoPostal int,
	ID_Distritos int not null
);
go
--2
create table Cargos(
	IDCargo int primary key identity(1, 1),
    	Cargo varchar(45) not null
);
go
--9
create table Empleados(
	IDEmpleado int primary key identity (1,1),
	Nombre varchar (50) NOT NULL,
	Apellido varchar (50) NOT NULL,
	DUI int NOT NULL,
	ISSS int NOT NULL,
	FechadeNacimiento date NOT NULL,
	Telefono varchar (20),
	Email varchar (10) not null,
	Genero varchar (10),
    IDDireccion int not null,
    IDCargo int not null
);
go
--3
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
go
--14
create table Productos (
	IDProducto int primary key identity (1,1),
	Nombre varchar (50) NOT NULL,
	Descripcion varchar (max),
	Precio decimal (10,2) NOT NULL,
	Stock int NOT NULL
);
go
--15
create table Proveedores (
	IDProveedor int primary key identity (1,1),
	Nombre varchar (50) NOT NULL,
	Telefono varchar (20)NOT NULL, 
	IDDireccion int NOT NULL
);
--13
create table Pedidos (
	IDPedidos int primary key identity (1,1),
	Fecha date NOT NULL, 
	Monto varchar (20)NOT NULL, 
	IDProveedor int NOT NULL
);
go
--5
create table DetallePedidos (
	IDDetallePedido int primary key identity (1,1),
	CantidadProdPedido int NOT NULL,
	IDProducto int NOT NULL,
	IDPedido int NOT NULL
);
go
--6
create table DetalleVentas (
	IDDetalleVenta int primary key identity (1,1),
	CantidadProdVenta int NOT NULL,
	IDProducto int NOT NULL,
	IDVenta int NOT NULL
);
--10
create table Facturas(
	IDFacturas int primary key identity (1,1),
	NumFactura varchar(45) not null,
	CreditoFiscal varchar(45) not null,
	IVA decimal(10,2) not null,
	MontoTotal decimal(10,2) not null,
	NIT varchar(45) not null,
	IDVenta int not null
);
-- MANEJO DE ROLES
go
--12
create table Opciones(
	IDOpcion int primary key identity (1,1),
    NombreOpcion varchar(60) not null
);
go
--16
create table Roles(
	IDRol int primary key identity(1, 1),
    NombreRol varchar(60) not null
);
go
--1
create table AsignacionRoles(
    IDAsignacionRol int primary key identity(1, 1),
    IDRol int not null,
    IDOpcion int not null
);
go
--17
create table Usuarios(
	IDUsuario int primary key identity(1, 1),	
    IDEmpleado int not null,
	IDRol int not null,
    Usuario varchar(60) not null,
    Clave varchar(60) not null,
);
--18
create table Ventas(
	IDVenta int primary key identity(1, 1),
	Fecha date not null,
	Monto decimal(10,2) not null,
	IDCliente int not null,
	IDEmpleado int not null
);
ALTER TABLE Municipios
ADD FOREIGN KEY (ID_Departamento)
REFERENCES Departamentos(ID_Departamento);

ALTER TABLE Distritos
ADD FOREIGN KEY (ID_Municipio)
REFERENCES Municipios(ID_Municipio);

ALTER TABLE Direcciones
ADD FOREIGN KEY (ID_Distrito)
REFERENCES Distritos(ID_Distrito);

ALTER TABLE Empleados
ADD FOREIGN KEY (IDCargo)
REFERENCES Cargos(IDCargo);

ALTER TABLE Direcciones
ADD FOREIGN KEY (ID_Distrito)
REFERENCES Distritos(ID_Distrito);

ALTER TABLE Empleados
ADD FOREIGN KEY (IDDireccion)
REFERENCES Direcciones(IDDireccion);

ALTER TABLE Clientes
ADD FOREIGN KEY (IDDireccion)
REFERENCES Direcciones(IDDireccion);

ALTER TABLE Pedidos
ADD FOREIGN KEY (IDProveedor)
REFERENCES Proveedores(IDProveedor);

ALTER TABLE DetallePedidos
ADD FOREIGN KEY (IDProducto)
REFERENCES Productos(IDProducto);

ALTER TABLE DetallePedidos
ADD FOREIGN KEY (IDPedido)
REFERENCES Pedidos(IDPedidos);

ALTER TABLE Usuarios
ADD FOREIGN KEY (IDRol)
REFERENCES Roles(IDRol);

ALTER TABLE Usuarios
ADD FOREIGN KEY (IDEmpleado)
REFERENCES Empleados(IDEmpleado);

ALTER TABLE AsignacionRoles
ADD FOREIGN KEY (IDOpcion)
REFERENCES Opciones(IDOpcion);

ALTER TABLE AsignacionRoles
ADD FOREIGN KEY (IDRol)
REFERENCES Roles(IDRol);

