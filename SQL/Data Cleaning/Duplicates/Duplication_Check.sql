select
    *
    , count(*)
from customer_orders
group by all
having true
    and count(*) > 1