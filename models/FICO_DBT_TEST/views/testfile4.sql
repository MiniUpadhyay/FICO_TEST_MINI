with testfile4 as (
    SELECT c.customerid as customerid, c.firstname, c.lastname, concat(c.firstname,' ', c.lastname) as customername, count(o.orderid) as No_of_Orders 
    from {{ source('raw', 'customers') }} c
join {{ source('raw', 'orders') }}  o on c.customerid=o.customerid
group by 1, firstname, lastname,customername order by no_of_orders desc
)
select customerid,customername,No_of_Orders from testfile4