create type sexo as enum('Masculino', 'Femenino', 'otro');
create table ejemplo(
id serial primary key,
nombre varchar(100) not null,
descripcion text,
precio numeric(10,2)not null,
disponible boolean default false,
fecha_creacion date not null,
hora_creacion time not null,
fecha_hora timestamp not null,
fecha_zona timestamp with time zone,
duracion interval,
ip inet,
mac macaddr,
punto_geo point,
datos_json json,
unico uuid,
moneda money,
rangos int4range,
colores varchar(20)[],
sexo_seleccionado sexo

);

INSERT INTO ejemplo VALUES(1, 'adrian', 'description', 10.23, true, '2025-02-23', '13:10:50', 
'2025-02-23 13:10:50', '2025-02-23 13:10:50+05', '1 day', 
'192.168.1.1', '80:00:12:23:10:00', '(10, 20)', '{"key": "value"}',
'06a73130-4c9b-4e7e-ae25-e1a98df7c900','15.23', '[10, 20)', 
ARRAY['rojo', 'verde', 'azul', 'amarillo'], 'Masculino'
);

select * from ejemplo;






