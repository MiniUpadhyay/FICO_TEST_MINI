with customer_view as (
select * from {{ source('raw', 'customers') }})
select * from customer_view