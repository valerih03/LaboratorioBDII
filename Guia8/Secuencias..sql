--Secuencia para llenar la llave primaria o cualquier campo 
--con numeración única de una tabla nueva o existente
use FerreteriaBD;
create sequence secuencia_direccion
    start with 1
    increment by 1
    no MAXVALUE;
create sequence secuencia_cargo
    start with 1
    increment by 1
    no MAXVALUE;
--Para iniciar las secuencias
alter sequence secuencia_direccion restart with 1;
alter sequence secuencia_cargo restart with 1;

--Para consultar el valor siguiente de la secuencia
select next value for secuencia_direccion as SiguienteValorDireccion;
--Para consultar el valor actual de la secuencia
select current_value as ValorActualDireccion from sys.sequences where name = 'secuencia_direccion';

--Para consultar el valor siguiente de la secuencia
select next value for secuencia_cargo as SiguienteValorCargo;
--Para consultar el valor actual de la secuencia
select current_value as ValorActualCargo from sys.sequences where name = 'secuencia_cargo';

--Para usar las secuencias
alter table Empleados
add constraint DF_IDDireccion default (next value for secuencia_direccion) for IDDireccion;

alter table Empleados
add constraint DF_IDCargo default (next value for secuencia_cargo) for IDCargo;