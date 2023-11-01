--Trigger
use FerreteriaBD
CREATE TRIGGER Trigger_ActualizacionVentas
ON Ventas
AFTER UPDATE
AS
BEGIN
    --Actualizacion en la misma tabla Ventas
    UPDATE v
    SET v.Monto = u.Monto * 1.10 -- Aumenta el Monto en un 10%
    FROM Ventas v
    INNER JOIN inserted u ON v.IDVenta = u.IDVenta;
    
    PRINT 'El trigger ha realizado la operación.';
END;
--Para comprobar
UPDATE Ventas
SET Monto = Monto * 1.10;
select * from Ventas;