{{
  config(
    materialized='incremental',
    unique_key='ORDERID'
  )
}}

with order_stg as (
select orderid,
orderdate,
customerid,
employeeid,
storeid,
status as statuscd,
case 
    when status = '01' then 'In Progress'
    when status = '02' then 'Completed'
    when status = '03' then 'Cancelled'
    else null
end as statusdesc,
case
    when storeid = 67567 then 'Online'
    else 'In-store'
end as order_channel,
_fivetran_synced,
current_timestamp as dbt_updated_at
from DATA_LAKE_FICO.RAW_SCH.ORDERS)
select orderid,orderdate,customerid,employeeid,
storeid,statuscd,statusdesc,
order_channel,_fivetran_synced,dbt_updated_at from order_stg

{% if is_incremental() %}

  where _fivetran_synced >= (select max(dbt_updated_at) from {{ this }})

{% endif %}