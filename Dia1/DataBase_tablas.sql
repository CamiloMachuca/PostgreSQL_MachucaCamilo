create table fabricante(
codigo serial primary key,
nombre varchar(100)

);


create table producto(
codigo serial primary key,
nombre varchar(100),
precio double PRECISION,
codigoFabricante int,
Constraint fk_fabricante foreign key(codigoFabricante) references fabricante(codigo) 
)