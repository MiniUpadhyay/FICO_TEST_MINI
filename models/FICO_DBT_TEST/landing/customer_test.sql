with customer_test as (
select * from {{ source('raw', 'customers') }})
select * from customer_test