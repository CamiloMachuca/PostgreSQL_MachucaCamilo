
-- vista que no mantiene informacion
create view stock_product_range as
select sum(stock_price) as stock_price, sum(stock)as stock, stockmin, stockmax, name from full_order_info
group by name, stockmin, stockmax;

create view stock_product as
select sum(stock_price* stock) as ammount_stock, name from full_order_info
group by name;

select * from stock_product where name='Webcam';
select * from stock_product_range;

-- vista materializada
-- drop materialized view stock_avg;
create materialized view stock_avg as
select sum(stock_price) as stock_price, sum(stock)as stock, stockmin, stockmax, name from full_order_info
group by name, stockmin, stockmax;
refresh materialized view stock_avg;

select * from stock_avg;

-- agregar foreing key
alter table orders add constraint fk_usuario foreign key(user_id) references users(id);
alter table order_details add constraint fk_oorder foreign key(order_id) references orders(id);
alter table order_details add constraint fk_producto foreign key(product_id) references products(id);

-- JOIN
select * from users left join orders on users.id= orders.user_id;

select * from users right outer join orders on users.id= orders.user_id;

select * from users left outer join orders on users.id= orders.user_id where orders.id is null;

select * from users full join orders on users.id= orders.user_id;

select * from orders left join order_details od on orders.id=od.order_id 
left join products p on od.product_id=p.id;


create view order_detail_view as
select orders.id from orders left join order_details od on orders.id=od.order_id 
left join products p on od.product_id=p.id;

create or replace procedure total_amount(id_user varchar(20))
language plpgsql
as $$
declare 
total numeric;
begin
select sum(quantity::numeric * price::numeric)
into total
from order_detail_view
where user_id=p_id_user;

raise notice 'El total de $ gastado % es %', p_id_user, total;
end;
$$;

call total_amount('00005');


CREATE VIEW order_detail_view1 as
SELECT users.id as user_id, users.first_name, orders.id as order_id, orders.orderdate, od.product_id, od.quantity, od.price, p.name
FROM users
RIGHT JOIN orders ON users.id = orders.user_id
LEFT JOIN order_details od ON orders.id = od.order_id
LEFT JOIN products p ON od.product_id = p.id;

CREATE OR REPLACE PROCEDURE total_amount(p_id_user VARCHAR(20))
LANGUAGE plpgsql
AS $$
DECLARE
	total NUMERIC;
BEGIN

	SELECT SUM(quantity::numeric * price::numeric)
	INTO total
	FROM order_detail_view1
	WHERE user_id = p_id_user;

	RAISE NOTICE 'El total de $ gastado % es %',p_id_user, total;
END;
$$;

CALL total_amount1('00005');
