with customer_test2 as (
select * from {{ source('raw', 'customers') }})
select * from customer_test2