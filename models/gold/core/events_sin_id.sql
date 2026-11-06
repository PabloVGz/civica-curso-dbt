{% set excluir=['event_id']%}

SELECT
    {{ dbt_utils.star(
        from=ref('slv_sql_server_dbo__events'),
        except=excluir
    ) }}

FROM {{ ref('slv_sql_server_dbo__events') }}