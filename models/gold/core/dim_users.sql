with users as (
    select * from {{ ref('slv_sql_server_dbo__users') }}
),
final as (
    select
         user_id
        , first_name
        , last_name
        , email
        , phone_number
        , address_id
        , created_at_utc
        , updated_at_utc
        , date_load
    from users
)
select * from final