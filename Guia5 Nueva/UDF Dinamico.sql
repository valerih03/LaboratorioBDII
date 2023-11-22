--UDF Dinamico
--Para obtener detalles empleados
create function ObtenerDetallesEmpleados()
--Use Resultado como variable
returns @Resultado table (
    IDEmpleado int,
    NombreCompleto varchar(100),
    FechaNacimiento date,
    Telefono varchar(20),
    Email varchar(50),
    Genero varchar(10),
    Direccion varchar(100),
    Cargo varchar(45)
)
as
begin
    insert into @Resultado (IDEmpleado, NombreCompleto, FechaNacimiento, Telefono, Email, Genero, Direccion, Cargo)
    select 
        E.IDEmpleado, 
        CONCAT(E.Nombre, ' ', E.Apellido) AS NombreCompleto, 
        E.FechadeNacimiento, 
        E.Telefono, 
        E.Email, 
        E.Genero,
        D.Linea1 + ' ' + isnull(D.Linea2, '') as Direccion,
        C.Cargo
    from Empleados E
    INNER JOIN Direcciones D on E.IDDireccion = D.IDDireccion
    INNER JOIN Cargos C on E.IDCargo = C.IDCargo;

    return;
end;

