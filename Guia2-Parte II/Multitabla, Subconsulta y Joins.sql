use FerreteriaBD;
--- 1 Haciendo uso de tipo Multitabla usando concat 
select
    P.IDPedido as Número_Pedido,
    DP.IDProducto as IDProducto,
    DP.CantidadProdPedido as Cantidad,
    (
        select CONCAT(Nombre, ' ', Apellido)
        from Clientes as C
        where C.IDCliente = P.IDPedido
    ) as Clientes
from
    Pedidos as P
INNER JOIN
    DetallePedidos AS DP ON P.IDPedido = DP.IDPedido

--- 2 Haciendo uso de una subconsulta
select
    IDVenta as NumeroVenta,
    Fecha as FechaVenta,
    (
        select CONCAT(CantidadProdVenta, ', ')
        from DetalleVentas
        where DetalleVentas.IDVenta = Ventas.IDVenta
    ) as ProductosVendidos
from
    Ventas;

--- 3 Haciendo uso de Inner Join en la tabla Empleados
select E.Nombre as Nombre, E.Apellido as Apellido, C.Cargo as Cargo
from Empleados as E
INNER JOIN Cargos as C on E.IDCargo = C.IDCargo;

--- 4 Haciendo uso de Inner Join en la tabla Clientes
select 
    CONCAT(C.Nombre, ' ', C.Apellido) as Nombre_Completo,
    D.IDDireccion as Dirección,
    D.IDDistrito as Distrito
from 
    Clientes as C
INNER JOIN 
    Direcciones as D on C.IDDireccion = D.IDDireccion;

--- 5 Haciendo uso de Left Join en la tabla Empleado y Ventas
select
    V.Fecha as FechaVenta,
    V.IDEmpleado as IDEmpleado,
    V.IDCliente as IDCliente
from
    Ventas as V
LEFT JOIN
    Empleados as E on V.IDEmpleado = E.IDEmpleado;
