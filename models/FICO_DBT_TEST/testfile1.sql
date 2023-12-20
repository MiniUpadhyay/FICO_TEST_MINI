with testfile1 as (
    SELECT c.customerid, c.firstname, c.lastname, concat(c.firstname,' ', c.lastname) as customername, count(o.orderid) as No_of_Orders 
    from DATA_LAKE_FICO.RAW_SCH.customers c
join DATA_LAKE_FICO.RAW_SCH.orders o on c.customerid=o.customerid
group by c.customerid, customername order by no_of_orders desc
)
select customerid,customername,No_of_Orders from testfile1