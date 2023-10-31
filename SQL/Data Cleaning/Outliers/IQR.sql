with orders_per_month as(
select
    date_trunc('month', order_date)::date as month
    , count(order_id) as orders
from customer_orders
group by
    month
)

-- Develop IQR upper and lower limits
, IQR as (select
    percentile_cont(.25) within group (order by orders) as Q1
    , median(orders) as Q2
    , percentile_cont(.75) within group (order by orders) as Q3
    , Q3 - Q1 as IQR
    , Q1 - (1.5 * IQR) as Q1_Fence
    , Q3 - (1.5 * IQR) as Q3_Fence
from orders_per_month
)

select
    'Without Outliers' as method
    , avg(orders) as avg_order_per_month
from orders_per_month
where true
    and orders not between 10 and 16

union

select
    'With Outliers' as method
    , avg(orders) as avg_order_per_month
from orders_per_month