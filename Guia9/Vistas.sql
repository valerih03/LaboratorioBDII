use FerreteriaBD
--Mostrar empleados y su respectivo cargo
SELECT
    EMP.IDEmpleado,
    EMP.Nombre,
    EMP.Apellido,
    CAR.Cargo
FROM
    Empleados EMP
INNER JOIN Cargos CAR ON EMP.IDCargo = CAR.IDCargo;

--Creacion de vista
create view VistaCargosEmpleados as
SELECT
    EMP.IDEmpleado,
    EMP.Nombre,
    EMP.Apellido,
    CAR.Cargo
FROM
    Empleados EMP
INNER JOIN Cargos CAR ON EMP.IDCargo = CAR.IDCargo;

-- Consulta de vista
select * from VistaCargosEmpleados;

