use FerreteriaBD;
--Ejercicio 1
--Procedimiento Almacenado
create procedure AgregarEmpleados
--Variables
	@Nombre varchar(50),
	@Apellido varchar(50),
	@DUI int,
	@ISSS int, 
	@FechaNacimiento date,
	@Telefono varchar(20),
	@Email varchar(100),
	@Genero varchar(10),
	@ID_Direccion int,
	@ID_Cargo int
as
begin
	--Insertar
	insert into Empleados values(
	@Nombre,
	@Apellido,
	@DUI,
	@ISSS, 
	@FechaNacimiento,
	@Telefono,
	@Email,
	@Genero,
	@ID_Direccion,
	@ID_Cargo
	);
	select * from Empleados;
end
exec AgregarEmpleados
	@Nombre = 'Rafael Alejandro',
	@Apellido = 'Hernández Carranza',
	@DUI = '12557988',
	@ISSS = '456466252',
	@FechaNacimiento = '1999-12-12',
	@Telefono = '67846345',
	@Email = 'rafalejandro@live.com',
	@Genero = 'M',
	@ID_Direccion = '3',
	@ID_Cargo = '1'
--Ejercicio 2
--Procedimiento Almacenado
create procedure MostrarTablas
as
begin 
	select 
		EMP.Nombre, EMP.Apellido, EMP.DUI,
		CAR.Cargo
	from Empleados EMP, Cargos CAR
	where CAR.IDCargo = EMP.IDCargo
	order by EMP.IDCargo
end
exec MostrarTablas