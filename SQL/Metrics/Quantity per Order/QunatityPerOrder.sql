select
    date_trunc('month', order_date)::date as month
    , sum(quantity) / count(order_id) as items_per_order
from customer_orders
group by
    month
order by
    month desc