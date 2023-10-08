use FerreteriaBD;
--Funcion Escalar
create function CalcularVentas ()
returns decimal(10, 2) 
as
begin
	--Variables
    declare @TotalVentas decimal(10, 2)

	--Para calcular las ventas
    select @TotalVentas = SUM(Monto)
    from Ventas

    returns @TotalVentas
end;

--Con Valores
create function CalcularPromedioVentas ()
returns decimal(10, 2) 
as
begin
	--Variables
    declare @PromedioVentas decimal(10, 2)

	--Para calcular el promedio de ventas
    select @PromedioVentas = AVG(Monto)
    from Ventas

    return @PromedioVentas
end;
