
--Procedimiento Almacenado, solo para actualizar
CREATE PROCEDURE ActualizarVenta
    @venta_id int,
    @nuevo_monto decimal(10, 2)
as
begin
    UPDATE Ventas
    set Monto = @nuevo_monto
    where IDVenta = @venta_id;
end;

