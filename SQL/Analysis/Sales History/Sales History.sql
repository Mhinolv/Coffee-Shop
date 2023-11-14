select
	week
	, count(order_id) as orders
from (
	select
		date_add(order_date, interval(1-dayofweek(order_date)) day) as week
		, order_id
	from customer_orders
	) as weekly_orders
group by
	week
order by
	week asc