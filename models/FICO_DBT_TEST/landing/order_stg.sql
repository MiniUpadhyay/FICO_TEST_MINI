with order_view as (
    select * from  {{ source('raw', 'orders') }})
select * from order_view