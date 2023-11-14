select
	month
	, items_per_order
	, round(avg(items_per_order) over(order by month asc
					rows between 2 preceding and current row),1) as rolling_avg
from (
	select
	    date_format(order_date, '%Y-%m-01') as month
	    , round(sum(quantity) / count(order_id),1) as items_per_order
	from customer_orders
	group by
	    date_format(order_date, '%Y-%m-01')
	    ) order_quantity