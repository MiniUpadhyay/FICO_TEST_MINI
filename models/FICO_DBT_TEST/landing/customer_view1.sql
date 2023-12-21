with customer_view1 as (
select * from {{ source('raw', 'customers') }})
select * from customer_view1