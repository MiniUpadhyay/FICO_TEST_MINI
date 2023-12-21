with customer_view2 as (
select * from {{ source('raw', 'customers') }})
select * from customer_view2