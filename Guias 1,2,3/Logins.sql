use FerreteriaBD
--Roles
create role Administrador;
create role Gerente;
create role Vendedor;
create role Contador;
create role Bodeguero;
create role RRHH;
--Logins
go
--admin
create login login_adm_juanrodas
with password = 'root';
go
--gerente
create login login_ger_diegosanchez
with password = 'Sanchez1234';
go
--vendedor
create login login_ven_rauldvalle
with password = 'Valle1234';
go
--Contador
create login login_cont_maryperez
with password = 'Perez1234';
--Bodeguero
create login login_bod_brayanariel
with password = 'Ariel123';
--RRHH
go
create login login_rrhh_juperez
with password = 'Ju1235';

--Usuarios
go
--adm
create user adm_juanrodas
for login login_adm_juanrodas;
go
--ger
create user ger_diegosanchez
for login login_ger_diegosanchez;
--ven
create user ven_rauldvalle
for login login_ven_rauldvalle;
--cont
create user cont_maryperez
for login login_cont_maryperez;
--bod
create user bod_brayanariel
for login login_bod_brayanariel
--rrhh
create user rrhh_juperez
for login login_rrhh_juperez;

-- AGREGAR USUARIOS A ROLES
go
alter role Administrador add member adm_juanrodas;
alter role Gerente add member ger_diegosanchez;
alter role Vendedor add member ven_rauldvalle;
alter role Contador add member cont_maryperez;
alter role Bodeguero add member bod_brayanariel;
alter role RRHH add member rrhh_juperez;

-- OTORGAR PERMISOS (En base a las opciones)
go
-- Administrador
grant control on database::FerreteriaBD to Administrador;

-- Gerente
grant select, insert, update, delete on dbo.Direcciones to Gerente;
grant select, insert, update, delete on dbo.Empleados to Gerente;
grant select, insert, update, delete on dbo.Cargos to Gerente;
grant select, insert, update, delete on dbo.Ventas to Gerente;
grant select, insert, update, delete on dbo.Facturas to Gerente;
grant select, insert, update, delete on dbo.DetallePedidos to Gerente;
grant select, insert, update, delete on dbo.DetalleVentas to Gerente;
grant select on dbo.Departamentos to Gerente;
grant select on dbo.Municipios to Gerente;
grant select on dbo.Distritos to Gerente;

-- Vendedor
grant select, insert, update, delete on dbo.Direcciones to Vendedor;
grant select, insert, update, delete on dbo.Clientes to Vendedor;
grant select, insert, update, delete on dbo.Facturas to Vendedor;
grant select, insert, update, delete on dbo.DetalleVentas to Vendedor;
grant select, insert, update, delete on dbo.Pedidos to Vendedor;
grant select on dbo.Departamentos to Vendedor;
grant select on dbo.Municipios to Vendedor;
grant select on dbo.Distritos to Vendedor;

-- Contador
grant select, insert, update, delete on dbo.Direcciones to Contador;
grant select, insert, update, delete on dbo.Clientes to Contador;
grant select, insert, update, delete on dbo.DetalleVentas to Contador;
grant select, insert, update, delete on dbo.Facturas to Contador;
grant select on dbo.Departamentos to Contador;
grant select on dbo.Municipios to Contador;
grant select on dbo.Distritos to Contador;

-- Bodeguero
grant select, insert, update, delete on dbo.Productos to Bodeguero;
grant select, insert, update, delete on dbo.Pedidos to Bodeguero;
grant select, insert, update, delete on dbo.DetallePedidos to Bodeguero;
grant select, insert, update, delete on dbo.Direcciones to Bodeguero;
grant select on dbo.Departamentos to Bodeguero;
grant select on dbo.Municipios to Bodeguero;
grant select on dbo.Distritos to Bodeguero;

-- RRHH
grant select, insert, update, delete on dbo.Direcciones to RRHH;
grant select, insert, update, delete on dbo.Cargos to RRHH;
grant select, insert, update, delete on dbo.Empleados to RRHH;
grant select on dbo.Departamentos to RRHH;
grant select on dbo.Municipios to RRHH;
grant select on dbo.Distritos to RRHH;
