use FerreteriaBD;
--Tabla para almacenar resultados
create table #Resultados (
    IDEmpleado int,
    Nombre varchar(50),
    Apellido varchar(50),
    DUI int,
    ISSS int
)
--Variables para el cursor
declare @IDEmpleado int
declare @Nombre varchar(50)
declare @Apellido varchar(50)
declare @DUI int
declare @ISSS int
-- Declarar el cursor
declare Empleados_cursor cursor for
select IDEmpleado, Nombre, Apellido, DUI, ISSS
from Empleados
-- Abrir el cursor
open Empleados_cursor

-- Inicializar la primera fila
fetch next from Empleados_cursor into @IDEmpleado, @Nombre, @Apellido, @DUI, @ISSS
while @@FETCH_STATUS = 0
begin
    -- Insertar los datos
    insert into #Resultados (IDEmpleado, Nombre, Apellido, DUI, ISSS)
    values (@IDEmpleado, @Nombre, @Apellido, @DUI, @ISSS)

    fetch next from empleados_cursor into @IDEmpleado, @Nombre, @Apellido, @DUI, @ISSS
end
close Empleados_cursor
deallocate Empleados_cursor
-- Mostrar resultados
select * from #Resultados
--DROP TABLE #Resultados

