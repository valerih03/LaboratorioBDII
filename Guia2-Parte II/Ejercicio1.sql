use FerreteriaBD;

--- 1 Haciendo uso de operadores logicos 
select * from Productos
where Nombre <> 'Llave';

--- 2 Haciendo uso de operadores logicos 
select * from Productos
where Nombre = 'Cemento' AND Stock >= 2;

--- 3 Calculos aritmeticos 
select AVG(DATEDIFF(YEAR, FechaNacimiento , GETDATE())) as Edad_Promedio
from Clientes;

--- 4 Calculos aritmeticos 
select IDCliente, Nombre, FechaNacimiento
from Clientes
order by FechaNacimiento asc
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

--- 5 Calculos aritmeticos
select IDFactura, MontoTotal as Monto_Más_Alto
from Facturas
order by MontoTotal desc
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;