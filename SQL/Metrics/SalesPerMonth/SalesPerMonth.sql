select
    date_trunc('month', order_date)::date as month
    , count(order_id) as sales
from calculation.customer_orders
where true
group by
    month
order by
    month desc