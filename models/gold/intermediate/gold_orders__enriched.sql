with orders as (
    select * from {{ ref('slv_sql_server_dbo__orders') }}
),

addresses as (
    select * from {{ ref('slv_sql_server_dbo__addresses') }}
),

promos as (
    select * from {{ ref('slv_sql_server_dbo__promos') }}
),

enriched_orders as (
    select
          o.order_id
        , o.user_id
        , o.address_id
        , o.promo_id
        , o.created_at_utc
        , o.estimated_delivery_at_utc
        , o.delivered_at_utc
        , o.tracking_id
        , o.shipping_service
        , o.shipping_cost_usd
        , o.order_cost_usd
        , o.order_total_usd
        , o.order_status
        , o.date_load as order_date_load

        , a.address_line
        , a.zipcode
        , a.state
        , a.country
        , a.date_load as address_date_load

        , p.discount_usd
        , p.promo_status
        , p.date_load as promo_date_load

    from orders o
    left join addresses a
        on o.address_id = a.address_id
    left join promos p
        on o.promo_id = p.promo_id
)

select * from enriched_orders
