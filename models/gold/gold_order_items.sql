with order_items as (
    select *
    from {{ ref('int_order_items__priced') }}
)

select *
from order_items