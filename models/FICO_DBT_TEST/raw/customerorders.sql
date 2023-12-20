/*
    Welcome to your customerorders dbt model!
*/


{{config(materilized='table')}}
with customerorders as (
    SELECT c.customerid, concat(c.firstname,' ', c.lastname) as customername, count(o.orderid) as No_of_Orders 
    from {{ source('raw', 'customers') }}
join {{ source('raw', 'orders') }} o on c.customerid=o.customerid
group by c.customerid, customername order by no_of_orders desc
)
select customerid,customername,No_of_Orders from customerorders