with testfile4 as (
    SELECT c.customerid as custid2, c.firstname, c.lastname, concat(c.firstname,' ', c.lastname) as customername, count(o.orderid) as No_of_Orders 
    from DATA_LAKE_FICO.RAW_SCH.customers c
join {{ ref('order_stg') }} o on c.customerid=o.customerid
group by 1, firstname, lastname,customername order by no_of_orders desc
)
select customerid,customername,No_of_Orders from testfile4