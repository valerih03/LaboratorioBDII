use FerreteriaBD;
go
---Logins
create login login_admin_JuanPerez
with password = 'root';
go
create login login_ger_JulioSanchez
with password = 'gerente123';
go
create login login_vend_CarlosHernandez
with password = 'vendedor123_';
go
create login login_cont_JosePadilla
with password = 'contador12;';
go
create login login_bod_HectorRecinos
with password = 'bodeguero...1';
go 
create login login_rrhh_BlancaFraile
with password = 'recursoshumanos2023';

--- usuarios
go
create user admin_JuanPerez
for login login_admin_JuanPerez;
go
create user ger_JulioSanchez
for login login_ger_JulioSanchez;
go
create user vend_CarlosHernandez
for login login_vend_CarlosHernandez;
go
create user cont_JosePadilla
for login login_cont_JosePadilla;
go
create user bod_HectorRecinos
for login login_bod_HectorRecinos;
go
create user rrhh_BlancaFraile
for login login_rrhh_BlancaFraile;

--- roles
go
create role Administrador;
create role Gerente;
create role Vendedor;
create role Contador;
create role Bodeguero;
create role RRHH;

-- Agregar usuarios como miembros del rol
go
alter role Administrador add member admin_JuanPerez;
alter role Gerente add member ger_JulioSanchez;
alter role Vendedor add member vend_CarlosHernandez;
alter role Contador add member cont_JosePadilla;
alter role Bodeguero add member bod_HectorRecinos;
alter role RRHH add member rrhh_BlancaFraile;

-- Otorgar permisos (Opciones en este caso)
go
grant control on database::FerreteriaBD to Administrador;
grant select on dbo.Facturas to Contador;
grant select, insert, update, delete on dbo.Clientes to Vendedor;
