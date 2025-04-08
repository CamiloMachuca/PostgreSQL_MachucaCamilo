-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;
-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre, precio from producto;
-- 3. Lista todas las columnas de la tabla producto. 
select * from producto;
-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares  estadounidenses (USD). 
	set moneda to "en_IE.utf8";
	select nombre, precio::numeric::money, '$'||(Precio*1.08)::numeric  from producto;
-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares  estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre  de producto, euros, dólares. 
	set moneda to "en_IE.utf8";
	select nombre as producto , precio::numeric::money as euro, '$'||(Precio*1.08)::numeric as dolares from producto;
-- 6. Lista los nombres y los precios de todos los productos de la tabla producto,  convirtiendo los nombres a mayúscula. 
select upper(nombre), precio from producto;
-- 7. Lista los nombres y los precios de todos los productos de la tabla producto,  convirtiendo los nombres a minúscula. 
select lower(nombre), precio from producto;
-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna  obtenga en mayúsculas los dos primeros caracteres del nombre del  fabricante. 
select nombre, upper(SUBSTRING(nombre, 1,2)) as dosCaracteres from fabricante;
-- 9. Lista los nombres y los precios de todos los productos de la tabla producto,  redondeando el valor del precio.
select nombre, ROUND(precio)  from producto;
-- 10. Lista los nombres y los precios de todos los productos de la tabla producto,  truncando el valor del precio para mostrarlo sin ninguna cifra decimal. 
select nombre, ROUND(precio)  from producto;
-- 11. Lista el identificador de los fabricantes que tienen productos en la  tabla producto. 
select f.codigo from fabricante f inner join producto p on p.codigoFabricante=f.codigo;
-- 12. Lista el identificador de los fabricantes que tienen productos en la  tabla producto, eliminando los identificadores que aparecen repetidos. 
select distinct f.codigo from fabricante f inner join producto p on p.codigoFabricante=f.codigo;
-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente. 
select nombre from fabricante order by nombre asc;
-- 14. Lista los nombres de los fabricantes ordenados de forma descendente. 
select nombre from fabricante order by nombre desc;
-- 15. Lista los nombres de los productos ordenados en primer lugar por el  nombre de forma ascendente y en segundo lugar por el precio de forma  descendente. 
select nombre, precio from producto order by nombre asc, precio desc;
-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;
-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante.  La cuarta fila también se debe incluir en la respuesta. 
select * from fabricante offset 3 limit 2;
-- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las  cláusulas ORDER BY y LIMIT) 
select * from producto order by precio asc limit 1;
-- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las  cláusulas ORDER BY y LIMIT) 
select * from producto order by precio desc limit 1;
-- 20. Lista el nombre de todos los productos del fabricante cuyo identificador de  fabricante es igual a 2. 
select nombre from producto where codigoFabricante=2;
-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120€. 
select nombre from producto where precio <=120;
-- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€. 
select nombre from producto where precio >=400;
-- 23. Lista el nombre de los productos que no tienen un precio mayor o igual a  400€. 
select nombre from producto where precio <400;
-- 24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar  el operador BETWEEN. 
select nombre from producto where precio >=80 and precio<=300;
-- 25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando  el operador BETWEEN. 
select nombre from producto where precio between 60 and 200;
-- 26. Lista todos los productos que tengan un precio mayor que 200€ y que el  identificador de fabricante sea igual a 6. 
select * from producto where precio>200 and codigoFabricante=6; 
-- 27. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5.  Sin utilizar el operador IN. 
select * from producto where codigoFabricante=1 or codigoFabricante=3 or codigoFabricante=5; 
-- 28. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5.  Utilizando el operador IN. 
select * from producto where codigoFabricante in (1,3,5); 
-- 29. Lista el nombre y el precio de los productos en céntimos (Habrá que  multiplicar por 100 el valor del precio). Cree un alias para la columna que  contiene el precio que se llame céntimos. 
select nombre, precio* 100 as centimos from producto;
-- 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S. 
select nombre from fabricante where nombre like 'S';
-- 31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e. 
select nombre from fabricante where nombre like '%e';
-- 32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w. 
select nombre from fabricante where nombre like '%w%';
-- 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres. 
select * from fabricante where length(nombre)=4;
-- 34. Devuelve una lista con el nombre de todos los productos que contienen la  cadena Portátil en el nombre. 
select nombre from producto where nombre Ilike '%Portátil%';
-- 35. Devuelve una lista con el nombre de todos los productos que contienen la  cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select nombre from producto where nombre Ilike '%Monitor%'  and precio<215;
-- 36. Lista el nombre y el precio de todos los productos que tengan un precio  mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en  orden descendente) y en segundo lugar por el nombre (en orden  ascendente). 
select nombre, precio from producto where precio >=180 order by precio desc, nombre asc;


-- consultas Multitablas

-- 1. Devuelve una lista con el nombre del producto, precio y nombre de
-- fabricante de todos los productos de la base de datos.
select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on p.codigoFabricante=f.codigo;

-- 2. Devuelve una lista con el nombre del producto, precio y nombre de
-- fabricante de todos los productos de la base de datos. Ordene el resultado
-- por el nombre del fabricante, por orden alfabético.
select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on p.codigoFabricante=f.codigo order by f.nombre asc;

-- 3. Devuelve una lista con el identificador del producto, nombre del producto,
-- identificador del fabricante y nombre del fabricante, de todos los productos
-- de la base de datos.
select p.codigo, p.nombre, f.codigo, f.nombre from producto p inner join fabricante f on p.codigoFabricante=f.codigo;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante,
-- del producto más barato.
select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on p.codigoFabricante=f.codigo order by p.precio asc limit 1;

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante,
-- del producto más caro.
select p.nombre, p.precio, f.nombre from producto p inner join fabricante f on p.codigoFabricante=f.codigo order by p.precio desc limit 1;
-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
select p.codigo, p.nombre, p.precio from producto p inner join fabricante f on p.codigoFabricante=f.codigo where f.nombre='Lenovo';

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan
-- un precio mayor que 200€.
select p.codigo, p.nombre, p.precio from producto p inner join fabricante f on p.codigoFabricante=f.codigo where f.nombre='Crucial' and p.precio>200;

-- 8. Devuelve un listado con todos los productos de los
-- fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
select p.codigo, p.nombre, p.precio from producto p inner join fabricante f on p.codigoFabricante=f.codigo where f.nombre= 'Asus' or f.nombre= 'Hewlett-Packard' or f.nombre='Seagate';

-- 9. Devuelve un listado con todos los productos de los
-- fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
select p.codigo, p.nombre, p.precio from producto p inner join fabricante f on p.codigoFabricante=f.codigo where f.nombre in ('Asus', 'Hewlett-Packard', 'Seagate');

-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los
-- fabricantes cuyo nombre termine por la vocal e.
select p.nombre, p.precio, f.nombre from fabricante f inner join producto p on p.codigoFabricante=f.codigo where f.nombre like '%e';

-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo
-- nombre de fabricante contenga el carácter w en su nombre.
select p.nombre, p.precio, f.nombre from fabricante f inner join producto p on p.codigoFabricante=f.codigo where f.nombre like '%w%';

-- 12. Devuelve un listado con el nombre de producto, precio y nombre de
-- fabricante, de todos los productos que tengan un precio mayor o igual a
-- 180€. Ordene el resultado en primer lugar por el precio (en orden
-- descendente) y en segundo lugar por el nombre (en orden ascendente)
select p.nombre, p.precio, f.nombre from fabricante f inner join producto p on p.codigoFabricante=f.codigo where p.precio>=180 order by p.precio desc, p.nombre asc;

-- 13. Devuelve un listado con el identificador y el nombre de fabricante,
-- solamente de aquellos fabricantes que tienen productos asociados en la
-- base de datos.
select f.codigo, f.nombre from fabricante f inner join producto p on p.codigoFabricante=f.codigo;
