select
	month
	, orders
	, round(avg(orders) over(order by month asc
					rows between 2 preceding and current row),0) as rolling_avg
from (
	select
		date_format(order_date, '%Y-%m-01') as month
		, count(order_id) as orders
	from customer_orders
	group by
		date_format(order_date, '%Y-%m-01')
	) orders