-- Question: Generate a list of all customers, flag when customers have purchased 'E-L-0.2'.

select
	c.customer_id
	, case when o.EL02_orders >= 1 then 1 else 0 end as binary_flag
from customers c
left join (
		select
			customer_id
			, count(*) as EL02_orders
		from orders
		where true
			and product_id = 'E-L-0.2'
		group by
			customer_id ) o
	on o.customer_id = c.customer_id
where true
order by
	binary_flag desc

	-- 	and case when o.EL02_orders >= 1 then 1 else 0 end = 1;