--UDF Escalar
--Para saber el monto total de ventas por clientes

create function MontoTotalVentasPorCliente(@IDCliente int)
returns decimal(10,2)
as
begin
	--Variables
    declare @TotalMonto decimal(10,2)
	--Para calcular el monto
    select @TotalMonto = sum(Monto)
    from Ventas
    where IDCliente = @IDCliente;

    return isnull(@TotalMonto, 0);
end;

