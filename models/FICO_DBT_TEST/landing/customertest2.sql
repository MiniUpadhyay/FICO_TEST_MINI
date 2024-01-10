with customertest2 as (
select * from {{ source('raw', 'customers') }})
select * from customertest2