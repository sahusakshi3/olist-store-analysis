use oliststore;
create table kpi1;
select if(weekday(order_purchase_timestamp)<5,"Weekdays","Weekend") as Days ,round(sum(payment_value)) from orders O 
inner join orderpayments P on (O.order_id=P.order_id) group by days;
select r.order_id,review_score,payment_type from reviews R inner join orderpayments P on (R.order_id=P.order_id)
where review_score=5 and payment_type="credit_card";

select product_category_name,round((abs(avg(timestampdiff(Day,order_delivered_customer_date,order_purchase_timestamp))))) as Duration 
from orderitems I left join orders O on (I.order_id=O.order_id)
inner join products P on (I.product_id=P.product_id)where product_category_name="pet_shop";




select customer_city,round(avg(price)),round(avg(payment_value)) from orders O left join customer C on (O.customer_id=C.customer_id)
inner join orderitems I on (O.order_id=I.order_id)
inner join orderpayments P on (I.order_id=P.order_id)
where customer_city="sao paulo";

select avg(datediff(order_delivered_customer_date, order_purchase_timestamp)) as avg_days 
from orders
inner join orderitems
on orders.order_id=orderitems.order_id
inner join products
on orderitems.product_id=products.product_id 
where product_category_name="pet_shop" ;












