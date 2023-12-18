{{config(materilized='table')}}
with customerorders as (
    SELECT c.customerid, concat(c.firstname,' ', c.lastname) as customername, count(o.orderid) as No_of_Orders 
    from raw_fico.fico_sch.customers c
join DATA_LAKE_FICO.RAW_SCH.orders o on c.customerid=o.customerid
group by c.customerid, customername order by no_of_orders desc
)
select customerid,customername,No_of_Orders from customerorders;